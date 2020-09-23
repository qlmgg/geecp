<?php
namespace app\index\controller;

use app\index\controller\Common; // 前置操作
use app\index\model\GeeBilling; //
use app\index\model\GeeDns; //
use app\index\model\GeeDomain; //
use app\index\model\GeeHost; //
use app\index\model\GeeServer; //
use app\index\model\GeeUser;
use app\index\model\GeeUserEnterprise;
use app\index\model\GeeUsergroup; //
use app\index\model\GeeUserRealnames; //
use app\index\model\GeeVps; //
use app\manager\model\GeeCloudserver; //
use app\manager\model\GeeRebatesLog; //
use think\Controller;
use think\Paginator\driver\Bootstrap;

class Agent extends Common
{
    public function index()
    {
        $u = new GeeUser();
        $ug = new GeeUsergroup();
        $ue = new GeeUserEnterprise();
        $b = new GeeBilling();
        $uid = session('_userInfo')['id'];
        //代理商信息
        $agentInfo = $u->where('id = ' . $uid)->find();
        $ename = $ue->where('user_id = ' . $uid)->value('name');
        $agentInfo['agentname'] = $ename ? $ename : ($agentInfo['realname'] ? $agentInfo['realname'] : $agentInfo['name']);
        $agentInfo['agentlevel'] = $ug->where('id = ' . $agentInfo['group_id'])->value('name');
        $agentInfo['agentphone'] = $agentInfo['tel'] ? $agentInfo['tel'] : $agentInfo['phone'];
        $agentInfo['clientnum'] = $u->where('manager_id = ' . $uid)->count();
        $this->assign('agent', $agentInfo);

        //获取近期返点收益分布数据
        $this->assign('agentRebatesData', $this->getRecentRebates([
            'start' => date('Y-m-d', strtotime('-30 day')),
            'end' => date('Y-m-d', strtotime('-0 day')),
        ]));

        //获取返点收益趋势
        $this->assign('agentRebatesLine', $this->getRebatesLine([
            'start' => date('Y-m-d', strtotime('-30 day')),
            'end' => date('Y-m-d', strtotime('-0 day')),
        ]));

        //现金返点消费趋势
        $this->assign('getCashRebateLine', $this->getCashRebateLine([
            'start' => date('Y-m-d', strtotime('-30 day')),
            'end' => date('Y-m-d', strtotime('-0 day')),
        ]));

        //客户返点排行榜
        $clientTop = $u->where('manager_id = ' . $uid)->where('make_rebates_money > 0')->order('make_rebates_money desc')->limit(10)->select();
        $this->assign('clientTop', $clientTop);

        return $this->fetch('Agent/index');
    }
    /**
     * 获取近期返点收益分布数据
     */
    public function getRecentRebates($time = [])
    {
        $u = new GeeUser();
        $b = new GeeBilling();
        $rl = new GeeRebatesLog();
        $uid = session('_userInfo')['id'];
        //与当前代理商相关的用户id
        $agentClient = $u->where('manager_id = ' . $uid)->select();
        $agentIds = [];
        $w = 'user_id = '.$uid;
        foreach ($agentClient as $k=>$v) {
            array_push($agentIds, $v['id']);
            $w .= ' or user_id = '.$v['id'];
        }
        //近期所属该代理商的订单
        if ($time) {
            $map["time"] = [['egt', strtotime($time['start'] . " 00:00:00")], ['ELT', strtotime($time['end'] . " 23:59:59")]];
            $recentRebatesOrder = $rl->where($w)->where(['create_time' => $map['time']])->select();
        }
        //生成时间段中包含所有产品类型
        $recentRebates = [];
        $res = [];
        foreach ($recentRebatesOrder as &$v) {
          $v['pro_type'] = db('product_class')->where('name = "' . $v['pro_type'] . '"')->value('title');
          // dump($v);
          if(!$recentRebates[$v['pro_type']]){
            $recentRebates[$v['pro_type']] = 0;
          }
          $recentRebates[$v['pro_type']] += $v['rebates'];
        }
        $recentRebatesData = [];
        // dump($recentRebates);
        foreach ($recentRebates as $k => $v) {
            array_push($recentRebatesData, [
                'name' => $k,
                'value' => $v,
            ]);
        }
        return $recentRebatesData;
    }
    /**
     * 近期返点收益趋势
     */
    public function getRebatesLine($time = [])
    {
        $u = new GeeUser();
        $b = new GeeBilling();
        $rl = new GeeRebatesLog();
        $uid = session('_userInfo')['id'];
        //近期所属该代理商的订单
        if ($time) {
            //生成时间段
            $times_sc = statistics_time(['start_time' => $time['start'], 'end_time' => $time['end']]);
        } else {
            //生成时间段
            $times_sc = statistics_time(['start_time' => date('Y-m-d', strtotime('-30 day')), 'end_time' => date('Y-m-d', strtotime('0 day'))]);
        }
        //与当前代理商相关的用户id
        $agentClient = $u->where('manager_id = ' . $uid)->select();
        $agentIds = [];
        foreach ($agentClient as &$v) {
            array_push($agentIds, $v['id']);
        }
        //生成时间段中包含所有产品类型
        $recentRebates = [];
        $res['types'] = [];
        //根据时间段生成当天产品收益
        foreach ($times_sc as $k => $v) {
            /* 时间条件 */
            $map = array();
            $map["time"] = array(array('egt', strtotime($v . " 00:00:00")), array('ELT', strtotime($v . " 23:59:59")));
            $recentRebatesOrder = $rl->where(array('create_time' => $map['time']))->select();
            $types = [];
            foreach ($recentRebatesOrder as &$val) {
                if ($val['user_id'] == $uid || in_array($val['user_id'], $agentIds)) {
                    $val['pro_type'] = db('product_class')->where('name = "' . $val['pro_type'] . '"')->value('title');
                    if (!$types[$val['pro_type']]) {
                        $types[$val['pro_type']] = 0;
                    }
                    $types[$val['pro_type']] += $val['rebates'];
                }
            }
            $res['date'][] = $v;
            $res['data'][] = $types;
            if ($val['pro_type']) {
                if (!in_array($val['pro_type'], $res['types'])) {
                    array_push($res['types'], $val['pro_type']);
                }
            }
        }
        return $res;
    }
    /**
     * 获取现金返点消费趋势
     */
    public function getCashRebateLine($time = [])
    {
        $b = new GeeBilling();
        $uid = session('_userInfo')['id'];
        //近期所属该代理商的订单
        if ($time) {
            //生成时间段
            $times_sc = statistics_time(['start_time' => $time['start'], 'end_time' => $time['end']]);
        } else {
            //生成时间段
            $times_sc = statistics_time(['start_time' => date('Y-m-d', strtotime('-30 day')), 'end_time' => date('Y-m-d', strtotime('0 day'))]);
        }
        foreach ($times_sc as $k => $v) {
            /* 时间条件 */
            $map = array();
            $map["time"] = array(array('egt', strtotime($v . " 00:00:00")), array('ELT', strtotime($v . " 23:59:59")));
            // dump($v);
            /* 当天现金金额 */
            $binfo = $b->where(array('create_time' => $map['time']))->where('user_id = ' . $uid . ' or manager_id = ' . $uid)->where('status = "1"')->select();
            $money = 0;
            $rebates = 0;
            if ($binfo) {
                foreach ($binfo as $key => $val) {
                    $money += (double) str_replace(",", "", $val['money']) - $val['use_rebates'];
                    $rebates += $val['use_rebates'];
                }
            }
            $historical[$k]['date'] = $v;
            $historical[$k]['value'] = [
                'cash' => to_double((double) $money),
                'rebates' => to_double((double) $rebates),
            ];
            $hdate[$k] = $v;
            $hval[$k] = [
                'cash' => to_double((double) $money),
                'rebates' => to_double((double) $rebates),
            ];
        }
        $res = [
            'historical' => $historical,
            'hdate' => $hdate,
            'hval' => $hval,
        ];
        return $res;
    }

    public function gethistory()
    {
        $data = $_POST;
        $ret = [
            'status' => 200,
            'msg' => '操作成功',
            'data' => '',
        ];
        $b = new GeeBilling();
        if ($data['ctype'] == 'pie') {
            $result = $this->getRecentRebates($data);
            $ret['data'] = [];
            $ret['data']['data'] = $result;
        } elseif ($data['ctype'] == 'rline') {
            $result = $this->getRebatesLine($data);
            $ret['data'] = [];
            $ret['data']['date'] = $result['date'];
            $ret['data']['data'] = $result['data'];
            $ret['data']['types'] = $result['types'];
        } else {
            $result = $this->getCashRebateLine($data);
            $ret['data'] = [];
            $ret['data']['date'] = $result['hdate'];
            $ret['data']['data'] = $result['hval'];
        }
        return json_encode($ret);
    }

    public function client()
    {
        $uinfo = session('_userInfo');
        $u = new GeeUser();
        //分销链接
        $agenturi = $_SERVER['REQUEST_SCHEME'] . '://' . $_SERVER['HTTP_HOST'] . '/console/agent/bind?token=' . $uinfo['manager_code'];
        $this->assign('agenturi', $agenturi);

        //客户列表
        $g = $_GET;
        if ($g['name']) {
            $w = [
                'name' => ['like', '%' . $g['name'] . '%'],
            ];
        }
        $list = $u->where('manager_id = ' . $uinfo['id'])->where($w)->order('id desc')->field("id,name,phone,email,manager_remark,balance,make_rebates_money")->paginate(10, false, ['query' => request()->param()]);
        $this->assign('list', $list);
        return $this->fetch('Agent/client');
    }
    public function clientauth()
    {
        $u = new GeeUser();
        $uinfo = session('_userInfo');
        $data = $_POST;
        $ret = [
            'status' => 200,
            'msg' => '操作成功',
            'data' => '',
        ];

        if (!isset($data['id']) || empty($data['id'])) {
            $ret['status'] = 422;
            $ret['msg'] = '请选择要修改的客户！';
            return json_encode($ret);
        }
        $id['id'] = $data['id'];
        unset($data['id']);
        $clientres = $u->save($data, $id);
        if (!$clientres) {
            $ret['status'] = 422;
            $ret['msg'] = '网络请求失败!请稍后再试!';
            return json_encode($ret);
        }
        return json_encode($ret);
    }
    //用户绑定代理商
    public function bind()
    {
        $u = new GeeUser();
        $ug = new GeeUsergroup();
        $g = $_GET;
        // dump(session('_userInfo')['id']);
        $uinfo = $u->where('id = ' . session('_userInfo')['id'])->find();
        $uginfo = $ug->where('id = ' . $uinfo['group_id'])->find();
        if (!$g['token']) {
            return $this->redirect('index/index/index');
        }
        // dump($uinfo['manager_id']);
        if ($uginfo['is_agent'] === 1) {
            //代理商
            return $this->redirect('index/agent/index');
        }
        //普通用户
        // dump($uinfo);
        if ($uinfo['manager_id']) {
            //已绑定
            $has = true;
            $agent = $u->where('id = "' . $uinfo['manager_id'] . '"')->find();
        } else {
            $has = false;
            $agent = $u->where('manager_code = "' . $g['token'] . '"')->find();
        }

        // dump($has);
        $this->assign('agent', $agent);
        $this->assign('hasagent', $has);
        return $this->fetch('Agent/bind');

    }
    //用户绑定代理商验证
    public function bindauth()
    {
        $u = new GeeUser();
        $uinfo = session('_userInfo');
        $data = $_POST;
        $ret = [
            'status' => 200,
            'msg' => '操作成功',
            'data' => '',
        ];

        if (!isset($data['token']) || empty($data['token'])) {
            $ret['status'] = 422;
            $ret['msg'] = '请选择要绑定的代理商！';
            return json_encode($ret);
        }
        $agent = $u->where('manager_code = "' . $data['token'] . '"')->find();
        $id['id'] = $uinfo['id'];
        unset($data['id']);
        $data['manager_id'] = $agent['id'];
        unset($data['token']);
        $clientres = $u->save($data, $id);
        if (!$clientres) {
            $ret['status'] = 422;
            $ret['msg'] = '网络请求失败!请稍后再试!';
            return json_encode($ret);
        }
        return json_encode($ret);
    }
    public function resource()
    {
        $cserver = new GeeCloudserver();
        $dns = new GeeDns();
        $domain = new GeeDomain();
        $host = new GeeHost();
        $server = new GeeServer();
        $vps = new GeeVps();
        $u = new GeeUser();
        //所属客户
        $g = $_GET;
        if ($g['name']) {
            $w = [
                'name' => ['like', '%' . $g['name'] . '%'],
            ];
        }
        $ulist = $u->where("`manager_id` = " . session('_userInfo')['id'])->where($w)->select();
        //最终7天内到期资源列表
        $list = [];
        foreach ($ulist as $k => $v) {
            //云主机
            $cslist = list_pro_toArray($cserver->where('user_id = ' . $v['id'])->where('end_time <= ' . strtotime("+7 day"))->select(), '云主机');
            foreach ($cslist as $key => $val) {
                array_push($list, [
                    'id' => $v['id'],
                    'name' => $v['name'],
                    'manager_remark' => $v['manager_remark'],
                    'pro_name' => $val['type'],
                    'pro_id' => $val['id'],
                    'create_time' => $val['create_time'],
                    'end_time' => $val['end_time'] < time() ? '已过期' : date('Y-m-d H:i:s', $val['end_time']),
                    'pay_type' => '预付费',
                ]);
            }
            //dns
            $dnslist = list_pro_toArray($dns->where('user_id = ' . $v['id'])->where('end_time <= ' . strtotime("+7 day"))->select(), 'DNS解析');
            foreach ($dnslist as $key => $val) {
                array_push($list, [
                    'id' => $v['id'],
                    'name' => $v['name'],
                    'manager_remark' => $v['manager_remark'],
                    'pro_name' => $val['type'],
                    'pro_id' => $val['id'],
                    'create_time' => $val['create_time'],
                    'end_time' => $val['end_time'] < time() ? '已过期' : date('Y-m-d H:i:s', $val['end_time']),
                    'pay_type' => '预付费',
                ]);
            }
            //域名服务
            $dlist = list_pro_toArray($domain->where('user_id = ' . $v['id'])->where('end_time <= ' . strtotime("+7 day"))->select(), '域名服务');
            foreach ($dlist as $key => $val) {
                array_push($list, [
                    'id' => $v['id'],
                    'name' => $v['name'],
                    'manager_remark' => $v['manager_remark'],
                    'pro_name' => $val['type'],
                    'pro_id' => $val['id'],
                    'create_time' => $val['create_time'],
                    'end_time' => $val['end_time'] < time() ? '已过期' : date('Y-m-d H:i:s', $val['end_time']),
                    'pay_type' => '预付费',
                ]);
            }
            //虚拟主机
            $hlist = list_pro_toArray($host->where('user_id = ' . $v['id'])->where('end_time <= ' . strtotime("+7 day"))->select(), '虚拟主机');
            foreach ($hlist as $key => $val) {
                array_push($list, [
                    'id' => $v['id'],
                    'name' => $v['name'],
                    'manager_remark' => $v['manager_remark'],
                    'pro_name' => $val['type'],
                    'pro_id' => $val['id'],
                    'create_time' => $val['create_time'],
                    'end_time' => $val['end_time'] < time() ? '已过期' : date('Y-m-d H:i:s', $val['end_time']),
                    'pay_type' => '预付费',
                ]);
            }
            //物理服务器
            $slist = list_pro_toArray($server->where('user_id = ' . $v['id'])->where('end_time <= ' . strtotime("+7 day"))->select(), '虚拟主机');
            foreach ($slist as $key => $val) {
                array_push($list, [
                    'id' => $v['id'],
                    'name' => $v['name'],
                    'manager_remark' => $v['manager_remark'],
                    'pro_name' => $val['type'],
                    'pro_id' => $val['id'],
                    'create_time' => $val['create_time'],
                    'end_time' => $val['end_time'] < time() ? '已过期' : date('Y-m-d H:i:s', $val['end_time']),
                    'pay_type' => '预付费',
                ]);
            }
            //vps
            $vlist = list_pro_toArray($vps->where('user_id = ' . $v['id'])->where('end_time <= ' . strtotime("+7 day"))->select(), 'VPS服务');
            foreach ($vlist as $key => $val) {
                array_push($list, [
                    'id' => $v['id'],
                    'name' => $v['name'],
                    'manager_remark' => $v['manager_remark'],
                    'pro_name' => $val['type'],
                    'pro_id' => $val['id'],
                    'create_time' => $val['create_time'],
                    'end_time' => $val['end_time'] < time() ? '已过期' : date('Y-m-d H:i:s', $val['end_time']),
                    'pay_type' => '预付费',
                ]);
            }
        }

        array_multisort(array_column($list, 'end_time'), SORT_DESC, $list);
        $all_idents = $list; //这里是需要分页的数据

        $curPage = input('get.page') ? input('get.page') : 1; //接收前段分页传值
        $listRow = 10; //每页10行记录
        $showdata = array_slice($all_idents, ($curPage - 1) * $listRow, $listRow, true); // 数组中根据条件取出一段值，并返回
        $p = Bootstrap::make($showdata, $listRow, $curPage, count($all_idents), false, [
            'var_page' => 'page',
            'path' => url('/console/agent/resource'), //这里根据需要修改url
            'query' => request()->param(),
            'fragment' => '',
        ]);

        $p->appends($_GET);
        // dump($p);
        // dump($p[0]);
        $this->assign('list', $p);
        return $this->fetch('Agent/resource');
    }
}
