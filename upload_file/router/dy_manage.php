<?php
use \think\Route;
use app\manager\model\GeeRoute; 
use app\manager\model\GeeV2mroute; 

/*****
 * 后台动态路由
 */

if (sys_is_installed() ) {
    //根据路由表生成管理端路由
    $route = new GeeV2mroute();
    $startRoute = $route->select();
    foreach ($startRoute as $key => $var) {
        Route::rule('manager/v2'.$var['name'],'manager'.ucwords($var['name']));
        if($var['f_id'] == 0){
          Route::rule('manager/v2/'.$var['code'].'/index','manager/'.ucwords($var['code']).'/index');
        }
    }
}
