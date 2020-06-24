<?php
use \think\Route;
/**
 * 后台管理端路由
 */

/**
 * 公共路由
 */
//单图上传
Route::rule('uploadImg','manager/Common/uploadimg');
//邮件发送
Route::rule('sendEmail','manager/Common/sendEmail');
//解析消息模板
Route::rule('sendMessage','manager/Common/sendMessage');



/**
 * 登录相关操作
 */
// 登录页面
Route::rule('manager/login','manager/Login/index');
// 登录操作		
Route::rule('manager/auth','manager/Login/auth');
// 退出
Route::rule('manager/logout','manager/Login/logout');

/*
 * 管理端首页
 */
// // 管理端首页
// Route::rule('manager','manager/Login/index');
// // 管理端首页
// Route::rule('manager/index','manager/Index/index');

// // 用户新增
// Route::rule('manager/user/useradd','manager/User/add');
// // 用户新增验证API
// Route::rule('manager/user/useraddAuth','manager/User/addAuth');
// // 用户删除
// Route::rule('manager/user/del','manager/User/del');
// // 用户状态
// Route::rule('manager/user/disabled','manager/User/disabled');
// // 用户组新增
// Route::rule('manager/user/groupadd','manager/User/addgroup');
// // 用户组新增验证API
// Route::rule('manager/user/groupaddAuth','manager/User/addgroupAuth');
// // 用户组删除
// Route::rule('manager/user/delgroup','manager/User/delgroup');


// // 员工新增
// Route::rule('manager/staff/staffadd','manager/Staff/add');
// // 员工新增验证API
// Route::rule('manager/staff/staffaddAuth','manager/Staff/addAuth');
// // 员工删除
// Route::rule('manager/staff/del','manager/Staff/del');
// // 员工状态
// Route::rule('manager/staff/disabled','manager/Staff/disabled');
// // 员工组新增
// Route::rule('manager/staff/groupadd','manager/Staff/addgroup');
// // 员工组新增验证API
// Route::rule('manager/staff/groupaddAuth','manager/Staff/addgroupAuth');
// // 员工组删除
// Route::rule('manager/staff/delgroup','manager/Staff/delgroup');


// // 基本信息新增验证API
// Route::rule('manager/system/basicAuth','manager/System/basicAuth');
// // SMTP邮件配置新增验证API
// Route::rule('manager/system/emailAuth','manager/System/emailAuth');
// // 附件设置新增验证API
// Route::rule('manager/system/annexAuth','manager/System/annexAuth');
// // 消息模板新增
// Route::rule('manager/system/addtemplate','manager/System/addtemplate');
// // 消息模板新增验证API
// Route::rule('manager/system/addtemplateAuth','manager/System/addtemplateAuth');
// // 消息模板删除
// Route::rule('manager/system/deltemplate','manager/System/deltemplate');
// // 消息模板状态操作
// Route::rule('manager/system/disatemplate','manager/System/disatemplate');


// // 产品新增
// Route::rule('manager/product/add','manager/Product/add');
// // 产品新增验证API
// Route::rule('manager/product/addAuth','manager/Product/addAuth');
// // 产品删除
// Route::rule('manager/product/del','manager/Product/del');
// // 产品组新增
// Route::rule('manager/product/addgroup','manager/Product/addgroup');
// // 产品组新增验证API
// Route::rule('manager/product/addgroupAuth','manager/Product/addgroupAuth');
// // 产品组删除
// Route::rule('manager/product/delgroup','manager/Product/delgroup');
// // 获取插件配置项
// Route::rule('manager/product/getPlugConfig','manager/Product/getPlugConfig');
// // 产品类型新增
// Route::rule('manager/product/addtype','manager/Product/addtype');
// // 产品类型新增验证API
// Route::rule('manager/product/addtypeAuth','manager/Product/addtypeAuth');
// // 产品类型删除
// Route::rule('manager/product/deltype','manager/Product/deltype');


// // 插件安装
// Route::rule('manager/addons/install','manager/Addons/install');
// // 插件卸载
// Route::rule('manager/addons/uninstall','manager/Addons/uninstall');
// // 插件启用
// Route::rule('manager/addons/on','manager/Addons/on');
// // 插件禁用
// Route::rule('manager/addons/off','manager/Addons/off');
// // 插件配置
// Route::rule('manager/addons/edit','manager/Addons/edit');

// // 系统更新确认
// Route::rule('manager/cloudservice/confirm','manager/Cloudservice/confirm');
// //系统检查变动文件
// Route::rule('manager/cloudservice/checkfile','manager/Cloudservice/checkfile');
// //系统检查版本
// Route::rule('manager/cloudservice/checkversion','manager/Cloudservice/checkversion');

//-----------------------------v2基础路由---------------------------------------

// 登录页面
Route::rule('manager/v2/login','manager/Login/index');
// 登录操作		
Route::rule('manager/v2/auth','manager/Login/auth');
// 退出
Route::rule('manager/v2/logout','manager/Login/logout');

/*
 * 管理端首页
 */
// 管理端首页
Route::rule('manager/','manager/Login/index');
Route::rule('manager/v2/','manager/Login/index');
// 管理端首页
Route::rule('manager/v2/index','manager/Index/index');
// 管理端首页
Route::rule('manager/v2/gethistory','manager/Index/gethistory');

// 用户新增
Route::rule('manager/v2/user/useradd','manager/User/add');
// 用户新增验证API
Route::rule('manager/v2/user/useraddAuth','manager/User/addAuth');
// 用户删除
Route::rule('manager/v2/user/del','manager/User/del');
// 用户状态
Route::rule('manager/v2/user/disabled','manager/User/disabled');
// 用户组新增
Route::rule('manager/v2/user/groupadd','manager/User/addgroup');
// 用户组新增验证API
Route::rule('manager/v2/user/groupaddAuth','manager/User/addgroupAuth');
// 用户组删除
Route::rule('manager/v2/user/delgroup','manager/User/delgroup');


// 员工新增
Route::rule('manager/v2/staff/staffadd','manager/Staff/add');
// 员工新增验证API
Route::rule('manager/v2/staff/staffaddAuth','manager/Staff/addAuth');
// 员工删除
Route::rule('manager/v2/staff/del','manager/Staff/del');
// 员工状态
Route::rule('manager/v2/staff/disabled','manager/Staff/disabled');
// 员工组新增
Route::rule('manager/v2/staff/groupadd','manager/Staff/addgroup');
// 员工组新增验证API
Route::rule('manager/v2/staff/groupaddAuth','manager/Staff/addgroupAuth');
// 员工组删除
Route::rule('manager/v2/staff/delgroup','manager/Staff/delgroup');


// 基本信息新增验证API
Route::rule('manager/v2/system/basicAuth','manager/System/basicAuth');
// SMTP邮件配置新增验证API
Route::rule('manager/v2/system/emailAuth','manager/System/emailAuth');
// 附件设置新增验证API
Route::rule('manager/v2/system/annexAuth','manager/System/annexAuth');
// 消息模板新增
Route::rule('manager/v2/system/addtemplate','manager/System/addtemplate');
// 消息模板新增验证API
Route::rule('manager/v2/system/addtemplateAuth','manager/System/addtemplateAuth');
// 消息模板删除
Route::rule('manager/v2/system/deltemplate','manager/System/deltemplate');
// 消息模板状态操作
Route::rule('manager/v2/system/disatemplate','manager/System/disatemplate');


// 产品新增
Route::rule('manager/v2/product/add','manager/Product/add');
// 产品新增验证API
Route::rule('manager/v2/product/addAuth','manager/Product/addAuth');
// 产品删除
Route::rule('manager/v2/product/del','manager/Product/del');
// 产品组新增
Route::rule('manager/v2/product/addgroup','manager/Product/addgroup');
// 产品组新增验证API
Route::rule('manager/v2/product/addgroupAuth','manager/Product/addgroupAuth');
// 产品组删除
Route::rule('manager/v2/product/delgroup','manager/Product/delgroup');
// 获取插件配置项
Route::rule('manager/v2/product/getPlugConfig','manager/Product/getPlugConfig');
// 产品类型新增
Route::rule('manager/v2/product/addtype','manager/Product/addtype');
// 产品类型新增验证API
Route::rule('manager/v2/product/addtypeAuth','manager/Product/addtypeAuth');
// 产品类型删除
Route::rule('manager/v2/product/deltype','manager/Product/deltype');


// 插件安装
Route::rule('manager/v2/addons/install','manager/Addons/install');
// 插件卸载
Route::rule('manager/v2/addons/uninstall','manager/Addons/uninstall');
// 插件启用
Route::rule('manager/v2/addons/on','manager/Addons/on');
// 插件禁用
Route::rule('manager/v2/addons/off','manager/Addons/off');
// 插件配置
Route::rule('manager/v2/addons/edit','manager/Addons/edit');

// 系统更新确认
Route::rule('manager/v2/cloudservice/confirm','manager/Cloudservice/confirm');
//系统检查变动文件
Route::rule('manager/v2/cloudservice/checkfile','manager/Cloudservice/checkfile');
//系统检查版本
Route::rule('manager/v2/cloudservice/checkversion','manager/Cloudservice/checkversion');
