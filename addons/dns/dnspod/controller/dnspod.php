<?php
namespace addons\dns\dnspod\controller;

use addons\dns\dnspod\model\GeeDnsDnspod;
use addons\dns\dnspod\model\GeeDnsRecordlist;
use app\index\model\GeeDns;
use gee\Http;
use think\Controller;
use think\Db;
use addons\dns\dnspod\common\library\DNSPod as DNS;
use think\exception\PDOException;
use app\manager\model\GeeAddons;

class dnspod extends Controller
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
        $post = input();
        // dump($data);
        if (empty($data['action']) || !isset($data['action'])) {
            $ret['status'] = 422;
            $ret['msg'] = '请求接口异常！接口不存在。';
            return $ret;
        }
        $_URI = 'http://api.cndns.com';
        $dns = new DNS();
        $addons = new GeeAddons();
        $GeeDns = new GeeDns();
        $Dnspodmodel   = new GeeDnsDnspod();
        $record = new GeeDnsRecordlist();
        $userinfo = session('_userInfo');
        // dump($data['action']);
        // dump($data['data']['domain']);
        // dump($data['data']['suffix']);
        // return;
        switch ($data['action']) {
            case 'CreateRecord':

                $data['domain_id'] = $post['domain_id'];
                $data['sub_domain'] = $post['sub_domain'];
                $data['record_type'] = $post['record_type'];
                $data['record_line_id'] = empty($post['record_line_id']) ? '10=1' :$post['record_line_id'];
                $data['value'] = $post['value'];
                $data['mx'] = $post['mx'] ?  $post['mx'] :1;
/*
                $_r ='{
    "status": {
        "code":"1",
        "message":"Action completed successful",
        "created_at":"2015-01-19 22:17:47"
    },
    "record": {
        "id":"16894439",
        "name":"@",
        "status":"enable"
    }
}';
*/

                $_r = $dns->RecordCreate($data);
                break;
            //域名查询
            case 'check':
                $url = 'http://dmcheck.cndns.com/check.aspx?domain-name=' . $data['data']['domain'] . '&tld=' . $data['data']['suffix'];
                break;
            //域名列表
            case 'DomainList':

                break;
            //创建联系人
            case 'createContact':
                foreach ($data['data'] as $k => $v) {
                    $data['data'][$k] = urlencode($v);
                }
                $url = $_URI . '/domains/CreateContact.aspx?username=' . $data['username'] . '&otime=' . $data['otime'] . '&checksum=' . $data['checksum'] . '&company-en=' . $data['data']['company_en'] . '&lastname-en=' . $data['data']['lastname_en'] . '&firstname-en=' . $data['data']['firstname_en'] . '&country-en=' . $data['data']['country_en'] . '&state-en=' . $data['data']['state_en'] . '&city-en=' . $data['data']['city_en'] . '&address-en=' . $data['data']['address_en'] . '&company-cn=' . $data['data']['company_cn'] . '&lastname-cn=' . $data['data']['lastname_cn'] . '&firstname-cn=' . $data['data']['firstname_cn'] . '&country-cn=' . $data['data']['country_cn'] . '&state-cn=' . $data['data']['state_cn'] . '&city-cn=' . $data['data']['city_cn'] . '&address-cn=' . $data['data']['address_cn'] . '&zipcode=' . $data['data']['zipcode'] . '&phone=' . $data['data']['phone'] . '&fax=' . $data['data']['fax'] . '&email=' . $data['data']['email'] . '&usertype=' . $data['data']['usertype'] . '&idtype=' . $data['data']['idtype'] . '&idnumber=' . $data['data']['idnumber'];
                break;
            //修改联系人
            case 'modifyContact':
                foreach ($data['data'] as $k => $v) {
                    $data['data'][$k] = urlencode($v);
                }
                $url = $_URI . '/domains/ModifyContact.aspx?username=' . $data['username'] . '&otime=' . $data['otime'] . '&checksum=' . $data['checksum'] . '&company-en=' . $data['data']['company_en'] . '&lastname-en=' . $data['data']['lastname_en'] . '&firstname-en=' . $data['data']['firstname_en'] . '&country-en=' . $data['data']['country_en'] . '&state-en=' . $data['data']['state_en'] . '&city-en=' . $data['data']['city_en'] . '&address-en=' . $data['data']['address_en'] . '&company-cn=' . $data['data']['company_cn'] . '&lastname-cn=' . $data['data']['lastname_cn'] . '&firstname-cn=' . $data['data']['firstname_cn'] . '&country-cn=' . $data['data']['country_cn'] . '&state-cn=' . $data['data']['state_cn'] . '&city-cn=' . $data['data']['city_cn'] . '&address-cn=' . $data['data']['address_cn'] . '&zipcode=' . $data['data']['zipcode'] . '&phone=' . $data['data']['phone'] . '&fax=' . $data['data']['fax'] . '&email=' . $data['data']['email'] . '&usertype=' . $data['data']['usertype'] . '&idtype=' . $data['data']['idtype'] . '&idnumber=' . $data['data']['idnumber'] . '&userid=' . $data['data']['userid'] . '&domainname=' . $data['data']['domainname'];
                break;
            //删除解析
            case 'deleteRecord':
                $infolist = $record->where(['user_id'=>$userinfo['id'],'id'=>$post['id']])->find();
                $_r = $dns->RecordRemove(intval($infolist->dnsdomain->domain_id),intval($infolist->record_id));
                break;
            //创建域名
            case 'createDom':
                $domain = $post['domain'];
                $_r = $dns->DomainCreate($domain);
                break;
            //续费域名
            case 'domainRenew':
                foreach ($data['data'] as $k => $v) {
                    $data['data'][$k] = urlencode($v);
                }
                $url = $_URI . '/domains/DomainRenew.aspx?username=' . $data['username'] . '&otime=' . $data['otime'] . '&checksum=' . $data['checksum'] . '&domainname=' . $data['data']['domainname'] . '&years=' . $data['data']['years'] . '&exptme=' . $data['data']['signature'] . '&signature=' . $data['data']['signature'] . '';
                break;
            //获取域名信息
            case 'domainInfo':
                $domain_id = $post['domain_id'];
                $_r = $dns->DomainIdInfo($domain_id);
                break;
            //域名隐私保护
            case 'domainWhoisProtect':
                $url = $_URI . '/domains/DomainWhoisProtect.aspx?username=' . $data['username'] . '&otime=' . $data['otime'] . '&checksum=' . $data['checksum'] . '&pdtnme=' . $data['data']['domainname'] . '&newstas=' . $data['data']['newstas'];
                break;
            //获取域名控制面板登陆地址
            case 'getLoginURL':
                $url = $_URI . '/domains/getLoginURL.aspx?username=' . $data['username'] . '&otime=' . $data['otime'] . '&checksum=' . $data['checksum'] . '&pdtnme=' . $data['data']['domainname'];
                break;
            //域名过户
            case 'domainguohu':
                $url = $_URI . '/domains/domainguohu.aspx?username=' . $data['username'] . '&otime=' . $data['otime'] . '&checksum=' . $data['checksum'] . '&domainname=' . $data['data']['domainname'] . '&userid=' . $data['data']['userid'];
                break;
            //修改域名DNS
            case 'modifyDNS':
                $url = $_URI . '/domains/ModifyDNS.aspx?username=' . $data['username'] . '&otime=' . $data['otime'] . '&checksum=' . $data['checksum'] . '&domainname=' . $data['data']['domainname'] . '&dns_hst1=' . $data['data']['dns_hst1'] . '&dns_hst2=' . $data['data']['dns_hst2'] . '&dns_hst3=' . $data['data']['dns_hst3'] . '&dns_hst4=' . $data['data']['dns_hst4'] . '&dns_hst5=' . $data['data']['dns_hst5'] . '&dns_hst6=' . $data['data']['dns_hst6'];
                break;
            //还原为美橙DNS
            case 'resetDNS':
                $url = $_URI . '/domains/ResetDNS.aspx?username=' . $data['username'] . '&otime=' . $data['otime'] . '&checksum=' . $data['checksum'] . '&domainname=' . $data['data']['domainname'];
                break;
        }

        $_r = json_decode($_r, true);



        if ($_r['status']['code'] !=1) {
            $ret['msg'] =$_r['status']['message'];
            return json_encode($ret);
        }

        try {
            // return;
            switch ($data['action']) {
                case 'CreateRecord':

                    $dnsinfo = $Dnspodmodel->where(['domain_id'=>$data['domain_id'],'user_id'=>$userinfo['id']])->find();

                    $record->sub_domain = $post['sub_domain'];
                    $record->user_id = $userinfo['id'];
                    $record->record_type = $post['record_type'];
                    $record->record_line = $post['record_line'];
                    $record->record_id = $_r['record']['id'];
                    $record->mx = $post['mx'];
                    $record->ttl = $post['ttl'];
                    $record->value = $post['value'];
                    $record->status = $_r['record']['status'] == 'enable' ? "正常":'禁止';
                    $record->product_id = isset($data['pro']['plug']) ? $data['pro']['plug'] :'';
                    $dnsinfo->recordlist()->save($record);
                    break;
                case 'createContact':
                    // dump(json_decode($_r,true));
                    $ret['data'] = json_decode($_r, true)['message'];
                    break;
                case 'modifyContact':
                    // dump($_r);
                    // dump($url);
                    $ret['data'] = json_decode($_r, true)['message'];
                    break;
                case 'deleteRecord':
                    // dump($_r);
                    $infolist->delete();

                    break;
                case 'createDom':
                    // dump($_r);


                    $ret['status'] = $_r['status']['code'];
                    $ret['msg'] = $_r['status']['message'];
                    $ret['data'] = $_r['domain']['domain'];

                    if ($ret['status'] ==1) {
                        $Dnspodmodel->product_id  = isset($data['pro']['plug']) ? $data['pro']['plug'] :'';
                        $Dnspodmodel->user_id = $userinfo['id'];
                        $Dnspodmodel->domain_id = $_r['domain']['id'];
                        $Dnspodmodel->domain=$_r['domain']['domain'];
                        $Dnspodmodel->status="正常";
                        $Dnspodmodel->save();


                        $GeeDns->user_id = $userinfo['id'];
                        $GeeDns->plug_id  = isset($data['pro']['plug']) ? $data['pro']['plug'] :'';
                        $GeeDns->plug_type = 'dns_dnspod';
                        $GeeDns->plug_name ='dnspod';
                        $GeeDns->type = 0;
                        $GeeDns->pro_id =$Dnspodmodel->getLastInsID();
                        $GeeDns->status="正常";
                        $GeeDns->save();
                    }
                    break;
                case 'domainRenew':
                    // dump($_r);
                    // return;
                    $ret['status'] = json_decode($_r, true)['status'];
                    $ret['data'] = json_decode($_r, true)['message'];
                    break;
                case 'domainInfo':

                    $ext_status = array_key_exists($_r['domain']['ext_status'], DNS::$ext_status) ?
                        DNS::$ext_status[$_r['domain']['ext_status']]: "正常";


                    $GeeDns =$GeeDns->get(intval($post['dns_id']));
                    $GeeDns->status=$ext_status;


                    $Dnspodinfo = $Dnspodmodel->where(['domain_id'=>intval($post['domain_id'])])->find();
                    $Dnspodinfo->status=$ext_status;
                    $Dnspodinfo->save();
                    break;
                case 'domainWhoisProtect':
                    // dump(json_decode($_r,true));
                    $ret['data'] = json_decode($_r, true)['message'];
                    break;
                case 'getLoginURL':
                    // dump(json_decode($_r,true));
                    $ret['data'] = json_decode($_r, true)['message'];
                    break;
                //域名过户
                case 'domainguohu':
                    // dump(json_decode($_r,true));
                    $ret['data'] = json_decode($_r, true)['message'];
                    break;
                case 'modifyDNS':
                    // dump(json_decode($_r, true));
                    $ret['data'] = json_decode($_r, true)['message'];
                    break;
                case 'resetDNS':
                    // dump(json_decode($_r, true));
                    $ret['data'] = json_decode($_r, true)['message'];
                    break;
            }

            //  echo json_encode($ret);
         //   die();
        } catch (PDOException $exception) {
            $ret['data']=$exception->getMessage();
            //  echo json_encode($ret);
          //  die();
        }

        return json_encode($ret);
    }
    /**
     * 更新域名列表数据
     * @param $data  所传参数
     * @param $data['user_id']  所属用户ID
     * @return json
     */
    public function updateList($data = [])
    {
    }

    /**
     * curl 调用接口
     * @param $aData
     * @return \SimpleXMLElement
     */
    private function send($_URI = '')
    {
        $curl = curl_init();
        $headerArray = array("Content-type:application/json;charset='utf-8'", "Accept:application/json");
        curl_setopt($curl, CURLOPT_HTTPHEADER, $headerArray);
        curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, false);
        curl_setopt($curl, CURLOPT_URL, $_URI);
        curl_setopt($curl, CURLOPT_HEADER, 0); //设置头文件的信息作为数据流输出
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1); //设置获取的信息以文件流的形式返回，而不是直接输出
        // curl_setopt($ch,CURLOPT_USERAGENT,$_SERVER['HTTP_USER_AGENT']);
        $return = curl_exec($curl);
        curl_close($curl);
        // dump($return);
        // $return = json_decode($return,true);
        return $return;
    }
}
