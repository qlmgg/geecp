<?php
// +----------------------------------------------------------------------
// | 公共路由文件
// +----------------------------------------------------------------------

use \think\Route;

//全局miss路由
Route::miss('home/error/miss');

//加载所有路由文件
$list_router_file = sys_select_dirs($dir='router/');

foreach ($list_router_file as  $value) {
    include_once('../router/'.$value);
}

