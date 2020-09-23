<?php

// 定义根目录,可更改此目录
define('GEE_ROOT', dirname(__DIR__) . '/');
define('GEE_DATA', GEE_ROOT . 'data/');

// 定义应用目录
define('APP_PATH', __DIR__ . '/../application/');
// 加载框架引导文件
require __DIR__ . '/../thinkphp/start.php';
