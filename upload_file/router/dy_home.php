<?php
use \think\Route;
use app\index\model\GeeWebroute; // 前台控制台路由表
use app\home\model\GeeHomeroute; // 前台模板路由表
$webRoute = new GeeWebroute();
$homeRoute = new GeeHomeroute();

/*****
 * 前台动态路由
 */

if (sys_is_installed()) {

    $webPlugRoute = $webRoute->where('f_id = 0 and is_plug != ""')->select();
    foreach ($webPlugRoute as $key => $var) {
        Route::rule('/'.$var['code'],$var['is_plug'].'/'.ucwords($var['code']).'/index');
        Route::rule('/'.$var['code'].'/index',$var['is_plug'].'/'.ucwords($var['code']).'/index');
        Route::rule('/'.$var['code'].'/list',$var['is_plug'].'/'.ucwords($var['code']).'/index');
        $webPlugRouteRes = $webRoute->where('`f_id` = '.$var['id'])->select();
        foreach ($webPlugRouteRes as $k => $v) {
            Route::rule('/'.$var['code'].'/'.$v['code'],$var['is_plug'].'/'.ucwords($var['code']).'/'.$v['code']);
        }
    }

    //根据路由表生成管理端路由
    $webStartRoute = $webRoute->select();
    foreach ($webStartRoute as $key => $var) {
        if($var['f_id'] == 0){
            Route::rule('console/'.$var['code'] ,'index/'.ucwords($var['code']).'/index');
            Route::rule('console/'.$var['code'].'/index' ,'index/'.ucwords($var['code']).'/index');
        } else {
            $froute = $webRoute->where('`id` = '.$var['f_id'])->find();
            Route::rule('console/'.$froute['code'].'/'.$var['code'],'index/'.ucwords($froute['code']).'/'.$var['code']);
            Route::rule('console/'.$froute['code'].'/'.$var['code'],'index/'.ucwords($froute['code']).'/'.$var['code']);
        }
    }


    //根据路由表生成管理端路由
    $homeStartRoute = $homeRoute->select();
    foreach ($homeStartRoute as $key => $var) {
        if($var['f_id'] == 0){
            Route::rule('/'.$var['code'] ,'home/'.ucwords($var['code']).'/index');
            Route::rule('/'.$var['code'].'/index' ,'home/'.ucwords($var['code']).'/index');
        } else {
            $froute = $homeRoute->where('`id` = '.$var['f_id'])->find();
            Route::rule('/'.$froute['code'].'/'.$var['code'],'home/'.ucwords($froute['code']).'/'.$var['code']);
            Route::rule('/'.$froute['code'].'/'.$var['code'],'home/'.ucwords($froute['code']).'/'.$var['code']);
        }
    }

}
