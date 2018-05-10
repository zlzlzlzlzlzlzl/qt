<?php
namespace app\index\controller;
use think\Controller;
use think\Session;
use app\index\model\UserModel;
use app\index\model\SystemModel as system;
use app\index\model\BossModel as Boss;
class Base extends Controller {
	protected $userinfo;
	protected $Sysinfo;
	/**
	 * [_initialize 中间件]
	 * @return [type] [description]
	 */
	public function _initialize() {
	    $sys = new System();
        $data = $sys::all();
        $webData = array();
        foreach ($data as $key => $value) {
            $webData[$value['key']] = $value['value'];
        }
        $this->Sysinfo = $webData;
		$um = new UserModel();
        $this->userinfo = $um->where('id',session('userid','','user_'))->find();
		if(Session::has('username','user_') && Session::has('userid','user_')) {
			return ;
		} else {
			return $this->error('请先登录！',url('/tologin'),30);
		}
	}

	/**
	 * [getOrderId 生成订单号]
	 * @return [type] [description]
	 */
	public function getOrderId($type = 1){
			$yCode = array('A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J');
		if($type == 1){
			$orderSn = $yCode[intval(date('Y')) - 2011] . strtoupper(dechex(date('m'))) . date('d') . substr(time(), -5) . substr(microtime(), 2, 5) . sprintf('%02d', rand(0, 99));
		}else{
			$orderSn = $yCode[intval(date('Y')) - 2017] . strtoupper(dechex(date('m'))) . date('d') . substr(time(), -5) . substr(microtime(), 2, 5) . sprintf('%02d', rand(0, 99));
		}
		return $orderSn;
	}

	/**
	 * [getBoss 查询庄家]
	 * @param  [type] $actionNo [description]
	 * @return [type]           [description]
	 */
	public function getBoss($actionNo){
		$boss = new Boss();
		$result = $boss->where('actionNo',$actionNo)->where('state','1')->find();
		if($result){
			return $result['uid'];
		}else{
			return 0;
		}

	}	


}
?>