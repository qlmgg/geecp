/*
 Navicat Premium Data Transfer

 Source Server         : localhosts
 Source Server Type    : MySQL
 Source Server Version : 80012
 Source Host           : localhost:3306
 Source Schema         : tp5geecp

 Target Server Type    : MySQL
 Target Server Version : 80012
 File Encoding         : 65001

 Date: 25/08/2020 17:30:00
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for gee_host_direct
-- ----------------------------
DROP TABLE IF EXISTS `gee_host_direct`;
CREATE TABLE `gee_host_direct`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT NULL COMMENT '所属用户',
  `product_id` int(11) NULL DEFAULT NULL COMMENT '产品ID',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '服务器名称',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '接口回传vpspassword',
  `attach` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '接口回传备注',
  `ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '服务器内部IP',
  `type` tinyint(1) NULL DEFAULT NULL COMMENT 'host套餐类型',
  `status` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '状态',
  `create_time` int(11) NULL DEFAULT NULL COMMENT '开通时间',
  `update_time` int(11) NULL DEFAULT NULL COMMENT '修改时间',
  `end_time` int(11) NULL DEFAULT NULL COMMENT '结束时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 55 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gee_host_direct
-- ----------------------------
INSERT INTO `gee_host_direct` VALUES (54, 25, 43, 'jlvhjgtx', 'test123', 'test3.com', '106.12.37.210', 1, '已过期', 1597914069, 1598075681, 1595235669);


INSERT INTO `gee_product_group` VALUES (null, 'direct测试主机分组', '测试专用', 0, 10, 1597736060, 1597736060);

ALTER TABLE gee_user ADD COLUMN `openid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微信openid';


-- ----------------------------
-- Table structure for gee_v2mroute
-- ----------------------------
DROP TABLE IF EXISTS `gee_v2mroute`;
CREATE TABLE `gee_v2mroute`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '路由名称',
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '路由标识',
  `name` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '路由路径',
  `f_id` int(11) NOT NULL COMMENT '上级ID',
  `s_id` int(11) NOT NULL COMMENT '从属id',
  `is_show` enum('0','1') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '是否展示 0:不展示 1:展示',
  `create_time` int(11) NOT NULL COMMENT '创建时间',
  `update_time` int(11) NOT NULL COMMENT '修改时间',
  `icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '路由图标',
  PRIMARY KEY (`id`, `s_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1021 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gee_v2mroute
-- ----------------------------
INSERT INTO `gee_v2mroute` VALUES (1, '业务', 'service', '/service', 0, 0, '1', 1557194766, 1557194766, 'iconchanpinku');
INSERT INTO `gee_v2mroute` VALUES (2, '域名管理', 'domain', '/service/domain', 1, 1, '1', 1557194766, 1557194766, '');
INSERT INTO `gee_v2mroute` VALUES (3, '主机管理', 'host', '/service/host', 1, 1, '1', 1557194766, 1557194766, '');
INSERT INTO `gee_v2mroute` VALUES (4, '租用托管', 'server', '/service/server', 1, 1, '1', 1557194766, 1557194766, '');
INSERT INTO `gee_v2mroute` VALUES (5, '工单', 'ticket', '/ticket', 0, 0, '1', 1557194766, 1557194766, 'icongongdanliebiao');
INSERT INTO `gee_v2mroute` VALUES (6, '工单列表', 'list', '/ticket/list', 5, 5, '1', 1557194766, 1557194766, '');
INSERT INTO `gee_v2mroute` VALUES (7, '工单分类', 'group', '/ticket/group', 5, 5, '0', 1557194766, 1557194766, '');
INSERT INTO `gee_v2mroute` VALUES (8, '产品', 'product', '/product', 0, 0, '1', 1557194766, 1557194766, 'iconcaidanguanli');
INSERT INTO `gee_v2mroute` VALUES (46, '产品类型', 'type', '/product/type', 8, 8, '1', 1557194766, 1557194766, '');
INSERT INTO `gee_v2mroute` VALUES (16, '用户', 'user', '/user', 0, 0, '1', 1557194766, 1557194766, 'iconyonghuguanli');
INSERT INTO `gee_v2mroute` VALUES (17, '用户列表', 'list', '/user/list', 16, 16, '1', 1557194766, 1557194766, '');
INSERT INTO `gee_v2mroute` VALUES (18, '用户分组', 'group', '/user/group', 16, 16, '1', 1557194766, 1557194766, '');
INSERT INTO `gee_v2mroute` VALUES (19, '财务', 'finance', '/finance', 0, 0, '1', 1557194766, 1557194766, 'iconcaiwu');
INSERT INTO `gee_v2mroute` VALUES (20, '总览', 'index', '/finance/index', 19, 0, '1', 1557194766, 1557194766, '');
INSERT INTO `gee_v2mroute` VALUES (21, '财务明细', 'details', '/finance/details', 19, 0, '1', 1557194766, 1557194766, '');
INSERT INTO `gee_v2mroute` VALUES (24, '充值记录', 'recharge', '/finance/recharge', 19, 0, '1', 1557194766, 1557194766, '');
INSERT INTO `gee_v2mroute` VALUES (25, '订单列表', 'order', '/finance/order', 19, 0, '1', 1557194766, 1557194766, '');
INSERT INTO `gee_v2mroute` VALUES (26, '发票管理', 'invoice', '/finance/invoice', 19, 0, '1', 1557194766, 1557194766, '');
INSERT INTO `gee_v2mroute` VALUES (27, '员工', 'staff', '/staff', 0, 0, '1', 1557194766, 1557194766, 'iconyonghu');
INSERT INTO `gee_v2mroute` VALUES (28, '员工列表', 'list', '/staff/list', 27, 0, '1', 1557194766, 1557194766, '');
INSERT INTO `gee_v2mroute` VALUES (29, '员工分组', 'group', '/staff/group', 27, 0, '1', 1557194766, 1557194766, '');
INSERT INTO `gee_v2mroute` VALUES (30, '扩展', 'addons', '/addons', 0, 0, '1', 1557194766, 1557194766, 'iconManagementDeploymen8');
INSERT INTO `gee_v2mroute` VALUES (31, '插件列表', 'list', '/addons/list', 30, 0, '1', 1557194766, 1557194766, '');
INSERT INTO `gee_v2mroute` VALUES (32, '详细', 'details', '/addons/details', 30, 0, '0', 1557194766, 1557194766, '');
INSERT INTO `gee_v2mroute` VALUES (33, '应用市场', 'https://addon.geecp.com', 'https://addon.geecp.com', 0, 0, '0', 1557194766, 1557194766, '');
INSERT INTO `gee_v2mroute` VALUES (999, '系统', 'system', '/system', 0, 0, '1', 1557194766, 1557194766, 'iconCloudCommunication-1');
INSERT INTO `gee_v2mroute` VALUES (35, '基本信息', 'basic', '/system/basic', 999, 0, '1', 1557194766, 1557194766, '');
INSERT INTO `gee_v2mroute` VALUES (36, '邮件设置', 'email', '/system/email', 999, 0, '1', 1557194766, 1557194766, '');
INSERT INTO `gee_v2mroute` VALUES (37, '短信设置', 'sms', '/system/sms', 999, 0, '0', 1557194766, 1557194766, '');
INSERT INTO `gee_v2mroute` VALUES (38, '支付设置', 'pay', '/system/pay', 999, 0, '0', 1557194766, 1557194766, '');
INSERT INTO `gee_v2mroute` VALUES (39, '消息模板', 'template', '/system/template', 999, 0, '1', 1557194766, 1557194766, '');
INSERT INTO `gee_v2mroute` VALUES (40, '附件设置', 'annex', '/system/annex', 999, 0, '1', 1557194766, 1557194766, '');
INSERT INTO `gee_v2mroute` VALUES (43, '产品列表', 'list', '/product/list', 8, 8, '1', 1557194766, 1557194766, '');
INSERT INTO `gee_v2mroute` VALUES (47, '导航管理', 'routes', '/routes', 0, 0, '0', 1557194766, 1557194766, '');
INSERT INTO `gee_v2mroute` VALUES (48, '添加导航', 'add', '/routes/add', 47, 0, '0', 1557194766, 1557194766, '');
INSERT INTO `gee_v2mroute` VALUES (49, '添加验证', 'addAuth', '/routes/addAuth', 47, 0, '0', 1557194766, 1557194766, '');
INSERT INTO `gee_v2mroute` VALUES (50, '删除路由', 'del', '/routes/del', 47, 0, '0', 1557194766, 1557194766, '');
INSERT INTO `gee_v2mroute` VALUES (51, '产品分类', 'class', '/product/class', 8, 8, '1', 1557194766, 1557194766, '');
INSERT INTO `gee_v2mroute` VALUES (52, '添加分类', 'addclass', '/product/addclass', 8, 51, '0', 1557194766, 1557194766, '');
INSERT INTO `gee_v2mroute` VALUES (53, '添加分类验证', 'addclassAuth', '/product/addclassAuth', 8, 0, '0', 1557194766, 1557194766, '');
INSERT INTO `gee_v2mroute` VALUES (54, '删除分类', 'delclass', '/product/delclass', 8, 0, '0', 1557194766, 1557194766, '');
INSERT INTO `gee_v2mroute` VALUES (59, '工单接入', 'join', '/ticket/join', 5, 0, '0', 1557194766, 1557194766, '');
INSERT INTO `gee_v2mroute` VALUES (57, '工单详情', 'details', '/ticket/details', 5, 5, '0', 1557194766, 1557194766, '');
INSERT INTO `gee_v2mroute` VALUES (58, '工单回复', 'reply', '/ticket/reply', 5, 0, '0', 1557194766, 1557194766, '');
INSERT INTO `gee_v2mroute` VALUES (60, '增值服务', 'added', '/product/added', 8, 8, '1', 1557194766, 1557194766, '');
INSERT INTO `gee_v2mroute` VALUES (61, '新增增值服务组', 'addaddedgroup', '/product/addaddedgroup', 8, 60, '0', 1557194766, 1557194766, '');
INSERT INTO `gee_v2mroute` VALUES (62, '新增增值服务', 'addadded', '/product/addadded', 8, 60, '0', 1557194766, 1557194766, '');
INSERT INTO `gee_v2mroute` VALUES (63, '新增增值服务组验证', 'addaddedgroupAuth', '/product/addaddedgroupAuth', 8, 0, '0', 1557194766, 1557194766, '');
INSERT INTO `gee_v2mroute` VALUES (64, '删除增值服务组', 'deladdedgroup', '/product/deladdedgroup', 8, 0, '0', 1557194766, 1557194766, '');
INSERT INTO `gee_v2mroute` VALUES (65, '新增增值服务验证', 'addaddedAuth', '/product/addaddedAuth', 8, 0, '0', 1557194766, 1557194766, '');
INSERT INTO `gee_v2mroute` VALUES (66, '删除增值服务', 'deladded', '/product/deladded', 8, 0, '0', 1557194766, 1557194766, '');
INSERT INTO `gee_v2mroute` VALUES (67, '交付物理服务器', 'delivery', '/service/delivery', 1, 0, '0', 0, 0, '');
INSERT INTO `gee_v2mroute` VALUES (68, '交付物理服务器验证', 'deliveryauth', '/service/deliveryauth', 1, 0, '0', 0, 0, '');
INSERT INTO `gee_v2mroute` VALUES (69, '删除订单', 'delorder', '/finance/delorder', 19, 0, '0', 0, 0, '');
INSERT INTO `gee_v2mroute` VALUES (71, '操作系统', 'os', '/product/os', 8, 0, '1', 0, 0, '');
INSERT INTO `gee_v2mroute` VALUES (79, '获取物理服务器信息', 'getserver', '/service/getserver', 1, 0, '0', 0, 0, '');
INSERT INTO `gee_v2mroute` VALUES (73, '添加操作系统', 'addosgroup', '/product/addosgroup', 8, 71, '0', 0, 0, '');
INSERT INTO `gee_v2mroute` VALUES (74, '添加操作系统验证', 'addosgroupAuth', '/product/addosgroupAuth', 8, 0, '0', 0, 0, '');
INSERT INTO `gee_v2mroute` VALUES (75, '删除操作系统', 'delosgroup', '/product/delosgroup', 8, 0, '0', 0, 0, '');
INSERT INTO `gee_v2mroute` VALUES (76, '添加操作系统版本', 'addostype', '/product/addostype', 8, 71, '0', 0, 0, '');
INSERT INTO `gee_v2mroute` VALUES (77, '添加操作系统验证', 'addostypeAuth', '/product/addostypeAuth', 8, 0, '0', 0, 0, '');
INSERT INTO `gee_v2mroute` VALUES (78, '删除操作系统版本', 'delostype', '/product/delostype', 8, 0, '0', 0, 0, '');
INSERT INTO `gee_v2mroute` VALUES (80, '编辑物理服务器信息', 'editserver', '/service/editserver', 1, 0, '0', 0, 0, '');
INSERT INTO `gee_v2mroute` VALUES (81, '实名认证', 'realverify', '/user/realverify', 16, 16, '1', 0, 0, '');
INSERT INTO `gee_v2mroute` VALUES (82, '通过认证', 'passreal', '/user/passreal', 16, 0, '0', 0, 0, '');
INSERT INTO `gee_v2mroute` VALUES (83, '拒绝认证', 'rejectreal', '/user/rejectreal', 16, 0, '0', 0, 0, '');
INSERT INTO `gee_v2mroute` VALUES (84, '企业认证', 'enterpriseverify', '/user/enterpriseverify', 16, 16, '1', 0, 0, '');
INSERT INTO `gee_v2mroute` VALUES (85, '通过认证', 'passenterprise', '/user/passenterprise', 16, 0, '0', 0, 0, NULL);
INSERT INTO `gee_v2mroute` VALUES (86, '拒绝认证', 'rejectenterprise', '/user/rejectenterprise', 16, 0, '0', 0, 0, NULL);
INSERT INTO `gee_v2mroute` VALUES (9, '云主机产品管理', 'vps', '/service/vps', 1, 1, '1', 0, 0, '');
INSERT INTO `gee_v2mroute` VALUES (87, '通过发票申请', 'passinvoice', '/finance/passinvoice', 19, 0, '0', 0, 0, NULL);
INSERT INTO `gee_v2mroute` VALUES (88, '拒绝发票申请', 'nopassinvoice', '/finance/nopassinvoice', 19, 0, '0', 0, 0, NULL);
INSERT INTO `gee_v2mroute` VALUES (89, '编辑发票信息', 'editinvoice', '/finance/editinvoice', 19, 0, '0', 0, 0, NULL);
INSERT INTO `gee_v2mroute` VALUES (91, '续费VPS', 'renewvps', '/service/renewvps', 1, 0, '0', 0, 0, NULL);
INSERT INTO `gee_v2mroute` VALUES (92, 'vps控制面板', 'vpsmanager', '/service/vpsmanager', 1, 0, '0', 0, 0, NULL);
INSERT INTO `gee_v2mroute` VALUES (97, '提交域名价格', 'adddomainpriceauth', '/service/adddomainpriceauth', 1, 0, '0', 0, 0, NULL);
INSERT INTO `gee_v2mroute` VALUES (95, '域名价格', 'domainprice', '/service/domainprice', 1, 1, '0', 0, 0, NULL);
INSERT INTO `gee_v2mroute` VALUES (96, '信息模板', 'domaintempaudit', '/service/domaintempaudit', 1, 1, '0', 0, 0, NULL);
INSERT INTO `gee_v2mroute` VALUES (98, '域名接口测试', 'domainchecked', '/service/domainchecked', 1, 0, '0', 0, 0, NULL);
INSERT INTO `gee_v2mroute` VALUES (99, '云平台', 'cloudservice', '/cloudservice', 0, 0, '1', 0, 0, 'iconyunpingtaianquan');
INSERT INTO `gee_v2mroute` VALUES (100, '系统升级', 'update', '/cloudservice/update', 99, 0, '1', 0, 0, '');
INSERT INTO `gee_v2mroute` VALUES (101, '注册站点', 'regsite', '/cloudservice/regsite', 99, 0, '0', 0, 0, NULL);
INSERT INTO `gee_v2mroute` VALUES (102, '云服务诊断', 'diagnose', '/cloudservice/diagnose', 99, 0, '0', 0, 0, NULL);
INSERT INTO `gee_v2mroute` VALUES (103, '信息模板详情', 'domaintempauditdetail', '/service/domaintempauditdetail', 1, 1, '0', 0, 0, NULL);
INSERT INTO `gee_v2mroute` VALUES (104, '订单详情', 'detailsinfo', '/finance/detailsinfo', 19, 25, '0', 0, 0, NULL);
INSERT INTO `gee_v2mroute` VALUES (105, '短信API设置', 'smsapi', '/system/smsapi', 999, 0, '1', 1557194766, 1557194766, '');
INSERT INTO `gee_v2mroute` VALUES (106, '短信API设置验证', 'smsapiAuth', '/system/smsapiAuth', 999, 0, '0', 0, 0, NULL);
INSERT INTO `gee_v2mroute` VALUES (107, '新闻', 'news', '/news', 0, 0, '1', 0, 0, 'iconxinwenguanli');
INSERT INTO `gee_v2mroute` VALUES (108, '新闻列表', 'list', '/news/list', 107, 0, '1', 0, 0, NULL);
INSERT INTO `gee_v2mroute` VALUES (109, '新闻分类', 'class', '/news/class', 107, 0, '1', 0, 0, NULL);
INSERT INTO `gee_v2mroute` VALUES (110, '新闻设置', 'addnews', '/news/addnews', 107, 108, '0', 0, 0, NULL);
INSERT INTO `gee_v2mroute` VALUES (111, '新闻设置验证', 'addnewsauth', '/news/addnewsauth', 107, 0, '0', 0, 0, NULL);
INSERT INTO `gee_v2mroute` VALUES (112, '新闻分类设置', 'addclass', '/news/addclass', 107, 109, '0', 0, 0, NULL);
INSERT INTO `gee_v2mroute` VALUES (113, '新闻分类设置验证', 'addclassauth', '/news/addclassauth', 107, 0, '0', 0, 0, NULL);
INSERT INTO `gee_v2mroute` VALUES (114, '用户充值', 'recharge', '/user/recharge', 16, 0, '0', 0, 0, NULL);
INSERT INTO `gee_v2mroute` VALUES (115, '新闻删除', 'delnews', '/news/delnews', 107, 0, '0', 0, 0, NULL);
INSERT INTO `gee_v2mroute` VALUES (116, '新闻分类删除', 'delclass', '/news/delclass', 107, 0, '0', 0, 0, NULL);
INSERT INTO `gee_v2mroute` VALUES (117, '前台模板设置', 'model', '/system/model', 999, 0, '1', 0, 0, NULL);
INSERT INTO `gee_v2mroute` VALUES (118, '前台模板应用', 'usemodel', '/system/usemodel', 999, 0, '0', 0, 0, NULL);
INSERT INTO `gee_v2mroute` VALUES (119, '前台模板卸载', 'uninstallmodel', '/system/uninstallmodel', 999, 0, '0', 0, 0, NULL);
INSERT INTO `gee_v2mroute` VALUES (120, '域名控制面板', 'todomainmanager', '/service/todomainmanager', 1, 0, '0', 0, 0, NULL);
INSERT INTO `gee_v2mroute` VALUES (121, '新增产品', 'add', '/product/add', 8, 43, '0', 0, 0, NULL);
INSERT INTO `gee_v2mroute` VALUES (122, '新增产品组', 'addgroup', '/product/addgroup', 8, 43, '0', 0, 0, NULL);
INSERT INTO `gee_v2mroute` VALUES (122, '新增产品类型', 'addtype', '/product/addtype', 8, 46, '0', 0, 0, NULL);
INSERT INTO `gee_v2mroute` VALUES (123, '新增用户', 'useradd', '/user/useradd', 16, 17, '0', 0, 0, NULL);
INSERT INTO `gee_v2mroute` VALUES (124, '新增用户组', 'groupadd', '/user/groupadd', 16, 18, '0', 0, 0, NULL);
INSERT INTO `gee_v2mroute` VALUES (125, '添加员工', 'staffadd', '/staff/staffadd', 28, 28, '0', 0, 0, NULL);
INSERT INTO `gee_v2mroute` VALUES (126, '添加员工分组', 'groupadd', '/staff/groupadd', 28, 29, '0', 0, 0, NULL);
INSERT INTO `gee_v2mroute` VALUES (127, '新增消息模板', 'addtemplate', '/system/addtemplate', 999, 39, '0', 0, 0, NULL);
INSERT INTO `gee_v2mroute` VALUES (128, '运营', 'operate', '/operate', 0, 0, '1', 0, 0, 'icondiannao');
INSERT INTO `gee_v2mroute` VALUES (129, '轮播图管理', 'banner', '/operate/banner', 128, 128, '1', 0, 0, NULL);
INSERT INTO `gee_v2mroute` VALUES (130, '轮播图添加', 'banneradd', '/operate/banneradd', 128, 129, '0', 0, 0, NULL);
INSERT INTO `gee_v2mroute` VALUES (131, '轮播图删除', 'bannerdel', '/operate/bannerdel', 128, 129, '0', 0, 0, NULL);
INSERT INTO `gee_v2mroute` VALUES (132, '轮播图添加验证', 'banneraddauth', '/operate/banneraddauth', 128, 129, '0', 0, 0, NULL);
INSERT INTO `gee_v2mroute` VALUES (133, '高防CDN管理', 'cdn', '/service/cdn', 1, 1, '1', 1557194766, 1557194766, '');
INSERT INTO `gee_v2mroute` VALUES (134, '高防CDN控制面板', 'cdnmanager', '/service/cdnmanager', 1, 1, '0', 0, 0, NULL);
INSERT INTO `gee_v2mroute` VALUES (135, '高防CDN续费', 'renewcdn', '/service/renewcdn', 1, 1, '0', 0, 0, NULL);
INSERT INTO `gee_v2mroute` VALUES (136, '虚拟主机控制面板', 'hostmanager', '/service/hostmanager', 1, 1, '0', 0, 0, NULL);
INSERT INTO `gee_v2mroute` VALUES (137, '虚拟主机续费', 'renewhost', '/service/renewhost', 1, 1, '0', 0, 0, NULL);
INSERT INTO `gee_v2mroute` VALUES (138, '消息群发', 'subMessaging', '/system/subMessaging', 999, 0, '0', 0, 0, NULL);
INSERT INTO `gee_v2mroute` VALUES (139, '产品分类状态管理', 'changeClassStatus', '/product/changeClassStatus', 8, 0, '0', 0, 0, NULL);
INSERT INTO `gee_v2mroute` VALUES (140, '智能建站管理', 'smartsite', '/service/smartsite', 1, 1, '1', 1557194766, 1557194766, '');
INSERT INTO `gee_v2mroute` VALUES (141, '智能建站控制面板', 'managersmartsite', '/service/managersmartsite', 1, 1, '0', 0, 0, NULL);
INSERT INTO `gee_v2mroute` VALUES (142, '智能建站续费', 'renewsmartsite', '/service/renewsmartsite', 1, 1, '0', 0, 0, NULL);
INSERT INTO `gee_v2mroute` VALUES (143, '代金券管理', 'coupon', '/finance/coupon', 19, 19, '1', 0, 0, NULL);
INSERT INTO `gee_v2mroute` VALUES (144, '代金券创建', 'couponadd', '/finance/couponadd', 19, 143, '0', 0, 0, NULL);
INSERT INTO `gee_v2mroute` VALUES (145, '代金券删除', 'coupondel', '/finance/coupondel', 19, 143, '0', 0, 0, NULL);
INSERT INTO `gee_v2mroute` VALUES (146, '代金券赋予', 'coupontouser', '/finance/coupontouser', 19, 143, '0', 0, 0, NULL);

-- ----------------------------
-- Table structure for gee_webroute
-- ----------------------------
DROP TABLE IF EXISTS `gee_webroute`;
CREATE TABLE `gee_webroute`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '路由名称',
  `name` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '路由路径',
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '路由标识',
  `f_id` int(11) NOT NULL COMMENT '上级ID',
  `s_id` int(11) NULL DEFAULT 0 COMMENT '从属ID',
  `status` enum('0','1') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '路由状态 0:禁用 1:启用',
  `icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '路由图标',
  `is_show` enum('0','1') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '是否展示到列表中 0:不展示 1:展示',
  `is_customize` enum('0','1') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '是否为自定义导航展示 0:不是 1:是',
  `is_pro` int(11) NULL DEFAULT 0 COMMENT '所属产品类型',
  `is_plug` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所属插件',
  `remark` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '备注',
  `create_time` int(11) NOT NULL COMMENT '创建时间',
  `update_time` int(11) NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 331 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gee_webroute
-- ----------------------------
INSERT INTO `gee_webroute` VALUES (1, '基本信息', '/basic', 'basic', 0, NULL, '1', NULL, '1', '0', 0, NULL, NULL, 1557194766, 1557194766);
INSERT INTO `gee_webroute` VALUES (2, '账号信息', '/basic/info', 'info', 1, NULL, '1', NULL, '1', '0', 0, NULL, NULL, 1557194766, 1557194766);
INSERT INTO `gee_webroute` VALUES (3, '安全设置', '/basic/safety', 'safety', 1, NULL, '1', NULL, '1', '0', 0, NULL, NULL, 1557194766, 1557194766);
INSERT INTO `gee_webroute` VALUES (4, '实名认证', '/basic/auth', 'auth', 1, NULL, '1', NULL, '1', '0', 0, NULL, NULL, 1557194766, 1557194766);
INSERT INTO `gee_webroute` VALUES (6, '云虚拟主机', '/host', 'host', 0, NULL, '0', 'icon-cvh', '0', '0', 0, NULL, NULL, 1557194766, 1557194766);
INSERT INTO `gee_webroute` VALUES (7, '云主机VPS', '/vps', 'vps', 0, NULL, '1', 'icon-ecs', '1', '0', 1, NULL, NULL, 1557194766, 1560335621);
INSERT INTO `gee_webroute` VALUES (8, '云主机', '/cloudserver', 'cloudserver', 0, NULL, '1', 'icon-ecs', '1', '0', 1, NULL, NULL, 1557194766, 1557194766);
INSERT INTO `gee_webroute` VALUES (9, '域名管理', '/domain', 'domain', 0, NULL, '1', 'icon-cdm', '1', '0', 1, NULL, NULL, 1557194766, 1557194766);
INSERT INTO `gee_webroute` VALUES (10, '云解析', '/analysis', 'analysis', 0, NULL, '1', 'icon-dns', '0', '0', 1, NULL, NULL, 1557194766, 1557194766);
INSERT INTO `gee_webroute` VALUES (11, '工单管理', '/ticket', 'ticket', 0, NULL, '1', NULL, '1', '0', 0, NULL, NULL, 1557194766, 1557194766);
INSERT INTO `gee_webroute` VALUES (12, '工单列表', '/ticket/list', 'list', 11, NULL, '1', NULL, '1', '0', 0, NULL, NULL, 1557194766, 1557194766);
INSERT INTO `gee_webroute` VALUES (13, '创建工单', '/ticket/add', 'add', 11, NULL, '1', NULL, '1', '0', 0, NULL, NULL, 1557194766, 1557194766);
INSERT INTO `gee_webroute` VALUES (14, '消息管理', '/message', 'message', 0, NULL, '1', NULL, '1', '0', 0, NULL, NULL, 1557194766, 1557194766);
INSERT INTO `gee_webroute` VALUES (132, '财务总览', '/billing/overview', 'overview', 131, NULL, '1', NULL, '1', '0', 0, NULL, NULL, 1560335597, 1560335597);
INSERT INTO `gee_webroute` VALUES (16, '安全认证', '/safetyauth', 'safetyauth', 0, NULL, '1', NULL, '1', '0', 0, NULL, NULL, 1557194766, 1557194766);
INSERT INTO `gee_webroute` VALUES (136, '收支明细', '/billing/dealrecord', 'dealrecord', 131, NULL, '1', NULL, '1', '0', 0, NULL, NULL, 1560335597, 1560335597);
INSERT INTO `gee_webroute` VALUES (134, '消费总览', '/consumption/overview', 'overview', 133, NULL, '1', NULL, '1', '0', 0, NULL, NULL, 1560335597, 1560335597);
INSERT INTO `gee_webroute` VALUES (135, '账单明细', '/consumption/list', 'list', 133, NULL, '1', NULL, '1', '0', 0, NULL, NULL, 1560335597, 1560335597);
INSERT INTO `gee_webroute` VALUES (133, '消费中心', '/billing/consumption', 'consumption', 131, NULL, '1', NULL, '1', '0', 0, NULL, NULL, 1560335597, 1560335597);
INSERT INTO `gee_webroute` VALUES (131, '财务中心', '/billing', 'billing', 0, NULL, '1', NULL, '1', '0', 0, NULL, NULL, 1560335597, 1560335597);
INSERT INTO `gee_webroute` VALUES (130, '支付状态', '/buy/paystatus', 'paystatus', 127, 127, '1', '', '0', '0', 0, NULL, NULL, 1560335597, 1560335597);
INSERT INTO `gee_webroute` VALUES (129, '线上支付', '/buy/onlinepay', 'onlinepay', 127, 127, '1', '', '0', '0', 0, NULL, NULL, 1560335597, 1560335597);
INSERT INTO `gee_webroute` VALUES (128, '确认订单', '/buy/confirm', 'confirm', 127, 127, '1', NULL, '0', '0', 0, NULL, NULL, 1560335597, 1560335597);
INSERT INTO `gee_webroute` VALUES (127, '购买产品', '/buy', 'buy', 0, NULL, '1', NULL, '0', '0', 0, NULL, NULL, 1560335597, 1560335597);
INSERT INTO `gee_webroute` VALUES (126, '实例', '/vps/index', 'index', 7, NULL, '1', NULL, '1', '0', 0, NULL, 'VPS实例列表', 1559807152, 1560335597);
INSERT INTO `gee_webroute` VALUES (138, '发票管理', '/billing/invoice', 'invoice', 131, NULL, '1', NULL, '1', '0', 0, NULL, NULL, 1560335597, 1560335597);
INSERT INTO `gee_webroute` VALUES (139, '发票列表', '/invoice/list', 'list', 138, 138, '1', NULL, '1', '0', 0, NULL, NULL, 1560335597, 1560335597);
INSERT INTO `gee_webroute` VALUES (140, '发票信息管理', '/invoice/template', 'template', 138, 138, '1', NULL, '1', '0', 0, NULL, NULL, 1560335597, 1560335597);
INSERT INTO `gee_webroute` VALUES (141, '寄送地址', '/invoice/addresslist', 'addresslist', 138, 138, '1', NULL, '1', '0', 0, NULL, NULL, 1560335597, 1560335597);
INSERT INTO `gee_webroute` VALUES (142, '订单管理', '/billing/order', 'order', 131, NULL, '1', NULL, '1', '0', 0, NULL, NULL, 1560335597, 1560335597);
INSERT INTO `gee_webroute` VALUES (143, '续费管理', '/billing/renew', 'renew', 131, NULL, '1', NULL, '0', '0', 0, NULL, NULL, 1560335597, 1560335597);
INSERT INTO `gee_webroute` VALUES (144, '退订管理', '/billing/refund', 'refund', 131, NULL, '1', NULL, '0', '0', 0, NULL, NULL, 1560335597, 1560335597);
INSERT INTO `gee_webroute` VALUES (145, '可退款订单', '/refund/list', 'list', 144, NULL, '1', NULL, '1', '0', 0, NULL, NULL, 1560335597, 1560335597);
INSERT INTO `gee_webroute` VALUES (146, '退订记录', '/refund/record', 'record', 144, NULL, '1', NULL, '1', '0', 0, NULL, NULL, 1560335597, 1560335597);
INSERT INTO `gee_webroute` VALUES (147, '合同管理', '/billing/contract', 'contract', 131, NULL, '1', NULL, '0', '0', 0, NULL, NULL, 1560335597, 1560335597);
INSERT INTO `gee_webroute` VALUES (148, '资源账单', '/consumption/resource', 'resource', 133, NULL, '1', NULL, '0', '0', 0, NULL, NULL, 1560335597, 1560335597);
INSERT INTO `gee_webroute` VALUES (182, '账号信息', '/iam', 'iam', 0, NULL, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (150, '充值', '/billing/recharge', 'recharge', 131, 132, '1', NULL, '0', '0', 0, NULL, NULL, 1560335597, 1560335597);
INSERT INTO `gee_webroute` VALUES (151, '提现', '/billing/withdraw', 'withdraw', 131, 132, '1', NULL, '0', '0', 0, NULL, NULL, 1560335597, 1560335597);
INSERT INTO `gee_webroute` VALUES (152, '购买验证', '/buy/pay', 'pay', 127, NULL, '1', NULL, '0', '0', 0, NULL, NULL, 1560335597, 1560335597);
INSERT INTO `gee_webroute` VALUES (153, '工单详情', '/ticket/details', 'details', 11, 12, '1', NULL, '0', '0', 0, NULL, NULL, 1560335597, 1560335597);
INSERT INTO `gee_webroute` VALUES (154, '创建工单验证', '/ticket/addauth', 'addauth', 11, NULL, '1', NULL, '0', '0', 0, NULL, NULL, 1560335597, 1560335597);
INSERT INTO `gee_webroute` VALUES (155, '工单回复', '/ticket/reply', 'reply', 11, NULL, '1', NULL, '0', '0', 0, NULL, NULL, 1560335597, 1560335597);
INSERT INTO `gee_webroute` VALUES (156, '工单确认', '/ticket/confirm', 'confirm', 11, NULL, '1', NULL, '0', '0', 0, NULL, NULL, 1560335597, 1560335597);
INSERT INTO `gee_webroute` VALUES (157, '撤销工单', '/ticket/cancel', 'cancel', 11, NULL, '1', NULL, '0', '0', 0, NULL, NULL, 1560335597, 1560335597);
INSERT INTO `gee_webroute` VALUES (158, '删除工单', '/ticket/del', 'del', 11, NULL, '1', NULL, '0', '0', 0, NULL, NULL, 1560335597, 1560335597);
INSERT INTO `gee_webroute` VALUES (159, '充值验证', '/billing/rechargeauth', 'rechargeauth', 131, NULL, '1', NULL, '0', '0', 0, NULL, NULL, 1560335597, 1560335597);
INSERT INTO `gee_webroute` VALUES (160, '接口API', '/api', 'api', 0, NULL, '1', NULL, '0', '0', 0, NULL, NULL, 1560335597, 1560335597);
INSERT INTO `gee_webroute` VALUES (161, '支付宝同步', '/api/return_url', 'return_url', 160, NULL, '1', NULL, '0', '0', 0, NULL, NULL, 1560335597, 1560335597);
INSERT INTO `gee_webroute` VALUES (162, '支付宝异步', '/api/notify_url', 'notify_url', 160, NULL, '1', NULL, '0', '0', 0, NULL, NULL, 1560335597, 1560335597);
INSERT INTO `gee_webroute` VALUES (163, '账单详情', '/billing/dealrecorddetails', 'dealrecorddetails', 131, 136, '1', NULL, '0', '0', 0, NULL, NULL, 1560335597, 1560335597);
INSERT INTO `gee_webroute` VALUES (166, '服务器租用', '/server', 'server', 0, NULL, '1', 'icon-dcc', '1', '0', 1, NULL, NULL, 1560335597, 1560335597);
INSERT INTO `gee_webroute` VALUES (165, '取消订单', '/billing/cancelorder', 'cancelorder', 131, NULL, '1', NULL, '0', '0', 0, NULL, NULL, 1560335597, 1560335597);
INSERT INTO `gee_webroute` VALUES (167, '租用物理服务器', '/server/add', 'add', 166, 168, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (168, '服务器租用管理', '/server/index', 'index', 166, NULL, '1', NULL, '1', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (169, '获取物理服务器产品', '/server/getAddedItems', 'getAddedItems', 166, NULL, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (170, '获取价格', '/server/getPrice', 'getPrice', 166, NULL, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (171, '获取物理服务器增值服务', '/server/getAdded', 'getAdded', 166, NULL, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (172, '租用物理服务器验证', '/server/addAuth', 'addAuth', 166, NULL, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (173, '获取物理服务器密码', '/server/getpass', 'getpass', 166, NULL, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (174, '重装操作系统', '/server/resetos', 'resetos', 166, NULL, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (176, '删除订单', '/billing/delorder', 'delorder', 131, NULL, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (177, '获取操作系统版本', '/server/getOstypes', 'getOstypes', 166, NULL, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (178, '订单详情', '/billing/orderdetails', 'orderdetails', 131, 142, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (179, '物理服务器详情', '/server/detail', 'detail', 166, 168, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (180, '编辑服务器信息', '/server/edits', 'edits', 166, 168, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (181, '获取历史消费趋势', '/consumption/gethistory', 'gethistory', 133, NULL, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (183, '用户中心', '/iam/overview', 'overview', 182, 182, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (184, '安全认证', '/iam/accesslist', 'accesslist', 182, 182, '1', NULL, '1', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (185, '个人认证', '/iam/cpersonal', 'cpersonal', 182, 182, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (186, '企业认证', '/iam/ccompany', 'ccompany', 182, 182, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (187, '账号信息编辑', '/iam/baseinfoedit', 'baseinfoedit', 182, 182, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (189, '提交实名认证信息', '/iam/subauth', 'subauth', 182, NULL, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (190, '修改基本信息', '/iam/baseinfoedit', 'baseinfoedit', 182, 182, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (191, '提交企业认证信息', '/iam/subcompany', 'subcompany', 182, NULL, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (192, '提交发票信息', '/invoice/subtemp', 'subtemp', 138, NULL, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (193, '提交发票地址', '/invoice/subaddress', 'subaddress', 138, NULL, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (194, '删除发票地址', '/invoice/deladdress', 'deladdress', 138, NULL, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (195, '发票申请', '/invoice/applyinvoice', 'applyinvoice', 138, 138, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (196, '提交发票申请', '/invoice/subapplyinvoice', 'subapplyinvoice', 138, NULL, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (197, '取消发票申请', '/invoice/cancelInvoice', 'cancelInvoice', 138, NULL, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (198, '域名概览', '/domain/index', 'index', 9, 200, '1', NULL, '1', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (199, '域名搜索', '/domain/search', 'search', 9, 200, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (200, '域名管理', '/domain/manage', 'manage', 9, NULL, '1', NULL, '1', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (201, '域名价格', '/domain/price', 'price', 9, NULL, '1', NULL, '1', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (202, '信息模板', '/domain/model', 'model', 9, NULL, '1', NULL, '1', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (203, '域名搜索接口', '/domain/searchdomain', 'searchdomain', 9, NULL, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (204, '域名查询接口', '/domain/searchdomaininfo', 'searchdomaininfo', 9, NULL, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (205, '获取域名清单价格', '/domain/getDomainListPrice', 'getDomainListPrice', 9, NULL, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (206, '创建域名订单', '/domain/add', 'add', 9, 200, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (207, '创建联系人信息验证', '/domain/modelAuth', 'modelAuth', 9, NULL, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (208, '删除联系人信息', '/domain/modeldel', 'modeldel', 9, NULL, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (209, '创建域名验证', '/domain/addAuth', 'addAuth', 9, NULL, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (210, '域名续费', '/domain/recharge', 'recharge', 9, 200, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (211, '域名详情', '/domain/detail', 'detail', 9, 200, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (212, '前往域名控制台', '/domain/tomanager', 'tomanager', 9, NULL, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (213, '更变域名隐私保护', '/domain/whoisProtect', 'whoisProtect', 9, NULL, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (214, '更变域名所有者', '/domain/transform', 'transform', 9, 200, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (215, '更变域名所有者验证', '/domain/transformauth', 'transformauth', 9, NULL, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (216, '更变域名DNS', '/domain/changens', 'changens', 9, 200, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (217, '更变域名DNS验证', '/domain/changensAuth', 'changensAuth', 9, NULL, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (218, '生成域名证书', '/domain/certification', 'certification', 9, NULL, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (219, '新增AKSK', '/addaccessAuth', 'addaccessAuth', 0, NULL, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (220, '新增AKSK', '/iam/addaccessAuth', 'addaccessAuth', 182, NULL, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (221, '修改AKSK说明', '/iam/editaccessIntro', 'editaccessIntro', 182, NULL, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (222, '删除AKSK', '/iam/delaccess', 'delaccess', 182, NULL, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (223, '主机服务', '/cloudserver/clientarea', 'clientarea', 8, 224, '1', NULL, '0', '1', 1, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (224, '实例列表', '/cloudserver/list', 'list', 8, NULL, '1', NULL, '1', '1', 1, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (232, 'VPS关闭', '/vps/off', 'off', 7, 0, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (226, '创建VPS', '/vps/add', 'add', 7, 224, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (227, '创建VPS验证', '/vps/addAuth', 'addAuth', 7, 0, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (228, '更新VPS', '/vps/up', 'up', 7, 0, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (229, '释放VPS', '/vps/del', 'del', 7, 0, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (230, '续费VPS', '/vps/renew', 'renew', 7, 224, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (231, 'VPS开启', '/vps/on', 'on', 7, 0, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (233, '修改VPS密码', '/vps/changepass', 'changepass', 7, 0, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (234, '获取VPS产品信息', '/vps/getProItem', 'getProItem', 7, 0, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (235, '获取VPS价格', '/vps/getPrice', 'getPrice', 7, 0, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (236, 'VPS控制台', '/vps/manager', 'manager', 7, 0, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (237, '创建实例', '/cloudserver/create', 'create', 8, 224, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (238, '获取价格', '/cloudserver/getprice', 'getprice', 8, 0, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (239, '获取配置列表', '/cloudserver/getprolist', 'getprolist', 8, 0, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (240, '获取操作系统', '/cloudserver/getostype', 'getostype', 8, 0, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (241, '获取产品价格', '/cloudserver/getPrice', 'getPrice', 8, 0, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (242, '创建云主机订单', '/cloudserver/addauth', 'addauth', 8, 0, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (243, '获取监控信息', '/cloudserver/getmontoring', 'getmontoring', 8, 0, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (244, '设置云主机电源状态', '/cloudserver/virtual_power', 'virtual_power', 8, 0, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (245, '链接云主机vnc', '/cloudserver/tovnc', 'tovnc', 8, 0, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (246, '重装操作系统', '/cloudserver/toresetos', 'toresetos', 8, 0, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (247, '创建快照', '/cloudserver/createsnapshot', 'createsnapshot', 8, 0, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (248, '恢复快照', '/cloudserver/setsnapshot', 'setsnapshot', 8, 0, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (249, '删除快照', '/cloudserver/delsnapshot', 'delsnapshot', 8, 0, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (250, '创建备份', '/cloudserver/createbackups', 'createbackups', 8, 0, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (251, '恢复备份', '/cloudserver/setbackups', 'setbackups', 8, 0, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (252, '删除备份', '/cloudserver/delbackups', 'delbackups', 8, 0, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (253, '修改密码', '/cloudserver/changepass', 'changepass', 8, 0, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (254, '登录', '/login', 'login', 0, 0, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (255, '获取注册验证码', '/login/getregcode', 'getregcode', 254, 0, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (256, '获取忘记密码验证码', '/login/getretcode', 'getretcode', 254, 0, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (257, '获取修改手机验证码', '/iam/sendrstcode', 'sendrstcode', 182, 0, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (258, '旧手机号确认', '/iam/changeoldphone', 'changeoldphone', 182, 0, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (259, '新手机号验证', '/iam/changenewphone', 'changenewphone', 182, 0, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (260, '获取重置vps密码短信验证码', '/vps/getresetcode', 'getresetcode', 7, 0, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (261, '云虚拟主机', '/host', 'host', 0, 0, '1', 'icon-ecs', '1', '0', 1, NULL, NULL, 1555555555, 1555555555);
INSERT INTO `gee_webroute` VALUES (262, '云虚拟主机管理', '/host/index', 'index', 261, 0, '1', NULL, '1', '0', 0, NULL, NULL, 155555555, 15555555);
INSERT INTO `gee_webroute` VALUES (263, '创建云虚拟主机站点', '/host/add', 'add', 261, 261, '1', NULL, '1', '0', 0, NULL, NULL, 12222222, 1222222222);
INSERT INTO `gee_webroute` VALUES (264, '创建云虚拟主机验证', '/host/addAuth', 'addAuth', 261, 0, '1', NULL, '0', '0', 0, NULL, NULL, 12222222, 1222222222);
INSERT INTO `gee_webroute` VALUES (265, '获取云虚拟主机的价格', '/host/getprice', 'getprice', 261, 0, '1', NULL, '0', '0', 0, NULL, NULL, 1222222222, 1555555555);
INSERT INTO `gee_webroute` VALUES (266, '云虚拟主机控制器', '/host/manager', 'manager', 261, 0, '1', NULL, '0', '0', 0, NULL, NULL, 155555, 555555);
INSERT INTO `gee_webroute` VALUES (267, '云虚拟主机修改密码', '/host/changepass', 'changepass', 261, 0, '1', NULL, '0', '0', 0, NULL, NULL, 155555555, 15555555);
INSERT INTO `gee_webroute` VALUES (268, '云解析', '/dns', 'dns', 0, 0, '1', 'icon-ecs', '1', '0', 1, NULL, NULL, 18888888, 18888888);
INSERT INTO `gee_webroute` VALUES (269, '云解析管理', '/dns/index', 'index', 268, 0, '1', NULL, '1', '0', 0, NULL, NULL, 888888, 8888);
INSERT INTO `gee_webroute` VALUES (270, '添加域名', '/dns/add_dns', 'add_dns', 268, 268, '1', NULL, '0', '0', 0, NULL, NULL, 2222, 222);
INSERT INTO `gee_webroute` VALUES (271, '更新状态', '/dns/update_status', 'update_status', 268, 268, '1', NULL, '0', '0', 0, NULL, NULL, 22222, 2222);
INSERT INTO `gee_webroute` VALUES (272, '解析记录', '/dns/recordlist', 'recordlist', 268, 268, '1', NULL, '0', '0', 0, NULL, NULL, 11111111, 11111111);
INSERT INTO `gee_webroute` VALUES (273, '解析展示', '/dns/record', 'record', 268, 268, '1', NULL, '0', '0', 0, NULL, NULL, 2111111, 1111111);
INSERT INTO `gee_webroute` VALUES (274, '解析添加', '/dns/record_add', 'record_add', 268, 268, '1', NULL, '0', '0', 0, NULL, NULL, 11111, 1111);
INSERT INTO `gee_webroute` VALUES (275, '首页', '/home', 'home', 0, 0, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (276, 'VPS产品', '/home/h_vps', 'h_vps', 275, 0, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (278, '生态合作', '/home/h_agent', 'h_agent', 275, 0, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (279, '云服务器', '/home/h_ecs', 'h_ecs', 275, 0, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (280, '内容分发网络CDN', '/home/h_cdn', 'h_cdn', 275, 0, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (281, '关于我们', '/home/h_about', 'h_about', 275, 0, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (282, '域名服务', '/home/h_domain', 'h_domain', 275, 0, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (283, '虚拟主机', '/home/h_host', 'h_host', 275, 0, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (284, '专属服务器', '/home/h_idc', 'h_idc', 275, 0, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (285, 'SSL证书服务', '/home/h_ssl', 'h_ssl', 275, 0, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (286, '促销活动', '/home/h_activity', 'h_activity', 275, 0, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (288, '首页', '/home/h_index', 'h_index', 275, 0, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (290, '代理商管理', '/agent', 'agent', 0, 0, '1', NULL, '1', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (291, '代理商信息', '/agent/index', 'index', 290, 290, '1', NULL, '1', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (292, '客户管理', '/agent/client', 'client', 290, 290, '1', NULL, '1', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (293, '编辑客户', '/agent/clientauth', 'clientauth', 290, 290, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (294, '客户资源', '/agent/resource', 'resource', 290, 290, '1', NULL, '1', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (295, '绑定代理商', '/agent/bind', 'bind', 290, 0, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (296, '绑定代理商验证', '/agent/bindauth', 'bindauth', 290, 0, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (297, '解析编辑', '/dns/record_edit', 'record_edit', 268, 268, '1', NULL, '0', '0', 0, NULL, NULL, 222222, 222222);
INSERT INTO `gee_webroute` VALUES (298, '解析记录删除', '/dns/record_del', 'record_del', 268, 268, '1', NULL, '0', '0', 0, NULL, NULL, 22222222, 2222222);
INSERT INTO `gee_webroute` VALUES (299, '获取代理商历史数据', '/agent/gethistory', 'gethistory', 290, 290, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (300, '高防CDN', '/cdn', 'cdn', 0, 0, '1', 'icon-ecs', '1', '0', 1, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (303, '创建高防CDN', '/cdn/add', 'add', 300, 302, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (302, '高防CDN管理', '/cdn/index', 'index', 300, 300, '1', NULL, '1', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (304, '创建高防CDN验证', '/cdn/addAuth', 'addAuth', 300, 0, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (305, '获取高防CDN价格', '/cdn/getprice', 'getprice', 300, 0, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (306, '高防CDN控制面板', '/cdn/manager', 'manager', 300, 0, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (307, '高防CDN修改密码', '/cdn/changepass', 'changepass', 300, 0, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (308, '获取虚拟主机密码', '/host/getpass', 'getpass', 261, 0, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (309, '获取高防CDN密码', '/cdn/getpass', 'getpass', 300, 0, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (310, '更新VPS列表信息', '/vps/updatelist', 'updatelist', 7, 0, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (311, '更新Server列表信息', '/server/updatelist', 'updatelist', 166, 0, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (312, '更新Host列表信息', '/host/updatelist', 'updatelist', 261, 0, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (313, '更新Dns列表信息', '/dns/updatelist', 'updatelist', 268, 0, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (314, '更新Cloudserver列表信息', '/cloudserver/updatelist', 'updatelist', 8, 0, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (315, '更新Cdn列表信息', '/cdn/updatelist', 'updatelist', 300, 0, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (316, '更新Domain列表信息', '/domain/updatelist', 'updatelist', 9, 0, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (317, '智能建站', '/smartsite', 'smartsite', 0, 0, '1', 'icon-ecs', '1', '0', 1, NULL, NULL, 1555555555, 1555555555);
INSERT INTO `gee_webroute` VALUES (318, '智能建站管理', '/smartsite/index', 'index', 317, 0, '1', NULL, '1', '0', 0, NULL, NULL, 155555555, 15555555);
INSERT INTO `gee_webroute` VALUES (319, '创建智能建站', '/smartsite/add', 'add', 317, 317, '1', NULL, '1', '0', 0, NULL, NULL, 12222222, 1222222222);
INSERT INTO `gee_webroute` VALUES (320, '创建智能建站验证', '/smartsite/addAuth', 'addAuth', 317, 0, '1', NULL, '0', '0', 0, NULL, NULL, 12222222, 1222222222);
INSERT INTO `gee_webroute` VALUES (321, '获取智能建站价格', '/smartsite/getprice', 'getprice', 317, 0, '1', NULL, '0', '0', 0, NULL, NULL, 1222222222, 1555555555);
INSERT INTO `gee_webroute` VALUES (323, '智能建站控制器', '/smartsite/manager', 'manager', 317, 0, '1', NULL, '0', '0', 0, NULL, NULL, 155555, 555555);
INSERT INTO `gee_webroute` VALUES (324, '智能建站修改密码', '/smartsite/changepass', 'changepass', 317, 0, '1', NULL, '0', '0', 0, NULL, NULL, 155555555, 15555555);
INSERT INTO `gee_webroute` VALUES (325, '智能建站获取密码', '/smartsite/getpass', 'getpass', 317, 0, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (326, '智能建站列表更新', '/smartsite/updatelist', 'updatelist', 317, 0, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (327, '代金券列表', '/billing/coupon', 'coupon', 131, NULL, '1', NULL, '1', '0', 0, NULL, NULL, 1560335597, 1560335597);
INSERT INTO `gee_webroute` VALUES (329, '获取新闻列表', '/home/getnews', 'getnews', 275, 0, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (330, '删除Host信息', '/host/del', 'del', 261, 0, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);

SET FOREIGN_KEY_CHECKS = 1;
