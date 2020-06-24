<?php
use app\index\model\GeeWebroute;
use \think\Route; // 前台控制台路由表
// use app\home\model\GeeHomeroute; // 前台模板路由表
$webRoute = new GeeWebroute();
// $homeRoute = new GeeHomeroute();

/*****
 * 前台动态路由
 */

if (sys_is_installed()) {

    $webPlugRoute = $webRoute->where('f_id = 0 and is_plug != ""')->select();
    foreach ($webPlugRoute as $key => $var) {
        Route::rule('/' . $var['code'], $var['is_plug'] . '/' . ucwords($var['code']) . '/index');
        Route::rule('/' . $var['code'] . '/index', $var['is_plug'] . '/' . ucwords($var['code']) . '/index');
        Route::rule('/' . $var['code'] . '/list', $var['is_plug'] . '/' . ucwords($var['code']) . '/index');
        $webPlugRouteRes = $webRoute->where('`f_id` = ' . $var['id'])->select();
        foreach ($webPlugRouteRes as $k => $v) {
            Route::rule('/' . $var['code'] . '/' . $v['code'], $var['is_plug'] . '/' . ucwords($var['code']) . '/' . $v['code']);
        }
    }

    //根据路由表生成console端路由
    $webStartRoute = $webRoute->select();
    foreach ($webStartRoute as $key => $var) {
        //生成home路由
        if ($var['code'] == 'home') {
            $homeid = $var['id'];
            Route::rule($var['name'], 'index' .$var['name']);
            Route::rule($var['name'] . '/index', 'index' . ucwords($var['name']) . '/index');
        }
        if ($homeid && $var['f_id'] == $homeid) {
            Route::rule(str_replace("h_","",$var['code']), 'index' . $var['name']);
            Route::rule(str_replace("h_","",$var['code']) . '/index', 'index' . $var['name']);
        }
        //--------------------------------------------------------------------------------------
        if ($var['f_id'] == 0) {
            Route::rule('console' . $var['name'], 'index' .$var['name']);
            Route::rule('console' . $var['name'] . '/index', 'index' . ucwords($var['name']) . '/index');
          } else {
            Route::rule('console' . $var['name'], 'index' .$var['name']);
        }
    }

    // //根据路由表生成API端路由
    // $webStartRoute = $webRoute->select();
    // foreach ($webStartRoute as $key => $var) {
    //     if ($var['f_id'] == 0) {
    //         Route::rule('api/' . $var['code'], 'index/' . ucwords($var['code']) . '/index');
    //         Route::rule('api/' . $var['code'] . '/index', 'index/' . ucwords($var['code']) . '/index');
    //     } else {
    //         $froute = $webRoute->where('`id` = ' . $var['f_id'])->find();
    //         Route::rule('api/' . $froute['code'] . '/' . $var['code'], 'index/' . ucwords($froute['code']) . '/' . $var['code']);
    //         Route::rule('api/' . $froute['code'] . '/' . $var['code'], 'index/' . ucwords($froute['code']) . '/' . $var['code']);
    //     }
    // }

}
