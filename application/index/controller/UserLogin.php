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
		$um = new UserModel();
		$data = $request->post();
		// print_r($data);
		if($data['username'] == '' || $data['pwd'] == '' || ($data['pwd'] != $data['repassword'])) {
			return '注册失败，请安照正常程序注册！';
		}
		$r = $um->where('username',$data['username'])->find();
		if($r) {
			echo '帐号已被注册！请重新输入帐号！';
			return;
		}
		$d = array(
		'username' => $data['username'],
		'password' => md5($data['pwd']),
		'coinPassword' => md5($data['pwd']),
		'phone' => $data['phone'],
		'qq' => $data['qq'],
		'registerTime' => time()
				);
			$res = $um->insert($d);
			if($res){
				echo '注册成功！取款密码默认和注册密码一致，请及时修改！';
				return;
			}else {
				echo 'error 404 notfound';
				return;
			}

	}
	/**
	 * [doLogin 登陆逻辑]
	 * @param  Request $request [description]
	 * @return [type]           [description]
	 */
	public function doLogin(Request $request) {
		$ip = request()->ip();
		$url = "http://int.dpool.sina.com.cn/iplookup/iplookup.php?format=json&ip=".$ip;
		$jsonData = file_get_contents($url);
		$cityArr = json_decode($jsonData,1);
		$city = $cityArr['province'];
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
			// 更新城市和在线状态
			$um->where('id',$userid)->update(['city'=>$city,'online'=>1,'session_id'=>session_id()]);
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
		$Us = new UserModel();
		$Us->where('id',Session::get('userid','user_'))->update(['online'=>0]);
		Session::flush();
		return $this->error('退出成功！',url('/tologin'),30);
	}


		public function off(){
		return $this->fetch('error/404');
	}
}
?>