<?php
namespace addons\domain\westdomain\common\library;
class Api
{
    private static $api = "https://api.west.cn/api/v2";

    /**
     * @var string  身份验证字符串
     */
    private $token;

    /**
     * @var string  接口使用者在西部数码注册的用户名
     */
    private $username;

    /**
     * @var string  API密码
     */
    private $password;

    /**
     * @var int 当前时间毫秒时间戳
     */
    private $time;

    public function __construct($username, $password)
    {
        $this->username = trim($username);
        $this->password = trim($password);
    }

    /**
     * 请求api
     * @param array $data 接口参数
     * @return bool|string
     */
    public function fetch_api($data)
    {
        // 拼接接口地址, 加上公共参数
        $url = self::$api . $data['action'] . (stripos($data['action'], '?') !== false ? '&' : '?') . $this->generate_common_parameters_sting();
        if (isset($data['query']) && is_array($data['query'])) $url .= ('&' . http_build_query($data['query']));
        // 请求头
        $headers = array('Content-Type: application/x-www-form-urlencoded');
        // 请求api
        return self::http_client($url, strcasecmp($data['method'], 'POST') === 0 ? $data['body'] : null, $headers);
    }

    /**
     * 生成 token 字符串
     * @return string
     */
    private function generate_token_sting()
    {
        $this->time = self::get_current_timestamp();
        return md5($this->username . $this->password . $this->time);
    }

    /**
     * 生成公共参数
     * @return string
     */
    private function generate_common_parameters_sting()
    {
        $token = $this->generate_token_sting();
        return http_build_query(array(
            'username' => $this->username,
            'time' => $this->time,
            'token' => $token,
        ));
    }

    /**
     * 获取当前时间戳
     * @return float
     */
    public static function get_current_timestamp()
    {
        list($usec, $sec) = explode(' ', microtime(), 2);
        return (float)sprintf('%.0f', (floatval($usec) + floatval($sec)) * 1000);
    }

    public static function http_client($url, $data = '', $headers = null)
    {
        return self::http_curl($url, $data, $headers, null, 30, 30);
    }

    public static function http_curl($url, $data, $headers, $cookies, $time_out, $time_out_exec)
    {
        $ch = curl_init();

        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, false);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_BINARYTRANSFER, false);
        curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, $time_out);
        curl_setopt($ch, CURLOPT_TIMEOUT, $time_out_exec);
        curl_setopt($ch, CURLOPT_HEADER, false);
        curl_setopt($ch, CURLOPT_NOBODY, false);

        if ($data && is_array($headers)) {
            curl_setopt($ch, CURLOPT_POST, true);
            curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query($data));
        }

        if ($cookies) {
            curl_setopt($ch, CURLOPT_COOKIEJAR, $cookies);
            curl_setopt($ch, CURLOPT_COOKIEFILE, $cookies);
        }

        if ($headers && is_array($headers)) {
            curl_setopt($ch,CURLOPT_HTTPHEADER, $headers);
        }

        $response = curl_exec($ch);
        if ($response === false) {
            @error_log(curl_error($ch), 0);
        }
        curl_close($ch);

        return $response;
    }

    public static function ToGB2312(&$item,$key){
        $item =iconv("utf-8","gb2312//IGNORE", $item);
    }
}