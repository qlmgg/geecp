<?php
/*
 * Author: 叶落深秋 <975827527@qq.com>
 * User: ylsq
 */

namespace app\manager\model;

use think\Model;
use think\Db;

/**
 * 代金券表
 */
class GeeCoupon extends Model
{
  protected $name = "Coupon";

  //所属用户
  public function getUserAttr($var, $data)
  {
    if($data['user_id']){
      $info = Db::name('user')->where('id = ' . $data['user_id'])->value('name');
    }
    
    return $info?$info:'未分配';
  }

  //状态
  public function getStatussAttr($var, $data)
  {
    switch ($data['status']) {
      case '0':
        $ck = '未使用';
        break;
      case '1':
        $ck = '使用中';
        break;
      case '2':
        $ck = '已使用';
        break;
      case '3':
        $ck = '已到期';
        break;
      case '4':
        $ck = '已作废';
        break;
      default:
        $ck = '';
        break;
    }
    return $ck;
  }
}
