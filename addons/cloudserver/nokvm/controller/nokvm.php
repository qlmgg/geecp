<?php
namespace addons\cloudserver\nokvm\controller;

use Exception;
use think\Controller;
use think\Db;

class nokvm extends Controller
{
    /**
     * 主控端接口
     * @param $data  所传参数
     * @param $data['data']  访问接口时的其余附带参数
     * @return json
     */
    public function control($data = [])
    {
        $ret = [
            'status' => 200,
            'msg' => '操作成功！',
            'data' => '',
        ];
        // dump($data);
        if (empty($data['action']) || !isset($data['action'])) {
            $ret['status'] = 422;
            $ret['msg'] = '请求接口异常！接口不存在。';
            return $ret;
        }
        $product = Db::name('product')->where('id = ' . $data['plug_id'])->find();
        //公共参数
        $config = json_decode($product['plug_config'], true);
        $token = $config['token'];
        $sdata['timeStamp'] = time();
        $sdata['randomStr'] = 'Ab1Anv';
        $sdata['token'] = $token; //token 自行配置的令牌，不清楚可看概述章节。
        $oldsdata = $sdata;
        sort($sdata, SORT_STRING);
        $str = implode($sdata);
        $signature = md5($str);
        $signature = strtoupper($signature); //最终得到加密后全大写的签名
        $_URI = $config['uri'];
        // dump($data);
        switch ($data['action']) {
            //获取数据中心
            case 'area':
                $url = $_URI . '/api/area?time=' . $oldsdata['timeStamp'] . '&random=' . $oldsdata['randomStr'] . '&signature=' . $signature;
                $data['method'] = 'GET';
                break;
            //获取计算节点
            case 'node':
                $url = $_URI . '/api/node/' . $data['areaid'] . '?time=' . $oldsdata['timeStamp'] . '&random=' . $oldsdata['randomStr'] . '&signature=' . $signature;
                $data['method'] = 'GET';
                break;
            //获取地址池
            case 'ip_pool':
                $url = $_URI . '/api/ip_pool/' . $data['nodeid'] . '?time=' . $oldsdata['timeStamp'] . '&random=' . $oldsdata['randomStr'] . '&signature=' . $signature;
                $data['method'] = 'GET';
                break;
            //获取池IP地址
            case 'ip_pool':
                $url = $_URI . '/api/ip_address/' . $data['ippoolid'] . '?time=' . $oldsdata['timeStamp'] . '&random=' . $oldsdata['randomStr'] . '&signature=' . $signature;
                $data['method'] = 'GET';
                break;
            //创建云主机
            case 'addvirtual':
                $url = $_URI . '/api/virtual?time=' . $oldsdata['timeStamp'] . '&random=' . $oldsdata['randomStr'] . '&signature=' . $signature;
                $data['method'] = 'POST';
                break;
            //云主机详情
            case 'getvirtual':
                $url = $_URI . '/api/virtual/' . $data['virtualid'] . '?time=' . $oldsdata['timeStamp'] . '&random=' . $oldsdata['randomStr'] . '&signature=' . $signature;
                $data['method'] = 'GET';
                break;
            //云主机软删除
            case 'delvirtual':
                $url = $_URI . '/api/virtual/' . $data['virtualid'] . '?time=' . $oldsdata['timeStamp'] . '&random=' . $oldsdata['randomStr'] . '&signature=' . $signature;
                $data['method'] = 'DELETE';
                break;
            //云主机软删除恢复
            case 'virtual_restore':
                $url = $_URI . '/api/virtual_restore/' . $data['virtualid'] . '?time=' . $oldsdata['timeStamp'] . '&random=' . $oldsdata['randomStr'] . '&signature=' . $signature;
                $data['method'] = 'GET';
                break;
            //云主机重装系统
            case 'virtual_reset_system':
                $url = $_URI . '/api/virtual_reset_system/' . $data['virtualid'] . '/' . $data['tempid'] . '?time=' . $oldsdata['timeStamp'] . '&random=' . $oldsdata['randomStr'] . '&signature=' . $signature;
                $data['method'] = 'GET';
                break;
            //云主机修改密码
            case 'virtual_reset_password':
                $url = $_URI . '/api/virtual_reset_password/' . $data['virtualid'] . '?time=' . $oldsdata['timeStamp'] . '&random=' . $oldsdata['randomStr'] . '&signature=' . $signature;
                $data['method'] = 'PUT';
                break;
            //云主机升级配置
            case 'upvirtual':
                $url = $_URI . '/api/virtual/' . $data['virtualid'] . '?time=' . $oldsdata['timeStamp'] . '&random=' . $oldsdata['randomStr'] . '&signature=' . $signature;
                $data['method'] = 'PUT';
                break;
            // //云主机电源管理
            // case 'virtual_power':
            //   $url = $_URI.'/api/virtual_power/'.$data['virtualid'].'?time='.$oldsdata['timeStamp'].'&random='.$oldsdata['randomStr'].'&signature='.$signature;
            //   $data['method'] = 'GET';
            // break;
            //云主机电源
            case 'virtual_power_type':
                $url = $_URI . '/api/virtual_power/' . $data['virtualid'] . '/' . $data['type'] . '?time=' . $oldsdata['timeStamp'] . '&random=' . $oldsdata['randomStr'] . '&signature=' . $signature;
                $data['method'] = 'GET';
                break;
            //云主机光驱
            case 'virtual_cd_rom':
                $url = $_URI . '/api/virtual_cd_rom/' . $data['virtualid'] . '/' . $data['type'] . '/' . $data['cd_rom'] . '?time=' . $oldsdata['timeStamp'] . '&random=' . $oldsdata['randomStr'] . '&signature=' . $signature;
                $data['method'] = 'GET';
                break;
            //链接VNC
            case 'virtual_link_vnc':
                $url = $_URI . '/api/virtual_link_vnc/' . $data['virtualid'] . '?time=' . $oldsdata['timeStamp'] . '&random=' . $oldsdata['randomStr'] . '&signature=' . $signature;
                $data['method'] = 'GET';
                break;
            //云主机运行状态
            case 'virtual_run_status':
                $url = $_URI . '/api/virtual_run_status/' . $data['virtualid'] . '?time=' . $oldsdata['timeStamp'] . '&random=' . $oldsdata['randomStr'] . '&signature=' . $signature;
                $data['method'] = 'GET';
                break;
            //云主机停机锁定
            case 'virtual_pause':
                $url = $_URI . '/api/virtual_pause/' . $data['virtualid'] . '?time=' . $oldsdata['timeStamp'] . '&random=' . $oldsdata['randomStr'] . '&signature=' . $signature;
                $data['method'] = 'GET';
                break;
            //云主机恢复停机
            case 'virtual_restore_pause':
                $url = $_URI . '/api/virtual_restore_pause/' . $data['virtualid'] . '?time=' . $oldsdata['timeStamp'] . '&random=' . $oldsdata['randomStr'] . '&signature=' . $signature;
                $data['method'] = 'GET';
                break;
            //创建快照
            case 'snapshot':
                $url = $_URI . '/api/snapshot?time=' . $oldsdata['timeStamp'] . '&random=' . $oldsdata['randomStr'] . '&signature=' . $signature;
                $data['method'] = 'POST';
                break;
            //删除快照
            case 'snapshot_del':
                $url = $_URI . '/api/snapshot/' . $data['snapshotid'] . '?time=' . $oldsdata['timeStamp'] . '&random=' . $oldsdata['randomStr'] . '&signature=' . $signature;
                $data['method'] = 'DELETE';
                break;
            //恢复快照
            case 'snapshot_restore':
                $url = $_URI . '/api/snapshot/' . $data['snapshotid'] . '/edit?time=' . $oldsdata['timeStamp'] . '&random=' . $oldsdata['randomStr'] . '&signature=' . $signature;
                $data['method'] = 'GET';
                break;
            //快照列表
            case 'snapshot_list':
                $url = $_URI . '/api/snapshot/' . $data['virtualid'] . '?time=' . $oldsdata['timeStamp'] . '&random=' . $oldsdata['randomStr'] . '&signature=' . $signature;
                $data['method'] = 'GET';
                break;
            //修改快照数量
            case 'snapshot_edit':
                $url = $_URI . '/api/snapshot/' . $data['virtualid'] . '?time=' . $oldsdata['timeStamp'] . '&random=' . $oldsdata['randomStr'] . '&signature=' . $signature;
                $data['method'] = 'PUT';
                break;
            //创建备份
            case 'backups':
                $url = $_URI . '/api/backups?time=' . $oldsdata['timeStamp'] . '&random=' . $oldsdata['randomStr'] . '&signature=' . $signature;
                $data['method'] = 'POST';
                break;
            //删除备份
            case 'backups_del':
                $url = $_URI . '/api/backups/' . $data['backupsid'] . '?time=' . $oldsdata['timeStamp'] . '&random=' . $oldsdata['randomStr'] . '&signature=' . $signature;
                $data['method'] = 'DELETE';
                break;
            //还原备份
            case 'backups_restore':
                $url = $_URI . '/api/backups/' . $data['backupsid'] . '/edit?time=' . $oldsdata['timeStamp'] . '&random=' . $oldsdata['randomStr'] . '&signature=' . $signature;
                $data['method'] = 'GET';
                break;
            //备份列表
            case 'backups_list':
                $url = $_URI . '/api/backups/' . $data['virtualid'] . '?time=' . $oldsdata['timeStamp'] . '&random=' . $oldsdata['randomStr'] . '&signature=' . $signature;
                $data['method'] = 'GET';
                break;
            //修改备份数量
            case 'backups_edit':
                $url = $_URI . '/api/backups/' . $data['virtualid'] . '?time=' . $oldsdata['timeStamp'] . '&random=' . $oldsdata['randomStr'] . '&signature=' . $signature;
                $data['method'] = 'PUT';
                break;
            //云主机监控
            case 'virtual_monitoring':
                $url = $_URI . '/api/virtual_monitoring/' . $data['virtualid'] . '?time=' . $oldsdata['timeStamp'] . '&random=' . $oldsdata['randomStr'] . '&signature=' . $signature;
                $data['method'] = 'GET';
                break;
            //获取公共模版
            case 'mirror_image':
                $url = $_URI . '/api/mirror_image?time=' . $oldsdata['timeStamp'] . '&random=' . $oldsdata['randomStr'] . '&signature=' . $signature;
                $data['method'] = 'GET';
                break;
            //获取光驱媒介
            case 'cd_rom':
                $url = $_URI . '/api/cd_rom?time=' . $oldsdata['timeStamp'] . '&random=' . $oldsdata['randomStr'] . '&signature=' . $signature;
                $data['method'] = 'GET';
                break;
            //获取用户所有安全组
            case 'security_group':
                $url = $_URI . '/api/security_group/' . $data['userid'] . '?time=' . $oldsdata['timeStamp'] . '&random=' . $oldsdata['randomStr'] . '&signature=' . $signature;
                $data['method'] = 'GET';
                break;
            //云主机当前安全组
            case 'security_group_virtual':
                $url = $_URI . '/api/security_group/' . $data['virtualid'] . '/edit?time=' . $oldsdata['timeStamp'] . '&random=' . $oldsdata['randomStr'] . '&signature=' . $signature;
                $data['method'] = 'GET';
                break;
            //新增安全组
            case 'security_group_add':
                $url = $_URI . '/api/security_group?time=' . $oldsdata['timeStamp'] . '&random=' . $oldsdata['randomStr'] . '&signature=' . $signature;
                $data['method'] = 'POST';
                break;
            //修改安全组
            case 'security_group_edit':
                $url = $_URI . '/api/security_group/' . $data['securityid'] . '?time=' . $oldsdata['timeStamp'] . '&random=' . $oldsdata['randomStr'] . '&signature=' . $signature;
                $data['method'] = 'PUT';
                break;
            //删除安全组
            case 'security_group_del':
                $url = $_URI . '/api/security_group/' . $data['securityid'] . '?time=' . $oldsdata['timeStamp'] . '&random=' . $oldsdata['randomStr'] . '&signature=' . $signature;
                $data['method'] = 'DELETE';
                break;
            //云主机应用安全组
            case 'security_group_apply':
                $url = $_URI . '/api/security_group_apply/' . $data['securityid'] . '?time=' . $oldsdata['timeStamp'] . '&random=' . $oldsdata['randomStr'] . '&signature=' . $signature;
                $data['method'] = 'POST';
                break;
            //安全组添加策略
            case 'security_group_acl':
                $url = $_URI . '/api/security_group_acl?time=' . $oldsdata['timeStamp'] . '&random=' . $oldsdata['randomStr'] . '&signature=' . $signature;
                $data['method'] = 'POST';
                break;
            //安全组当前策略
            case 'security_group_acl_info':
                $url = $_URI . '/api/security_group_acl/' . $data['securityid'] . '?time=' . $oldsdata['timeStamp'] . '&random=' . $oldsdata['randomStr'] . '&signature=' . $signature;
                $data['method'] = 'GET';
                break;
            //安全组删除策略
            case 'security_group_acl_del':
                $url = $_URI . '/api/security_group_acl/' . $data['securityid'] . '?time=' . $oldsdata['timeStamp'] . '&random=' . $oldsdata['randomStr'] . '&signature=' . $signature;
                $data['method'] = 'DELETE';
                break;
            //获取全部套餐
            case 'plan':
                $url = $_URI . '/api/plan?time=' . $oldsdata['timeStamp'] . '&random=' . $oldsdata['randomStr'] . '&signature=' . $signature;
                $data['method'] = 'GET';
                break;
            //获取指定套餐
            case 'plan_get':
                $url = $_URI . '/api/plan/' . $data['planid'] . '?time=' . $oldsdata['timeStamp'] . '&random=' . $oldsdata['randomStr'] . '&signature=' . $signature;
                $data['method'] = 'GET';
                break;
            //新增转发策略
            case 'nat_acl':
                $url = $_URI . '/api/nat_acl?time=' . $oldsdata['timeStamp'] . '&random=' . $oldsdata['randomStr'] . '&signature=' . $signature;
                $data['method'] = 'POST';
                break;
            //修改策略限制数
            case 'nat_acl_edit':
                $url = $_URI . '/api/nat_acl/' . $data['virtualid'] . '?time=' . $oldsdata['timeStamp'] . '&random=' . $oldsdata['randomStr'] . '&signature=' . $signature;
                $data['method'] = 'PUT';
                break;
            //删除策略
            case 'nat_acl_del':
                $url = $_URI . '/api/nat_acl/' . $data['aclid'] . '?time=' . $oldsdata['timeStamp'] . '&random=' . $oldsdata['randomStr'] . '&signature=' . $signature;
                $data['method'] = 'DELETE';
                break;
            //获取当前转发策略
            case 'nat_acl_get':
                $url = $_URI . '/api/nat_acl/' . $data['virtualid'] . '?time=' . $oldsdata['timeStamp'] . '&random=' . $oldsdata['randomStr'] . '&signature=' . $signature;
                $data['method'] = 'GET';
                break;
            //新增站点
            case 'nat_web':
                $url = $_URI . '/api/nat_web?time=' . $oldsdata['timeStamp'] . '&random=' . $oldsdata['randomStr'] . '&signature=' . $signature;
                $data['method'] = 'POST';
                break;
            //修改站点限制数
            case 'nat_web_edit':
                $url = $_URI . '/api/nat_web/' . $data['virtualid'] . '?time=' . $oldsdata['timeStamp'] . '&random=' . $oldsdata['randomStr'] . '&signature=' . $signature;
                $data['method'] = 'PUT';
                break;
            //删除站点
            case 'nat_web_del':
                $url = $_URI . '/api/nat_web/' . $data['webid'] . '?time=' . $oldsdata['timeStamp'] . '&random=' . $oldsdata['randomStr'] . '&signature=' . $signature;
                $data['method'] = 'DELETE';
                break;
            //获取当前站点
            case 'nat_web_get':
                $url = $_URI . '/api/nat_web/' . $data['virtualid'] . '?time=' . $oldsdata['timeStamp'] . '&random=' . $oldsdata['randomStr'] . '&signature=' . $signature;
                $data['method'] = 'GET';
                break;
            //资源检测
            case 'area_check':
                $url = $_URI . '/api/area_check?time=' . $oldsdata['timeStamp'] . '&random=' . $oldsdata['randomStr'] . '&signature=' . $signature;
                $data['method'] = 'POST';
                break;
            default:
                break;

        }
        if ($data['action'] != 'renewvirtual') {
            $_d = $data['method'] == 'GET' ? [] : $data['data'];
            // dump($data);
            // dump($_d);
            // return;
            $_r = $this->send($url, $_d, $data['method']);
            // dump($url);
            // dump(json_decode($_r, true));
            // dump($_r);
        }

        // dump($ret);
        $resinfo = json_decode($_r, true);
        switch ($data['action']) {
            //创建云主机
            case 'addvirtual':
                if ($resinfo['code'] == '0' && $resinfo['message'] == '创建成功') {
                    // dump($resinfo);
                    $save = [
                        'user_id' => $data['user_id'],
                        'plug_id' => $data['plug_id'],
                        'plug_name' => $data['way'],
                        'pro_id' => $data['plug_id'],
                        'virtual_id' => $resinfo['data']['id'],
                        'name' => $resinfo['data']['name'],
                        'title' => $data['data']['title'],
                        'region_id' => $data['data']['areas_id'],
                        'group_id' => $data['data']['nodes_id'],
                        'os_id' => $data['data']['os_id'],
                        'os_versions_id' => $data['data']['os_versions_id'],
                        'templates_id' => $data['data']['templates_id'],
                        'sys_disk' => '-',
                        'cds_disk' => $data['data']['data_disk_size'],
                        'mbps' => $data['data']['net_in'],
                        'ip' => $resinfo['data']['public_ip'][0]['ip'],
                        'private_ip' => $resinfo['data']['private_ip'],
                        // 'username'=> $resinfo['data']['name'],
                        'password' => $data['data']['vnc_pwd'],
                        'status' => '1',
                        'create_time' => time(),
                        'update_time' => time(),
                        'end_time' => $data['data']['end_time'],
                    ];
                    Db::name('cloudserver')->insert($save);
                }
                break;
            case 'renewvirtual':
                //续费云主机
                $save = [
                    'status' => '1',
                    'update_time' => time(),
                    'end_time' => $data['data']['end_time'],
                ];
                Db::name('cloudserver')->where('virtual_id = ' . $data['data']['virtual_id'])->update($save);
                $csinfo = Db::name('cloudserver')->where('virtual_id = ' . $data['data']['virtual_id'])->find();
                //恢复删除
                // virtual_restore
                // virtual_restore_pause
                $redel = [
                    'way' => $csinfo['plug_name'],
                    'pro_id' => $csinfo['pro_id'],
                    'plug_id' => $csinfo['pro_id'],
                    'function' => 'control',
                    'action' => 'virtual_restore',
                    'virtual_id' => $data['data']['virtual_id'],
                ];
                $this->control($redel);
                //恢复停机
                $restop = [
                    'way' => $csinfo['plug_name'],
                    'pro_id' => $csinfo['pro_id'],
                    'plug_id' => $csinfo['pro_id'],
                    'function' => 'control',
                    'action' => 'virtual_restore_pause',
                    'virtual_id' => $data['data']['virtual_id'],
                ];
                $this->control($restop);
                break;
        }
        if ($data['action'] == 'virtual_link_vnc') {
            $ret['data'] = $url;
            // $ret['data'] = $_r;
        } else {
            $ret['data'] = json_decode($_r, true);
        }
        return json_encode($ret);
    }

    /**
     * curl 调用接口
     * @param $aData
     * @return \SimpleXMLElement
     */
    private function send($url, $params, $method = 'GET', $header = array(), $timeout = 5)
    {

        // POST 提交方式的传入 $params 必须是字符串形式
        $opts = array(
            CURLOPT_TIMEOUT => $timeout,
            CURLOPT_RETURNTRANSFER => 1,
            CURLOPT_SSL_VERIFYPEER => false,
            CURLOPT_SSL_VERIFYHOST => false,
            CURLOPT_HTTPHEADER => $header,
        );

        /* 根据请求类型设置特定参数 */
        switch (strtoupper($method)) {
            case 'GET':
                $opts[CURLOPT_URL] = $url . '&' . http_build_query($params);
                break;
            case 'POST':
                $params = http_build_query($params);
                $opts[CURLOPT_URL] = $url;
                $opts[CURLOPT_POST] = 1;
                $opts[CURLOPT_POSTFIELDS] = $params;
                break;
            case 'DELETE':
                $opts[CURLOPT_URL] = $url;
                $opts[CURLOPT_HTTPHEADER] = array("X-HTTP-Method-Override: DELETE");
                $opts[CURLOPT_CUSTOMREQUEST] = 'DELETE';
                $opts[CURLOPT_POSTFIELDS] = $params;
                break;
            case 'PUT':
                $params = http_build_query($params);
                $opts[CURLOPT_URL] = $url;
                $opts[CURLOPT_POST] = 0;
                $opts[CURLOPT_CUSTOMREQUEST] = 'PUT';
                $opts[CURLOPT_POSTFIELDS] = $params;
                break;
            default:
                throw new Exception('不支持的请求方式！');
        }

        /* 初始化并执行curl请求 */
        $ch = curl_init();
        curl_setopt_array($ch, $opts);
        $data = curl_exec($ch);
        $error = curl_error($ch);
        // dump($data);
        return $data;
    }
}
