<?php
/*
 * Author: 叶落深秋 <975827527@qq.com>
 * User: ylsq
 */

namespace app\manager\model;
use think\Model;

/**
 * 新闻表
 */
class GeeOperateBanner extends Model
{
  protected $name = "OperateBanner";
  
  //新闻状态
  public function getTStatusAttr($var, $data)
  {
    return $data['status'] == 1?'显示':'隐藏';
  }
}
