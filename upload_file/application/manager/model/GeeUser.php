<?php
/*
 * Author: 叶落深秋 <975827527@qq.com>
 * User: ylsq
 */

namespace app\manager\model;

use app\index\model\GeeUserEnterprise; // 用户组表
use app\manager\model\GeeBilling; // 用户组表
use think\Model;

// 用户组表

/**
 * 用户表
 */
class GeeUser extends Model
{
    protected $name = "User";
    //用户类型
    public function getUserTypeAttr($var, $data)
    {
        return $data['type'] == '0' ? '个人' : '企业';
    }
    //所选用户消费金额
    public function getConsumptionAmountAttr($var, $data)
    {
        $b = new GeeBilling();
        // dump($data);
        $aconsumedlist = $b->where('`type` = "0" and `status` = 1 and `user_id`=' . $data['id'])->select();
        $amountConsumed = 0;
        foreach ($aconsumedlist as $k => $v) {
            $amountConsumed += $v['money'];
        }
        return $amountConsumed;
    }
    //当前返点金额
    public function getNowRebatesMoneyAttr($var,$data){
      return $data['rebates_money'] - $data['use_rebates_money'];
    }
    //用户组
    public function getUserGroupAttr($var, $data)
    {
        return db('usergroup')->where('id = ' . $data['group_id'])->find()['name'] ? db('usergroup')->where('id = ' . $data['group_id'])->find()['name'] : '暂无分组';
    }
    //所属代理商
    public function getUserManagerAttr($var, $data)
    {
        return $data['manager_id'] && db('user')->where('id = ' . $data['manager_id'])->find()['name'] ? db('user')->where('id = ' . $data['manager_id'])->find()['name'] : '无';
    }
    //企业名称
    public function getUserEnterpriseAttr($var,$data){
      $ue = new GeeUserEnterprise();
      return $ue->where('user_id = '.$data['id'])->find()['name'];
    }
    //认证状态
    public function getUserApproveAttr($var, $data)
    {
        return $data['approve'] == '0' ? '未认证' : '已认证';
    }
    //用户状态
    public function getUserStatusAttr($var, $data)
    {
        switch ($data['status']) {
            case '0':
                return '正常';
                break;
            case '1':
                return '欠费';
                break;
            case '2':
                return '锁定';
                break;
        }
    }
    public function getRstatusAttr($var, $data)
    {
        switch ($data['realverify']) {
            case '0':
                return '未提交审核';
                break;
            case '1':
                return '审核中';
                break;
            case '2':
                return '审核通过';
                break;
            case '3':
                return '审核失败';
                break;
        }
    }
    public function getEstatusAttr($var, $data)
    {
        $ue = new GeeUserEnterprise();
        $einfo = $ue->where('user_id = ' . $data['id'])->find();
        if ($einfo) {
            switch ($einfo['status']) {
                case '0':
                    return '审核中';
                    break;
                case '1':
                    return '审核通过';
                    break;
                case '2':
                    return '审核失败';
                    break;
            }
        } else {
            return '未提交审核';
        }
    }
}
