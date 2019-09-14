/*
Navicat MySQL Data Transfer

Source Server         : myDataBase
Source Server Version : 50519
Source Host           : localhost:3306
Source Database       : work_daily

Target Server Type    : MYSQL
Target Server Version : 50519
File Encoding         : 65001

Date: 2019-09-05 12:31:43
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for log
-- ----------------------------
DROP TABLE IF EXISTS `log`;
CREATE TABLE `log` (
  `id` varchar(32) NOT NULL,
  `project_id` varchar(32) NOT NULL,
  `level` char(1) NOT NULL COMMENT '重要等级 1-重要紧急 2-重要不紧急 3-紧急不重要 4-都不',
  `date` date NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `type` char(1) DEFAULT NULL COMMENT '类型 1-计划 2-突发 3-备忘 4-问题 5-总结 6-番茄钟 7-日结',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `status` char(1) DEFAULT NULL COMMENT '状态 1-完成 2-未完成 3-搁置',
  `use_time` double(4,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of log
-- ----------------------------
INSERT INTO `log` VALUES ('01ecc32a18556e4ff510403b96e51c5b', '111', '4', '2019-08-30', '水电费阿打发阿打发', '1', null, null, null, '2', null);
INSERT INTO `log` VALUES ('0d364ac75f5e93b2f08269b397617e9f', '111', '1', '2019-08-29', '123123', '1', '', null, null, '2', null);
INSERT INTO `log` VALUES ('2f77e7a83d0f04c28fba0fd51b951f84', '111', '4', '2019-08-30', '水电费阿打发阿打发', '1', null, null, null, '2', null);
INSERT INTO `log` VALUES ('3896baa136f7a560415085bda1772bd0', '111', '4', '2019-08-30', '水电费', '1', null, null, null, '2', null);
INSERT INTO `log` VALUES ('4198ada879b54a28d09bd0a86e8a6be4', '111', '4', '2019-08-30', '邓平收到罚单法大大', '1', '', null, null, '2', null);
INSERT INTO `log` VALUES ('52f0bf0d8e8b786f8e7064137108d87b', '', '4', '2019-08-30', '胜多负少的', '1', null, null, null, '2', null);
INSERT INTO `log` VALUES ('54604aaed4108ad3bb2c69e1b150b2b6', '2d280fc5a8f25ba1a7d6bc091e1f434c', '2', '2019-09-03', '交易开发60105、67009', '1', null, null, null, '2', null);
INSERT INTO `log` VALUES ('55e143ecd7589096c1ac93eb39f28b1b', '111', '3', '2019-08-30', '邓平', '3', '', null, null, '2', null);
INSERT INTO `log` VALUES ('824cb02864751a855c78d4fe1241bdab', '2d280fc5a8f25ba1a7d6bc091e1f434c', '3', '2019-09-02', '贵阳统一支付了解安排', '1', '', null, null, '2', null);
INSERT INTO `log` VALUES ('8c4c8253812359034299f2f8c12e7241', '2d280fc5a8f25ba1a7d6bc091e1f434c', '3', '2019-09-03', '日志管理系统', '1', '', '2019-09-04 11:56:10', null, '2', null);
INSERT INTO `log` VALUES ('d80f7d9f0bf42ece3feed473a674faa1', '', '4', '2019-08-30', '打发点', '1', null, null, null, '2', null);
INSERT INTO `log` VALUES ('df4a9b1fe7041d7ca0848df3574b3c78', '111', '4', '2019-08-30', '水电费阿打发阿打发', '1', null, null, null, '2', null);
INSERT INTO `log` VALUES ('e23f27a4126abf4237a8717af258a257', '2d280fc5a8f25ba1a7d6bc091e1f434c', '4', '2019-09-03', '', '7', null, null, null, '1', null);
INSERT INTO `log` VALUES ('e361164b019a2f3fd0ef0dbe6719fbae', '111', '4', '2019-08-30', '水电费阿打发阿打发', '1', null, null, null, '2', null);
INSERT INTO `log` VALUES ('e61cb50175c4d4c6566123694139f94c', '111', '4', '2019-08-30', '水电费阿打发', '1', null, null, null, '2', null);
INSERT INTO `log` VALUES ('fef83d78a165301a1aed52cfba125d68', '3860a8ea89fa25cf09106c12c51ba1e2', '4', '2019-09-05', '了解项目情况', '1', null, null, null, '2', null);
INSERT INTO `log` VALUES ('ff03fdc4838e895fa6f2272d1b1f0e28', '111', '3', '2019-08-30', '打发点', '1', '', '2019-08-30 14:13:47', '2019-08-27 14:13:58', '2', null);

-- ----------------------------
-- Table structure for log_detail
-- ----------------------------
DROP TABLE IF EXISTS `log_detail`;
CREATE TABLE `log_detail` (
  `id` varchar(32) NOT NULL,
  `log_id` varchar(32) NOT NULL,
  `content` varchar(255) DEFAULT NULL COMMENT '内容',
  `status` char(1) NOT NULL COMMENT '状态 1-完成 2-未完成',
  `seq` int(11) NOT NULL COMMENT '序号',
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `use_time` double(4,2) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of log_detail
-- ----------------------------
INSERT INTO `log_detail` VALUES ('0a0254becdf1a775586df005e45c793f', '8c4c8253812359034299f2f8c12e7241', '用户信息修改功能', '2', '15', null, null, null, null);
INSERT INTO `log_detail` VALUES ('0fd53f26b34124d711fcc4a7d23786bd', '8c4c8253812359034299f2f8c12e7241', '新增日志时，若为日结等时，自动状态为已完成', '2', '12', null, null, null, null);
INSERT INTO `log_detail` VALUES ('1b81169c7c0d3af03295b5c5a2cb7e93', 'e23f27a4126abf4237a8717af258a257', '交易开发了解 ，定制报文 60105 处理完成', '2', '3', null, null, null, null);
INSERT INTO `log_detail` VALUES ('2482647d71f2d6b99a8908472079ecdd', '8c4c8253812359034299f2f8c12e7241', '按钮改为右键设置，先备份，以待回退', '2', '3', null, null, null, null);
INSERT INTO `log_detail` VALUES ('48336ee24fad75a0c3e5a8a523f1316f', '8c4c8253812359034299f2f8c12e7241', '内嵌页滚动条设置', '2', '6', null, null, null, null);
INSERT INTO `log_detail` VALUES ('4937fb1219eab88ae51ba245809e1857', '8c4c8253812359034299f2f8c12e7241', '明细添加耗时、开始时间、结束时间', '2', '1', null, null, null, null);
INSERT INTO `log_detail` VALUES ('5b876b0801f957f2846e667a309bf172', '8c4c8253812359034299f2f8c12e7241', '明细 选中显示去除，顺序拖拉调整，完成样式调整', '1', '1', null, null, null, null);
INSERT INTO `log_detail` VALUES ('5c331a409213b3d7ab03d69d7582330a', '824cb02864751a855c78d4fe1241bdab', '了解总体设计', '1', '1', null, null, null, null);
INSERT INTO `log_detail` VALUES ('5e40677298d756ec20ddd4ba570782e2', '8c4c8253812359034299f2f8c12e7241', '项目管理 页面表格高度自适应', '2', '9', null, null, null, null);
INSERT INTO `log_detail` VALUES ('79a950d34945e1b81c98835507cb3f0b', '8c4c8253812359034299f2f8c12e7241', '角色登录功能', '2', '14', null, null, null, null);
INSERT INTO `log_detail` VALUES ('7b8d3fd0af202a67c8e05f968cfbc845', '8c4c8253812359034299f2f8c12e7241', '页面首页问题处理', '2', '7', null, null, null, null);
INSERT INTO `log_detail` VALUES ('7f4767fdda9292fe73c9f85c851f3449', '8c4c8253812359034299f2f8c12e7241', '明细 添加 开始时间，结束时间', '2', '11', null, null, null, null);
INSERT INTO `log_detail` VALUES ('843c9f85e5668cdf59e1c302eaaa8891', '824cb02864751a855c78d4fe1241bdab', '了解各个子系统具体的实现方式', '2', '3', null, null, null, null);
INSERT INTO `log_detail` VALUES ('8ce7e3528dbb1a068ba6f218d1db253c', 'fef83d78a165301a1aed52cfba125d68', '项目上线时间', '2', '1', null, null, null, null);
INSERT INTO `log_detail` VALUES ('a3364ccb6c99686702b4a35ead4e9c48', '8c4c8253812359034299f2f8c12e7241', '日志开始，结束时间用按钮的方式计算', '2', '5', null, null, null, null);
INSERT INTO `log_detail` VALUES ('ada82d073a1dab82f89024000e53a2f8', '8c4c8253812359034299f2f8c12e7241', '增加页面刷新功能', '2', '8', null, null, null, null);
INSERT INTO `log_detail` VALUES ('b3325399c9ec6d087f46276a9ed09d75', '824cb02864751a855c78d4fe1241bdab', '了解各个子系统通的运作流程', '2', '2', null, null, null, null);
INSERT INTO `log_detail` VALUES ('b3e7c1c879e9aa202b361170a975e0cd', 'e23f27a4126abf4237a8717af258a257', '日志管理系统 明细页switch按钮，及展示效果处理  3.5h', '2', '1', null, null, null, null);
INSERT INTO `log_detail` VALUES ('b50ece2669dfe73796dafdd4fe7eaf72', 'fef83d78a165301a1aed52cfba125d68', '工作内容', '2', '2', null, null, null, null);
INSERT INTO `log_detail` VALUES ('d1515e055370205a0fc0785abc321381', '8c4c8253812359034299f2f8c12e7241', '日志添加预计耗时列', '2', '10', null, null, null, null);
INSERT INTO `log_detail` VALUES ('d39f89ca9a80914e06cc3d422380ed93', '8c4c8253812359034299f2f8c12e7241', '开始时间、结束时间，耗时不可同时存在', '2', '13', null, null, null, null);
INSERT INTO `log_detail` VALUES ('ee904ac8373b27318edbb9e59606eb6d', '8c4c8253812359034299f2f8c12e7241', '日志添加耗时列', '2', '4', null, null, null, null);
INSERT INTO `log_detail` VALUES ('ee9fd897ae9641abd826dcd80ab17dbd', '8c4c8253812359034299f2f8c12e7241', '日志 重要等级样式调整，完成样式调整', '1', '2', null, null, null, null);
INSERT INTO `log_detail` VALUES ('f67ad63bf48d6378fedeb34c701b86ab', 'e23f27a4126abf4237a8717af258a257', '日志管理 重要等级显示效果 1.5h', '2', '2', null, null, null, null);

-- ----------------------------
-- Table structure for project
-- ----------------------------
DROP TABLE IF EXISTS `project`;
CREATE TABLE `project` (
  `id` varchar(32) NOT NULL,
  `name` varchar(255) NOT NULL COMMENT '项目名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of project
-- ----------------------------
INSERT INTO `project` VALUES ('2d280fc5a8f25ba1a7d6bc091e1f434c', '贵阳统一支付');
INSERT INTO `project` VALUES ('3860a8ea89fa25cf09106c12c51ba1e2', '建行支付项目');
INSERT INTO `project` VALUES ('3ba0013d293f05f70c684ef53d73d303', '公共项目');
INSERT INTO `project` VALUES ('6aad665e26aaf5990b648bb23c2a4a7a', '乐山ESB');
INSERT INTO `project` VALUES ('f3324e6fde0ea64d926876abcf71f687', '遂宁银行ESB、前置');
INSERT INTO `project` VALUES ('ffe2ce237368ac1082464fb1f5fbdb7e', '重庆柜面');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` varchar(32) NOT NULL,
  `name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `type` varchar(2) NOT NULL DEFAULT '0',
  `now_project` varchar(255) DEFAULT NULL COMMENT '当前使用的项目',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_unique` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('123', '洒水多', '123123', '0', null);
INSERT INTO `user` VALUES ('1234', '发顺丰', '123123', '0', null);
INSERT INTO `user` VALUES ('123444', '123', '123', '0', null);
INSERT INTO `user` VALUES ('1235', '发送到', '123123', '0', null);
INSERT INTO `user` VALUES ('1236', '发放多少', '123123', '0', null);
INSERT INTO `user` VALUES ('12367', '递四方速递', '123123', '0', null);
INSERT INTO `user` VALUES ('qwe', '收到罚单', '123123', '0', null);
