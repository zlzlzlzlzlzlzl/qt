<?php
namespace app\index\controller;
use think\Controller;
use app\index\controller\Base;
use think\Request;
use think\Session;
use app\index\model\DataTimeModel;
use app\index\model\SystemModel as System;
use app\index\model\UserModel as User;
use app\index\model\DataModel as Da;

class Index extends Base
{
    /**
     * [index 默认]
     * @return [type] [description]
     */
    public function index() {
        $Da       = new Da();
        $U        = new User();
        $codeData = [];
        $index    = 0;
        $codeArr  = $Da->order('number DESC')->limit(0,40)->select();
        $userArr  = $U->where('online',1)->select();
        $userCount=count($userArr);
        foreach ($codeArr as $key => $value) {
            $codeData[$index]['number'] = $value['number']; 
            $codeData[$index]['data'] = explode(',',$value['data']);
            $index++;
        }
        return $this->fetch('index',['userinfo'=>$this->userinfo,'codeArr'=>$codeData,'userArr'=>$userArr,'userCount'=>$userCount,'Sysinfo'=>$this->Sysinfo]);
    }
    /**
     * [twoMethod 展示双骰玩法]
     * @return [type] [description]
     */
    public function twoMethod() {
        return $this->fetch('twoMethod',['userinfo'=>$this->userinfo,'Sysinfo'=>$this->Sysinfo]);
    }
    /**
     * [getGameInfo 游戏简介]
     * @return [type] [description]
     */
    public function getGameInfo() {
        return $this->fetch('gameinfo',['userinfo'=>$this->userinfo,'Sysinfo'=>$this->Sysinfo]);
    }
    /**
     * [getUserInfo 个人中心]
     * @return [type] [description]
     */
    public function getUserInfo() {
        return $this->fetch('userinfo',['userinfo'=>$this->userinfo,'Sysinfo'=>$this->Sysinfo]);
    }

    /**
     * [getQiHao 获取期号]
     * 
     * @param  Request $request [description]
     * @return [JSON]           [期号,开奖时间]
     */
    public function getQiHao(Request $request) {
        $dm  = new DataTimeModel();
        $h   = date('H:i:s'); 
        $res = $dm->where('actionTime','>',$h)->limit(0,1)->find();
        
        $n   = date('Y');
        $y   = sprintf('%02s',  date('m'));
        $d   = sprintf('%02s',  date('d'));
        $c   = sprintf('%03s', $res->actionNo);
        $actionNo = $n.$y.$d.$c;
        $dates = date('m/d/Y',time());
        $data = ['qihao'=>$actionNo,'kjsj'=>$res->actionTime,'dates'=>$dates];
        // print_r($data);exit;
         if($request->isAjax()){
            return json_encode($data);
        }else{
            return $actionNo .','.$res->actionTime;
        }
    
    }
    /**
     * [getMethod 获取玩法信息]
     * @param  Request $request [参数：当前玩法]
     * @return [JSON]           [description]
     */
    public function getMethod(Request $request) {

    }


    /**
     * [getSetting 获取设置]
     * @param  Request $request [description]
     * @return [type]           [description]
     */
    public function getSetting(Request $request){
        return json_encode($this->Sysinfo);   
    }

    /**
     * [getuserId 获取用户ID]
     * @return [type] [description]
     */
    public function getuserId(){
        return json_encode($this->userinfo['id']);
    }

    public function getCoin(request $request){
        $arr = $request->post();
        $id = $arr['id'];
        $User = new User();
        $coin = $User->where('id',$id)->value('coin');
        echo json_encode($coin);
    }

    /**
     * [getTime 获取毫秒级别的时间戳]
     * @return [type] [description]
     */
      function getTime(){  
            $time = explode (" ", microtime());   
            $time = $time [1] . ($time [0] * 1000);   
            $time2 = explode ( ".", $time );   
            $time = $time2 [0];  
            if(request()->isAjax()){
                echo $time;
            }else{
                return $time;  
            }
    }

    /**
     * [checkTime 检查封盘时间]
     * @return [type] [description]
     */
    function checkTime(){   
        $time = time();
        $action     = date('Y-m-d 09:00:00',$time);
        $end        = date('Y-m-d 22:00:00',$time);
        $actionTime = strtotime($action);
        $endTime    = strtotime($end);
        return $time < $actionTime || $time > $endTime ?false:true;

    }

}
