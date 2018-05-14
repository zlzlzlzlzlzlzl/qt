<?php
namespace app\index\controller;
use app\index\controller\Base;
use app\index\model\Usermodel as Us;
use app\index\model\BankModel as Bk;
use app\index\model\UserRechargeModel as UR;
use app\index\model\UserBankModel as Ub;
use app\index\model\withdrawmoneyModel as Wm;
use think\Request;
/**
*  
*/
class User extends Base
{
	
	/**
	 * [userRecharge 充值页面]
	 * @return [type] [description]
	 */
	public function userRecharge(){
		$U        = new Us();
		$ub       = new Bk();
		$bank     = $ub->where('isDelete','1')->select();
		$userData = $U->where('id',$this->userinfo['id'])->find();
		return $this->fetch('userRecharge',['user'=>$userData,'bank'=>$bank]);
	}

	/**
	 * [RechargeState 充值申请 插入申请表]
	 * @param request $request [description]
	 */
	public function RechargeState(Request $request){
		// echo '23123';exit;
		$data                = $request->post();
		$recharge            = [];
		$recharge['bankId']  = $data['bankId'];
		$data['docVlGender'] == 'coins' ? $recharge['amount'] = $data['coin'] : $recharge['amount'] =$data['docVlGender'];
		$recharge['uid']     = $this->userinfo['id'];
		$recharge['orderId'] = $this->getOrderId(2);
		$recharge['time'] = time();
		$Ur = new UR();
		$Bk = new Bk();
		$bankinfo = $Bk->where('id',$data['bankId'])->find();
		$userinfo = $this->userinfo;
		$Ur->insert($recharge);
		return $this->fetch('bank-list',['bankinfo'=>$bankinfo,'user'=>$userinfo]);
	}

	/**
	 * [withdrawMoneyV 提现页面]
	 * @return [type] [description]
	 */
	public function withdrawMoneyV(){
		$Ub       = new Ub();
		$bankinfo = $Ub->where('uid',$this->userinfo['id'])->select();
		return $this->fetch('withdrawMoney',['user'=>$this->userinfo,'bankinfo'=>$bankinfo]);
	}

	/**
	 * [setUserBank 添加银行卡页面]
	 * @param request $request [description]
	 */
	public function setUserBank(request $request){
		$bank        = $request->post();
		$bank['uid'] = $this->userinfo['id'];
		// print_r($bank);exit;
		$Ub          = new Ub();
		$result      = $Ub->insert($bank);
		if($result){
			echo 'yes';
		}else{
			echo 'no';
		}
	}

	/**
	 * [withdrawMoney 用户提现申请]
	 * @param  request $request [description]
	 * @return [type]           [description]
	 */
	public function withdrawMoney(request $request){
		$data = $request->post();
		if($data['amount'] > $this->userinfo['coin']){
			die('您的余额不足');
		}
		// 把申请的余额减去 增加冻结金额
		$Us = new Us();
		$amount = $this->userinfo['coin']-$data['amount'];
		$fcoin = $this->userinfo['fcoin']+$data['amount'];
		$Us->where('id',$this->userinfo['id'])->update(['coin'=>$amount,'fcoin'=>$fcoin]);

		// 插入请求表
		$data['uid'] = $this->userinfo['id'];
		$data['time']= time();
		$Wm          = new Wm();
		$result      = $Wm->insert($data);
		if($result){
			echo 'yes';
		}else{
			echo 'no';
		}
	}



	public function checkOnline(){
		$Us  = new Us();
		$userinfo = $Us->where('id',$this->userinfo['id'])->find();
		if($this->userinfo['session_id'] !== $userinfo['session_id']){
			return 'error';
		}else{
			return 'yes';
		}
	}



}


	



?>