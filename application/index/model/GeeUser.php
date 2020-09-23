<?php
namespace app\index\model;

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
    //所属代理商id
    public function getUserManagerIdAttr($var, $data)
    {
      return $data['manager_id'] && db('user')->where('id = ' . $data['manager_id'])->find()['name'] ? db('user')->where('id = ' . $data['manager_id'])->find()['name'] : '无';
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
}
