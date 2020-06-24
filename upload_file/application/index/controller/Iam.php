<?php
namespace app\index\controller;

use app\index\controller\Common; // 前置操作
use app\index\model\GeeAccesskey; // 请求类
use app\index\model\GeeUser;
use app\index\model\GeeUserEnterprise;
use think\Cache;
use think\Controller;

// 用户表
// 用户企业认证表

class Iam extends Common
{
    public function index()
    {
        return $this->redirect('index/Iam/overview');
    }
    public function overview()
    {
        $user = new GeeUser();
        $ue = new GeeUserEnterprise();
        $ueinfo = $ue->where('user_id = ' . session('_userInfo')['id'])->find();
        $this->assign('ueinfo', $ueinfo);
        return $this->fetch('Iam/overview');
    }
    //发送修改手机号短信验证码
    public function sendrstcode()
    {
        $data = $_POST;
        $ret = [
            'status' => 200,
            'msg' => '操作成功！',
        ];

        if (!isset($data['phone']) || !vali_data('phone', $data['phone'])) {
            $ret['status'] = 422;
            $ret['msg'] = '手机号提交有误！';
            return json_encode($ret);
        }

        // 判断是否有验证码 处在 60秒内有效期
        if (Cache::get('changeMobileCode:' . $data['phone'])) {
            $old_cache_data = Cache::get('changeMobileCode:' . $data['phone']);
            $last_time = $old_cache_data['send_time'];
            if ($last_time + 60 > time()) {
                $ret['status'] = 422;
                $ret['msg'] = '请等60秒后,再次发送验证码！';
                return json_encode($ret);
            }
        }
        //短信随机验证码
        $smsCode = mt_rand(100000, 999999);
        $expire_time = time() + 300;
        $cache_data = [
            'phone' => $data['phone'],
            'code' => $smsCode,
            'expire_time' => $expire_time, #过期时间
            'send_time' => time(), #发送时间
        ];
        cache('changeMobileCode:' . $data['phone'], $cache_data, 300);

        //发起短信请求
        $res = parseMsgPublic([
            'mark' => 'changeMobileCode',
            'to' => $data['phone'],
            'params' => [
                $smsCode,
            ],
        ]);

        // dump(Cache::has('changeMobileCode:' . $data['phone']));
        // dump(cache('changeMobileCode:' . $data['phone']));
        return json_encode($ret);
    }
    //旧手机号验证
    public function changeoldphone()
    {
        $data = $_POST;
        $ret = [
            'status' => 200,
            'msg' => '操作成功',
            'data' => '',
        ];
        $u = new GeeUser();

        if (!isset($data['smscode']) || empty($data['smscode'])) {
            $ret['status'] = 422;
            $ret['msg'] = '短信验证码提交有误！';
            return json_encode($ret);
        }
        // dump(Cache::get('changeMobileCode:' . $data['phone']));
        //验证短信码
        if (Cache::get('changeMobileCode:' . $data['phone'])) {
            $old_cache_data = Cache::get('changeMobileCode:' . $data['phone']);
            if ($old_cache_data['code'] != $data['smscode']) {
                $ret['status'] = 422;
                $ret['msg'] = '短信验证码不正确！';
                return json_encode($ret);
            }
        } else {
            $ret['status'] = 422;
            $ret['msg'] = '未发送短信验证码或短信验证码已过期!';
            return json_encode($ret);
        }

        if (isset($data['phone'])) {
            if (!vali_data('phone', $data['phone'])) {
                $ret['status'] = 422;
                $ret['msg'] = '手机号提交有误！';
                return json_encode($ret);
            } else {
                // $uinfo = session('_userInfo');
                // $u->where('id = ' . $uinfo['id'])->update([
                //     'phone' => $data['phone'],
                //     'update' => time(),
                // ]);
                cache('changeMobileCode:' . $data['phone'], [], 1);
            }
        }
        return json_encode($ret);
    }
    //新手机号验证
    public function changenewphone()
    {
        $data = $_POST;
        $ret = [
            'status' => 200,
            'msg' => '操作成功',
            'data' => '',
        ];
        $u = new GeeUser();

        if (!isset($data['smscode']) || empty($data['smscode'])) {
            $ret['status'] = 422;
            $ret['msg'] = '短信验证码提交有误！';
            return json_encode($ret);
        }
        //验证短信码
        if (Cache::get('changeMobileCode:' . $data['phone'])) {
            $old_cache_data = Cache::get('changeMobileCode:' . $data['phone']);
            if ($old_cache_data['code'] != $data['smscode']) {
                $ret['status'] = 422;
                $ret['msg'] = '短信验证码不正确！';
                return json_encode($ret);
            }
        } else {
            $ret['status'] = 422;
            $ret['msg'] = '未发送短信验证码或短信验证码已过期!';
            return json_encode($ret);
        }

        if (isset($data['phone'])) {
            if (!vali_data('phone', $data['phone'])) {
                $ret['status'] = 422;
                $ret['msg'] = '手机号提交有误！';
                return json_encode($ret);
            } else {
                $uinfo = session('_userInfo');
                $u->where('id = ' . $uinfo['id'])->update([
                    'phone' => $data['phone'],
                    'update' => time(),
                ]);
            }
        }
        return json_encode($ret);
    }
    public function cpersonal()
    {
        return $this->fetch('Iam/cpersonal');
    }
    public function subauth()
    {
        $p = $_POST;
        $ret = [
            'status' => 200,
            'msg' => '操作成功',
            'data' => '',
        ];
        $u = new GeeUser();
        if (!isset($p['realname']) || empty($p['realname'])) {
            $ret['status'] = 422;
            $ret['msg'] = '请输入真实姓名!';
            return json_encode($ret);
        }
        if (!isset($p['idcard']) || empty($p['idcard']) || !vali_data('idcard', $p['idcard'])) {
            $ret['status'] = 422;
            $ret['msg'] = '请输入正确的身份证号码!';
            return json_encode($ret);
        }
        $id['id'] = $p['id'];
        $saves = [
            'realname' => $p['realname'],
            'idcard' => $p['idcard'],
            'realverify' => 1,
        ];
        $res = $u->where('id = ' . $p['id'])->update($saves);
        if ($res) {
            return json_encode($ret);
        } else {
            $ret['status'] = 422;
            $ret['msg'] = '网络异常!请稍后再试';
            return json_encode($ret);
        }
    }
    public function ccompany()
    {
        $u = new GeeUserEnterprise();
        $cinfo = $u->where("user_id = " . session('_userInfo')['id'])->find();
        // dump($cinfo);
        $this->assign('cinfo', $cinfo);
        return $this->fetch('Iam/ccompany');
    }
    public function accesslist()
    {
        $uinfo = session('_userInfo');
        $ak = new GeeAccesskey();
        $list = $ak->where('user_id = ' . $uinfo['id'])->order('id desc')->paginate(20);
        $count = $ak->where('user_id = ' . $uinfo['id'])->count();
        $this->assign('list', $list);
        $this->assign('count', $count);
        return $this->fetch('Iam/accesslist');
    }
    public function addaccessAuth()
    {
        $ak = new GeeAccesskey();
        $p = $_POST;
        $ret = [
            'status' => 200,
            'msg' => '操作成功',
            'data' => '',
        ];
        $uinfo = session('_userInfo');
        $count = $ak->where('user_id = ' . $uinfo['id'])->count();
        if ($count >= 20) {
            $ret['status'] = 422;
            $ret['msg'] = '已超过可创建上限!';
            return json_encode($ret);
        }

        $put = [
            'ak' => $this->vali_name('ak', rand_name(32, 1), 32, 'rand_name'),
            'sk' => $this->vali_name('sk', rand_name(32, 1), 32, 'rand_name'),
            'intro' => '',
            'user_id' => $uinfo['id'],
        ];
        $res = $ak->save($put);
        if ($res) {
            return json_encode($ret);
        } else {
            $ret['status'] = 422;
            $ret['msg'] = '网络异常!请稍后再试';
            return json_encode($ret);
        }
    }
    public function editaccessIntro()
    {
        $ak = new GeeAccesskey();
        $p = $_POST;
        $ret = [
            'status' => 200,
            'msg' => '操作成功',
            'data' => '',
        ];
        $uinfo = session('_userInfo');
        if (!isset($p['intro']) || empty($p['intro'])) {
            $ret['status'] = 422;
            $ret['msg'] = '请输入说明内容!';
            return json_encode($ret);
        }

        $res = $ak->where('id = ' . $p['id'])->update(['intro' => $p['intro']]);
        if ($res) {
            return json_encode($ret);
        } else {
            $ret['status'] = 422;
            $ret['msg'] = '网络异常!请稍后再试';
            return json_encode($ret);
        }
    }
    public function delaccess()
    {
        $ak = new GeeAccesskey();
        $p = $_POST;
        $ret = [
            'status' => 200,
            'msg' => '操作成功',
            'data' => '',
        ];
        $uinfo = session('_userInfo');

        $res = $ak->where('id = ' . $p['id'] . ' and user_id = ' . $uinfo['id'])->delete();
        if ($res) {
            return json_encode($ret);
        } else {
            $ret['status'] = 422;
            $ret['msg'] = '网络异常!请稍后再试';
            return json_encode($ret);
        }
    }
    /**
     * 验证随机名称
     */
    public function vali_name($key, $val, $len, $func)
    {
        if (!is_int($val) && !is_bool($val)) {
            $w = '"' . $val . '"';
        }
        $has = db('accesskey')->where('`' . $key . '` = ' . $w)->find();
        if ($has) {
            $vali = $this->vali_name($key, $func($len), $len, $func);
            return $vali;
        } else {
            return $val;
        }
    }
    public function baseinfoedit()
    {
        return $this->fetch('Iam/baseinfoedit');
    }
    public function subcompany()
    {
        $p = $_POST;
        $ret = [
            'status' => 200,
            'msg' => '操作成功',
            'data' => '',
        ];
        $ue = new GeeUserEnterprise();
        $u = new GeeUser();
        if ((!isset($p['type']) || empty($p['type'])) && $p['type'] != '0') {
            $ret['status'] = 422;
            $ret['msg'] = '请选择组织类型!';
            return json_encode($ret);
        }
        if (!isset($p['name']) || empty($p['name'])) {
            $ret['status'] = 422;
            $ret['msg'] = '请输入企业/字号/企业名称!';
            return json_encode($ret);
        }
        if (!isset($p['code']) || empty($p['code'])) {
            $ret['status'] = 422;
            $ret['msg'] = '请输入营业执照注册号/组织机构代码!';
            return json_encode($ret);
        }
        if (!isset($p['pic']) || empty($p['pic'])) {
            $ret['status'] = 422;
            $ret['msg'] = '请上传营业执照扫描件/组织机构代码证扫描件!';
            return json_encode($ret);
        }
        $saves = [
            'type' => $p['type'],
            'name' => $p['name'],
            'code' => $p['code'],
            'pic' => $p['pic'],
            'is_individual' => $p['is_individual'],
            'user_id' => $p['id'],
            'status' => 0,
        ];
        $has = $ue->where('user_id = ' . $p['id'])->find();
        $uinfo = $u->where('id = ' . $p['id'])->find();
        if (!empty($has)) {
            $res = $ue->where('user_id = ' . $p['id'])->update($saves);
        } else {
            $res = $ue->save($saves);
            if ($uinfo['realverify'] != 2) {
                $u->where('id = ' . $p['id'])->update(['realverify' => 1]);
            }
        }
        if ($res) {
            return json_encode($ret);
        } else {
            $ret['status'] = 422;
            $ret['msg'] = '网络异常!请稍后再试';
            return json_encode($ret);
        }
    }
}
