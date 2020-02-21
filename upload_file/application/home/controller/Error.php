<?php
namespace app\home\controller;
use think\Controller;
/**
 * 错误处理
 */
class Error extends Controller
{

    //全局miss路由
    public function miss()
    {       
        return $this->fetch('Error/404');
    }


}
