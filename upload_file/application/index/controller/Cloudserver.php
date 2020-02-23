<?php
namespace app\index\controller;

use app\admin\model\GeeAddons; // 前置操作
use app\admin\model\GeeCloudserver; //产品分类表
use app\admin\model\GeeOsgroup; //产品组表
use app\admin\model\GeeOstype; //产品表
use app\admin\model\GeeProduct; // 操作系统组表
use app\admin\model\GeeProductClass; //操作系统版本表
use app\admin\model\GeeProductGroup; //插件表
use app\index\controller\Common; //云主机表
use app\index\model\GeeBilling; //产品购买配置表
use app\index\model\GeeProConfig; //订单表
use think\Db;

class Cloudserver extends Common
{
    public function index()
    {
        return $this->redirect('index/Cloudserver/list');
    }
    function list() {
        $cs = new GeeCloudserver();
        $list = $cs->where('user_id = ' . session('_userInfo')['id'])->order('id desc')->paginate(10);
        $this->assign('list', $list);
        return $this->fetch('Cloudserver/list');
    }
    public function clientarea()
    {
        $cs = new GeeCloudserver();
        $pro = new GeeProduct();
        $addons = new GeeAddons();
        $g = $_GET;
        $csinfo = $cs->where('name = "' . $g['name'] . '"')->find();
        if (!$csinfo) {
            return $this->redirect('index/Cloudserver/list');
        }

        $plug = new \addons\cloudserver\cloudserver();
        //信息
        $putData = [
            'way' => $csinfo['plug_name'],
            'pro_id' => $csinfo['pro_id'],
            'plug_id' => $csinfo['pro_id'],
            'function' => 'control',
            'action' => 'getvirtual',
            'virtualid' => $csinfo['virtual_id'],
        ];
        $csres = $plug->cloudserver($putData);
        $csres = json_decode($csres, true);
        if ($csres['status'] == 200 && $csres['data']['code'] == 0) {
            $csinfo['info'] = $csres['data']['data'];
            $csinfo['status'] = $csres['data']['data']['status']['data'][0]['code'];
            $cs->where('name = "' . $g['name'] . '"')->update([
                // 'password' => $csres['data']['data']['status']['data'][0]['code'],
                'status' => $csres['data']['data']['status']['data'][0]['code'],
            ]);

        }
        //操作系统
        $og = new GeeOsgroup();
        $ot = new GeeOstype();

        $osinfo = $og->select();
        $osinfo = list_toArray($osinfo);
        foreach ($osinfo as $k => $v) {
            $osinfo[$v['title']] = $v;
            $osinfo[$v['title']]['child'] = list_toArray($ot->where('group_id = ' . $v['id'])->select());
            unset($osinfo[$k]);
        }

        //快照
        $sputData = [
            'way' => $csinfo['plug_name'],
            'pro_id' => $csinfo['pro_id'],
            'plug_id' => $csinfo['pro_id'],
            'function' => 'control',
            'action' => 'snapshot_list',
            'virtualid' => $csinfo['virtual_id'],
        ];
        $snapshot = $plug->cloudserver($sputData);
        $snapshot = json_decode($snapshot, true);

        //备份
        $bputData = [
            'way' => $csinfo['plug_name'],
            'pro_id' => $csinfo['pro_id'],
            'plug_id' => $csinfo['pro_id'],
            'function' => 'control',
            'action' => 'backups_list',
            'virtualid' => $csinfo['virtual_id'],
        ];
        $backups = $plug->cloudserver($bputData);
        $backups = json_decode($backups, true);
        // dump($osinfo);
        // dump($snapshot);
        // dump($backups);
        // dump($csres);

        $this->assign('csinfo', $csinfo);
        $this->assign('osinfo', $osinfo);
        $this->assign('snapshot', $snapshot);
        $this->assign('backups', $backups);
        return $this->fetch('Cloudserver/clientarea');
    }
    /**
     * 获取监控信息
     */
    public function getmontoring()
    {
        $cs = new GeeCloudserver();
        $pro = new GeeProduct();
        $addons = new GeeAddons();
        $g = $_GET;
        $ret = [
            'status' => 200,
            'msg' => '操作成功',
            'data' => '',
        ];
        $csinfo = $cs->where('name = "' . $g['name'] . '"')->find();
        if (!$csinfo) {
            $ret['status'] = 422;
            $ret['msg'] = '非法操作！';
            return $ret;
        }

        $plug = new \addons\cloudserver\cloudserver();
        //监控
        $putData = [
            'way' => $csinfo['plug_name'],
            'pro_id' => $csinfo['pro_id'],
            'plug_id' => $csinfo['pro_id'],
            'function' => 'control',
            'action' => 'virtual_monitoring',
            'virtualid' => $csinfo['virtual_id'],
            // 'data' => [
            //     'virtualid' => $csinfo['virtual_id'],
            // ],
        ];
        // dump($g);
        $csres = $plug->cloudserver($putData);
        $csres = json_decode($csres, true);
        $ret['data'] = $csres['data'];
        return json_encode($ret);
    }
    /**
     * 操作云主机电源
     */
    public function virtual_power()
    {
        $cs = new GeeCloudserver();
        $g = $_GET;
        $ret = [
            'status' => 200,
            'msg' => '操作成功',
            'data' => '',
        ];
        $csinfo = $cs->where('name = "' . $g['name'] . '"')->find();
        if (!$csinfo) {
            $ret['status'] = 422;
            $ret['msg'] = '非法操作！';
            return $ret;
        }

        $plug = new \addons\cloudserver\cloudserver();
        if ($g['type'] == 'boot') {
            $type = 'start';
        } elseif ($g['type'] == 'shutdown') {
            $type = 'compel_shut';
        } elseif ($g['type'] == 'reboot') {
            $type = 'restart';
        } else {
            $ret['status'] = 422;
            $ret['msg'] = '非法操作！';
            return $ret;
        }
        //电源管理
        $putData = [
            'way' => $csinfo['plug_name'],
            'pro_id' => $csinfo['pro_id'],
            'plug_id' => $csinfo['pro_id'],
            'function' => 'control',
            'action' => 'virtual_power_type',
            'virtualid' => $csinfo['virtual_id'],
            'type' => $type,
            // 'data' => [
            //     'virtualid' => $csinfo['virtual_id'],
            // ],
        ];
        // dump($putData);
        $csres = $plug->cloudserver($putData);
        $csres = json_decode($csres, true);
        // dump($csres);
        $ret['data'] = $csres['data'];
        return json_encode($ret);

    }
    /**
     * 修改密码
     */
    public function changepass()
    {
        $cs = new GeeCloudserver();
        $g = $_GET;
        $ret = [
            'status' => 200,
            'msg' => '操作成功',
            'data' => '',
        ];
        $csinfo = $cs->where('name = "' . $g['name'] . '"')->find();
        if (!$csinfo) {
            $ret['status'] = 422;
            $ret['msg'] = '非法操作！';
            return $ret;
        }
        $plug = new \addons\cloudserver\cloudserver();
        //修改密码
        $putData = [
            'way' => $csinfo['plug_name'],
            'pro_id' => $csinfo['pro_id'],
            'plug_id' => $csinfo['pro_id'],
            'function' => 'control',
            'action' => 'virtual_reset_password',
            'virtualid' => $csinfo['virtual_id'],
            'data' => [
                'type' => 'system',
                'password' => $g['sys_pass'],
            ],
        ];
        $csres = $plug->cloudserver($putData);
        $csres = json_decode($csres, true);

        $vputData = [
            'way' => $csinfo['plug_name'],
            'pro_id' => $csinfo['pro_id'],
            'plug_id' => $csinfo['pro_id'],
            'function' => 'control',
            'action' => 'virtual_reset_password',
            'virtualid' => $csinfo['virtual_id'],
            'data' => [
                'type' => 'vnc',
                'password' => $g['sys_pass'],
            ],
        ];
        $vcsres = $plug->cloudserver($vputData);
        $vcsres = json_decode($vcsres, true);
        $ret['data'] = $csres['data'];
        return json_encode($ret);
    }
    /**
     * 重装操作系统
     */
    public function toresetos()
    {
        $cs = new GeeCloudserver();
        $ot = new GeeOstype();
        $g = $_GET;
        $ret = [
            'status' => 200,
            'msg' => '操作成功',
            'data' => '',
        ];
        $csinfo = $cs->where('name = "' . $g['name'] . '"')->find();
        if (!$csinfo) {
            $ret['status'] = 422;
            $ret['msg'] = '非法操作！';
            return $ret;
        }
        $tempid = $ot->where('id = ' . $g['osid'])->find();
        foreach (json_decode($tempid['model_id'], true) as $k => $v) {
            if ($v['name'] == $csinfo['plug_name']) {
                $tempid = $v['id'];
            }
        }
        $plug = new \addons\cloudserver\cloudserver();
        //重装操作系统
        $putData = [
            'way' => $csinfo['plug_name'],
            'pro_id' => $csinfo['pro_id'],
            'plug_id' => $csinfo['pro_id'],
            'function' => 'control',
            'action' => 'virtual_reset_system',
            'virtualid' => $csinfo['virtual_id'],
            'tempid' => $tempid,
            'type' => '',
            // 'data' => [
            //     'virtualid' => $csinfo['virtual_id'],
            // ],
        ];
        // dump($putData);
        // return;
        $csres = $plug->cloudserver($putData);
        $csres = json_decode($csres, true);
        // dump($csres);
        $ret['data'] = $csres['data'];
        return json_encode($ret);
    }
    /**
     * 创建快照
     */
    public function createsnapshot()
    {
        $cs = new GeeCloudserver();
        $g = $_GET;
        $ret = [
            'status' => 200,
            'msg' => '操作成功',
            'data' => '',
        ];
        $csinfo = $cs->where('name = "' . $g['name'] . '"')->find();
        if (!$csinfo) {
            $ret['status'] = 422;
            $ret['msg'] = '非法操作！';
            return $ret;
        }
        $plug = new \addons\cloudserver\cloudserver();
        //创建快照
        $putData = [
            'way' => $csinfo['plug_name'],
            'pro_id' => $csinfo['pro_id'],
            'plug_id' => $csinfo['pro_id'],
            'function' => 'control',
            'action' => 'snapshot',
            'data' => [
                'virtual' => $csinfo['virtual_id'],
            ],
        ];
        $csres = $plug->cloudserver($putData);
        $csres = json_decode($csres, true);
        $ret['data'] = $csres['data'];
        return json_encode($ret);

    }
    /**
     * 恢复快照
     */
    public function setsnapshot()
    {
        $cs = new GeeCloudserver();
        $g = $_GET;
        $ret = [
            'status' => 200,
            'msg' => '操作成功',
            'data' => '',
        ];
        $csinfo = $cs->where('name = "' . $g['name'] . '"')->find();
        if (!$csinfo) {
            $ret['status'] = 422;
            $ret['msg'] = '非法操作！';
            return $ret;
        }
        // dump($g);
        $plug = new \addons\cloudserver\cloudserver();
        //恢复快照
        $putData = [
            'way' => $csinfo['plug_name'],
            'pro_id' => $csinfo['pro_id'],
            'plug_id' => $csinfo['pro_id'],
            'function' => 'control',
            'action' => 'snapshot_restore',
            'snapshotid' => $g['snapshotid'],
            // 'data' => [
            //     'virtual' => $csinfo['virtual_id'],
            // ],
        ];
        $csres = $plug->cloudserver($putData);
        $csres = json_decode($csres, true);
        $ret['data'] = $csres['data'];
        return json_encode($ret);

    }
    /**
     * 删除快照
     */
    public function delsnapshot()
    {
        $cs = new GeeCloudserver();
        $g = $_GET;
        $ret = [
            'status' => 200,
            'msg' => '操作成功',
            'data' => '',
        ];
        $csinfo = $cs->where('name = "' . $g['name'] . '"')->find();
        if (!$csinfo) {
            $ret['status'] = 422;
            $ret['msg'] = '非法操作！';
            return $ret;
        }
        $plug = new \addons\cloudserver\cloudserver();
        //删除快照
        $putData = [
            'way' => $csinfo['plug_name'],
            'pro_id' => $csinfo['pro_id'],
            'plug_id' => $csinfo['pro_id'],
            'function' => 'control',
            'action' => 'snapshot_del',
            'snapshotid' => $g['snapshotid'],
            // 'data' => [
            //     'virtual' => $csinfo['virtual_id'],
            // ],
        ];
        $csres = $plug->cloudserver($putData);
        $csres = json_decode($csres, true);
        $ret['data'] = $csres['data'];
        return json_encode($ret);

    }
    /**
     * 创建备份
     */
    public function createbackups()
    {
        $cs = new GeeCloudserver();
        $g = $_GET;
        $ret = [
            'status' => 200,
            'msg' => '操作成功',
            'data' => '',
        ];
        $csinfo = $cs->where('name = "' . $g['name'] . '"')->find();
        if (!$csinfo) {
            $ret['status'] = 422;
            $ret['msg'] = '非法操作！';
            return $ret;
        }
        $plug = new \addons\cloudserver\cloudserver();
        //创建备份
        $putData = [
            'way' => $csinfo['plug_name'],
            'pro_id' => $csinfo['pro_id'],
            'plug_id' => $csinfo['pro_id'],
            'function' => 'control',
            'action' => 'backups',
            'data' => [
                'virtual' => $csinfo['virtual_id'],
            ],
        ];
        $csres = $plug->cloudserver($putData);
        $csres = json_decode($csres, true);
        $ret['data'] = $csres['data'];
        return json_encode($ret);

    }
    /**
     * 恢复备份
     */
    public function setbackups()
    {
        $cs = new GeeCloudserver();
        $g = $_GET;
        $ret = [
            'status' => 200,
            'msg' => '操作成功',
            'data' => '',
        ];
        $csinfo = $cs->where('name = "' . $g['name'] . '"')->find();
        if (!$csinfo) {
            $ret['status'] = 422;
            $ret['msg'] = '非法操作！';
            return $ret;
        }
        // dump($g);
        $plug = new \addons\cloudserver\cloudserver();
        //恢复备份
        $putData = [
            'way' => $csinfo['plug_name'],
            'pro_id' => $csinfo['pro_id'],
            'plug_id' => $csinfo['pro_id'],
            'function' => 'control',
            'action' => 'backups_restore',
            'backupsid' => $g['backupsid'],
            // 'data' => [
            //     'virtual' => $csinfo['virtual_id'],
            // ],
        ];
        $csres = $plug->cloudserver($putData);
        $csres = json_decode($csres, true);
        $ret['data'] = $csres['data'];
        return json_encode($ret);

    }
    /**
     * 删除备份
     */
    public function delbackups()
    {
        $cs = new GeeCloudserver();
        $g = $_GET;
        $ret = [
            'status' => 200,
            'msg' => '操作成功',
            'data' => '',
        ];
        $csinfo = $cs->where('name = "' . $g['name'] . '"')->find();
        if (!$csinfo) {
            $ret['status'] = 422;
            $ret['msg'] = '非法操作！';
            return $ret;
        }
        $plug = new \addons\cloudserver\cloudserver();
        //删除备份
        $putData = [
            'way' => $csinfo['plug_name'],
            'pro_id' => $csinfo['pro_id'],
            'plug_id' => $csinfo['pro_id'],
            'function' => 'control',
            'action' => 'backups_del',
            'backupsid' => $g['backupsid'],
            // 'data' => [
            //     'virtual' => $csinfo['virtual_id'],
            // ],
        ];
        $csres = $plug->cloudserver($putData);
        $csres = json_decode($csres, true);
        $ret['data'] = $csres['data'];
        return json_encode($ret);

    }
    /**
     * 链接vnc
     */
    public function tovnc()
    {
        $cs = new GeeCloudserver();
        $pro = new GeeProduct();
        $addons = new GeeAddons();
        $g = $_GET;
        $ret = [
            'status' => 200,
            'msg' => '操作成功',
            'data' => '',
        ];
        $csinfo = $cs->where('name = "' . $g['name'] . '"')->find();
        if (!$csinfo) {
            $ret['status'] = 422;
            $ret['msg'] = '非法操作！';
            return $ret;
        }

        $plug = new \addons\cloudserver\cloudserver();
        //监控
        $putData = [
            'way' => $csinfo['plug_name'],
            'pro_id' => $csinfo['pro_id'],
            'plug_id' => $csinfo['pro_id'],
            'function' => 'control',
            'action' => 'virtual_link_vnc',
            'virtualid' => $csinfo['virtual_id'],
        ];
        // dump($g);
        $csres = $plug->cloudserver($putData);
        $csres = json_decode($csres, true);
        // header('Access-Control-Allow-Origin: *');
        // dump($csres);
        header("Location:" . $csres['data']);
        // echo $csres['data'];
    }
    public function create()
    {
        $addons = new GeeAddons();
        $group = new GeeProductGroup();
        $pro = new GeeProduct();
        $osgroup = new GeeOsgroup();
        $ostype = new GeeOstype();
        $plug = new \addons\cloudserver\cloudserver();
        //获取默认产品分类
        $grouplist = $group->where('class_id = 9')->select();
        //获取默认产品列表
        $prolist = $pro->where('group_id = ' . $grouplist[0]['id'])->select();
        //获取默认操作系统
        $osgrouplist = $osgroup->select();
        //获取默认操作系统版本
        $ostypelist = $ostype->where('group_id = ' . $osgrouplist[0]['id'])->select();

        $this->assign('grouplist', $grouplist);
        $this->assign('prolist', $prolist);
        $this->assign('osgrouplist', $osgrouplist);
        $this->assign('ostypelist', $ostypelist);
        return $this->fetch('Cloudserver/create');
    }
    /**
     * 创建实例验证
     */
    public function addAuth()
    {
        $data = $_POST;
        $class = new GeeProductClass();
        $group = new GeeProductGroup();
        $pro = new GeeProduct();
        $pc = new GeeProConfig();
        $billing = new GeeBilling();
        $addons = new GeeAddons();
        $osgroup = new GeeOsgroup();
        $ostype = new GeeOstype();
        $plug = new \addons\cloudserver\cloudserver();
        $item = $pro->where('id = ' . $data['pro_id'])->find();
        $pro_config = json_decode($item['plug_config'], true);
        $pro_id = json_decode($item['plug_config'], true)['product_id'];
        $ret = [
            'status' => 200,
            'msg' => '操作成功',
            'data' => '',
        ];
        $userinfo = session('_userInfo');
        if ($userinfo['realverify'] != 2) {
            $ret['status'] = 422;
            $ret['msg'] = '请先进行实名认证!';
            return json_encode($ret);
        }

        if (!vali_data('cspwd', $data['password'])) {
            $ret['status'] = 422;
            $ret['msg'] = '请传入正确的管理员密码!';
            return json_encode($ret);
        }
        $proinfo = $pro->where('id = ' . $data['pro_id'])->find();
        $proConfig = json_decode($proinfo['plug_config'], true);
        $osinfo = $ostype->where('id = ' . $data['os_versions_id'])->find();
        $temps = json_decode($osinfo['model_id'], true);
        $plugname = $addons->where('id = ' . $proinfo['plug'])->find()['name'];
        if ($temps) {
            foreach ($temps as $k => $v) {
                if ($v['name'] == $plugname) {
                    $temp_id = $v['id'];
                }
            }
        } else {
            $temp_id = '';
        }
        // dump($proConfig);
        if (!$data['type']) {
            $action = 'addvirtual';
            $datas = [
                'users_id' => session('_userInfo')['id'],
                'username' => session('_userInfo')['username'],
                'name' => $this->vali_name('name', rand_name(6), 6, 'rand_name'),
                'title' => 'instance-' . $this->vali_name('title', rand_name(8), 8, 'rand_name'),
                'areas_id' => $proConfig['areas_id'],
                'areas_id' => $proConfig['areas_id'],
                'nodes_id' => $proConfig['nodes_id'],
                'core' => $proConfig['core'],
                'cpu_mode' => $proConfig['cpu_mode'],
                'memory' => $proConfig['memory'],
                'sys_disk_mode' => $proConfig['sys_disk_mode'],
                'sys_disk_iops' => $proConfig['sys_disk_iops'],
                'sys_disk_read' => $proConfig['sys_disk_read'],
                'sys_disk_write' => $proConfig['sys_disk_write'],
                'data_disk_mode' => $proConfig['data_disk_mode'],
                'data_disk_size' => $data['cds_disk'],
                'data_disk_iops' => $proConfig['data_disk_iops'],
                'data_disk_read' => $proConfig['data_disk_read'],
                'data_disk_write' => $proConfig['data_disk_write'],
                'net_out' => $data['mbps'],
                'net_in' => $data['mbps'],
                'snapshoot' => $proConfig['snapshoot'],
                'backups' => $proConfig['backups'],
                'templates_id' => $temp_id,
                'os_id' => $data['pro_id'],
                'os_versions_id' => $data['os_versions_id'],
                'sys_pwd' => $data['password'],
                'vnc_pwd' => $data['password'],
                'expire_time' => '2999-06-30 23:59:59',
                'end_time' => strtotime(date("Y-m-d H:i:s", strtotime("+" . ($data['pay_length']) . " month"))),
                'ip_num' => $proConfig['ip_num'],
                'flow_limit' => $proConfig['flow_limit'],
                'nat_acl_limit' => $proConfig['nat_acl_limit'],
                'nat_web_limit' => $proConfig['nat_web_limit'],
            ];
            $type = 'create';
        } else if ($data['type'] == 'renew') {
            // $action = 'renew';
            // $datas = [
            //   'year'=> $years,
            //   'vpsname'=> $data['name']
            // ];
            // $type = 'renew';
        } else if ($data['type'] == 'update') {
            // $action = 'update';
            // $datas = [
            //   'vpsname'=> $data['name']
            // ];
            // $type = 'update';
        } else {
            $ret['status'] = 422;
            $ret['msg'] = '非法操作！';
            return $ret;
        }
        $plugAddr = '\addons\cloudserver\cloudserver';
        $proinfo = $pro->where('id = ' . $data['pro_id'])->find();
        $way = $addons->where('id = ' . $proinfo['plug'])->find()['name'];
        $putData = [
            'pro_id' => $data['pro_id'],
            'plug' => $plugAddr,
            'class' => 'cloudserver',
            'function' => 'control',
            'data' => [
                'way' => $way,
                'plug_id' => $data['pro_id'],
                'user_id' => session('_userInfo')['id'],
                'action' => $action,
                'data' => $datas,
            ],
        ];
        // dump($putData);
        // exit;
        $items = $pro->where('id = ' . $data['pro_id'])->find();
        $_SESSION['_create_putData'] = $putData;
        $items['describe'];
        $pinfo = [
            [
                'group' => $group->where('id = ' . $items['group_id'])->value('name'),
                'class' => $class->where('id = ' . $items['type'])->value('title'),
                'name' => $items['name'],
                'type' => $type,
                'num' => $data['number'],
                'config' => $items['describe'],
                'years' => $data['pay_length'],
                'price' => str_replace(",", "", json_decode($this->getPrice(['type' => $data['type'], 'pro_id' => $data['pro_id'], 'pay_length' => $data['pay_length'], 'id' => $data['id'], 'name' => $data['name']]), true)['data']['price']),
            ],
        ];
        $_SESSION['_pro_info'] = $pinfo;
        // dump($_SESSION);
        $price = 0;
        foreach ($_SESSION['_pro_info'] as $k => $v) {
            $str = $v['price'];
            //中文标点
            $char = ",。、！？：；﹑•＂…‘’“”〝〞∕¦‖—　〈〉﹞﹝「」‹›〖〗】【»«』『〕〔》《﹐﹕︰﹔！¡？¿﹖﹌﹏﹋＇´ˊˋ―﹫︳︴¯＿￣﹢﹦﹤‐­˜﹟﹩﹠﹪﹡﹨﹍﹉﹎﹊ˇ︵︶︷︸︹︿﹀︺︽︾ˉ﹁﹂﹃﹄︻︼（）";

            $pattern = array(
                '/[' . $char . ']/u', //中文标点符号
                '/[ ]{2,}/',
            );
            $prices = preg_replace($pattern, '', $str);
            $price += str_replace(",", "", $prices);
        }
        $number = $this->vali_name('title', rand_name(8), 8, 'rand_name');
        $order_number = date('Ymdhis', time()) . rand(10000, 99999);

        // dump($pinfo);
        // dump($putData);
        // exit;
        $pcConfig['order_number'] = $order_number;
        $pcConfig['config'] = json_encode([
            '_create_putData' => $putData,
            '_pro_info' => $pinfo,
        ]);
        // dump($pcConfig);
        // return;
        $pc->save($pcConfig);
        $billing_save = [
            'number' => $number,
            'order_number' => $order_number,
            'pro_list' => json_encode($_SESSION['_pro_info']),
            'user_id' => session('_userInfo')['id'],
            'type' => '0',
            'order_type' => $type,
            'money' => (double) str_replace(",", "", $price),
            'balance' => (double) session('_userInfo')['balance'] - (double) $_SESSION['_pro_info']['price'],
            'cash' => 0,
            'channel_type' => '0',
            'remarks' => '',
            'status' => '0',
            'order_status' => '2',
        ];
        $_SESSION['_pro_order'] = $billing_save['order_number'];
        $billing->save($billing_save);
        return json_encode($ret);

    }
    /**
     * 获取配置
     */
    public function getProlist()
    {
        $id = $_POST['id'];
        $ret = [
            'status' => 200,
            'msg' => '操作成功！',
            'data' => '',
        ];
        $pro = new GeeProduct();
        if ($_POST['type'] == 'update') {
            $pro = new GeeProduct();
            $item = $pro->where('id = ' . $_POST['pro_id'])->find();
            $items = explode(',', $item['update_list']);
            $num = 0;
            foreach ($items as $k => $v) {
                $proitem = $pro->field('plug_config,update_list', true)->where('id = ' . $v . ' and group_id = ' . $_POST['id'])->find();
                if ($proitem) {
                    $proList[$num] = $proitem;
                } else {
                    continue;
                }
                $num++;
            }
        } else {
            $proList = $pro->field('plug_config,update_list', true)->where('group_id = ' . $id)->select();
        }
        $ret['data'] = $proList;
        return json_encode($ret);
    }
    /**
     * 获取操作系统
     */
    public function getOstype()
    {
        $id = $_POST['id'];
        $ret = [
            'status' => 200,
            'msg' => '操作成功！',
            'data' => '',
        ];
        $ostype = new GeeOstype();
        $ostypeList = $ostype->where('group_id = ' . $id)->select();
        $ret['data'] = $ostypeList;
        return json_encode($ret);
    }
    /**
     * 验证随机名称
     */
    public function vali_name($key, $val, $len, $func)
    {
        if (!is_int($val) && !is_bool($val)) {
            $w = '"' . $val . '"';
        }
        $has = db('cloudserver')->where('`' . $key . '` = ' . $w)->find();
        if ($has) {
            $vali = $this->vali_name($key, $func($len), $len, $func);
            return $vali;
        } else {
            return $val;
        }
    }
    /**
     * 获取价格
     */
    public function getPrice()
    {
        $data = $_POST;
        $pro = new GeeProduct();
        $ret = [
            'status' => 200,
            'msg' => '操作成功',
            'data' => '',
        ];
        if ($data['type'] != 'renew') {

        }
        $item = $pro->where('id = ' . $data['pro_id'])->find();
        $pro_config = json_decode($item['plug_config'], true);
        // dump($pro_config);
        if ($data['type'] != 'update') {
            //固定换算价格
            switch ($data['pay_length']) {
                case 1:
                    $lengthPrice = $item['month'] * 1;
                    break;
                case 2:
                    $lengthPrice = $item['month'] * 2;
                    break;
                case 3:
                    $lengthPrice = $item['quarter'] * 1;
                    break;
                case 4:
                    $lengthPrice = $item['quarter'] * 1 + $item['month'] * 1;
                    break;
                case 5:
                    $lengthPrice = $item['quarter'] * 1 + $item['month'] * 2;
                    break;
                case 6:
                    $lengthPrice = $item['semestrale'] * 1;
                    break;
                case 7:
                    $lengthPrice = $item['semestrale'] * 1 + $item['month'] * 1;
                    break;
                case 8:
                    $lengthPrice = $item['semestrale'] * 1 + $item['month'] * 2;
                    break;
                case 9:
                    $lengthPrice = $item['semestrale'] * 1 + $item['quarter'] * 1;
                    break;
                case 10:
                    $lengthPrice = $item['years'];
                    break;
                case 11:
                    $lengthPrice = $item['years'];
                    break;
                case 12:
                    $lengthPrice = $item['years'];
                    break;
                case 24:
                    $lengthPrice = $item['biennium'];
                    break;
                case 36:
                    $lengthPrice = $item['triennium'];
                    break;
                default:
                    $ret['status'] = 422;
                    $ret['msg'] = '非法操作！';
                    return json_encode($ret);
                    break;
            }
        } else {
            $lengthPrice = $item['month'] * 1;
        }
        $dprice = (int) $data['cds_disk'] * (double) $pro_config['cdsprice'] * $data['pay_length'];
        $mprice = (int) $data['mbps'] * (double) $pro_config['eipprice'] * $data['pay_length'];
        $lengthPrice = $lengthPrice + $dprice + $mprice;
        $lengthPrice = $lengthPrice * (int) $data['number'];
        $ret['data'] = ['price' => number_format($lengthPrice, 2)];
        return json_encode($ret);
    }
}
