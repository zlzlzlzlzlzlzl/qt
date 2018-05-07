<?php
namespace app\index\controller;
use think\Controller;
use app\index\model\UserModel;
use think\Request;
use think\Session;
class UserLogin extends Controller {
	/**
	 * [viewLogin 展示登陆界面]
	 * @return [type] [description]
	 */
	public function viewLogin() {
		return $this->fetch('login');
	}
	/**
	 * [toRegister 注册逻辑]
	 * @param  Request $request [description]
	 * @return [type]           [description]
	 */
	public function toRegister(Request $request) {
		$data = $request->post();
		print_r($data);
	}
	/**
	 * [doLogin 登陆逻辑]
	 * @param  Request $request [description]
	 * @return [type]           [description]
	 */
	public function doLogin(Request $request) {
		$data = $request->post();
		$um = new UserModel();
		$uname = $data['user'];
		$password = md5($data['password']);
		if($uname == '' || $password == '') {
			$msg = ['code'=>0,'msg'=>'用户名或密码不能为空i！'];
			return json_encode($msg);
		}
		$status = $um->where('username',$uname)->where('password',$password)->find();
		if($status) {
			$userid =  $status['id'];
			$username = $status['username'];
			$nickName = $status['nickName'];
			$status['loginTime'] = time();
			$status->save();
			Session::set('userid',$userid,'user_');  
			Session::set('username',$username,'user_');
			Session::set('nickName',$nickName,'user_');
			$msg =  ['code'=>1,'msg'=>'success'];
			return json_encode($msg);
		} else {
			$msg = ['code'=>0,'msg'=>'用户名或密码错误i！'];
			return json_encode($msg);
		}
	}
	/**
	 * [logOut 用户退出]
	 * @return [type] [description]
	 */
	public function logOut() {
		Session::flush();
		return $this->error('退出成功！',url('/tologin'),30);
	}
}
?>