<?php
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: xieyongfa <xieyongfa@ecarde.com>
// +----------------------------------------------------------------------

\think\Console::addDefaultCommands([
    "think\\Crontab",
]);

if (!function_exists('push_crontab')) {

    /**
     * 添加到计划任务
     * @param string $name
     * @param string $class
     * @param array $payload
     * @param integer $interval_sec
     * @return bool
     */
    function push_crontab($name, $class, $payload = [], $interval_sec = 60)
    {
        $crontab = new \think\Crontab();
        return $crontab->push($name, $class, $payload, $interval_sec);
    }
}