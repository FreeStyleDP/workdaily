/*
Navicat MySQL Data Transfer

Source Server         : myDataBase
Source Server Version : 80017
Source Host           : localhost:3306
Source Database       : work_daily

Target Server Type    : MYSQL
Target Server Version : 80017
File Encoding         : 65001

Date: 2019-09-18 12:39:59
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
  `start_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `end_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` char(1) DEFAULT NULL COMMENT '状态 1-完成 2-未完成 3-搁置',
  `use_time` double(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of log
-- ----------------------------
INSERT INTO `log` VALUES ('09198fa77947ee04d46370c29e6d585d', '3860a8ea89fa25cf09106c12c51ba1e2', '4', '2019-09-12', '剩余4个接口 单元测试，重点看有内嵌报文组装是否符合格式要求', '1', '', '2019-09-01 00:00:00', '2019-09-18 12:34:40', '1', null);
INSERT INTO `log` VALUES ('0e0217c78fd025ca470a6e4a1c1f3904', '3860a8ea89fa25cf09106c12c51ba1e2', '4', '2019-09-11', '后续4个接口开发', '1', '', '2019-09-01 00:00:00', '2019-09-18 12:35:25', '1', null);
INSERT INTO `log` VALUES ('1e68e1b4063a97a32d409d503916ad79', '3860a8ea89fa25cf09106c12c51ba1e2', '4', '2019-09-14', 'idea 新建时的模板不对', '1', '', '2019-09-01 00:00:00', '2019-09-18 12:35:25', '1', null);
INSERT INTO `log` VALUES ('2da93be2e3fecc70b4b0d51f37f8a6d3', '3860a8ea89fa25cf09106c12c51ba1e2', '1', '2019-09-13', '货车帮接口剩余3个，调整', '1', '', '2019-09-01 00:00:00', '2019-09-18 12:35:25', '1', '60.00');
INSERT INTO `log` VALUES ('35aa3b3f7e91cf6630b0dc71cb41204e', '3860a8ea89fa25cf09106c12c51ba1e2', '4', '2019-09-09', '继续调接口，从最开始的一个一个设置', '1', '', '2019-09-01 00:00:00', '2019-09-18 12:35:25', '1', null);
INSERT INTO `log` VALUES ('399f4adec2c4c3524fe856dd38f6ad40', '3860a8ea89fa25cf09106c12c51ba1e2', '1', '2019-09-14', 'ccb client 都有group 可以合并吗？', '1', '', '2019-09-01 00:00:00', '2019-09-18 12:35:25', '1', null);
INSERT INTO `log` VALUES ('40f40eb43c12473c2855c90de0f9250b', '3860a8ea89fa25cf09106c12c51ba1e2', '4', '2019-09-10', 'git 分支了解，及使用？', '4', null, '2019-09-01 00:00:00', '2019-09-18 12:35:25', '2', null);
INSERT INTO `log` VALUES ('47edc67a997e34aa73c976d96ff7158d', '3860a8ea89fa25cf09106c12c51ba1e2', '4', '2019-09-11', '', '7', null, '2019-09-01 00:00:00', '2019-09-18 12:35:25', '1', null);
INSERT INTO `log` VALUES ('54604aaed4108ad3bb2c69e1b150b2b6', '2d280fc5a8f25ba1a7d6bc091e1f434c', '2', '2019-09-03', '交易开发60105、67009', '1', '', '2019-09-01 00:00:00', '2019-09-18 12:35:25', '3', '2.00');
INSERT INTO `log` VALUES ('5a282a70a0390b087a2ffd1fd712430d', '3ba0013d293f05f70c684ef53d73d303', '4', '2019-09-16', '', '7', null, '2019-09-01 00:00:00', '2019-09-18 12:35:25', '1', null);
INSERT INTO `log` VALUES ('5d452b048cd2458b30a1176e9368f4ee', '3860a8ea89fa25cf09106c12c51ba1e2', '1', '2019-09-16', '按照给定样式修改代码，预计 2.5h', '1', '', '2019-09-01 00:00:00', '2019-09-18 12:35:25', '1', '30.00');
INSERT INTO `log` VALUES ('73a7becf3302ede8a95cdb568a491cbf', '3860a8ea89fa25cf09106c12c51ba1e2', '3', '2019-09-10', '常用宏', '3', '', '2019-09-01 00:00:00', '2019-09-18 12:35:25', '1', null);
INSERT INTO `log` VALUES ('76b40d2111a5ad86c211e6dcf05a2f70', '3860a8ea89fa25cf09106c12c51ba1e2', '4', '2019-09-08', 'TFT_ADR_INFO 地址信息 我们自己的不全，是所有字段都封装？还是只给部分字段？', '4', '', '2019-09-01 00:00:00', '2019-09-18 12:35:25', '1', null);
INSERT INTO `log` VALUES ('824cb02864751a855c78d4fe1241bdab', '2d280fc5a8f25ba1a7d6bc091e1f434c', '3', '2019-09-02', '贵阳统一支付了解安排', '1', '', '2019-09-05 14:12:28', '2019-09-05 14:12:30', '3', null);
INSERT INTO `log` VALUES ('8c4c8253812359034299f2f8c12e7241', '3ba0013d293f05f70c684ef53d73d303', '3', '2019-09-03', '日志管理系统', '1', '', '2019-09-04 11:56:10', '2019-09-18 12:29:10', '2', null);
INSERT INTO `log` VALUES ('91d01aa1e2917c62b6de0491085404e9', '3860a8ea89fa25cf09106c12c51ba1e2', '4', '2019-09-09', '备忘', '3', '', '2019-09-01 00:00:00', '2019-09-18 12:35:25', '1', null);
INSERT INTO `log` VALUES ('a5bc21c7717cc34f15a5b030cade2764', '3860a8ea89fa25cf09106c12c51ba1e2', '4', '2019-09-09', '', '7', null, '2019-09-01 00:00:00', '2019-09-18 12:35:25', '1', null);
INSERT INTO `log` VALUES ('a908e387057ae818ec4bd04485ce994c', '3860a8ea89fa25cf09106c12c51ba1e2', '4', '2019-09-09', '去除敏感信息 CCBServiceImpl 411', '3', '', '2019-09-01 00:00:00', '2019-09-18 12:35:25', '1', null);
INSERT INTO `log` VALUES ('ab826c5b25c4f466b71b77b4d2333b5a', '3860a8ea89fa25cf09106c12c51ba1e2', '4', '2019-09-06', '', '7', null, '2019-09-01 00:00:00', '2019-09-18 12:35:25', '1', null);
INSERT INTO `log` VALUES ('b3b8497335194b67d1fed5460a647af3', '3860a8ea89fa25cf09106c12c51ba1e2', '4', '2019-09-12', '测试断言 的用法', '1', '', '2019-09-01 00:00:00', '2019-09-18 12:35:25', '1', null);
INSERT INTO `log` VALUES ('b7bb7ec43fe0a4294f747dc11c57c310', '3860a8ea89fa25cf09106c12c51ba1e2', '1', '2019-09-12', '剩余4个接口的，响应报文拼装', '1', '', '2019-09-01 00:00:00', '2019-09-18 12:35:25', '1', null);
INSERT INTO `log` VALUES ('bdab7bbdc812e03e56e68c5a43b6c16d', '3860a8ea89fa25cf09106c12c51ba1e2', '4', '2019-09-08', '电话号码 需不需要考虑输入非必输的情况？创建实体类?还是字段？', '4', '', '2019-09-01 00:00:00', '2019-09-18 12:35:25', '1', null);
INSERT INTO `log` VALUES ('c9e949350131552fe7c47c03c30c9093', '3860a8ea89fa25cf09106c12c51ba1e2', '4', '2019-09-17', 'mock 测试', '1', '', '2019-09-01 00:00:00', '2019-09-18 12:35:25', '2', null);
INSERT INTO `log` VALUES ('cafb5217cbb7353881f5c3a06b00fee7', '3860a8ea89fa25cf09106c12c51ba1e2', '4', '2019-09-08', '额度测算  字段映射备注', '3', '', '2019-09-01 00:00:00', '2019-09-18 12:35:25', '1', null);
INSERT INTO `log` VALUES ('d3b26f52224bfaefd47ff661f167dc2d', '3860a8ea89fa25cf09106c12c51ba1e2', '4', '2019-09-18', '日志管理软件，最后的日结功能处理', '1', null, '2019-09-18 09:25:19', '2019-09-18 09:25:19', '2', null);
INSERT INTO `log` VALUES ('d5122ad499cd3b408f8931fa8ec68f2a', '3860a8ea89fa25cf09106c12c51ba1e2', '4', '2019-09-17', '', '7', null, '2019-09-17 18:34:13', '2019-09-17 18:42:05', '1', null);
INSERT INTO `log` VALUES ('dd3250beb7278f1e1ddcb3094787c8cc', '3860a8ea89fa25cf09106c12c51ba1e2', '4', '2019-09-11', '代码规范处理', '1', '', '2019-09-01 00:00:00', '2019-09-18 12:35:25', '1', null);
INSERT INTO `log` VALUES ('e23f27a4126abf4237a8717af258a257', '2d280fc5a8f25ba1a7d6bc091e1f434c', '4', '2019-09-03', '', '7', null, '2019-09-01 00:00:00', '2019-09-18 12:35:25', '1', null);
INSERT INTO `log` VALUES ('e397eb745aae5a08cfd65eda96ccf85c', '3860a8ea89fa25cf09106c12c51ba1e2', '1', '2019-09-10', '项目同步到git上，方便家里使用', '1', '', '2019-09-01 00:00:00', '2019-09-18 12:35:25', '1', '60.00');
INSERT INTO `log` VALUES ('ee12c9f8efb042c1dfe11a015bcc0c20', '3860a8ea89fa25cf09106c12c51ba1e2', '1', '2019-09-14', '申请信息提交 修改参数', '1', '', '2019-09-01 00:00:00', '2019-09-18 12:35:25', '1', null);
INSERT INTO `log` VALUES ('faf83f9c3f3307310328c5d57d330e9d', '3860a8ea89fa25cf09106c12c51ba1e2', '4', '2019-09-05', '', '7', null, '2019-09-01 00:00:00', '2019-09-18 12:35:25', '1', null);
INSERT INTO `log` VALUES ('fef83d78a165301a1aed52cfba125d68', '3860a8ea89fa25cf09106c12c51ba1e2', '4', '2019-09-05', '了解项目情况', '1', '', '2019-09-01 00:00:00', '2019-09-18 12:35:25', '1', null);

-- ----------------------------
-- Table structure for log_detail
-- ----------------------------
DROP TABLE IF EXISTS `log_detail`;
CREATE TABLE `log_detail` (
  `id` varchar(32) NOT NULL,
  `log_id` varchar(32) NOT NULL,
  `content` varchar(5000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '内容',
  `status` char(1) NOT NULL COMMENT '状态 1-完成 2-未完成',
  `seq` int(11) NOT NULL COMMENT '序号',
  `start_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `end_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `use_time` double(10,2) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of log_detail
-- ----------------------------
INSERT INTO `log_detail` VALUES ('0a0254becdf1a775586df005e45c793f', '8c4c8253812359034299f2f8c12e7241', '用户信息修改功能', '2', '15', '2019-09-01 00:00:00', '2019-09-18 12:36:42', null, null);
INSERT INTO `log_detail` VALUES ('0b4fa2e8ac88a2e3213af6e1d16f78c0', 'ab826c5b25c4f466b71b77b4d2333b5a', '日志管理系统 日志排序问题', '2', '3', '2019-09-01 00:00:00', '2019-09-18 12:36:42', '120.00', '');
INSERT INTO `log_detail` VALUES ('0cde454340979333fee2399285a67df7', '8c4c8253812359034299f2f8c12e7241', '明细添加bug', '1', '1', '2019-09-01 00:00:00', '2019-09-18 12:36:42', null, '');
INSERT INTO `log_detail` VALUES ('0fd53f26b34124d711fcc4a7d23786bd', '8c4c8253812359034299f2f8c12e7241', '新增日志时，若为日结等时，自动状态为已完成', '1', '12', '2019-09-01 00:00:00', '2019-09-18 12:36:42', null, null);
INSERT INTO `log_detail` VALUES ('1424d51a120e85d57cad31ff873eb6fb', 'faf83f9c3f3307310328c5d57d330e9d', '日志管理系统 ', '2', '3', '2019-09-01 00:00:00', '2019-09-18 12:36:42', '270.00', '');
INSERT INTO `log_detail` VALUES ('156504acccf10231ae70babb5de7e47e', '8c4c8253812359034299f2f8c12e7241', '明细添加时，增加耗时框，备注框', '1', '4', '2019-09-01 00:00:00', '2019-09-18 12:36:42', null, null);
INSERT INTO `log_detail` VALUES ('15b591c52389d06b80a5c905e4c526f8', '8c4c8253812359034299f2f8c12e7241', '紧急不重要  key-value 对应错误', '1', '24', '2019-09-01 00:00:00', '2019-09-18 12:36:42', null, '');
INSERT INTO `log_detail` VALUES ('1b81169c7c0d3af03295b5c5a2cb7e93', 'e23f27a4126abf4237a8717af258a257', '交易开发了解 ，定制报文 60105 处理完成', '2', '3', '2019-09-01 00:00:00', '2019-09-18 12:36:42', null, null);
INSERT INTO `log_detail` VALUES ('2482647d71f2d6b99a8908472079ecdd', '8c4c8253812359034299f2f8c12e7241', '按钮改为右键设置，先备份，以待回退', '1', '3', '2019-09-05 14:37:11', '2019-09-01 00:00:00', '0.00', '');
INSERT INTO `log_detail` VALUES ('24be621963674d4d16a61b6a456f2067', 'ab826c5b25c4f466b71b77b4d2333b5a', '日志管理系统 按钮置灰', '2', '4', '2019-09-01 00:00:00', '2019-09-18 12:36:42', '30.00', '');
INSERT INTO `log_detail` VALUES ('25eedb7860d74663dd4d6f08f0c836d1', '47edc67a997e34aa73c976d96ff7158d', '后续4只接口 类建立，流程控制，剩余 响应信息的处理', '2', '3', '2019-09-01 00:00:00', '2019-09-18 12:36:42', '240.00', '');
INSERT INTO `log_detail` VALUES ('26ecdb37e17561bfbd6c7cd845f3105d', '8c4c8253812359034299f2f8c12e7241', '耗时 可以清除', '1', '22', '2019-09-01 00:00:00', '2019-09-18 12:36:42', null, '');
INSERT INTO `log_detail` VALUES ('324296a4a1b9f138a7106bb4c3e628b2', '8c4c8253812359034299f2f8c12e7241', '明细排序，及解决方案', '1', '2', '2019-09-01 00:00:00', '2019-09-18 12:36:42', null, null);
INSERT INTO `log_detail` VALUES ('48336ee24fad75a0c3e5a8a523f1316f', '8c4c8253812359034299f2f8c12e7241', '内嵌页滚动条设置', '1', '6', '2019-09-01 00:00:00', '2019-09-18 12:36:42', null, null);
INSERT INTO `log_detail` VALUES ('4937fb1219eab88ae51ba245809e1857', '8c4c8253812359034299f2f8c12e7241', '明细添加耗时、开始时间、结束时间', '1', '1', '2019-09-01 00:00:00', '2019-09-18 12:36:42', '130.00', '完成');
INSERT INTO `log_detail` VALUES ('5b876b0801f957f2846e667a309bf172', '8c4c8253812359034299f2f8c12e7241', '明细 选中显示去除，顺序拖拉调整，完成样式调整', '1', '1', '2019-09-01 00:00:00', '2019-09-18 12:36:42', null, null);
INSERT INTO `log_detail` VALUES ('5c331a409213b3d7ab03d69d7582330a', '824cb02864751a855c78d4fe1241bdab', '了解总体设计', '1', '1', '2019-09-01 00:00:00', '2019-09-18 12:36:42', null, null);
INSERT INTO `log_detail` VALUES ('5d54c037c44dc0a51a6d8c696ef52092', '47edc67a997e34aa73c976d96ff7158d', '处理昨天代码不规范问题', '2', '2', '2019-09-01 00:00:00', '2019-09-18 12:36:42', '120.00', '');
INSERT INTO `log_detail` VALUES ('5e40677298d756ec20ddd4ba570782e2', '8c4c8253812359034299f2f8c12e7241', '项目管理 页面表格高度自适应', '1', '9', '2019-09-01 00:00:00', '2019-09-18 12:36:42', null, null);
INSERT INTO `log_detail` VALUES ('695ccccacb01d5d8b86020ec7eace08a', 'faf83f9c3f3307310328c5d57d330e9d', '了解工作内容', '2', '1', '2019-09-01 00:00:00', '2019-09-18 12:36:42', '60.00', '主要是测试接口');
INSERT INTO `log_detail` VALUES ('6a0c684e4c19e4061112d2d25dd91e2a', 'cafb5217cbb7353881f5c3a06b00fee7', 'pdid sdk 无此字段', '2', '1', '2019-09-01 00:00:00', '2019-09-18 12:36:42', null, '');
INSERT INTO `log_detail` VALUES ('713992d120a7ae2c3e0647449e2bb52e', '8c4c8253812359034299f2f8c12e7241', '增加 日结功能， 自动统计最后处理时间为当天的项', '1', '16', '2019-09-01 00:00:00', '2019-09-18 12:36:42', null, '');
INSERT INTO `log_detail` VALUES ('79a950d34945e1b81c98835507cb3f0b', '8c4c8253812359034299f2f8c12e7241', '角色登录功能', '2', '14', '2019-09-01 00:00:00', '2019-09-18 12:36:42', null, '');
INSERT INTO `log_detail` VALUES ('7b8d3fd0af202a67c8e05f968cfbc845', '8c4c8253812359034299f2f8c12e7241', '页面首页问题处理', '1', '7', '2019-09-01 00:00:00', '2019-09-18 12:36:42', null, null);
INSERT INTO `log_detail` VALUES ('7f4767fdda9292fe73c9f85c851f3449', '8c4c8253812359034299f2f8c12e7241', '明细 添加 开始时间，结束时间', '1', '11', '2019-09-01 00:00:00', '2019-09-18 12:36:42', null, null);
INSERT INTO `log_detail` VALUES ('843c9f85e5668cdf59e1c302eaaa8891', '824cb02864751a855c78d4fe1241bdab', '了解各个子系统具体的实现方式', '2', '3', '2019-09-01 00:00:00', '2019-09-18 12:36:42', null, null);
INSERT INTO `log_detail` VALUES ('8ce7e3528dbb1a068ba6f218d1db253c', 'fef83d78a165301a1aed52cfba125d68', '项目上线时间', '1', '1', '2019-09-01 00:00:00', '2019-09-18 12:36:42', null, '2周');
INSERT INTO `log_detail` VALUES ('8f8043152f77e44b2fad6b374ba9c3c7', '8c4c8253812359034299f2f8c12e7241', '右键显示增删改，对应的表格区域右键才有效果', '2', '25', '2019-09-17 14:21:32', '2019-09-17 14:21:32', null, '');
INSERT INTO `log_detail` VALUES ('9a4aed2da94789dc0f91f8d512728cca', '8c4c8253812359034299f2f8c12e7241', '获取最大 seq bug 修改，换项目时，清除', '1', '17', '2019-09-01 00:00:00', '2019-09-18 12:36:42', null, '');
INSERT INTO `log_detail` VALUES ('9ade882e67f00491f35218dcaaa36122', '8c4c8253812359034299f2f8c12e7241', '工作模式 调整，搜索 最后修改时间为当天的', '1', '20', '2019-09-01 00:00:00', '2019-09-18 12:36:42', null, '');
INSERT INTO `log_detail` VALUES ('a3364ccb6c99686702b4a35ead4e9c48', '8c4c8253812359034299f2f8c12e7241', '日志开始，结束时间用按钮的方式计算', '1', '5', '2019-09-01 00:00:00', '2019-09-18 12:36:42', null, null);
INSERT INTO `log_detail` VALUES ('a7bf6b6d3d5054cf7154b05487679b21', '8c4c8253812359034299f2f8c12e7241', 'log表、detail表可以放大', '2', '27', '2019-09-17 14:22:24', '2019-09-17 14:22:24', null, '');
INSERT INTO `log_detail` VALUES ('a9749fdbfd97a2727d642ea4fbaea94e', '47edc67a997e34aa73c976d96ff7158d', '没有给自己留出，学习的时间，不好，再忙最后1小时都是学习用的', '2', '5', '2019-09-01 00:00:00', '2019-09-18 12:36:42', null, '');
INSERT INTO `log_detail` VALUES ('ad2cd12ebd0ed939f0f370e8437b1104', 'd5122ad499cd3b408f8931fa8ec68f2a', '太长的时间用户开发、工作，说好的最后一小时反思，学习当日的，要保证每天5点开始日结', '2', '2', '2019-09-17 18:42:05', '2019-09-17 18:42:05', null, '');
INSERT INTO `log_detail` VALUES ('ada82d073a1dab82f89024000e53a2f8', '8c4c8253812359034299f2f8c12e7241', '增加页面刷新功能', '1', '8', '2019-09-01 00:00:00', '2019-09-18 12:36:42', null, '由于加载顺序问题，暂时不考虑');
INSERT INTO `log_detail` VALUES ('b3325399c9ec6d087f46276a9ed09d75', '824cb02864751a855c78d4fe1241bdab', '了解各个子系统通的运作流程', '2', '2', '2019-09-01 00:00:00', '2019-09-18 12:36:42', '6.00', '');
INSERT INTO `log_detail` VALUES ('b3e7c1c879e9aa202b361170a975e0cd', 'e23f27a4126abf4237a8717af258a257', '日志管理系统 明细页switch按钮，及展示效果处理              3.5h', '2', '1', '2019-09-01 00:00:00', '2019-09-18 12:36:42', '12.00', '');
INSERT INTO `log_detail` VALUES ('b482f8e5f384142d63e52c2e427af1cf', 'd5122ad499cd3b408f8931fa8ec68f2a', '日志管理系统', '2', '1', '2019-09-17 18:39:30', '2019-09-17 18:39:30', null, '');
INSERT INTO `log_detail` VALUES ('b50ece2669dfe73796dafdd4fe7eaf72', 'fef83d78a165301a1aed52cfba125d68', '工作内容', '1', '2', '2019-09-01 00:00:00', '2019-09-18 12:36:42', null, '测试相关，要有了代码才能后一步');
INSERT INTO `log_detail` VALUES ('bbde4d965c0118b633cbd95d1b8424a6', '47edc67a997e34aa73c976d96ff7158d', '抽空看下分支使用方法', '2', '4', '2019-09-01 00:00:00', '2019-09-18 12:36:42', null, '');
INSERT INTO `log_detail` VALUES ('c289d8b9f5bae1c2ac17d7edf6108e07', '8c4c8253812359034299f2f8c12e7241', '完成时间改为 最后修改时间，并且完成时间、开始时间 后台修改，前端不能修改，明显的最后修改时间修改，会改动日志的最后修改时间', '1', '18', '2019-09-01 00:00:00', '2019-09-18 12:36:42', null, '');
INSERT INTO `log_detail` VALUES ('c392bed16c630fbb829f57f6a782ebf9', '8c4c8253812359034299f2f8c12e7241', '日志表格添加 项目列，并且当前项目可以保持为空值', '1', '21', '2019-09-01 00:00:00', '2019-09-18 12:36:42', null, '');
INSERT INTO `log_detail` VALUES ('cbdddc16f1910a9b11d71409737c8814', '8c4c8253812359034299f2f8c12e7241', '日志  换行，最好是单元格换行，可以不用调比例了', '1', '23', '2019-09-01 00:00:00', '2019-09-18 12:36:42', null, '');
INSERT INTO `log_detail` VALUES ('d1515e055370205a0fc0785abc321381', '8c4c8253812359034299f2f8c12e7241', '日志添加预计耗时列', '1', '10', '2019-09-01 00:00:00', '2019-09-18 12:36:42', null, null);
INSERT INTO `log_detail` VALUES ('d39f89ca9a80914e06cc3d422380ed93', '8c4c8253812359034299f2f8c12e7241', '开始时间、结束时间，耗时不可同时存在', '1', '13', '2019-09-01 00:00:00', '2019-09-18 12:36:42', null, null);
INSERT INTO `log_detail` VALUES ('d595e11d8c58554d94dc9fa1eda3e7f7', 'ab826c5b25c4f466b71b77b4d2333b5a', '日志管理系统 日志明显问题处理', '2', '2', '2019-09-01 00:00:00', '2019-09-18 12:36:42', '90.00', '');
INSERT INTO `log_detail` VALUES ('d6a19db21f2be20ab92bbb307d7683ba', '8c4c8253812359034299f2f8c12e7241', '明细增删改后，刷新log表', '2', '26', '2019-09-17 14:22:03', '2019-09-17 14:22:03', null, '');
INSERT INTO `log_detail` VALUES ('ee904ac8373b27318edbb9e59606eb6d', '8c4c8253812359034299f2f8c12e7241', '日志添加耗时列', '1', '4', '2019-09-05 14:31:19', '2019-09-05 14:37:22', null, '');
INSERT INTO `log_detail` VALUES ('ee9fd897ae9641abd826dcd80ab17dbd', '8c4c8253812359034299f2f8c12e7241', '日志 重要等级样式调整，完成样式调整', '1', '2', '2019-09-01 00:00:00', '2019-09-18 12:36:42', null, null);
INSERT INTO `log_detail` VALUES ('f0f01d325ef2b4cfa9b921e69ab7ff13', '47edc67a997e34aa73c976d96ff7158d', '今天上午处理版本到 11点，合并分支', '2', '1', '2019-09-01 00:00:00', '2019-09-18 12:36:42', null, '');
INSERT INTO `log_detail` VALUES ('f67ad63bf48d6378fedeb34c701b86ab', 'e23f27a4126abf4237a8717af258a257', '日志管理 重要等级显示效果 1.5h', '2', '2', '2019-09-01 00:00:00', '2019-09-18 12:36:42', null, '');
INSERT INTO `log_detail` VALUES ('fa9fb4d2136cacfc3cfde90f7630f399', 'ab826c5b25c4f466b71b77b4d2333b5a', '学习效果不强，easyui 用了这么多次，也没有说，把方法的调用，表格有的东西做一个了解，再开始，而是匆匆忙忙的用', '2', '23', '2019-09-01 00:00:00', '2019-09-18 12:36:42', null, '建议：涉及到使用两次以上的就要对其做一定的了解了');
INSERT INTO `log_detail` VALUES ('ffed5f4b4110e09ca3a30841ec882f6d', '73a7becf3302ede8a95cdb568a491cbf', 's', '2', '1', '2019-09-01 00:00:00', '2019-09-18 12:36:42', null, 'v0v$hyLiprivate String p:a;OHjv0v$hyLi/** pa*/joHj');

-- ----------------------------
-- Table structure for project
-- ----------------------------
DROP TABLE IF EXISTS `project`;
CREATE TABLE `project` (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `name` varchar(255) NOT NULL COMMENT '项目名称',
  `seq` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  PRIMARY KEY (`seq`),
  UNIQUE KEY `un` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of project
-- ----------------------------
INSERT INTO `project` VALUES ('', '', '0');
INSERT INTO `project` VALUES ('2d280fc5a8f25ba1a7d6bc091e1f434c', '贵阳统一支付', '1');
INSERT INTO `project` VALUES ('3860a8ea89fa25cf09106c12c51ba1e2', '建行支付项目', '2');
INSERT INTO `project` VALUES ('3ba0013d293f05f70c684ef53d73d303', '公共项目', '3');
INSERT INTO `project` VALUES ('6aad665e26aaf5990b648bb23c2a4a7a', '乐山ESB', '4');
INSERT INTO `project` VALUES ('f3324e6fde0ea64d926876abcf71f687', '遂宁银行ESB、前置', '5');
INSERT INTO `project` VALUES ('ffe2ce237368ac1082464fb1f5fbdb7e', '重庆柜面', '6');

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
INSERT INTO `user` VALUES ('dengping', '邓平', 'dengping', '0', '');
