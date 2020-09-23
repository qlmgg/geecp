<?php
namespace addons\domain\cndns\controller;

use think\Controller;
use think\Db;

class cndns extends Controller
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
        $_URI = 'http://api.cndns.com';
        if ($data['action'] != 'check') {
            $product = Db::name('product')->where('id = ' . $data['pro_id'])->find();
            $config = json_decode($product['plug_config'], true);
            $data['username'] = $config['username'];
            list($msec, $sec) = explode(' ', microtime());
            $msectime = (float) sprintf('%.0f', (floatval($msec) + floatval($sec)) * 1000);
            $otime = date('Ymd') . substr($msectime, -3);
            $data['otime'] = $otime;
            //验证串。（必填）md5(username+md5(您 API 接口的密码)+otime+您在美橙站点填写的邮箱)。
            //例如：md5(api 账号+md5(111111)+20120921110855123+api 账号邮箱)
            $data['checksum'] = md5($config['username'] . md5($config['password']) . $otime . $config['email']);
        }
        // dump($data['action']);
        // dump($data['data']['domain']);
        // dump($data['data']['suffix']);
        // return;
        switch ($data['action']) {
            case 'checked':
                //测试接口运行
                $url = $_URI . '/domains/DomainDetail.aspx?username=' . $data['username'] . '&otime=' . $data['otime'] . '&checksum=' . $data['checksum'] . '&domainname=jialewan.com';
                break;
            //域名查询
            case 'check':
                $url = 'http://dmcheck.cndns.com/check.aspx?domain-name=' . $data['data']['domain'] . '&tld=' . $data['data']['suffix'];
                break;
            //联系人列表
            case 'contactList':
                $url = $_URI . '/domains/ContactList.aspx?username=' . $data['username'] . '&otime=' . $data['otime'] . '&checksum=' . $data['checksum'] . '&userid=' . $data['data']['userid'];
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
            //删除联系人
            case 'deleteContact':
                $url = $_URI . '/domains/DeleteContact.aspx?username=' . $data['username'] . '&otime=' . $data['otime'] . '&checksum=' . $data['checksum'] . '&userid=' . $data['data']['userid'];
                break;
            //创建域名
            case 'createDom':
                foreach ($data['data'] as $k => $v) {
                    $data['data'][$k] = urlencode($v);
                }
                $url = $_URI . '/domains/CreateDom.aspx?username=' . $data['username'] . '&otime=' . $data['otime'] . '&checksum=' . $data['checksum'] . '&userid=' . $data['data']['userid'] . '&domainname=' . $data['data']['domainname'] . '&years=' . $data['data']['years'] . '&domainpass=' . $data['data']['domainpass'] . '&isName=' . $data['data']['isName'] . '&dns1=' . $data['data']['dns1'] . '&dns2=' . $data['data']['dns2'] . '&dns3=' . $data['data']['dns3'] . '&dns4=' . $data['data']['dns4'] . '&dns5=' . $data['data']['dns5'] . '&dns6=' . $data['data']['dns6'] . '&signature=' . $data['data']['signature'] . '&voucherid=' . $data['data']['voucherid'];
                break;
            //续费域名
            case 'domainRenew':
                foreach ($data['data'] as $k => $v) {
                    $data['data'][$k] = urlencode($v);
                }
                $url = $_URI . '/domains/DomainRenew.aspx?username=' . $data['username'] . '&otime=' . $data['otime'] . '&checksum=' . $data['checksum'] . '&domainname=' . $data['data']['domainname'] . '&years=' . $data['data']['years'] . '&exptme=' . $data['data']['signature'] . '&signature=' . $data['data']['signature'] . '';
                break;
            //获取域名信息
            case 'domainDetail':
                $url = $_URI . '/domains/DomainDetail.aspx?username=' . $data['username'] . '&otime=' . $data['otime'] . '&checksum=' . $data['checksum'] . '&domainname=' . $data['data']['domainname'];
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
        $_r = $this->send($url);
        // dump($url);
        // dump(json_decode($_r,true));
        // dump($_r);

        // return;
        switch ($data['action']) {
            case 'check':
                $ret['data'] = json_decode($_r, true)['message'][0][$data['data']['domain'] . $data['data']['suffix']];
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
            case 'contactList':
                // dump($_r);
                $ret['data'] = json_decode($_r, true)['message'];
                break;
            case 'createDom':
                // dump($_r);
                $ret['status'] = json_decode($_r, true)['status'];
                $ret['data'] = json_decode($_r, true)['message'];
                break;
            case 'domainRenew':
                // dump($_r);
                // return;
                $ret['status'] = json_decode($_r, true)['status'];
                $ret['data'] = json_decode($_r, true)['message'];
                break;
            case 'domainDetail':
                // dump(json_decode($_r,true));
                $ret['data'] = json_decode($_r, true)['message'];
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
        // dump($ret);
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
