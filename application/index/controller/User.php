<?php
namespace app\index\controller;
use app\index\controller\Base;
use app\index\model\Usermodel as Us;
use app\index\model\BankModel as Bk;

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
		$U  = new Us();
		$ub = new Bk();
		$bank = $ub->all();
		$userData = $U->where('id',$this->userinfo['id'])->find();
		return $this->fetch('userRecharge',['user'=>$userData]);
	}


}






?>