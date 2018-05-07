<?php
namespace app\index\controller;
use think\Controller;
use app\index\controller\Base;
use think\Request;
use think\Session;
use app\index\model\DataTimeModel;
use app\index\model\SystemModel as System;

class Index extends Base
{
    /**
     * [index 默认]
     * @return [type] [description]
     */
    public function index() {
        return $this->fetch('index',['userinfo'=>$this->userinfo]);
    }
    /**
     * [twoMethod 展示双骰玩法]
     * @return [type] [description]
     */
    public function twoMethod() {
    	return $this->fetch('twoMethod',['userinfo'=>$this->userinfo]);
    }
    /**
     * [getGameInfo 游戏简介]
     * @return [type] [description]
     */
    public function getGameInfo() {
    	return $this->fetch('gameinfo',['userinfo'=>$this->userinfo]);
    }
    /**
     * [getUserInfo 个人中心]
     * @return [type] [description]
     */
    public function getUserInfo() {
    	return $this->fetch('userinfo',['userinfo'=>$this->userinfo]);
    }
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
        $data = $request->post();
        return json_encode($data);
    }
    /**
     * [baoZiXiaZhu 投注豹子]
     * @param  Request $request [description]
     * @return [type]           [description]
     */
    public function baoZiXiaZhu(Request $request) {
         $data = $request->post();
         return json_encode($data);
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
        $data = ['qihao'=>$actionNo,'kjsj'=>$res->actionTime];
         if($request->isAjax()){
            return json_encode($data);
        }else{
            return $data;
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
        $sys = new System();
        $data = $sys::all();
        $webData = array();
        foreach ($data as $key => $value) {
            $webData[$value['key']] = $value['value'];
        }
        return json_encode($webData);   
    }
}
