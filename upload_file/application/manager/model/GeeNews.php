<?php
/*
 * Author: 叶落深秋 <975827527@qq.com>
 * User: ylsq
 */

namespace app\manager\model;
use app\manager\model\GeeNewsclass; // 用户表
use think\Model;

/**
 * 新闻表
 */
class GeeNews extends Model
{
  protected $name = "News";
  //新闻分类
  public function getClassAttr($var, $data)
  {
    $nc = new GeeNewsclass();
    return $nc->where('id = '.$data['class_id'])->find()['name'];
  }
  //新闻状态
  public function getTStatusAttr($var, $data)
  {
    return $data['status'] == 1?'显示':'隐藏';
  }
}
