<?php
namespace app\index\controller;

use app\index\model\GeeUser; // 日志表
use app\manager\model\GeeWebbasic; // 员工表
use think\Cache;
use think\Controller;

// 基本信息表

class Login extends Controller
{
    public function _initialize()
    {
        $user = new GeeUser();
        $basic = new GeeWebbasic();
        //网站基本数据
        $basicInfo = $basic->where('id = 1')->find();
        $this->_basicInfo = $basicInfo;
        $this->assign("basicInfo", $basicInfo);
        session('_basicInfo', $basicInfo);
    }
    //登录页面
    public function index()
    {
        if (isset($_COOKIE['token']) && !empty($_COOKIE['token']) && jwt_decode($_COOKIE['token'])) {

            $user = new GeeUser();
            //JWT 数据
            $res = jwt_decode($_COOKIE['token']);
            $res = object_toArray($res);
            $res = $user->where('id = ' . $res['jti']['user_id'])->find();
            if ($res) {
                if ($_GET['redirect']) {
                    return $this->redirect($_GET['redirect']);
                }
                return $this->redirect('index/Index/index');
            } else {
                // return $this->redirect('index/Login/index');
            }
        }
        return $this->fetch('Login/login');
    }
    //登录验证
    public function auth()
    {
        $data = $_POST;
        $ret = [
            'status' => 200,
            'msg' => '操作成功！',
        ];
        $user = new GeeUser();
        if (!isset($data['username']) || !vali_data('phone', $data['username'])) {
            $ret['status'] = 422;
            $ret['msg'] = '手机号或密码错误！';
            return $ret;
        }
        if (!isset($data['password']) || empty($data['password'])) {
            $ret['status'] = 422;
            $ret['msg'] = '手机号或密码错误！';
            return $ret;
        }
        $userinfo = $user->where('`phone` = "' . $data['username'] . '"')->find();
        if (!$userinfo) {
            $ret['status'] = 422;
            $ret['msg'] = '手机号或密码错误！';
            return $ret;
        }
        if ($userinfo['status'] == '2') {
            $ret['status'] = 422;
            $ret['msg'] = '该账号已被锁定，请联系管理员解锁！';
            return $ret;
        }
        if (password_verify($data['password'], $userinfo['password'])) {
            // $log = new GeeLog();
            // $saveInfo = [
            //     'content' => $userinfo['name'].' 登录了，登录IP为：'.get_ip(),
            //     'ip' => get_ip()
            // ];
            // $logres = $log->save($saveInfo);
            $userres = $user->save(['last_login_time' => time()], ['id' => $userinfo['id']]);
            if ($userres) {
                $to_info = [
                    'user_id' => $userinfo['id'],
                    'rend' => rand(0, 100),
                ];
                $sign = $this->sign($to_info);
                $to_info['sign'] = $sign;
                $token = jwt_encode($to_info);
                $ret['token'] = $token;
                return $ret;
            }
        }
        $ret['status'] = 422;
        $ret['msg'] = '手机号或密码错误！';
        return $ret;
    }
    /**
     * 签名
     */
    public function sign($to_info)
    {
        // 生成签名
        ksort($to_info);
        $sign = '';
        foreach ($to_info as $key => $var) {
            $sign .= $key . '=' . $var . '&';
        }
        $sign = trim($sign, '&');
        return md5($sign);
    }
    /**
     * 退出
     */
    public function logout()
    {
        setcookie('token', '', time() - 3600, '/');
        return $this->redirect('index/Login/index');
        die;
    }
    //注册页面
    public function register()
    {
        if (isset($_COOKIE['token']) && !empty($_COOKIE['token']) && jwt_decode($_COOKIE['token'])) {
          if ($_GET['redirect']) {
              return $this->redirect($_GET['redirect']);
          }
            return $this->redirect('index/Index/index');
        }
        return $this->fetch('Login/regest');
    }
    //注册验证
    public function regauth()
    {
        $data = $_POST;
        $ret = [
            'status' => 200,
            'msg' => '操作成功！',
        ];
        $user = new GeeUser();
        if (!isset($data['username']) || empty($data['username'])) {
            $ret['status'] = 422;
            $ret['msg'] = '用户名提交有误！';
            return json_encode($ret);
        }
        if (!isset($data['phone']) || !vali_data('phone', $data['phone'])) {
            $ret['status'] = 422;
            $ret['msg'] = '手机号提交有误！';
            return json_encode($ret);
        }
        if (!isset($data['agree']) || empty($data['agree'])) {
            $ret['status'] = 422;
            $ret['msg'] = '请阅读并同意《用户协议》！';
            return json_encode($ret);
        }
        if (!isset($data['smscode']) || empty($data['smscode'])) {
            $ret['status'] = 422;
            $ret['msg'] = '短信验证码提交有误！';
            return json_encode($ret);
        }
        //验证短信码
        if (Cache::get('registerCode:' . $data['phone'])) {
            $old_cache_data = Cache::get('registerCode:' . $data['phone']);
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
        if (!isset($data['email']) || !vali_data('email', $data['email'])) {
            $ret['status'] = 422;
            $ret['msg'] = '电子邮箱提交有误！';
            return json_encode($ret);
        }
        if (!isset($data['password']) || !vali_data('pwd', $data['password'])) {
            $ret['status'] = 422;
            $ret['msg'] = '请设置6-18字符登录密码';
            return json_encode($ret);
        }
        if (!isset($data['vpassword']) || !vali_data('pwd', $data['vpassword'])) {
            $ret['status'] = 422;
            $ret['msg'] = '请设置6-18字符登录密码';
            return json_encode($ret);
        }
        if ($data['vpassword'] != $data['password']) {
            $ret['status'] = 422;
            $ret['msg'] = '登录密码与确认密码不一致！';
            return json_encode($ret);
        }

        $is_username = $user->where('`username` = "' . $data['username'] . '"')->find();
        $is_phone = $user->where('`phone` = "' . $data['phone'] . '"')->find();
        $is_email = $user->where('`email` = "' . $data['email'] . '"')->find();
        if ($is_username) {
            $ret['status'] = 422;
            $ret['msg'] = '用户名已被使用！';
            return json_encode($ret);
        }
        if ($is_phone) {
            $ret['status'] = 422;
            $ret['msg'] = '手机号已被使用！';
            return json_encode($ret);
        }
        if ($is_email) {
            $ret['status'] = 422;
            $ret['msg'] = '电子邮箱已被使用！';
            return json_encode($ret);
        }

        $data['password'] = passToHash($data['password']);
        $data['create_ip'] = get_ip();
        $data['name'] = $data['phone'];
        $data['group_id'] = 1;
        $data['last_login_time'] = time();
        unset($data['vpassword']);
        unset($data['smscode']);
        unset($data['agree']);
        $regres = $user->save($data);
        if ($regres) {
            $nowuser = $user->where('phone = ' . $data['phone'])->find();
            $to_info = [
                'user_id' => $nowuser['id'],
                'rend' => rand(0, 100),
            ];
            $sign = $this->sign($to_info);
            $to_info['sign'] = $sign;
            $token = jwt_encode($to_info);
            // setcookie('token',$token,time() + 3600 * 2,'/');
            $ret['token'] = $token;
            return json_encode($ret);
        }

        $ret['status'] = 422;
        $ret['msg'] = '网络错误！请再次尝试';
        return json_encode($ret);
    }
    //获取注册短信验证码
    public function getregcode()
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
        if (Cache::get('registerCode:' . $data['phone'])) {
            $old_cache_data = Cache::get('registerCode:' . $data['phone']);
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
        cache('registerCode:' . $data['phone'], $cache_data, 300);

        //发起短信请求
        $res = parseMsgPublic([
            'mark' => 'registerCode',
            'to' => $data['phone'],
            'params' => [
                'basic_name',
                $smsCode,
            ],
        ]);
        $res = json_decode($res,true);
        if($res['status'] != 200){
          $ret['status'] = $res['status'];
          $ret['msg'] = $res['msg'];
          return json_encode($ret);
        }
        // dump(Cache::has('registerCode:' . $data['phone']));
        // dump(cache('registerCode:' . $data['phone']));
        return json_encode($ret);
    }
    //注册协议
    public function regdeal()
    {
        return $this->fetch('Login/regdeal');
    } //忘记密码页面
    public function forget()
    {
        if (isset($_COOKIE['token']) && !empty($_COOKIE['token']) && jwt_decode($_COOKIE['token'])) {
          if ($_GET['redirect']) {
              return $this->redirect($_GET['redirect']);
          }
            return $this->redirect('index/Index/index');
        }
        return $this->fetch('Login/forget');
    }

    //获取忘记密码短信验证码
    public function getretcode()
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
        if (Cache::get('retrieveCode:' . $data['phone'])) {
            $old_cache_data = Cache::get('retrieveCode:' . $data['phone']);
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
        cache('retrieveCode:' . $data['phone'], $cache_data, 300);

        //发起短信请求
        $res = parseMsgPublic([
            'mark' => 'retrieveCode',
            'to' => $data['phone'],
            'params' => [
                'basic_name',
                $smsCode,
            ],
        ]);
        $res = json_decode($res,true);
        if($res['status'] != 200){
          $ret['status'] = $res['status'];
          $ret['msg'] = $res['msg'];
          return json_encode($ret);
        }

        // dump(Cache::has('registerCode:' . $data['phone']));
        // dump(cache('registerCode:' . $data['phone']));
        return json_encode($ret);
    }
    //忘记密码验证
    public function forgetauth()
    {
        $data = $_POST;
        $ret = [
            'status' => 200,
            'msg' => '操作成功！',
        ];
        $user = new GeeUser();
        if (!isset($data['phone']) || !vali_data('phone', $data['phone'])) {
            $ret['status'] = 422;
            $ret['msg'] = '手机号提交有误！';
            return json_encode($ret);
        }
        if (!isset($data['smscode']) || empty($data['smscode'])) {
            $ret['status'] = 422;
            $ret['msg'] = '短信验证码提交有误！';
            return json_encode($ret);
        }
        //验证短信码
        if (Cache::get('retrieveCode:' . $data['phone'])) {
            $old_cache_data = Cache::get('retrieveCode:' . $data['phone']);
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
        if (!isset($data['password']) || !vali_data('pwd', $data['password'])) {
            $ret['status'] = 422;
            $ret['msg'] = '请设置6-18字符登录密码';
            return json_encode($ret);
        }
        if (!isset($data['vpassword']) || !vali_data('pwd', $data['vpassword'])) {
            $ret['status'] = 422;
            $ret['msg'] = '请设置6-18字符登录密码';
            return json_encode($ret);
        }
        if ($data['vpassword'] != $data['password']) {
            $ret['status'] = 422;
            $ret['msg'] = '登录密码与确认密码不一致！';
            return json_encode($ret);
        }

        $is_phone = $user->where('`phone` = "' . $data['phone'] . '"')->find();
        if (!$is_phone) {
            $ret['status'] = 422;
            $ret['msg'] = '用户不存在！';
            return json_encode($ret);
        }
        $id['id'] = $is_phone['id'];
        $data['password'] = passToHash($data['password']);
        $data['name'] = $data['phone'];
        $data['last_login_time'] = time();
        unset($data['vpassword']);
        unset($data['smscode']);
        $regres = $user->save($data, $id);
        if ($regres) {
            $to_info = [
                'user_id' => $is_phone['id'],
                'rend' => rand(0, 100),
            ];
            $sign = $this->sign($to_info);
            $to_info['sign'] = $sign;
            $token = jwt_encode($to_info);
            // setcookie('token',$token,time() + 3600 * 2,'/');
            $ret['token'] = $token;
            return json_encode($ret);
        }

        $ret['status'] = 422;
        $ret['msg'] = '网络错误！请再次尝试';
        return json_encode($ret);
    }
}
