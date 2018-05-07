<?php
namespace app\index\controller;
use app\index\controller\Base;
use think\Request;
use think\Session;
use app\index\model\BetsModel as Bets;


class Lottery extends Base{


    /**
     * [qiangZhuang 抢庄逻辑]
     * @return [type] [description]
     */
    public function qiangZhuang() {

    }
    /**a
     * [xiaZhu 下注逻辑]
     * @param  Request $request [description]
     * @return [type]           [description]
     */
    public function xiaZhu(Request $request) {
		$bet      = $request->post();
		$money    = $bet['money'];
		$code     = $bet['haoma'];
		$playedId = $bet['playedId'];
		$actionNo = $bet['qihao'];
		$nowTime  = time();
		$nowTimes = date('H:i:s',$nowTime);
		$betArr   =[];
        // 首先判断金额合法
        if($money > $this->Sysinfo['maxamount']){
        	die(json_encode("下注金额大于最大单注下注金额,请重新输入金额"));
        }
        if($money < $this->Sysinfo['minamount']){
        	die(json_encode("下注金额小于最小单注下注金额,请重新输入金额"));
        }
        // 判断是否是代理以及是否开启了代理禁止下注
        if($this->userinfo['agency'] && $this->Sysinfo['daili'] == 0){
        	die(json_encode('代理不能投注 有疑问请联系客服协助解决'));
        }
        // 判断期号是否正确以及下注时间是否是合法下注时间
        $in = new \app\index\controller\Index;
        $jsonTime = $in->getQiHao($request);
        $sysTime = json_decode($jsonTime,1);
        $nowTimes = strtotime($nowTimes);
        $sysTimes = strtotime($sysTime['kjsj']);
        if($nowTimes > $sysTimes - $this->Sysinfo['fengdan'] || $actionNo != $sysTime['qihao']){
        	die(json_encode('本期已经进入封单时间,请切换下期投注'));
        }
        // 判断通过插入投注表 bet
		$betArr['uid']      = $this->userinfo['id'];
		$betArr['playedId'] = $playedId;
		$betArr['actionNo'] = $actionNo;
		$betArr['actionData'] = $code;
		$betArr['actionTime'] = $nowTime;
		$betArr['orderId'] = $this->getOrderId();
		$betArr['boss']     = $this->getBoss($actionNo);
		$betArr['state']    = 0;
		$betArr['amount']   = $money;
        $betM = new Bets();
        $result = $betM->insert($betArr);
        if($result){
        	return "下注成功!";
        }else{
        	return "下注失败!网络故障!";
        }
    }









}

?>