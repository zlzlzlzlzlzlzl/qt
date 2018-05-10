<?php
namespace app\index\controller;
use app\index\controller\Base;
use think\Request;
use think\Session;
use app\index\model\BetsModel as Bets;
use app\index\model\UserModel as User;
use app\index\model\DataModel as Lo;

class Lottery extends Base{


    /**
     * [qiangZhuang 抢庄逻辑]
     * @return [type] [description]
     */
    public function qiangZhuang() {

    }

    /**
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
        // 判断余额是否足够支付
        if($this->userinfo['coin'] < $money){
            die(json_encode($this->userinfo['coin'].'您的余额不足,请立即充值'.$money));
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
            $User = new User();
            $User->where('id',$this->userinfo['id'])->setDec('coin',$money);//-余额
            $User->where('id',$this->userinfo['id'])->setInc('fcoin',$money);//+冻结金额
        	return "下注成功!";
        }else{
        	return "下注失败!网络故障!";
        }
    }


    /**
     * [getCode 获取最新的开奖期号]
     * @param  Request $request [description]
     * @return [type]           [description]
     */
    public function getCode(Request $request){
        $Lo = new Lo();
        $data = $Lo->order('number DESC')->find();
        $code = explode(',',$data->data);
        echo json_encode($code);

    }

    /**
     * [getBetList 用户下注记录]
     * @return [type] [description]
     */
    public function getBetList(){
        $uid = $this->userinfo['id'];
        $lo = new Bets();
        $data = $lo->where('uid',$uid)->select();
        foreach ($data as $key => $value) {
            $data[$key]['actionTime'] = date('Y-m-d H:i:s',$value->actionTime);
            $played = '';
            $sate = '';
            if($data[$key]['playedId'] < 4){
              $played .= '两骰';
              if($value['playedId'] ==1){
                $played .= '单压';
              }else if($value['playedId'] ==2){
                $played .= '二中二' ;
              }else{
                $played .= '对子';
              }
             
            }else{
              $played .= '三骰';
              if($value['playedId'] ==4){
                $played .= '单压';
              }else if($value['playedId'] ==5){
                $played .= '二中二' ;
              }else{
                $played .= '豹子';
              }
             }

           if($data[$key]['state'] == 0){
            $state = "<td style='color:#FFF;'>未开奖</td>";
           }else if($data[$key]['state'] == 1){
            $state = "<td style='color:#F00;'>已派奖</td>";
           }else{
            $state = "<td style='color:#0F0;'>未中奖</td>";
           }

            $data[$key]['playedId'] = $played;
            $data[$key]['state'] = $state; 
            $value['zjamount'] > 0 ? $data[$key]['zjamount'] = "<td style='color:#F00;'>{$value['zjamount']}</td>":$data[$key]['zjamount'] = "<td style='color:#0F0;'>{$value['zjamount']}</td>";
        }
        echo json_encode($data);
    }



}

?>