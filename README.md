
![Image](https://images.gitee.com/uploads/images/2020/0223/181407_3d7ec98d_1332225.png)

## GEECP 开源公有云管理系统（现已支持八大功能模块）

重要通知！！！！

GEECP v3即将到来，我们重构了所有的代码，使用PHP+SWOOLE，提升性能的同时，更好的支持集群和分布式部署。

前端采用React（Antd方案），比原有的GEECP 提升至少5倍性能。

V3 以后，仅支持自生产，后端业务基于OPENSTACK。

完全自研的应用服务，为您提供更多智能的产品与服务API。


#### 基础功能支持计划：

支持的功能|状态|插件或第三方
-|-|-
域名注册|已完成|美橙互联/西部数码/ResellerClub
智能解析|已完成|对接DNSPOD解析服务
虚拟主机|已完成|EasyPanel/DirectAdmin/Plesk
VPS|已完成|星外Hyper-v/SolusVM
云主机|已完成|Nokvm/Jincloud
SSL证书|进行中|GlobalSign/Comodo/Certum/Symantec/DigiCert/CFCA
智能建站|已完成|耐斯尼克建站宝盒
云解析|进行中|官方永久免费的云API
CDN|已完成| 支持kanglecdn，自研cdn系统即将上线
云WAF|进行中| * 
高防IP|进行中| *
租用托管|已完成|二次修改，第一版已出。目前改进方向纳入自动化机房管理


#### MSP多云管理服务

厂商 |模块
-|-
百度云|云服务器、云硬盘、弹性公网IP
腾讯云|云服务器、云磁盘、弹性公网IP
华为云|云服务器、云磁盘、弹性公网IP
阿里云|云服务器、云磁盘、弹性公网IP


#### 云分销模块

功能 | 概述
-|-
基于OPENSTACK®受控| 自主接入，PoleStack云集群



## 如何安装GEECP?


```
下载安装包：请到论坛下载 bbs.geecp.com
```


## 配置服务器环境（推荐）

~~~
推荐LNMP环境
Nginx
PHP 7.2+
Mysql 5.7 +

更多运行问题参考ThinkPHP5.0运行环境
~~~


## 安装GEECP系统

~~~
http://www.yourdomain.com/ （访问域名会自动跳转到install进行安装）
~~~

## 管理地址

~~~
https://yourdomain.com/manager（账号密码是你安装的时候填写的）
~~~

## 使用交流
~~~
QQ群：730868267
~~~


## 交流论坛

[开发指南](http://www.geecp.com)

## 参与开发

请参阅 [ThinkPHP 5.0.24 ](https://www.kancloud.cn/manual/thinkphp5)。

## 版权信息

Gee Control Panel（简称“Geecp”）它并不是一款免费软件，当您用于商业用途时请您先取得商用许可。

本项目包含的第三方源码和二进制文件之版权信息另行标注。

版权所有Copyright © 2018-2020 by Geecp (http://www.geecp.com)

All rights reserved。http://www.geecp.com

著作权所有者为宿州七朵信息技术有限公司。

更多细节参阅 [LICENSE](LICENSE)
