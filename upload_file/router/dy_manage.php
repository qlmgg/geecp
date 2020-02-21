<?php
use \think\Route;
use app\admin\model\GeeRoute; 

/*****
 * 后台动态路由
 */

if (sys_is_installed() ) {
    //根据路由表生成管理端路由
    $route = new GeeRoute();
    $startRoute = $route->where('`f_id` = 0 and `is_show` = "1"')->select();
    foreach ($startRoute as $key => $var) {
        Route::rule('manager/'.$var['code'],'admin/'.ucwords($var['code']).'/index');
        Route::rule('manager/'.$var['code'].'/index','admin/'.ucwords($var['code']).'/index');
        $routeRes = $route->where('`f_id` = '.$var['id'])->select();
        foreach ($routeRes as $k => $v) {
            Route::rule('manager/'.$var['code'].'/'.$v['code'],'admin/'.ucwords($var['code']).'/'.$v['code']);
        }
    }

}
