<?php
/*
 * Author: 叶落深秋 <975827527@qq.com>
 * User: ylsq
 */

namespace app\manager\model;
use think\Model;
use app\manager\model\GeeStaffgroup; // 用户组表

/**
 * 员工表
 */
class GeeAdminuser extends Model
{
  protected $name = "Adminuser";
	//员工组
    public function getStaffGroupAttr($var,$data)
    {
        return db('staffgroup')->where('id = '.$data['group_id'])->find()['name']?db('staffgroup')->where('id = '.$data['group_id'])->find()['name']:'暂无分组';
    }
	//员工状态
    public function getStaffStatusAttr($var,$data)
    {
    	switch ($data['status']) {
    		case '0':
    			return '正常';
			break;
    		case '1':
    			return '锁定';
			break;
    		case '2':
    			return '欠费';
			break;
    	}
    }
}
