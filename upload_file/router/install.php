<?php
use \think\Route;


/*****
 * 系统安装路由
 */
Route::group('install', function () {
    //查看协议并安装
    Route::rule('/step1', 'install/index/step1');
    //运行环境检测
    Route::rule('/step2', 'install/index/step2');
    //配置数据库以及管理员
    Route::rule('/step3', 'install/index/step3');
    //安装处理
    Route::rule('/step4', 'install/index/step4');
    //安装过程
    Route::rule('/action', 'install/index/action');
    //安装完成
    Route::rule('/step5', 'install/index/step5');
    //导入管理员
    Route::rule('/create_admin', 'install/index/create_admin');
    //更新数据库配置文件
    Route::rule('/update_dbconfig', 'install/index/update_dbconfig');
    
    //测试数据库密码
    Route::rule('/testDbPwd', 'install/index/testDbPwd');
});





