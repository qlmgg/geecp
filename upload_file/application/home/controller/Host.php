<?php
namespace app\home\controller;
use app\home\controller\Common; // 前置操作
use app\admin\model\GeeWebbasic; // 基本信息表

class Host extends Common
{
    public function index()
    {
        return $this->fetch('Host/index');
    }
}
