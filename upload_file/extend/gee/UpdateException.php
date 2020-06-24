<?php

namespace gee;

use think\Exception;

/**
 * 更新异常处理类
 * @package think
 */
class UpdateException extends Exception
{

    public function __construct($message, $code, $data = '')
    {
        $this->message  = $message;
        $this->code     = $code;
        $this->data     = $data;
    }

}
