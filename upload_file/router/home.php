<?php

use \think\Route;

/*****
 * 
 * 前台路由
 */

Route::rule('/api/return_url','index/Api/return_url');
Route::rule('/api/notify_url','index/Api/notify_url');
/**
 *  插件路由
 */
//虚拟主机
Route::rule('manager/vhost/index','admin/Vhosts/index');
Route::rule('manager/vhost/add','admin/Vhosts/add');
Route::rule('manager/vhost/addAuth','admin/Vhosts/addAuth');
Route::rule('manager/vhost/del','admin/Vhosts/del');
Route::rule('manager/vhost/group','admin/Vhosts/group');
Route::rule('manager/vhost/addgroup','admin/Vhosts/addgroup');
Route::rule('manager/vhost/addgroupAuth','admin/Vhosts/addgroupAuth');
Route::rule('manager/vhost/delgroup','admin/Vhosts/delgroup');
Route::rule('manager/vhost/vhost','admin/Vhosts/vhost');
Route::rule('manager/vhost/addvhost','admin/Vhosts/addvhost');
Route::rule('manager/vhost/addvhostAuth','admin/Vhosts/addvhostAuth');
Route::rule('manager/vhost/syncvhost','admin/Vhosts/syncvhost');

//VPS通用操作(前台)
// Route::rule('vps/index','index/Vpss/index');
// Route::rule('vps/add','index/Vpss/add');
// Route::rule('vps/addAuth','index/Vpss/addAuth');
// Route::rule('vps/up','index/Vpss/up');
// Route::rule('vps/del','index/Vpss/del');
// Route::rule('vps/renew','index/Vpss/renew');
// Route::rule('vps/on','index/Vpss/on');
// Route::rule('vps/off','index/Vpss/off');
// Route::rule('vps/changepass','index/Vpss/changepass');
// Route::rule('vps/getProItem','index/Vpss/getProItem');
// Route::rule('vps/getPrice','index/Vpss/getPrice');
// Route::rule('vps/manager','index/Vpss/manager');



//vps操作
Route::rule('console/vps/add','index/Vps/add');
Route::rule('console/vps/addAuth','index/Vps/addAuth');
Route::rule('console/vps/up','index/Vps/up');
Route::rule('console/vps/del','index/Vps/del');
Route::rule('console/vps/del','index/Vps/release');
Route::rule('console/vps/renew','index/Vps/renew');
Route::rule('console/vps/on','index/Vps/on');
Route::rule('console/vps/off','index/Vps/off');
Route::rule('console/vps/changepass','index/Vps/changepass');
Route::rule('console/vps/getProItem','index/Vps/getProItem');
Route::rule('console/vps/getPrice','index/Vps/getPrice');
Route::rule('console/vps/manager','index/Vps/manager');

/**
 * 前台用户端控制台路由
 */
//首页
Route::rule('console/','index/Index/index');
Route::rule('console/index','index/Index/index');


/**
 * 前台用户端路由
 */
// 登录页面
Route::rule('/login','index/Login/index');
// 登录操作		
Route::rule('/auth','index/Login/auth');
// 注册页面
Route::rule('/register','index/Login/register');
// 注册操作		
Route::rule('/regauth','index/Login/regauth');
//注册协议
Route::rule('/regdeal','index/Login/regdeal');
// 忘记密码页面
Route::rule('/forget','index/Login/forget');
// 忘记密码操作		
Route::rule('/forgetauth','index/Login/forgetauth');
// 退出
Route::rule('/logout','index/Login/logout');
//首页
Route::rule('/','home/Index/index');
Route::rule('/index','home/Index/index');

