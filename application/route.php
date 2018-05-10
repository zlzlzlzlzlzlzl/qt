<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006~2018 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: liu21st <liu21st@gmail.com>
// +----------------------------------------------------------------------
use think\Route;
Route::get('/','index/index/index');
Route::get('index','index/index/index');
Route::get('two','index/index/twoMethod');
Route::get('gameinfo','index/index/getGameInfo');
Route::get('userinfo','index/index/getUserInfo');
Route::get('tologin','index/UserLogin/viewLogin');
Route::post('dologin','index/UserLogin/doLogin');
Route::post('toregister','index/UserLogin/toRegister');
Route::get('logout','index/UserLogin/logOut');
Route::post('qiangzhuang','index/index/qiangZhuang');
Route::post('xiazhu','index/lottery/xiaZhu');
Route::post('baozixiazhu','index/index/baoZiXiaZhu');
Route::get('getqihao','index/index/getQiHao');
Route::post('getSetting','index/index/getSetting');
Route::post('getuserId','index/index/getUserId');
Route::post('getCode','index/lottery/getCode');
Route::post('getUserCoin','index/index/getCoin');
Route::post('getBetList','index/Lottery/getBetList');
Route::get('Vrecharge','index/User/userRecharge');
Route::post('inRecharge','index/User/RechargeState');
Route::get('withdraw','index/User/withdrawMoneyV');
Route::post('withdrawMoney','index/User/withdrawMoney');
Route::post('setUserBank','index/User/setUserBank');
