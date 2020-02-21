<?php
use \think\Route;
/**
 * 后台管理端路由
 */

/**
 * 公共路由
 */
//单图上传
Route::rule('uploadImg','admin/Common/uploadimg');
//邮件发送
Route::rule('sendEmail','admin/Common/sendEmail');


/**
 * 登录相关操作
 */
// 登录页面
Route::rule('manager/login','admin/Login/index');
// 登录操作		
Route::rule('manager/auth','admin/Login/auth');
// 退出
Route::rule('manager/logout','admin/Login/logout');

/*
 * 管理端首页
 */
// 管理端首页
Route::rule('manager','admin/Login/index');
// 管理端首页
Route::rule('manager/index','admin/Index/index');

// 用户新增
Route::rule('manager/user/useradd','admin/User/add');
// 用户新增验证API
Route::rule('manager/user/useraddAuth','admin/User/addAuth');
// 用户删除
Route::rule('manager/user/del','admin/User/del');
// 用户状态
Route::rule('manager/user/disabled','admin/User/disabled');
// 用户组新增
Route::rule('manager/user/groupadd','admin/User/addgroup');
// 用户组新增验证API
Route::rule('manager/user/groupaddAuth','admin/User/addgroupAuth');
// 用户组删除
Route::rule('manager/user/delgroup','admin/User/delgroup');


// 员工新增
Route::rule('manager/staff/staffadd','admin/Staff/add');
// 员工新增验证API
Route::rule('manager/staff/staffaddAuth','admin/Staff/addAuth');
// 员工删除
Route::rule('manager/staff/del','admin/Staff/del');
// 员工状态
Route::rule('manager/staff/disabled','admin/Staff/disabled');
// 员工组新增
Route::rule('manager/staff/groupadd','admin/Staff/addgroup');
// 员工组新增验证API
Route::rule('manager/staff/groupaddAuth','admin/Staff/addgroupAuth');
// 员工组删除
Route::rule('manager/staff/delgroup','admin/Staff/delgroup');


// 基本信息新增验证API
Route::rule('manager/system/basicAuth','admin/System/basicAuth');
// SMTP邮件配置新增验证API
Route::rule('manager/system/emailAuth','admin/System/emailAuth');
// 附件设置新增验证API
Route::rule('manager/system/annexAuth','admin/System/annexAuth');
// 消息模板新增
Route::rule('manager/system/addtemplate','admin/System/addtemplate');
// 消息模板新增验证API
Route::rule('manager/system/addtemplateAuth','admin/System/addtemplateAuth');
// 消息模板删除
Route::rule('manager/system/deltemplate','admin/System/deltemplate');
// 消息模板状态操作
Route::rule('manager/system/disatemplate','admin/System/disatemplate');


// 产品新增
Route::rule('manager/product/add','admin/Product/add');
// 产品新增验证API
Route::rule('manager/product/addAuth','admin/Product/addAuth');
// 产品删除
Route::rule('manager/product/del','admin/Product/del');
// 产品组新增
Route::rule('manager/product/addgroup','admin/Product/addgroup');
// 产品组新增验证API
Route::rule('manager/product/addgroupAuth','admin/Product/addgroupAuth');
// 产品组删除
Route::rule('manager/product/delgroup','admin/Product/delgroup');
// 获取插件配置项
Route::rule('manager/product/getPlugConfig','admin/Product/getPlugConfig');
// 产品类型新增
Route::rule('manager/product/addtype','admin/Product/addtype');
// 产品类型新增验证API
Route::rule('manager/product/addtypeAuth','admin/Product/addtypeAuth');
// 产品类型删除
Route::rule('manager/product/deltype','admin/Product/deltype');


// 插件安装
Route::rule('manager/addons/install','admin/Addons/install');
// 插件卸载
Route::rule('manager/addons/uninstall','admin/Addons/uninstall');
// 插件启用
Route::rule('manager/addons/on','admin/Addons/on');
// 插件禁用
Route::rule('manager/addons/off','admin/Addons/off');
// 插件配置
Route::rule('manager/addons/edit','admin/Addons/edit');

// 系统更新确认
Route::rule('manager/cloudservice/confirm','admin/Cloudservice/confirm');
//系统检查变动文件
Route::rule('manager/cloudservice/checkfile','admin/Cloudservice/checkfile');
//系统检查版本
Route::rule('manager/cloudservice/checkversion','admin/Cloudservice/checkversion');
