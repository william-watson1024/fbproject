/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306_for
 Source Server Type    : MySQL
 Source Server Version : 80040 (8.0.40)
 Source Host           : localhost:3306
 Source Schema         : fb

 Target Server Type    : MySQL
 Target Server Version : 80040 (8.0.40)
 File Encoding         : 65001

 Date: 02/06/2025 22:08:26
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `tpl_web_type` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '前端模板类型（element-ui模版 element-plus模版）',
  `package_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '代码生成业务表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (5, 'myfbuser', '投注积分用户表', NULL, NULL, 'Myfbuser', 'crud', 'element-ui', 'com.ruoyi.system', 'system', 'myfbuser', '投注积分用户管理', 'ruoyi', '0', '/', '{\"parentMenuId\":2022}', 'admin', '2025-05-30 21:26:25', '', '2025-05-30 21:26:48', NULL);
INSERT INTO `gen_table` VALUES (6, 'myfbweb', '直播链接管理表', NULL, NULL, 'Myfbweb', 'crud', 'element-ui', 'com.ruoyi.system', 'system', 'myfbweb', '直播链接管理', 'ruoyi', '0', '/', '{\"parentMenuId\":2022}', 'admin', '2025-05-30 21:26:25', '', '2025-05-30 21:27:17', NULL);
INSERT INTO `gen_table` VALUES (9, 'mybetrecord', '下注信息表', NULL, NULL, 'Mybetrecord', 'crud', 'element-ui', 'com.ruoyi.system', 'system', 'mybetrecord', '下注信息管理', 'ruoyi', '0', '/', '{\"parentMenuId\":2022}', 'admin', '2025-05-31 03:40:29', '', '2025-05-31 03:40:48', NULL);

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` bigint NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `sort` int NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 51 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (21, 5, 'id', '用户ID\r\n', 'int', 'Long', 'id', '1', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-05-30 21:26:25', '', '2025-05-30 21:26:48');
INSERT INTO `gen_table_column` VALUES (22, 5, 'account', '用户账号', 'varchar(255)', 'String', 'account', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2025-05-30 21:26:25', '', '2025-05-30 21:26:48');
INSERT INTO `gen_table_column` VALUES (23, 5, 'password', '用户密码', 'varchar(255)', 'String', 'password', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2025-05-30 21:26:25', '', '2025-05-30 21:26:48');
INSERT INTO `gen_table_column` VALUES (24, 5, 'name', '用户名', 'varchar(255)', 'String', 'name', '0', '0', '0', '1', '1', '1', '1', 'LIKE', 'input', '', 4, 'admin', '2025-05-30 21:26:25', '', '2025-05-30 21:26:48');
INSERT INTO `gen_table_column` VALUES (25, 5, 'points', '用户积分', 'int', 'Long', 'points', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2025-05-30 21:26:25', '', '2025-05-30 21:26:48');
INSERT INTO `gen_table_column` VALUES (26, 6, 'id', '直播id\r\n', 'int', 'Long', 'id', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-05-30 21:26:25', '', '2025-05-30 21:27:17');
INSERT INTO `gen_table_column` VALUES (27, 6, 'name', '直播名', 'varchar(255)', 'String', 'name', '0', '0', '0', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2025-05-30 21:26:25', '', '2025-05-30 21:27:17');
INSERT INTO `gen_table_column` VALUES (28, 6, 'description', '直播描述', 'text', 'String', 'description', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'textarea', '', 3, 'admin', '2025-05-30 21:26:25', '', '2025-05-30 21:27:17');
INSERT INTO `gen_table_column` VALUES (29, 6, 'url', '直播链接', 'varchar(500)', 'String', 'url', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'textarea', '', 4, 'admin', '2025-05-30 21:26:25', '', '2025-05-30 21:27:17');
INSERT INTO `gen_table_column` VALUES (30, 6, 'is_active', '直播状态', 'tinyint(1)', 'Integer', 'isActive', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2025-05-30 21:26:25', '', '2025-05-30 21:27:17');
INSERT INTO `gen_table_column` VALUES (44, 9, 'id', '下注id', 'int', 'Long', 'id', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-05-31 03:40:29', '', '2025-05-31 03:40:48');
INSERT INTO `gen_table_column` VALUES (45, 9, 'my_fbuser_id', '下注用户id号', 'int', 'Long', 'myFbuserId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2025-05-31 03:40:29', '', '2025-05-31 03:40:48');
INSERT INTO `gen_table_column` VALUES (46, 9, 'my_fbuser_account', '下注用户账号', 'varchar(255)', 'String', 'myFbuserAccount', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2025-05-31 03:40:29', '', '2025-05-31 03:40:48');
INSERT INTO `gen_table_column` VALUES (47, 9, 'bet_num', '下注数量', 'int', 'Long', 'betNum', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2025-05-31 03:40:29', '', '2025-05-31 03:40:48');
INSERT INTO `gen_table_column` VALUES (48, 9, 'bet_name', '下注名', 'varchar(255)', 'String', 'betName', '0', '0', '0', '1', '1', '1', '1', 'LIKE', 'input', '', 5, 'admin', '2025-05-31 03:40:29', '', '2025-05-31 03:40:48');
INSERT INTO `gen_table_column` VALUES (49, 9, 'is_active', '下注处理状态', 'int', 'Long', 'isActive', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2025-05-31 03:40:29', '', '2025-05-31 03:40:48');
INSERT INTO `gen_table_column` VALUES (50, 9, 'bet_time', '下注时间', 'datetime', 'Date', 'betTime', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'datetime', '', 7, 'admin', '2025-05-31 03:40:29', '', '2025-05-31 03:40:48');

-- ----------------------------
-- Table structure for mybetrecord
-- ----------------------------
DROP TABLE IF EXISTS `mybetrecord`;
CREATE TABLE `mybetrecord`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '下注id',
  `my_fbuser_id` int NULL DEFAULT NULL COMMENT '下注用户id号',
  `my_fbuser_account` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '下注用户账号',
  `bet_num` int NULL DEFAULT NULL COMMENT '下注数量',
  `bet_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '下注名',
  `is_active` int NULL DEFAULT NULL COMMENT '下注处理状态',
  `bet_time` datetime NULL DEFAULT NULL COMMENT '下注时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mybetrecord
-- ----------------------------
INSERT INTO `mybetrecord` VALUES (3, 1, '666', 20, 'cy', 0, '2025-05-01 00:00:00');
INSERT INTO `mybetrecord` VALUES (4, 1, '123', 500, '1', 0, '2025-05-01 00:00:00');
INSERT INTO `mybetrecord` VALUES (5, 1, 'user001', 300, '猜冠军', 0, '2025-05-31 00:00:00');
INSERT INTO `mybetrecord` VALUES (6, 1, 'user001', 300, '猜冠军', 0, '2025-05-31 00:00:00');
INSERT INTO `mybetrecord` VALUES (7, 1, 'user001', 300, '猜冠军', 0, '2025-05-31 00:00:00');
INSERT INTO `mybetrecord` VALUES (8, 1, 'user001', 300, '猜冠军', 0, '2025-05-31 00:00:00');
INSERT INTO `mybetrecord` VALUES (10, 1, '4Dc6heoglu', 10, '鱼', 0, '2025-06-02 00:08:11');
INSERT INTO `mybetrecord` VALUES (11, 1, '4Dc6heoglu', 10, '鱼', 0, '2025-06-02 00:17:42');
INSERT INTO `mybetrecord` VALUES (12, 1, '4Dc6heoglu', 10, '鱼', 0, '2025-06-02 00:20:30');
INSERT INTO `mybetrecord` VALUES (13, 1, '1', 1, '1', 0, '2025-06-25 00:00:00');
INSERT INTO `mybetrecord` VALUES (14, 666, '666', 1, '1', 0, '2025-06-10 00:32:34');
INSERT INTO `mybetrecord` VALUES (15, 1, '4Dc6heoglu', 10, '鱼', 0, '2025-06-02 00:48:36');
INSERT INTO `mybetrecord` VALUES (16, 1, '4Dc6heoglu', 10, '鱼', 0, '2025-06-02 00:48:46');
INSERT INTO `mybetrecord` VALUES (17, 1, '4Dc6heoglu', 10, '鱼', 0, '2025-06-02 00:48:58');
INSERT INTO `mybetrecord` VALUES (18, 1, '4Dc6heoglu', 10, '蟹', 0, '2025-06-02 01:13:03');
INSERT INTO `mybetrecord` VALUES (19, 1, '4Dc6heoglu', 10, '葫芦', 0, '2025-06-02 01:15:13');
INSERT INTO `mybetrecord` VALUES (20, 1, '4Dc6heoglu', 10, '鸡', 0, '2025-06-02 01:16:05');
INSERT INTO `mybetrecord` VALUES (21, 5, 'yaYiTvQoZ3', 10, '葫芦', 0, '2025-06-02 01:17:39');
INSERT INTO `mybetrecord` VALUES (22, 1, '4Dc6heoglu', 10, '鹿', 0, '2025-06-02 01:30:41');
INSERT INTO `mybetrecord` VALUES (23, 1, '4Dc6heoglu', 10, '鱼', 0, '2025-06-02 15:34:09');
INSERT INTO `mybetrecord` VALUES (24, 1, 'test', 10, '鹿', 0, '2025-06-02 21:31:55');
INSERT INTO `mybetrecord` VALUES (25, 22, '20250602', 1000, '鹿', 0, '2025-06-02 21:37:34');
INSERT INTO `mybetrecord` VALUES (26, 22, '20250602', 2000, '鹿', 0, '2025-06-02 21:38:14');

-- ----------------------------
-- Table structure for myfbuser
-- ----------------------------
DROP TABLE IF EXISTS `myfbuser`;
CREATE TABLE `myfbuser`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '用户ID\r\n',
  `account` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '用户账号',
  `password` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '用户密码',
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `points` int NULL DEFAULT NULL COMMENT '用户积分',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of myfbuser
-- ----------------------------
INSERT INTO `myfbuser` VALUES (1, 'test', 'test11', 'Sheh Siu Wai', 990);
INSERT INTO `myfbuser` VALUES (2, '8txKrrzUpz', 'AuZBZYqTSc', 'Pang Ka Ming', 966);
INSERT INTO `myfbuser` VALUES (3, 'IH7RF0R2F5', 'ye0SoEhE4Z', 'Harada Hina', 780);
INSERT INTO `myfbuser` VALUES (4, 'FsiXdsJ7Ub', 'SJlMUlvOGp', 'Yu Zitao', 452);
INSERT INTO `myfbuser` VALUES (5, 'yaYiTvQoZ3', 'g1aLd5T2ty', 'Takeuchi Mitsuki', 636);
INSERT INTO `myfbuser` VALUES (6, 'sVwyJYp9Dp', 'RKGTxxBwfv', 'Ishida Hana', 586);
INSERT INTO `myfbuser` VALUES (7, '7RCAJVrCfP', 'Pc69gYLbnm', 'Tam Wai Lam', 3);
INSERT INTO `myfbuser` VALUES (8, 'YW6cJnfewe', 'QEFUzcCVD3', 'Maruyama Sara', 677);
INSERT INTO `myfbuser` VALUES (9, 'umZcUgOKUi', 'QuJjAYV7R9', 'Justin Stone', 617);
INSERT INTO `myfbuser` VALUES (10, 'sTR25KhNjW', 'iYADdmdHKz', 'Hara Momoka', 389);
INSERT INTO `myfbuser` VALUES (11, 'W7lGdvbsxl', 'stKM3kLVMX', 'Cheung Siu Wai', 456);
INSERT INTO `myfbuser` VALUES (12, 'cPIwdpDT9p', 'jxA7M53FV1', 'Richard Mcdonald', 908);
INSERT INTO `myfbuser` VALUES (13, 'pKrnJGMloz', 'MlOE8P6Uht', 'Wei Xiaoming', 97);
INSERT INTO `myfbuser` VALUES (14, '4sofp6vtSW', 'sV1ua6vQzS', 'Wong Wai Lam', 20);
INSERT INTO `myfbuser` VALUES (15, 'EGchIg0doX', 'va62HxhxxE', 'Dai Zitao', 455);
INSERT INTO `myfbuser` VALUES (16, '2Y6eZksiXZ', '3kI4hLHfjE', 'Carl Henderson', 495);
INSERT INTO `myfbuser` VALUES (17, 'Tk39N9BDh6', 'FSu5kuM4rO', 'Ryan Grant', 701);
INSERT INTO `myfbuser` VALUES (18, 'HJpm9TYLLZ', 'ERdRrSoMmE', 'Ikeda Yuna', 911);
INSERT INTO `myfbuser` VALUES (19, 'H5H18RRDk8', 'pkyuhL6BVf', 'Tsang Ho Yin', 520);
INSERT INTO `myfbuser` VALUES (20, 'b50nftLqr1', 'SSFlfIzM0W', 'Chris Ross', 634);
INSERT INTO `myfbuser` VALUES (21, 'william001', '123456', 'William', 0);
INSERT INTO `myfbuser` VALUES (22, '20250602', 'll20250602', 'test', 11000);

-- ----------------------------
-- Table structure for myfbweb
-- ----------------------------
DROP TABLE IF EXISTS `myfbweb`;
CREATE TABLE `myfbweb`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '直播id\r\n',
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '直播名',
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT '直播描述',
  `url` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '直播链接',
  `is_active` tinyint(1) NULL DEFAULT 1 COMMENT '直播状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of myfbweb
-- ----------------------------
INSERT INTO `myfbweb` VALUES (2, 'Shen Yunxi', 'You can select any connections,                   ', 'http://drive.porterg.cn/ToysGames', 2);
INSERT INTO `myfbweb` VALUES (3, 'Ren Xiaoming', 'Navicat Monitor can be installed                  ', 'https://www.choiyunfat2019.co.jp/MusicalInstrument', 2);
INSERT INTO `myfbweb` VALUES (4, 'Du Rui', 'SQL Editor allows you to create                   ', 'http://auth.rar.co.jp/HealthBabyCare', 2);
INSERT INTO `myfbweb` VALUES (5, 'Nakagawa Hikaru', 'A query is used to extract data                   ', 'https://live.bilibili.com/5678?live_from=81001&spm_id_from=333.1007.0.0', 1);
INSERT INTO `myfbweb` VALUES (6, 'Zhou Zitao', 'All the Navicat Cloud objects are                 ', 'https://auth.hasegawatakuya94.xyz/Beauty', 1);
INSERT INTO `myfbweb` VALUES (7, 'Jesus James', 'Such sessions are also susceptible                ', 'https://www.rick.us/Baby', 2);
INSERT INTO `myfbweb` VALUES (8, '测试直播间', 'HTTP Tunneling is a method for                    ', 'https://jzb5ishk.zhubaicheng.com/player/2/1/0/3854481', 1);
INSERT INTO `myfbweb` VALUES (9, 'Dai Zitao', 'Navicat provides powerful tools                   ', 'https://auth.xiaomingliang.us/ArtsHandicraftsSewing', 1);
INSERT INTO `myfbweb` VALUES (10, 'Helen Turner', 'The Navigation pane employs tree                  ', 'https://video.gonzalezle816.net/HouseholdKitchenAppliances', 1);
INSERT INTO `myfbweb` VALUES (11, 'Siu Wai San', 'SSH serves to prevent such vulnerabilities        ', 'http://video.lsho.biz/BaggageTravelEquipment', 2);
INSERT INTO `myfbweb` VALUES (12, 'Samuel Mcdonald', 'It wasn’t raining when Noah built the ark.', 'https://www.lwu1985.co.jp/ArtsHandicraftsSewing', 1);
INSERT INTO `myfbweb` VALUES (13, 'Cao Zitao', 'Navicat 15 has added support for                  ', 'http://image.hoc.xyz/AutomotivePartsAccessories', 2);
INSERT INTO `myfbweb` VALUES (14, 'Shi Xiaoming', 'In the Objects tab, you can use                   ', 'http://video.ayatowa3.jp/ComputersElectronics', 2);
INSERT INTO `myfbweb` VALUES (15, 'Kinoshita Mio', 'The Information Pane shows the                    ', 'http://auth.jiehongl.org/Appliances', 1);
INSERT INTO `myfbweb` VALUES (16, 'Murata Ayato', 'Navicat authorizes you to make                    ', 'https://image.donalb.info/AppsGames', 1);
INSERT INTO `myfbweb` VALUES (17, 'Shimizu Momoe', 'The reason why a great man is great               ', 'http://video.jhall.us/ToolsHomeDecoration', 2);
INSERT INTO `myfbweb` VALUES (18, 'Sylvia Warren', 'If you wait, all that happens is you get older.', 'https://drive.ahunt.org/CollectiblesFineArt', 2);
INSERT INTO `myfbweb` VALUES (19, 'Donna Jenkins', 'If opportunity doesn’t knock, build a door.', 'https://www.kennedyma.xyz/HouseholdKitchenAppliances', 2);
INSERT INTO `myfbweb` VALUES (20, 'Mary Hernandez', 'The Synchronize to Database function              ', 'http://www.wsmo5.co.jp/Appliances', 1);

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '参数配置表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2025-05-30 17:29:16', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2025-05-30 17:29:16', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2025-05-30 17:29:16', '', NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES (4, '账号自助-验证码开关', 'sys.account.captchaEnabled', 'true', 'Y', 'admin', '2025-05-30 17:29:16', '', NULL, '是否开启验证码功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'true', 'Y', 'admin', '2025-05-30 17:29:16', '', NULL, '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (6, '用户登录-黑名单列表', 'sys.login.blackIPList', '', 'Y', 'admin', '2025-05-30 17:29:16', '', NULL, '设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');
INSERT INTO `sys_config` VALUES (7, '用户管理-初始密码修改策略', 'sys.account.initPasswordModify', '1', 'Y', 'admin', '2025-05-30 17:29:16', '', NULL, '0：初始密码修改策略关闭，没有任何提示，1：提醒用户，如果未修改初始密码，则在登录时就会提醒修改密码对话框');
INSERT INTO `sys_config` VALUES (8, '用户管理-账号密码更新周期', 'sys.account.passwordValidateDays', '0', 'Y', 'admin', '2025-05-30 17:29:16', '', NULL, '密码更新周期（填写数字，数据初始化值为0不限制，若修改必须为大于0小于365的正整数），如果超过这个周期登录系统时，则在登录时就会提醒修改密码对话框');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 200 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '部门表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '若依科技', 0, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-05-30 17:29:14', '', NULL);
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '深圳总公司', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-05-30 17:29:14', '', NULL);
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '长沙分公司', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-05-30 17:29:14', '', NULL);
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '研发部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-05-30 17:29:14', '', NULL);
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-05-30 17:29:14', '', NULL);
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '测试部门', 3, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-05-30 17:29:14', '', NULL);
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-05-30 17:29:14', '', NULL);
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-05-30 17:29:14', '', NULL);
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-05-30 17:29:14', '', NULL);
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-05-30 17:29:14', '', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '字典数据表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2025-05-30 17:29:16', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2025-05-30 17:29:16', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2025-05-30 17:29:16', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2025-05-30 17:29:16', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2025-05-30 17:29:16', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2025-05-30 17:29:16', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2025-05-30 17:29:16', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2025-05-30 17:29:16', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2025-05-30 17:29:16', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2025-05-30 17:29:16', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2025-05-30 17:29:16', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2025-05-30 17:29:16', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2025-05-30 17:29:16', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2025-05-30 17:29:16', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2025-05-30 17:29:16', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2025-05-30 17:29:16', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2025-05-30 17:29:16', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2025-05-30 17:29:16', '', NULL, '其他操作');
INSERT INTO `sys_dict_data` VALUES (19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2025-05-30 17:29:16', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2025-05-30 17:29:16', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2025-05-30 17:29:16', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2025-05-30 17:29:16', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2025-05-30 17:29:16', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2025-05-30 17:29:16', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2025-05-30 17:29:16', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (26, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2025-05-30 17:29:16', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2025-05-30 17:29:16', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2025-05-30 17:29:16', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2025-05-30 17:29:16', '', NULL, '停用状态');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '字典类型表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2025-05-30 17:29:15', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2025-05-30 17:29:15', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2025-05-30 17:29:15', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2025-05-30 17:29:15', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2025-05-30 17:29:15', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2025-05-30 17:29:15', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2025-05-30 17:29:15', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2025-05-30 17:29:15', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2025-05-30 17:29:15', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2025-05-30 17:29:16', '', NULL, '登录状态列表');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '定时任务调度表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2025-05-30 17:29:16', '', NULL, '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2025-05-30 17:29:16', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2025-05-30 17:29:16', '', NULL, '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE,
  INDEX `idx_sys_logininfor_s`(`status` ASC) USING BTREE,
  INDEX `idx_sys_logininfor_lt`(`login_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 132 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '系统访问记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (100, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-05-30 18:02:08');
INSERT INTO `sys_logininfor` VALUES (101, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-05-30 18:15:10');
INSERT INTO `sys_logininfor` VALUES (102, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-05-30 18:15:30');
INSERT INTO `sys_logininfor` VALUES (103, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-05-30 18:16:30');
INSERT INTO `sys_logininfor` VALUES (104, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-05-30 18:19:39');
INSERT INTO `sys_logininfor` VALUES (105, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-05-30 18:21:50');
INSERT INTO `sys_logininfor` VALUES (106, 'test', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '注册成功', '2025-05-30 18:22:16');
INSERT INTO `sys_logininfor` VALUES (107, 'test', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-05-30 18:22:27');
INSERT INTO `sys_logininfor` VALUES (108, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '用户不存在/密码错误', '2025-05-30 20:19:38');
INSERT INTO `sys_logininfor` VALUES (109, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '验证码错误', '2025-05-30 20:19:44');
INSERT INTO `sys_logininfor` VALUES (110, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '用户不存在/密码错误', '2025-05-30 20:19:52');
INSERT INTO `sys_logininfor` VALUES (111, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '验证码已失效', '2025-05-30 20:22:20');
INSERT INTO `sys_logininfor` VALUES (112, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '用户不存在/密码错误', '2025-05-30 20:22:33');
INSERT INTO `sys_logininfor` VALUES (113, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '用户不存在/密码错误', '2025-05-30 20:22:38');
INSERT INTO `sys_logininfor` VALUES (114, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-05-30 20:23:05');
INSERT INTO `sys_logininfor` VALUES (115, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-05-30 20:34:27');
INSERT INTO `sys_logininfor` VALUES (116, 'test', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-05-30 20:34:36');
INSERT INTO `sys_logininfor` VALUES (117, 'test', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-05-30 20:34:44');
INSERT INTO `sys_logininfor` VALUES (118, 'test', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-05-30 20:34:49');
INSERT INTO `sys_logininfor` VALUES (119, 'test', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-05-30 20:49:01');
INSERT INTO `sys_logininfor` VALUES (120, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-05-30 20:49:11');
INSERT INTO `sys_logininfor` VALUES (121, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-05-31 03:22:35');
INSERT INTO `sys_logininfor` VALUES (122, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-05-31 03:38:43');
INSERT INTO `sys_logininfor` VALUES (123, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-05-31 03:38:48');
INSERT INTO `sys_logininfor` VALUES (124, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-05-31 13:16:31');
INSERT INTO `sys_logininfor` VALUES (125, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '验证码错误', '2025-05-31 13:21:47');
INSERT INTO `sys_logininfor` VALUES (126, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-05-31 13:21:50');
INSERT INTO `sys_logininfor` VALUES (127, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-05-31 21:48:36');
INSERT INTO `sys_logininfor` VALUES (128, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2025-06-02 04:06:44');
INSERT INTO `sys_logininfor` VALUES (129, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2025-06-02 15:34:41');
INSERT INTO `sys_logininfor` VALUES (130, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2025-06-02 16:34:10');
INSERT INTO `sys_logininfor` VALUES (131, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2025-06-02 21:32:25');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '路由参数',
  `route_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '路由名称',
  `is_frame` int NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2065 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '菜单权限表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, 'system', NULL, '', '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2025-05-30 17:29:14', '', NULL, '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 2, 'monitor', NULL, '', '', 1, 0, 'M', '0', '0', '', 'monitor', 'admin', '2025-05-30 17:29:14', '', NULL, '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 3, 'tool', NULL, '', '', 1, 0, 'M', '0', '0', '', 'tool', 'admin', '2025-05-30 17:29:14', '', NULL, '系统工具目录');
INSERT INTO `sys_menu` VALUES (4, '若依官网', 0, 4, 'http://ruoyi.vip', NULL, '', '', 0, 0, 'M', '0', '0', '', 'guide', 'admin', '2025-05-30 17:29:14', '', NULL, '若依官网地址');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', '', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2025-05-30 17:29:14', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', '', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2025-05-30 17:29:14', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2025-05-30 17:29:14', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', '', '', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2025-05-30 17:29:14', '', NULL, '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', '', '', 1, 0, 'C', '0', '0', 'system:post:list', 'post', 'admin', '2025-05-30 17:29:14', '', NULL, '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', '', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2025-05-30 17:29:14', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', '', '', 1, 0, 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2025-05-30 17:29:14', '', NULL, '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', '', '', 1, 0, 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2025-05-30 17:29:14', '', NULL, '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, 'log', '', '', '', 1, 0, 'M', '0', '0', '', 'log', 'admin', '2025-05-30 17:29:14', '', NULL, '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', '', '', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2025-05-30 17:29:14', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, 'job', 'monitor/job/index', '', '', 1, 0, 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2025-05-30 17:29:14', '', NULL, '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, 'druid', 'monitor/druid/index', '', '', 1, 0, 'C', '0', '0', 'monitor:druid:list', 'druid', 'admin', '2025-05-30 17:29:14', '', NULL, '数据监控菜单');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 4, 'server', 'monitor/server/index', '', '', 1, 0, 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2025-05-30 17:29:14', '', NULL, '服务监控菜单');
INSERT INTO `sys_menu` VALUES (113, '缓存监控', 2, 5, 'cache', 'monitor/cache/index', '', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis', 'admin', '2025-05-30 17:29:14', '', NULL, '缓存监控菜单');
INSERT INTO `sys_menu` VALUES (114, '缓存列表', 2, 6, 'cacheList', 'monitor/cache/list', '', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis-list', 'admin', '2025-05-30 17:29:14', '', NULL, '缓存列表菜单');
INSERT INTO `sys_menu` VALUES (115, '表单构建', 3, 1, 'build', 'tool/build/index', '', '', 1, 0, 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2025-05-30 17:29:14', '', NULL, '表单构建菜单');
INSERT INTO `sys_menu` VALUES (116, '代码生成', 3, 2, 'gen', 'tool/gen/index', '', '', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2025-05-30 17:29:14', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu` VALUES (117, '系统接口', 3, 3, 'swagger', 'tool/swagger/index', '', '', 1, 0, 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2025-05-30 17:29:14', '', NULL, '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', '', '', 1, 0, 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2025-05-30 17:29:14', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', '', '', 1, 0, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2025-05-30 17:29:14', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1000, '用户查询', 100, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2025-05-30 17:29:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1001, '用户新增', 100, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2025-05-30 17:29:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户修改', 100, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2025-05-30 17:29:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户删除', 100, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2025-05-30 17:29:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户导出', 100, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2025-05-30 17:29:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导入', 100, 6, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2025-05-30 17:29:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '重置密码', 100, 7, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2025-05-30 17:29:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '角色查询', 101, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2025-05-30 17:29:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色新增', 101, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2025-05-30 17:29:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色修改', 101, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2025-05-30 17:29:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色删除', 101, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2025-05-30 17:29:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色导出', 101, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2025-05-30 17:29:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '菜单查询', 102, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2025-05-30 17:29:15', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单新增', 102, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2025-05-30 17:29:15', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单修改', 102, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2025-05-30 17:29:15', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单删除', 102, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2025-05-30 17:29:15', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '部门查询', 103, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2025-05-30 17:29:15', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门新增', 103, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2025-05-30 17:29:15', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门修改', 103, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2025-05-30 17:29:15', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门删除', 103, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2025-05-30 17:29:15', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '岗位查询', 104, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin', '2025-05-30 17:29:15', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位新增', 104, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin', '2025-05-30 17:29:15', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位修改', 104, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2025-05-30 17:29:15', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位删除', 104, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2025-05-30 17:29:15', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位导出', 104, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin', '2025-05-30 17:29:15', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '字典查询', 105, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2025-05-30 17:29:15', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典新增', 105, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2025-05-30 17:29:15', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典修改', 105, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2025-05-30 17:29:15', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典删除', 105, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2025-05-30 17:29:15', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典导出', 105, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2025-05-30 17:29:15', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '参数查询', 106, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', '2025-05-30 17:29:15', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数新增', 106, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', '2025-05-30 17:29:15', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数修改', 106, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2025-05-30 17:29:15', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数删除', 106, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2025-05-30 17:29:15', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数导出', 106, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', '2025-05-30 17:29:15', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '公告查询', 107, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2025-05-30 17:29:15', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告新增', 107, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2025-05-30 17:29:15', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告修改', 107, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2025-05-30 17:29:15', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告删除', 107, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2025-05-30 17:29:15', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '操作查询', 500, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2025-05-30 17:29:15', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作删除', 500, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2025-05-30 17:29:15', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '日志导出', 500, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2025-05-30 17:29:15', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '登录查询', 501, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2025-05-30 17:29:15', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录删除', 501, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2025-05-30 17:29:15', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '日志导出', 501, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2025-05-30 17:29:15', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '账户解锁', 501, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:unlock', '#', 'admin', '2025-05-30 17:29:15', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2025-05-30 17:29:15', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2025-05-30 17:29:15', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2025-05-30 17:29:15', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1049, '任务查询', 110, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2025-05-30 17:29:15', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '任务新增', 110, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2025-05-30 17:29:15', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1051, '任务修改', 110, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2025-05-30 17:29:15', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1052, '任务删除', 110, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2025-05-30 17:29:15', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1053, '状态修改', 110, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2025-05-30 17:29:15', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1054, '任务导出', 110, 6, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2025-05-30 17:29:15', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '生成查询', 116, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2025-05-30 17:29:15', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '生成修改', 116, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2025-05-30 17:29:15', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成删除', 116, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2025-05-30 17:29:15', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '导入代码', 116, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2025-05-30 17:29:15', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '预览代码', 116, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2025-05-30 17:29:15', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '生成代码', 116, 6, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2025-05-30 17:29:15', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2022, '核心功能', 0, 1, 'core', NULL, NULL, '', 1, 0, 'M', '0', '0', NULL, 'dashboard', 'admin', '2025-05-30 21:12:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2035, '直播链接管理', 2022, 1, 'myfbweb', 'system/myfbweb/index', NULL, '', 1, 0, 'C', '0', '0', 'system:myfbweb:list', '#', 'admin', '2025-05-30 21:31:44', '', NULL, '直播链接管理菜单');
INSERT INTO `sys_menu` VALUES (2036, '直播链接管理查询', 2035, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:myfbweb:query', '#', 'admin', '2025-05-30 21:31:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2037, '直播链接管理新增', 2035, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:myfbweb:add', '#', 'admin', '2025-05-30 21:31:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2038, '直播链接管理修改', 2035, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:myfbweb:edit', '#', 'admin', '2025-05-30 21:31:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2039, '直播链接管理删除', 2035, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:myfbweb:remove', '#', 'admin', '2025-05-30 21:31:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2040, '直播链接管理导出', 2035, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:myfbweb:export', '#', 'admin', '2025-05-30 21:31:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2041, '投注积分用户管理', 2022, 1, 'myfbuser', 'system/myfbuser/index', NULL, '', 1, 0, 'C', '0', '0', 'system:myfbuser:list', '#', 'admin', '2025-05-30 21:31:55', '', NULL, '投注积分用户管理菜单');
INSERT INTO `sys_menu` VALUES (2042, '投注积分用户管理查询', 2041, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:myfbuser:query', '#', 'admin', '2025-05-30 21:31:55', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2043, '投注积分用户管理新增', 2041, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:myfbuser:add', '#', 'admin', '2025-05-30 21:31:55', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2044, '投注积分用户管理修改', 2041, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:myfbuser:edit', '#', 'admin', '2025-05-30 21:31:55', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2045, '投注积分用户管理删除', 2041, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:myfbuser:remove', '#', 'admin', '2025-05-30 21:31:55', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2046, '投注积分用户管理导出', 2041, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:myfbuser:export', '#', 'admin', '2025-05-30 21:31:55', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2059, '下注信息管理', 2022, 1, 'mybetrecord', 'system/mybetrecord/index', NULL, '', 1, 0, 'C', '0', '0', 'system:mybetrecord:list', '#', 'admin', '2025-05-31 03:42:01', '', NULL, '下注信息管理菜单');
INSERT INTO `sys_menu` VALUES (2060, '下注信息管理查询', 2059, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:mybetrecord:query', '#', 'admin', '2025-05-31 03:42:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2061, '下注信息管理新增', 2059, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:mybetrecord:add', '#', 'admin', '2025-05-31 03:42:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2062, '下注信息管理修改', 2059, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:mybetrecord:edit', '#', 'admin', '2025-05-31 03:42:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2063, '下注信息管理删除', 2059, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:mybetrecord:remove', '#', 'admin', '2025-05-31 03:42:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2064, '下注信息管理导出', 2059, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:mybetrecord:export', '#', 'admin', '2025-05-31 03:42:01', '', NULL, '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '通知公告表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2018-07-01 若依新版本发布啦', '2', 0xE696B0E78988E69CACE58685E5AEB9, '0', 'admin', '2025-05-30 17:29:16', '', NULL, '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：2018-07-01 若依系统凌晨维护', '1', 0xE7BBB4E68AA4E58685E5AEB9, '0', 'admin', '2025-05-30 17:29:16', '', NULL, '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint NULL DEFAULT 0 COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`) USING BTREE,
  INDEX `idx_sys_oper_log_bt`(`business_type` ASC) USING BTREE,
  INDEX `idx_sys_oper_log_s`(`status` ASC) USING BTREE,
  INDEX `idx_sys_oper_log_ot`(`oper_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 173 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '操作日志记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (100, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"my_fb_user,my_fb_web\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-30 20:29:03', 89);
INSERT INTO `sys_oper_log` VALUES (101, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"my_fb_user\"}', NULL, 0, NULL, '2025-05-30 20:29:05', 187);
INSERT INTO `sys_oper_log` VALUES (102, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"my_fb_web\"}', NULL, 0, NULL, '2025-05-30 20:29:07', 32);
INSERT INTO `sys_oper_log` VALUES (103, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"people\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"用户管理\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"/myfb/user\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-30 20:51:24', 23);
INSERT INTO `sys_oper_log` VALUES (104, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2025-05-30 20:51:24\",\"icon\":\"people\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2012,\"menuName\":\"用户管理\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":1,\"path\":\"/myfb/user\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"修改菜单\'用户管理\'失败，菜单名称已存在\",\"code\":500}', 0, NULL, '2025-05-30 20:51:42', 3);
INSERT INTO `sys_oper_log` VALUES (105, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2025-05-30 20:51:24\",\"icon\":\"people\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2012,\"menuName\":\"积分用户管理\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":1,\"path\":\"/myfb/user\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-30 20:51:52', 10);
INSERT INTO `sys_oper_log` VALUES (106, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"druid\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"直播间链接管理\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":1,\"path\":\"/system/web\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-30 20:54:48', 112);
INSERT INTO `sys_oper_log` VALUES (107, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', '研发部门', '/tool/gen/1,2', '127.0.0.1', '内网IP', '[1,2]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-30 21:07:50', 37);
INSERT INTO `sys_oper_log` VALUES (108, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"myfbuser,myfbweb\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-30 21:07:53', 69);
INSERT INTO `sys_oper_log` VALUES (109, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"button\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"核心菜单\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"core\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-30 21:10:07', 15);
INSERT INTO `sys_oper_log` VALUES (110, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2020', '127.0.0.1', '内网IP', '2020', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-30 21:10:24', 13);
INSERT INTO `sys_oper_log` VALUES (111, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"核心菜单\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-30 21:10:36', 10);
INSERT INTO `sys_oper_log` VALUES (112, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2021', '127.0.0.1', '内网IP', '2021', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-30 21:10:53', 13);
INSERT INTO `sys_oper_log` VALUES (113, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"dashboard\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"核心功能\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"core\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-30 21:12:14', 15);
INSERT INTO `sys_oper_log` VALUES (114, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"myfbuser\",\"className\":\"Myfbuser\",\"columns\":[{\"capJavaField\":\"Id\",\"columnId\":11,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-05-30 21:07:53\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Account\",\"columnId\":12,\"columnName\":\"account\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-05-30 21:07:53\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"account\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Password\",\"columnId\":13,\"columnName\":\"password\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-05-30 21:07:53\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"password\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnId\":14,\"columnName\":\"name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-05-30 21:07:53\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"requ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-30 21:13:05', 35);
INSERT INTO `sys_oper_log` VALUES (115, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"myfbuser\"}', NULL, 0, NULL, '2025-05-30 21:13:53', 36);
INSERT INTO `sys_oper_log` VALUES (116, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"myfbweb\",\"className\":\"Myfbweb\",\"columns\":[{\"capJavaField\":\"Id\",\"columnId\":16,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-05-30 21:07:53\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnId\":17,\"columnName\":\"name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-05-30 21:07:53\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Description\",\"columnId\":18,\"columnName\":\"description\",\"columnType\":\"text\",\"createBy\":\"admin\",\"createTime\":\"2025-05-30 21:07:53\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"textarea\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"description\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Url\",\"columnId\":19,\"columnName\":\"url\",\"columnType\":\"varchar(500)\",\"createBy\":\"admin\",\"createTime\":\"2025-05-30 21:07:53\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"textarea\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"url\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":fal', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-30 21:16:09', 36);
INSERT INTO `sys_oper_log` VALUES (117, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"myfbweb\"}', NULL, 0, NULL, '2025-05-30 21:16:12', 58);
INSERT INTO `sys_oper_log` VALUES (118, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', '研发部门', '/tool/gen/3,4', '127.0.0.1', '内网IP', '[3,4]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-30 21:26:21', 26);
INSERT INTO `sys_oper_log` VALUES (119, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"myfbweb,myfbuser\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-30 21:26:25', 52);
INSERT INTO `sys_oper_log` VALUES (120, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"myfbuser\",\"className\":\"Myfbuser\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"用户ID\\r\\n\",\"columnId\":21,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-05-30 21:26:25\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Account\",\"columnComment\":\"用户账号\",\"columnId\":22,\"columnName\":\"account\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-05-30 21:26:25\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"account\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Password\",\"columnComment\":\"用户密码\",\"columnId\":23,\"columnName\":\"password\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-05-30 21:26:25\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"password\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"用户名\",\"columnId\":24,\"columnName\":\"name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-05-30 21:26:25\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"nam', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-30 21:26:48', 33);
INSERT INTO `sys_oper_log` VALUES (121, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"myfbweb\",\"className\":\"Myfbweb\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"直播id\\r\\n\",\"columnId\":26,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-05-30 21:26:25\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"直播名\",\"columnId\":27,\"columnName\":\"name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-05-30 21:26:25\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Description\",\"columnComment\":\"直播描述\",\"columnId\":28,\"columnName\":\"description\",\"columnType\":\"text\",\"createBy\":\"admin\",\"createTime\":\"2025-05-30 21:26:25\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"textarea\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"description\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Url\",\"columnComment\":\"直播链接\",\"columnId\":29,\"columnName\":\"url\",\"columnType\":\"varchar(500)\",\"createBy\":\"admin\",\"createTime\":\"2025-05-30 21:26:25\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"textarea\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"url\",\"ja', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-30 21:27:17', 17);
INSERT INTO `sys_oper_log` VALUES (122, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"myfbuser\"}', NULL, 0, NULL, '2025-05-30 21:27:19', 148);
INSERT INTO `sys_oper_log` VALUES (123, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"myfbweb\"}', NULL, 0, NULL, '2025-05-30 21:27:20', 36);
INSERT INTO `sys_oper_log` VALUES (124, '投注积分用户管理', 2, 'com.ruoyi.system.controller.MyfbuserController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/myfbuser', '127.0.0.1', '内网IP', '{\"account\":\"4Dc6heoglu\",\"id\":1,\"name\":\"Sheh Siu Wai\",\"params\":{},\"points\":123}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-30 21:34:15', 17);
INSERT INTO `sys_oper_log` VALUES (125, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"mybetrecord\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-31 03:27:19', 72);
INSERT INTO `sys_oper_log` VALUES (126, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"mybetrecord\",\"className\":\"Mybetrecord\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"下注id\",\"columnId\":31,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-05-31 03:27:19\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"MyFbuserId\",\"columnComment\":\"下注用户id\",\"columnId\":32,\"columnName\":\"my_fbuser_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-05-31 03:27:19\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"myFbuserId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"BetNum\",\"columnComment\":\"下注数量\",\"columnId\":33,\"columnName\":\"bet_num\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-05-31 03:27:19\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"betNum\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"BetName\",\"columnComment\":\"下注名\",\"columnId\":34,\"columnName\":\"bet_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-05-31 03:27:19\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"betName\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-31 03:28:06', 44);
INSERT INTO `sys_oper_log` VALUES (127, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"mybetrecord\"}', NULL, 0, NULL, '2025-05-31 03:28:08', 170);
INSERT INTO `sys_oper_log` VALUES (128, '投注积分用户管理', 2, 'com.ruoyi.system.controller.MyfbuserController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/myfbuser', '127.0.0.1', '内网IP', '{\"account\":\"4Dc6heoglu\",\"id\":1,\"name\":\"Sheh Siu Wai\",\"params\":{},\"points\":60}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-31 03:30:13', 18);
INSERT INTO `sys_oper_log` VALUES (129, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', '研发部门', '/tool/gen/7', '127.0.0.1', '内网IP', '[7]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-31 03:33:27', 31);
INSERT INTO `sys_oper_log` VALUES (130, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"mybetrecord\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-31 03:33:32', 47);
INSERT INTO `sys_oper_log` VALUES (131, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"mybetrecord\",\"className\":\"Mybetrecord\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"下注id\",\"columnId\":37,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-05-31 03:33:32\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"MyFbuserId\",\"columnComment\":\"下注用户id号\",\"columnId\":38,\"columnName\":\"my_fbuser_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-05-31 03:33:32\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"myFbuserId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"MyFbuserAccount\",\"columnComment\":\"下注用户账号\",\"columnId\":39,\"columnName\":\"my_fbuser_account\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-05-31 03:33:32\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"myFbuserAccount\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"BetNum\",\"columnComment\":\"下注数量\",\"columnId\":40,\"columnName\":\"bet_num\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-05-31 03:33:32\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isReq', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-31 03:33:53', 39);
INSERT INTO `sys_oper_log` VALUES (132, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"mybetrecord\"}', NULL, 0, NULL, '2025-05-31 03:33:57', 167);
INSERT INTO `sys_oper_log` VALUES (133, '下注信息管理', 1, 'com.ruoyi.system.controller.MybetrecordController.add()', 'POST', 1, 'admin', '研发部门', '/system/mybetrecord', '127.0.0.1', '内网IP', '{\"betName\":\"123\",\"betNum\":123,\"betTime\":\"2025-05-16\",\"myFbuserAccount\":\"2\",\"myFbuserId\":1,\"params\":{}}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\r\n### The error may exist in file [D:\\fb\\RuoYi-Vue\\ruoyi-admin\\target\\classes\\mapper\\system\\MybetrecordMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.MybetrecordMapper.insertMybetrecord-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into mybetrecord          ( my_fbuser_id,             my_fbuser_account,             bet_num,             bet_name,                          bet_time )           values ( ?,             ?,             ?,             ?,                          ? )\r\n### Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\n; Field \'id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'id\' doesn\'t have a default value', '2025-05-31 03:36:58', 150);
INSERT INTO `sys_oper_log` VALUES (134, '下注信息管理', 1, 'com.ruoyi.system.controller.MybetrecordController.add()', 'POST', 1, 'admin', '研发部门', '/system/mybetrecord', '127.0.0.1', '内网IP', '{\"betName\":\"123\",\"betNum\":123,\"betTime\":\"2025-05-16\",\"myFbuserAccount\":\"2\",\"myFbuserId\":1,\"params\":{}}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\r\n### The error may exist in file [D:\\fb\\RuoYi-Vue\\ruoyi-admin\\target\\classes\\mapper\\system\\MybetrecordMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.MybetrecordMapper.insertMybetrecord-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into mybetrecord          ( my_fbuser_id,             my_fbuser_account,             bet_num,             bet_name,                          bet_time )           values ( ?,             ?,             ?,             ?,                          ? )\r\n### Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\n; Field \'id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'id\' doesn\'t have a default value', '2025-05-31 03:37:02', 3);
INSERT INTO `sys_oper_log` VALUES (135, '下注信息管理', 1, 'com.ruoyi.system.controller.MybetrecordController.add()', 'POST', 1, 'admin', '研发部门', '/system/mybetrecord', '127.0.0.1', '内网IP', '{\"betName\":\"123\",\"betNum\":123,\"betTime\":\"2025-05-16\",\"myFbuserAccount\":\"2\",\"myFbuserId\":1,\"params\":{}}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\r\n### The error may exist in file [D:\\fb\\RuoYi-Vue\\ruoyi-admin\\target\\classes\\mapper\\system\\MybetrecordMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.MybetrecordMapper.insertMybetrecord-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into mybetrecord          ( my_fbuser_id,             my_fbuser_account,             bet_num,             bet_name,                          bet_time )           values ( ?,             ?,             ?,             ?,                          ? )\r\n### Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\n; Field \'id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'id\' doesn\'t have a default value', '2025-05-31 03:37:05', 4);
INSERT INTO `sys_oper_log` VALUES (136, '下注信息管理', 1, 'com.ruoyi.system.controller.MybetrecordController.add()', 'POST', 1, 'admin', '研发部门', '/system/mybetrecord', '127.0.0.1', '内网IP', '{\"betName\":\"123\",\"betNum\":123,\"betTime\":\"2025-05-31\",\"myFbuserAccount\":\"123\",\"myFbuserId\":123,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-31 03:37:47', 6);
INSERT INTO `sys_oper_log` VALUES (137, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', '研发部门', '/tool/gen/8', '127.0.0.1', '内网IP', '[8]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-31 03:40:26', 28);
INSERT INTO `sys_oper_log` VALUES (138, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"mybetrecord\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-31 03:40:29', 47);
INSERT INTO `sys_oper_log` VALUES (139, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"mybetrecord\",\"className\":\"Mybetrecord\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"下注id\",\"columnId\":44,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-05-31 03:40:29\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":9,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"MyFbuserId\",\"columnComment\":\"下注用户id号\",\"columnId\":45,\"columnName\":\"my_fbuser_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-05-31 03:40:29\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"myFbuserId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":9,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"MyFbuserAccount\",\"columnComment\":\"下注用户账号\",\"columnId\":46,\"columnName\":\"my_fbuser_account\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-05-31 03:40:29\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"myFbuserAccount\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":9,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"BetNum\",\"columnComment\":\"下注数量\",\"columnId\":47,\"columnName\":\"bet_num\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-05-31 03:40:29\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-31 03:40:48', 35);
INSERT INTO `sys_oper_log` VALUES (140, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"mybetrecord\"}', NULL, 0, NULL, '2025-05-31 03:40:52', 136);
INSERT INTO `sys_oper_log` VALUES (141, '下注信息管理', 3, 'com.ruoyi.system.controller.MybetrecordController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/mybetrecord/1', '127.0.0.1', '内网IP', '[1]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-31 03:43:15', 15);
INSERT INTO `sys_oper_log` VALUES (142, '下注信息管理', 5, 'com.ruoyi.system.controller.MybetrecordController.export()', 'POST', 1, 'admin', '研发部门', '/system/mybetrecord/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2025-05-31 03:49:51', 771);
INSERT INTO `sys_oper_log` VALUES (143, '下注信息管理', 5, 'com.ruoyi.system.controller.MybetrecordController.export()', 'POST', 1, 'admin', '研发部门', '/system/mybetrecord/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2025-05-31 03:52:58', 45);
INSERT INTO `sys_oper_log` VALUES (144, '下注信息管理', 1, 'com.ruoyi.system.controller.MybetrecordController.add()', 'POST', 1, 'admin', '研发部门', '/system/mybetrecord', '127.0.0.1', '内网IP', '{\"betName\":\"连文桢\",\"betNum\":50,\"betTime\":\"2025-05-31\",\"id\":2,\"isActive\":1,\"myFbuserAccount\":\"2424\",\"myFbuserId\":1,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-31 04:24:29', 109);
INSERT INTO `sys_oper_log` VALUES (145, '处理下注记录', 2, 'com.ruoyi.system.controller.MybetrecordController.processBetRecord()', 'POST', 1, 'admin', '研发部门', '/system/mybetrecord/process', '127.0.0.1', '内网IP', '{\"betName\":\"2\",\"multiple\":2}', '{\"msg\":\"处理完成\",\"code\":200}', 0, NULL, '2025-05-31 04:55:34', 35);
INSERT INTO `sys_oper_log` VALUES (146, '下注信息管理', 2, 'com.ruoyi.system.controller.MybetrecordController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/mybetrecord', '127.0.0.1', '内网IP', '{\"betName\":\"连文桢\",\"betNum\":50,\"betTime\":\"2025-05-31\",\"id\":2,\"isActive\":1,\"myFbuserAccount\":\"2424\",\"myFbuserId\":1,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-31 04:55:43', 11);
INSERT INTO `sys_oper_log` VALUES (147, '处理下注记录', 2, 'com.ruoyi.system.controller.MybetrecordController.processBetRecord()', 'POST', 1, 'admin', '研发部门', '/system/mybetrecord/process', '127.0.0.1', '内网IP', '{\"betName\":\"连文桢\",\"multiple\":2}', '{\"msg\":\"处理完成\",\"code\":200}', 0, NULL, '2025-05-31 04:56:01', 26);
INSERT INTO `sys_oper_log` VALUES (148, '下注信息管理', 2, 'com.ruoyi.system.controller.MybetrecordController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/mybetrecord', '127.0.0.1', '内网IP', '{\"betName\":\"连文桢\",\"betNum\":50,\"betTime\":\"1970-01-08\",\"id\":2,\"isActive\":0,\"myFbuserAccount\":\"2424\",\"myFbuserId\":1,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-31 05:01:52', 10);
INSERT INTO `sys_oper_log` VALUES (149, '下注信息管理', 2, 'com.ruoyi.system.controller.MybetrecordController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/mybetrecord', '127.0.0.1', '内网IP', '{\"betName\":\"连文桢\",\"betNum\":50,\"betTime\":\"2025-05-01\",\"id\":2,\"isActive\":0,\"myFbuserAccount\":\"2424\",\"myFbuserId\":1,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-31 05:21:29', 22);
INSERT INTO `sys_oper_log` VALUES (150, '下注信息管理', 1, 'com.ruoyi.system.controller.MybetrecordController.add()', 'POST', 1, 'admin', '研发部门', '/system/mybetrecord', '127.0.0.1', '内网IP', '{\"betName\":\"123\",\"betNum\":1231,\"betTime\":\"2025-05-08\",\"isActive\":123,\"myFbuserAccount\":\"23213\",\"myFbuserId\":1,\"params\":{}}', NULL, 1, 'Invalid bound statement (not found): com.ruoyi.system.mapper.MybetrecordMapper.insertMybetrecord', '2025-05-31 13:22:41', 8);
INSERT INTO `sys_oper_log` VALUES (151, '下注信息管理', 1, 'com.ruoyi.system.controller.MybetrecordController.add()', 'POST', 1, 'admin', '研发部门', '/system/mybetrecord', '127.0.0.1', '内网IP', '{\"betName\":\"345345\",\"betNum\":45345,\"betTime\":\"2025-05-01\",\"isActive\":45345,\"myFbuserAccount\":\"4534\",\"myFbuserId\":43,\"params\":{}}', NULL, 1, 'Invalid bound statement (not found): com.ruoyi.system.mapper.MybetrecordMapper.insertMybetrecord', '2025-05-31 13:22:55', 1);
INSERT INTO `sys_oper_log` VALUES (152, '下注信息管理', 1, 'com.ruoyi.system.controller.MybetrecordController.add()', 'POST', 1, 'admin', '研发部门', '/system/mybetrecord', '127.0.0.1', '内网IP', '{\"betName\":\"345345\",\"betNum\":45345,\"betTime\":\"2025-05-01\",\"isActive\":45345,\"myFbuserAccount\":\"4534\",\"myFbuserId\":43,\"params\":{}}', NULL, 1, 'Invalid bound statement (not found): com.ruoyi.system.mapper.MybetrecordMapper.insertMybetrecord', '2025-05-31 13:22:57', 1);
INSERT INTO `sys_oper_log` VALUES (153, '下注信息管理', 1, 'com.ruoyi.system.controller.MybetrecordController.add()', 'POST', 1, 'admin', '研发部门', '/system/mybetrecord', '127.0.0.1', '内网IP', '{\"betName\":\"cy\",\"betNum\":20,\"betTime\":\"2025-05-01\",\"id\":3,\"isActive\":1,\"myFbuserAccount\":\"666\",\"myFbuserId\":1,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-31 13:28:53', 115);
INSERT INTO `sys_oper_log` VALUES (154, '处理下注记录', 2, 'com.ruoyi.system.controller.MybetrecordController.processBetRecord()', 'POST', 1, 'admin', '研发部门', '/system/mybetrecord/process', '127.0.0.1', '内网IP', '{\"betName\":\"cy\",\"multiple\":5}', '{\"msg\":\"处理完成\",\"code\":200}', 0, NULL, '2025-05-31 13:29:51', 25);
INSERT INTO `sys_oper_log` VALUES (155, '下注信息管理', 1, 'com.ruoyi.system.controller.MybetrecordController.add()', 'POST', 1, 'admin', '研发部门', '/system/mybetrecord', '127.0.0.1', '内网IP', '{\"betName\":\"1\",\"betNum\":500,\"betTime\":\"2025-05-01\",\"id\":4,\"isActive\":1,\"myFbuserAccount\":\"123\",\"myFbuserId\":1,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-31 13:31:05', 14);
INSERT INTO `sys_oper_log` VALUES (156, '处理下注记录', 2, 'com.ruoyi.system.controller.MybetrecordController.processBetRecord()', 'POST', 1, 'admin', '研发部门', '/system/mybetrecord/process', '127.0.0.1', '内网IP', '{\"betName\":\"0\",\"multiple\":50}', '{\"msg\":\"处理完成\",\"code\":200}', 0, NULL, '2025-05-31 13:31:13', 18);
INSERT INTO `sys_oper_log` VALUES (157, '下注信息管理', 3, 'com.ruoyi.system.controller.MybetrecordController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/mybetrecord/9', '127.0.0.1', '内网IP', '[9]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-02 00:08:31', 11);
INSERT INTO `sys_oper_log` VALUES (158, '下注信息管理', 1, 'com.ruoyi.system.controller.MybetrecordController.add()', 'POST', 1, 'admin', '研发部门', '/system/mybetrecord', '127.0.0.1', '内网IP', '{\"params\":{}}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1\r\n### The error may exist in file [D:\\fb\\fb\\RuoYi-Vue\\ruoyi-admin\\target\\classes\\mapper\\system\\MybetrecordMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.MybetrecordMapper.insertMybetrecord-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into mybetrecord\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1', '2025-06-02 00:23:57', 75);
INSERT INTO `sys_oper_log` VALUES (159, '下注信息管理', 1, 'com.ruoyi.system.controller.MybetrecordController.add()', 'POST', 1, 'admin', '研发部门', '/system/mybetrecord', '127.0.0.1', '内网IP', '{\"betName\":\"1\",\"betNum\":1,\"betTime\":\"2025-06-25 00:00:00\",\"id\":13,\"isActive\":1,\"myFbuserAccount\":\"1\",\"myFbuserId\":1,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-02 00:34:22', 119);
INSERT INTO `sys_oper_log` VALUES (160, '下注信息管理', 1, 'com.ruoyi.system.controller.MybetrecordController.add()', 'POST', 1, 'admin', '研发部门', '/system/mybetrecord', '127.0.0.1', '内网IP', '{\"betName\":\"1\",\"betNum\":1,\"betTime\":\"2025-06-10 00:34:34\",\"id\":14,\"isActive\":1,\"myFbuserAccount\":\"666\",\"myFbuserId\":666,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-02 00:34:49', 4);
INSERT INTO `sys_oper_log` VALUES (161, '下注信息管理', 2, 'com.ruoyi.system.controller.MybetrecordController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/mybetrecord', '127.0.0.1', '内网IP', '{\"betName\":\"1\",\"betNum\":1,\"betTime\":\"2025-06-10 00:32:34\",\"id\":14,\"isActive\":1,\"myFbuserAccount\":\"666\",\"myFbuserId\":666,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-02 00:35:12', 9);
INSERT INTO `sys_oper_log` VALUES (162, '投注积分用户管理', 2, 'com.ruoyi.system.controller.MyfbuserController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/myfbuser', '127.0.0.1', '内网IP', '{\"account\":\"4Dc6heoglu\",\"id\":1,\"name\":\"Sheh Siu Wai\",\"params\":{},\"points\":1350}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-02 01:15:39', 17);
INSERT INTO `sys_oper_log` VALUES (163, '处理下注记录', 2, 'com.ruoyi.system.controller.MybetrecordController.processBetRecord()', 'POST', 1, 'admin', '研发部门', '/system/mybetrecord/process', '127.0.0.1', '内网IP', '{\"betName\":\"葫芦\",\"multiple\":3}', '{\"msg\":\"处理完成\",\"code\":200}', 0, NULL, '2025-06-02 01:18:06', 74);
INSERT INTO `sys_oper_log` VALUES (164, '投注积分用户管理', 2, 'com.ruoyi.system.controller.MyfbuserController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/myfbuser', '127.0.0.1', '内网IP', '{\"account\":\"4Dc6heoglu\",\"id\":1,\"name\":\"Sheh Siu Wai\",\"params\":{},\"points\":200}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-02 01:33:42', 4);
INSERT INTO `sys_oper_log` VALUES (165, '处理下注记录', 2, 'com.ruoyi.system.controller.MybetrecordController.processBetRecord()', 'POST', 1, 'admin', '研发部门', '/system/mybetrecord/process', '127.0.0.1', '内网IP', '{\"betName\":\"鹿\",\"multiple\":2}', '{\"msg\":\"处理完成\",\"code\":200}', 0, NULL, '2025-06-02 01:39:25', 11);
INSERT INTO `sys_oper_log` VALUES (166, '投注积分用户管理', 2, 'com.ruoyi.system.controller.MyfbuserController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/myfbuser', '127.0.0.1', '内网IP', '{\"account\":\"4Dc6heoglu\",\"id\":1,\"name\":\"Sheh Siu Wai\",\"params\":{},\"points\":500}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-02 15:34:58', 25);
INSERT INTO `sys_oper_log` VALUES (167, '直播链接管理', 3, 'com.ruoyi.system.controller.MyfbwebController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/myfbweb/1', '127.0.0.1', '内网IP', '[1]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-02 21:34:55', 23);
INSERT INTO `sys_oper_log` VALUES (168, '直播链接管理', 5, 'com.ruoyi.system.controller.MyfbwebController.export()', 'POST', 1, 'admin', '研发部门', '/system/myfbweb/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2025-06-02 21:35:11', 1072);
INSERT INTO `sys_oper_log` VALUES (169, '投注积分用户管理', 2, 'com.ruoyi.system.controller.MyfbuserController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/myfbuser', '127.0.0.1', '内网IP', '{\"account\":\"test\",\"id\":1,\"name\":\"Sheh Siu Wai\",\"params\":{},\"points\":990}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-02 21:36:04', 6);
INSERT INTO `sys_oper_log` VALUES (170, '投注积分用户管理', 1, 'com.ruoyi.system.controller.MyfbuserController.add()', 'POST', 1, 'admin', '研发部门', '/system/myfbuser', '127.0.0.1', '内网IP', '{\"account\":\"20250602\",\"name\":\"test\",\"params\":{},\"points\":10000}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-02 21:36:43', 4);
INSERT INTO `sys_oper_log` VALUES (171, '处理下注记录', 2, 'com.ruoyi.system.controller.MybetrecordController.processBetRecord()', 'POST', 1, 'admin', '研发部门', '/system/mybetrecord/process', '127.0.0.1', '内网IP', '{\"betName\":\"熊\",\"multiple\":2}', '{\"msg\":\"处理完成\",\"code\":200}', 0, NULL, '2025-06-02 21:38:04', 28);
INSERT INTO `sys_oper_log` VALUES (172, '处理下注记录', 2, 'com.ruoyi.system.controller.MybetrecordController.processBetRecord()', 'POST', 1, 'admin', '研发部门', '/system/mybetrecord/process', '127.0.0.1', '内网IP', '{\"betName\":\"鹿\",\"multiple\":2}', '{\"msg\":\"处理完成\",\"code\":200}', 0, NULL, '2025-06-02 21:38:25', 16);

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '岗位信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2025-05-30 17:29:14', '', NULL, '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2025-05-30 17:29:14', '', NULL, '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2025-05-30 17:29:14', '', NULL, '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2025-05-30 17:29:14', '', NULL, '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '角色信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2025-05-30 17:29:14', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', 1, 1, '0', '0', 'admin', '2025-05-30 17:29:14', '', NULL, '普通角色');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `dept_id` bigint NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '角色和部门关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (2, 100);
INSERT INTO `sys_role_dept` VALUES (2, 101);
INSERT INTO `sys_role_dept` VALUES (2, 105);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2);
INSERT INTO `sys_role_menu` VALUES (2, 3);
INSERT INTO `sys_role_menu` VALUES (2, 4);
INSERT INTO `sys_role_menu` VALUES (2, 100);
INSERT INTO `sys_role_menu` VALUES (2, 101);
INSERT INTO `sys_role_menu` VALUES (2, 102);
INSERT INTO `sys_role_menu` VALUES (2, 103);
INSERT INTO `sys_role_menu` VALUES (2, 104);
INSERT INTO `sys_role_menu` VALUES (2, 105);
INSERT INTO `sys_role_menu` VALUES (2, 106);
INSERT INTO `sys_role_menu` VALUES (2, 107);
INSERT INTO `sys_role_menu` VALUES (2, 108);
INSERT INTO `sys_role_menu` VALUES (2, 109);
INSERT INTO `sys_role_menu` VALUES (2, 110);
INSERT INTO `sys_role_menu` VALUES (2, 111);
INSERT INTO `sys_role_menu` VALUES (2, 112);
INSERT INTO `sys_role_menu` VALUES (2, 113);
INSERT INTO `sys_role_menu` VALUES (2, 114);
INSERT INTO `sys_role_menu` VALUES (2, 115);
INSERT INTO `sys_role_menu` VALUES (2, 116);
INSERT INTO `sys_role_menu` VALUES (2, 117);
INSERT INTO `sys_role_menu` VALUES (2, 500);
INSERT INTO `sys_role_menu` VALUES (2, 501);
INSERT INTO `sys_role_menu` VALUES (2, 1000);
INSERT INTO `sys_role_menu` VALUES (2, 1001);
INSERT INTO `sys_role_menu` VALUES (2, 1002);
INSERT INTO `sys_role_menu` VALUES (2, 1003);
INSERT INTO `sys_role_menu` VALUES (2, 1004);
INSERT INTO `sys_role_menu` VALUES (2, 1005);
INSERT INTO `sys_role_menu` VALUES (2, 1006);
INSERT INTO `sys_role_menu` VALUES (2, 1007);
INSERT INTO `sys_role_menu` VALUES (2, 1008);
INSERT INTO `sys_role_menu` VALUES (2, 1009);
INSERT INTO `sys_role_menu` VALUES (2, 1010);
INSERT INTO `sys_role_menu` VALUES (2, 1011);
INSERT INTO `sys_role_menu` VALUES (2, 1012);
INSERT INTO `sys_role_menu` VALUES (2, 1013);
INSERT INTO `sys_role_menu` VALUES (2, 1014);
INSERT INTO `sys_role_menu` VALUES (2, 1015);
INSERT INTO `sys_role_menu` VALUES (2, 1016);
INSERT INTO `sys_role_menu` VALUES (2, 1017);
INSERT INTO `sys_role_menu` VALUES (2, 1018);
INSERT INTO `sys_role_menu` VALUES (2, 1019);
INSERT INTO `sys_role_menu` VALUES (2, 1020);
INSERT INTO `sys_role_menu` VALUES (2, 1021);
INSERT INTO `sys_role_menu` VALUES (2, 1022);
INSERT INTO `sys_role_menu` VALUES (2, 1023);
INSERT INTO `sys_role_menu` VALUES (2, 1024);
INSERT INTO `sys_role_menu` VALUES (2, 1025);
INSERT INTO `sys_role_menu` VALUES (2, 1026);
INSERT INTO `sys_role_menu` VALUES (2, 1027);
INSERT INTO `sys_role_menu` VALUES (2, 1028);
INSERT INTO `sys_role_menu` VALUES (2, 1029);
INSERT INTO `sys_role_menu` VALUES (2, 1030);
INSERT INTO `sys_role_menu` VALUES (2, 1031);
INSERT INTO `sys_role_menu` VALUES (2, 1032);
INSERT INTO `sys_role_menu` VALUES (2, 1033);
INSERT INTO `sys_role_menu` VALUES (2, 1034);
INSERT INTO `sys_role_menu` VALUES (2, 1035);
INSERT INTO `sys_role_menu` VALUES (2, 1036);
INSERT INTO `sys_role_menu` VALUES (2, 1037);
INSERT INTO `sys_role_menu` VALUES (2, 1038);
INSERT INTO `sys_role_menu` VALUES (2, 1039);
INSERT INTO `sys_role_menu` VALUES (2, 1040);
INSERT INTO `sys_role_menu` VALUES (2, 1041);
INSERT INTO `sys_role_menu` VALUES (2, 1042);
INSERT INTO `sys_role_menu` VALUES (2, 1043);
INSERT INTO `sys_role_menu` VALUES (2, 1044);
INSERT INTO `sys_role_menu` VALUES (2, 1045);
INSERT INTO `sys_role_menu` VALUES (2, 1046);
INSERT INTO `sys_role_menu` VALUES (2, 1047);
INSERT INTO `sys_role_menu` VALUES (2, 1048);
INSERT INTO `sys_role_menu` VALUES (2, 1049);
INSERT INTO `sys_role_menu` VALUES (2, 1050);
INSERT INTO `sys_role_menu` VALUES (2, 1051);
INSERT INTO `sys_role_menu` VALUES (2, 1052);
INSERT INTO `sys_role_menu` VALUES (2, 1053);
INSERT INTO `sys_role_menu` VALUES (2, 1054);
INSERT INTO `sys_role_menu` VALUES (2, 1055);
INSERT INTO `sys_role_menu` VALUES (2, 1056);
INSERT INTO `sys_role_menu` VALUES (2, 1057);
INSERT INTO `sys_role_menu` VALUES (2, 1058);
INSERT INTO `sys_role_menu` VALUES (2, 1059);
INSERT INTO `sys_role_menu` VALUES (2, 1060);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '0' COMMENT '账号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  `pwd_update_date` datetime NULL DEFAULT NULL COMMENT '密码最后更新时间',
  `create_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 101 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '用户信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '若依', '00', 'ry@163.com', '15888888888', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2025-06-02 21:32:26', '2025-05-30 17:29:14', 'admin', '2025-05-30 17:29:14', '', '2025-06-02 21:32:25', '管理员');
INSERT INTO `sys_user` VALUES (2, 105, 'ry', '若依', '00', 'ry@qq.com', '15666666666', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2025-05-30 17:29:14', '2025-05-30 17:29:14', 'admin', '2025-05-30 17:29:14', '', NULL, '测试员');
INSERT INTO `sys_user` VALUES (100, NULL, 'test', 'test', '00', '', '', '0', '', '$2a$10$S6Z.3O4Du73ZzbueMRqzhuZgWRH6EXwl8/DGcMSXreY2leSb6xitK', '0', '0', '127.0.0.1', '2025-05-30 20:34:50', '2025-05-30 18:22:16', '', '2025-05-30 18:22:16', '', '2025-05-30 20:34:49', NULL);

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `post_id` bigint NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (2, 2);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '用户和角色关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);

SET FOREIGN_KEY_CHECKS = 1;
