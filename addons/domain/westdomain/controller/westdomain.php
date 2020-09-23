<?php
namespace addons\domain\westdomain\controller;

use addons\domain\westdomain\common\library\Api;
use think\Controller;
use think\Db;

class westdomain extends Controller
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
        $_URI = 'http://api.westdomain.com';

        $product = Db::name('product')->where('id = ' . $data['pro_id'])->find();
        $config = json_decode($product['plug_config'], true);
        $data['username'] = $config['username'];

        list($msec, $sec) = explode(' ', microtime());
        $msectime = (float)sprintf('%.0f', (floatval($msec) + floatval($sec)) * 1000);

        //验证串。（必填）md5(username+md5(您 API 接口的密码)。
        //例如：md5(api 账号+md5(111111)+20120921110855123+api 账号邮箱)
        $data['token'] = md5($config['username'] . $config['password']. $msectime);

        $api = new Api($data['username'], $config['password']);
        // dump($data['action']);
        // dump($data['data']['domain']);
        // dump($data['data']['suffix']);
        // return;
        $postdata=[];
        $flag=true;
        switch ($data['action']) {
            case 'checked':
                //测试接口运行
                $url = $_URI . '/domains/DomainDetail.aspx?username=' . $data['username'] . '&otime=' . $data['otime'] . '&checksum=' . $data['checksum'] . '&domainname=jialewan.com';
                break;
            //域名查询
            case 'check':
                $postdata = array(
                    'action' => '/domain/query/',
                    'method' => 'POST',
                    /*
                    'body' => array(
                        'domain' => 'test',
                        'suffix' => '.com',
                    )
                    */
                );
                $postdata['body']=$data['data'];


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
                //创建模板
                $res = $this->auditsub($data['data']['userid'],$api);
                if($res['result']=='200'){

                }
                var_dump($res);die();
                $postdata = array(
                    'action' => '/audit/?act=regdomain',
                    'method' => 'POST',
                    'body' => array(
                       // 'domain' => $data['data']['domainname'],
                        'domain' => 'test.com',
                        'regyear' => 1,
                        'domainpwd' =>   $data['data']['domainpass'],
                        'c_sysid'=>631463
                    )
                );
                $flag=false;
                break;
            //续费域名
            case 'domainRenew':
                $postdata = array(
                    'action' => '/domain/?act=renew',
                    'method' => 'POST',
                    'body' => array(
                    //    'domain' => $data['data']['domainname'],
                        'domain' => "test.com",//测试
                        'year' => $data['data']['years'],
                        'expiredate' => $data['data']['exptme'] ? $data['data']['exptme']:date('Y-m-d H:i:s') ,
                        'client_price'=>1
                    )
                );

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

        if($flag){
            $_r = $api->fetch_api($postdata);
            $_r= iconv("gb2312","utf-8//IGNORE",$_r);
        }

        // dump($url);
        // dump(json_decode($_r,true));
        // dump($_r);

        // return;
        switch ($data['action']) {
            case 'check':
                $ret['data'] = json_decode($_r, true)['avail'] == 0 ? "available":"unavailable";
                $ret['status'] = 200;
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
                $ret['status'] = json_decode($_r, true)['result'];
                $ret['errcode'] = json_decode($_r, true)['errcode'];
                $ret['data'] = json_decode($_r, true)['msg'];
                break;
            case 'domainRenew':
                // dump($_r);
                // return;

                if(isset(json_decode($_r, true)['msg']))  $ret['msg']=json_decode($_r, true)['msg'];
                $ret['status'] = json_decode($_r, true)['result'];
                $ret['data'] = json_decode($_r, true)['msg'];

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
        $res['status'] =200;
        return json_encode($ret);
    }
    public function auditsub($id,$api){


        $contact = Db::name('domain_contact')->find($id);

        if(!$contact) return [];
        $res = $this->creteAuditsub($contact,$api);
        return $res;

    }

    public function creteAuditsub($contact,$api){


        $postdata = array(
            'action' => '/audit/?act=auditsub',
            'method' => 'POST',
            'body' => array(
                //    'domain' => $data['data']['domainname'],
                'c_regtype' => $contact['usertype'],//测试
                'c_ln_m' => $contact['lastname_cn'],
                'c_fn_m' => $contact['company_cn'],
                'c_org_m'=> $contact['company_cn'],
                'c_co' => $contact['country_en'],
                'cocode' => strstr($contact['phone'],".",true),
                'c_st_m' => $contact['state_cn'],
                'c_ct_m' => $contact['city_cn'],
                'c_adr_m'=>$contact['address_cn'],
                'c_pc' => $contact['zipcode'],
                'c_ph' =>trim(strstr($contact['phone'],"."),"."),
                'c_ph_type' => 0,
                'c_em' => $contact['email'],
                'c_ln' => $contact['lastname_en'],
                'c_fn' => $contact['firstname_en'],
                'c_st' => $contact['state_en'],
                'c_ct' => $contact['city_en'],
                'c_adr' => $contact['address_en'],
            )
        );
        array_walk($postdata['body'], array('addons\domain\westdomain\common\library\Api', 'ToGB2312'));
/*
        $postdata = array(
            'action' => '/audit/?act=auditsub',
            'method' => 'POST',
            'body' => array(
                //    'domain' => $data['data']['domainname'],
                'c_regtype' => iconv("utf-8","gb2312//IGNORE",$contact['usertype']),//测试
                'c_ln_m' => iconv("utf-8","gb2312//IGNORE",$contact['lastname_cn']),
                'c_fn_m' => iconv("utf-8","gb2312//IGNORE",'付涛'),
                'c_org_m'=> iconv("utf-8","gb2312//IGNORE",'付涛'),
                'c_co' =>iconv("utf-8","gb2312//IGNORE", $contact['country_en']),
                'cocode' => iconv("utf-8","gb2312//IGNORE", strstr($contact['phone'],".",true)),
                'c_st_m' => iconv("utf-8","gb2312//IGNORE", $contact['state_cn']),
                'c_ct_m' => iconv("utf-8","gb2312//IGNORE", $contact['city_cn']),
                'c_adr_m'=>  iconv("utf-8","gb2312//IGNORE", $contact['address_cn']),
                'c_pc' =>  iconv("utf-8","gb2312//IGNORE", $contact['zipcode']),
                'c_ph' =>iconv("utf-8","gb2312//IGNORE", trim(strstr($contact['phone'],"."),".")),
                'c_ph_type' => 0,
                'c_em' =>iconv("utf-8","gb2312//IGNORE", $contact['email']),
                'c_ln' => iconv("utf-8","gb2312//IGNORE", $contact['lastname_en']),
                'c_fn' =>  iconv("utf-8","gb2312//IGNORE", $contact['firstname_en']),
                'c_st' => iconv("utf-8","gb2312//IGNORE", $contact['state_en']),
                'c_ct' => iconv("utf-8","gb2312//IGNORE", $contact['city_en']),
                'c_adr' => iconv("utf-8","gb2312//IGNORE", $contact['address_en']),
            )
        );
*/
        $_r= iconv("gb2312","utf-8//IGNORE",$api->fetch_api($postdata));

        return $_r;
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
