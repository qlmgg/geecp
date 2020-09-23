<?php
/**
 * Author: 镜面王子 <153555712@qq.com>
 * User: jingmian
 */
namespace addons\host\easypanel\common\library;

use think\Exception;

/**
 * 更新异常处理类
 * @package think
 */
class WhmException extends Exception
{

    public function __construct($message, $code, $type= '',$data = '')
    {
        $this->message  = $message;
        $this->code     = $code;
        $this->data     = $data;
        $this->type     = $type;
    }

}