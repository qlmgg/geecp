<?php
namespace addons\cdn\easypanelcdn\common\library;
/**
 * Author: 镜面王子 <153555712@qq.com>
 * User: jingmian
 */

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