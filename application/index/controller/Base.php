<?php
namespace app\index\controller;
use think\Controller;
use think\Session;
use app\index\model\UserModel;
class Base extends Controller {
	protected $userinfo;
	/**
	 * [_initialize 中间件]
	 * @return [type] [description]
	 */
	public function _initialize() {
		$um = new UserModel();
        $this->userinfo = $um->where('id',session('userid','','user_'))->find();
		if(Session::has('username','user_') && Session::has('userid','user_')) {
			return ;
		} else {
			return $this->error('请先登录！',url('/tologin'),30);
	}
}
}
?>