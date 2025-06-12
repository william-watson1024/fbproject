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

 Date: 12/06/2025 21:02:14
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for fb_game_info
-- ----------------------------
DROP TABLE IF EXISTS `fb_game_info`;
CREATE TABLE `fb_game_info`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '游戏ID',
  `game_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '游戏名称',
  `game_host` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '游戏主播',
  `live_stream_id` int NOT NULL COMMENT '房间号',
  `game_round` int NOT NULL COMMENT '当前局号',
  `result` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '开奖结果',
  `game_status` enum('投注中','封盘','已开奖','已结算') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '投注中' COMMENT '游戏状态',
  `game_serial_number` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '游戏局流水号',
  `start_time` datetime NOT NULL COMMENT '开局时间',
  `close_time` datetime NULL DEFAULT NULL COMMENT '实际封盘时间',
  `end_time` datetime NULL DEFAULT NULL COMMENT '结算时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of fb_game_info
-- ----------------------------
INSERT INTO `fb_game_info` VALUES (2, 'testgame', 'testhost', 1, 2, '鱼', '封盘', '00012', '2025-06-12 20:07:21', '2025-06-12 20:42:58', '2025-06-12 20:15:35');
INSERT INTO `fb_game_info` VALUES (3, 'etete', 'testhost', 1, 3, '鱼', '封盘', '00013', '2025-06-12 20:20:42', '2025-06-12 20:20:43', '2025-06-12 20:20:44');

-- ----------------------------
-- Table structure for fb_game_record
-- ----------------------------
DROP TABLE IF EXISTS `fb_game_record`;
CREATE TABLE `fb_game_record`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '下注ID',
  `game_user_id` int NOT NULL COMMENT '下注用户ID',
  `game_user_account` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '下注用户账号',
  `live_stream_id` int NOT NULL COMMENT '直播房间ID',
  `game_type` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '游戏类型',
  `game_round` int NOT NULL COMMENT '游戏局号',
  `bet_num` int NOT NULL COMMENT '下注金额',
  `bet_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '下注名称',
  `bet_content` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '投注内容',
  `is_active` int NOT NULL DEFAULT 0 COMMENT '下注状态',
  `bet_time` datetime NOT NULL COMMENT '下注时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of fb_game_record
-- ----------------------------
INSERT INTO `fb_game_record` VALUES (1, 6, 'test1123', 1, '1', 1, 10, '鹿', '鹿', 0, '2025-06-12 15:51:50');
INSERT INTO `fb_game_record` VALUES (2, 6, 'test1123', 1, '1', 1, 10, '鱼', '鱼', 0, '2025-06-12 15:58:07');
INSERT INTO `fb_game_record` VALUES (3, 1, '1', 1, '1', 1, 1, '1', '1', 0, '2025-06-12 15:59:50');
INSERT INTO `fb_game_record` VALUES (4, 1, '1', 1, '1', 1, 1, '1', '鹿', 0, '2025-06-12 16:01:06');
INSERT INTO `fb_game_record` VALUES (5, 6, 'test1123', 1, '1', 1, 10, '鹿', '鹿', 0, '2025-06-12 20:03:21');
INSERT INTO `fb_game_record` VALUES (6, 6, 'test1123', 1, '1', 1, 100, '鱼', '鱼', 0, '2025-06-12 20:04:27');
INSERT INTO `fb_game_record` VALUES (7, 6, 'test1123', 1, '1', 1, 30, '鸡', '鸡', 0, '2025-06-12 20:04:54');
INSERT INTO `fb_game_record` VALUES (8, 6, 'test1123', 1, '1', 2, 10, '鹿', '鹿', 0, '2025-06-12 20:14:40');
INSERT INTO `fb_game_record` VALUES (9, 6, 'test1123', 1, '1', 2, 10, '葫芦', '葫芦', 0, '2025-06-12 20:33:30');
INSERT INTO `fb_game_record` VALUES (10, 6, 'test1123', 1, '1', 2, 10, '葫芦', '葫芦', 0, '2025-06-12 20:33:59');

-- ----------------------------
-- Table structure for fb_game_user
-- ----------------------------
DROP TABLE IF EXISTS `fb_game_user`;
CREATE TABLE `fb_game_user`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `account` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '用户账号',
  `password` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '用户密码',
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '用户名',
  `points` int NULL DEFAULT 0 COMMENT '用户积分',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of fb_game_user
-- ----------------------------
INSERT INTO `fb_game_user` VALUES (3, '1', '1', '1', 21);
INSERT INTO `fb_game_user` VALUES (4, '2', '2', '2', 2);
INSERT INTO `fb_game_user` VALUES (5, 'test11', 'test11', 'test', 0);
INSERT INTO `fb_game_user` VALUES (6, 'test1123', 'test1123', 'test1123', 9980);

-- ----------------------------
-- Table structure for fb_live_stream
-- ----------------------------
DROP TABLE IF EXISTS `fb_live_stream`;
CREATE TABLE `fb_live_stream`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '直播ID',
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '直播名称',
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT '直播描述',
  `url` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '直播链接',
  `is_active` tinyint(1) NULL DEFAULT 1 COMMENT '直播状态',
  `game_type` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '游戏类型',
  `game_host` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '游戏主播名称',
  `game_start_time` datetime NULL DEFAULT NULL COMMENT '游戏开始时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of fb_live_stream
-- ----------------------------
INSERT INTO `fb_live_stream` VALUES (1, 'test', '1', 'https://www.321zb.co/live/1788', 1, '1', 'testhost', '2025-06-11 14:27:16');

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
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '代码生成业务表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (14, 'fb_game_info', '游戏信息表', NULL, NULL, 'FbGameInfo', 'crud', 'element-ui', 'com.ruoyi.system', 'system', 'gameInfo', '游戏信息管理', 'leo', '0', '/', '{\"parentMenuId\":2022}', 'admin', '2025-06-06 19:09:18', '', '2025-06-06 19:37:09', NULL);
INSERT INTO `gen_table` VALUES (15, 'fb_game_record', '游戏记录表', NULL, NULL, 'FbGameRecord', 'crud', 'element-ui', 'com.ruoyi.system', 'system', 'gameRecord', '游戏记录管理', 'leo', '0', '/', '{\"parentMenuId\":2022}', 'admin', '2025-06-06 19:09:18', '', '2025-06-06 19:39:45', NULL);
INSERT INTO `gen_table` VALUES (16, 'fb_game_user', '游戏用户表', NULL, NULL, 'FbGameUser', 'crud', 'element-ui', 'com.ruoyi.system', 'system', 'gameUser', '游戏用户管理', 'leo', '0', '/', '{\"parentMenuId\":2022}', 'admin', '2025-06-06 19:09:18', '', '2025-06-06 19:52:18', NULL);
INSERT INTO `gen_table` VALUES (17, 'fb_live_stream', '直播网站表', NULL, NULL, 'FbLiveStream', 'crud', 'element-ui', 'com.ruoyi.system', 'system', 'liveStream', '直播网站管理', 'leo', '0', '/', '{\"parentMenuId\":2022}', 'admin', '2025-06-06 19:09:18', '', '2025-06-06 19:52:28', NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 121 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (86, 14, 'id', '游戏ID', 'int', 'Long', 'id', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-06-06 19:09:18', '', '2025-06-06 19:37:09');
INSERT INTO `gen_table_column` VALUES (87, 14, 'game_name', '游戏名称', 'varchar(255)', 'String', 'gameName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2025-06-06 19:09:18', '', '2025-06-06 19:37:09');
INSERT INTO `gen_table_column` VALUES (88, 14, 'game_host', '游戏主播', 'varchar(255)', 'String', 'gameHost', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2025-06-06 19:09:18', '', '2025-06-06 19:37:09');
INSERT INTO `gen_table_column` VALUES (89, 14, 'live_stream_id', '房间号', 'int', 'Long', 'liveStreamId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2025-06-06 19:09:18', '', '2025-06-06 19:37:09');
INSERT INTO `gen_table_column` VALUES (90, 14, 'game_round', '当前局号', 'int', 'Long', 'gameRound', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2025-06-06 19:09:18', '', '2025-06-06 19:37:09');
INSERT INTO `gen_table_column` VALUES (91, 14, 'result', '开奖结果', 'varchar(255)', 'String', 'result', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2025-06-06 19:09:18', '', '2025-06-06 19:37:09');
INSERT INTO `gen_table_column` VALUES (92, 14, 'game_status', '游戏状态', 'enum(\'投注中\',\'封盘\',\'已开奖\',\'已结算\')', 'String', 'gameStatus', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', '', 7, 'admin', '2025-06-06 19:09:18', '', '2025-06-06 19:37:09');
INSERT INTO `gen_table_column` VALUES (93, 14, 'game_serial_number', '游戏局流水号', 'varchar(50)', 'String', 'gameSerialNumber', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2025-06-06 19:09:18', '', '2025-06-06 19:37:09');
INSERT INTO `gen_table_column` VALUES (94, 14, 'start_time', '开局时间', 'datetime', 'Date', 'startTime', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', 9, 'admin', '2025-06-06 19:09:18', '', '2025-06-06 19:37:09');
INSERT INTO `gen_table_column` VALUES (95, 14, 'close_time', '实际封盘时间', 'datetime', 'Date', 'closeTime', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'datetime', '', 10, 'admin', '2025-06-06 19:09:18', '', '2025-06-06 19:37:09');
INSERT INTO `gen_table_column` VALUES (96, 14, 'end_time', '结算时间', 'datetime', 'Date', 'endTime', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'datetime', '', 11, 'admin', '2025-06-06 19:09:18', '', '2025-06-06 19:37:09');
INSERT INTO `gen_table_column` VALUES (97, 15, 'id', '下注ID', 'int', 'Long', 'id', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-06-06 19:09:18', '', '2025-06-06 19:39:45');
INSERT INTO `gen_table_column` VALUES (98, 15, 'game_user_id', '下注用户ID', 'int', 'Long', 'gameUserId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2025-06-06 19:09:18', '', '2025-06-06 19:39:45');
INSERT INTO `gen_table_column` VALUES (99, 15, 'game_user_account', '下注用户账号', 'varchar(255)', 'String', 'gameUserAccount', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2025-06-06 19:09:18', '', '2025-06-06 19:39:45');
INSERT INTO `gen_table_column` VALUES (100, 15, 'live_stream_id', '直播房间ID', 'int', 'Long', 'liveStreamId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2025-06-06 19:09:18', '', '2025-06-06 19:39:45');
INSERT INTO `gen_table_column` VALUES (101, 15, 'game_type', '游戏类型', 'varchar(255)', 'String', 'gameType', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', '', 5, 'admin', '2025-06-06 19:09:18', '', '2025-06-06 19:39:45');
INSERT INTO `gen_table_column` VALUES (102, 15, 'game_round', '游戏局号', 'int', 'Long', 'gameRound', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2025-06-06 19:09:18', '', '2025-06-06 19:39:45');
INSERT INTO `gen_table_column` VALUES (103, 15, 'bet_num', '下注金额', 'int', 'Long', 'betNum', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2025-06-06 19:09:18', '', '2025-06-06 19:39:45');
INSERT INTO `gen_table_column` VALUES (104, 15, 'bet_name', '下注名称', 'varchar(255)', 'String', 'betName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 8, 'admin', '2025-06-06 19:09:18', '', '2025-06-06 19:39:45');
INSERT INTO `gen_table_column` VALUES (105, 15, 'bet_content', '投注内容', 'text', 'String', 'betContent', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'editor', '', 9, 'admin', '2025-06-06 19:09:18', '', '2025-06-06 19:39:45');
INSERT INTO `gen_table_column` VALUES (106, 15, 'is_active', '下注状态', 'int', 'Long', 'isActive', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', '', 10, 'admin', '2025-06-06 19:09:18', '', '2025-06-06 19:39:45');
INSERT INTO `gen_table_column` VALUES (107, 15, 'bet_time', '下注时间', 'datetime', 'Date', 'betTime', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', 11, 'admin', '2025-06-06 19:09:18', '', '2025-06-06 19:39:45');
INSERT INTO `gen_table_column` VALUES (108, 16, 'id', '用户ID', 'int', 'Long', 'id', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-06-06 19:09:18', '', '2025-06-06 19:52:18');
INSERT INTO `gen_table_column` VALUES (109, 16, 'account', '用户账号', 'varchar(255)', 'String', 'account', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2025-06-06 19:09:18', '', '2025-06-06 19:52:18');
INSERT INTO `gen_table_column` VALUES (110, 16, 'password', '用户密码', 'varchar(255)', 'String', 'password', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2025-06-06 19:09:18', '', '2025-06-06 19:52:18');
INSERT INTO `gen_table_column` VALUES (111, 16, 'name', '用户名', 'varchar(255)', 'String', 'name', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 4, 'admin', '2025-06-06 19:09:18', '', '2025-06-06 19:52:18');
INSERT INTO `gen_table_column` VALUES (112, 16, 'points', '用户积分', 'int', 'Long', 'points', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2025-06-06 19:09:18', '', '2025-06-06 19:52:18');
INSERT INTO `gen_table_column` VALUES (113, 17, 'id', '直播ID', 'int', 'Long', 'id', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-06-06 19:09:18', '', '2025-06-06 19:52:28');
INSERT INTO `gen_table_column` VALUES (114, 17, 'name', '直播名称', 'varchar(255)', 'String', 'name', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2025-06-06 19:09:18', '', '2025-06-06 19:52:28');
INSERT INTO `gen_table_column` VALUES (115, 17, 'description', '直播描述', 'text', 'String', 'description', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'textarea', '', 3, 'admin', '2025-06-06 19:09:18', '', '2025-06-06 19:52:28');
INSERT INTO `gen_table_column` VALUES (116, 17, 'url', '直播链接', 'varchar(500)', 'String', 'url', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'textarea', '', 4, 'admin', '2025-06-06 19:09:18', '', '2025-06-06 19:52:28');
INSERT INTO `gen_table_column` VALUES (117, 17, 'is_active', '直播状态', 'tinyint(1)', 'Integer', 'isActive', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2025-06-06 19:09:18', '', '2025-06-06 19:52:28');
INSERT INTO `gen_table_column` VALUES (118, 17, 'game_type', '游戏类型', 'varchar(255)', 'String', 'gameType', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'select', '', 6, 'admin', '2025-06-06 19:09:18', '', '2025-06-06 19:52:28');
INSERT INTO `gen_table_column` VALUES (119, 17, 'game_host', '游戏主播名称', 'varchar(255)', 'String', 'gameHost', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2025-06-06 19:09:18', '', '2025-06-06 19:52:28');
INSERT INTO `gen_table_column` VALUES (120, 17, 'game_start_time', '游戏开始时间', 'datetime', 'Date', 'gameStartTime', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'datetime', '', 8, 'admin', '2025-06-06 19:09:18', '', '2025-06-06 19:52:28');

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
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 140 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '系统访问记录' ROW_FORMAT = DYNAMIC;

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
INSERT INTO `sys_logininfor` VALUES (128, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-06-02 01:55:17');
INSERT INTO `sys_logininfor` VALUES (129, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '验证码已失效', '2025-06-06 19:03:24');
INSERT INTO `sys_logininfor` VALUES (130, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '验证码错误', '2025-06-06 19:03:26');
INSERT INTO `sys_logininfor` VALUES (131, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-06-06 19:03:29');
INSERT INTO `sys_logininfor` VALUES (132, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-06-06 19:51:52');
INSERT INTO `sys_logininfor` VALUES (133, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '验证码错误', '2025-06-06 18:13:13');
INSERT INTO `sys_logininfor` VALUES (134, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-06-06 18:13:15');
INSERT INTO `sys_logininfor` VALUES (135, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-06-06 18:31:44');
INSERT INTO `sys_logininfor` VALUES (136, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-06-06 18:44:12');
INSERT INTO `sys_logininfor` VALUES (137, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-06-06 18:44:16');
INSERT INTO `sys_logininfor` VALUES (138, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2025-06-12 15:23:19');
INSERT INTO `sys_logininfor` VALUES (139, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2025-06-12 20:00:50');

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
) ENGINE = InnoDB AUTO_INCREMENT = 2089 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '菜单权限表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, 'system', NULL, '', '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2025-05-30 17:29:14', '', NULL, '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 2, 'monitor', NULL, '', '', 1, 0, 'M', '0', '0', '', 'monitor', 'admin', '2025-05-30 17:29:14', '', NULL, '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 3, 'tool', NULL, '', '', 1, 0, 'M', '0', '0', '', 'tool', 'admin', '2025-05-30 17:29:14', '', NULL, '系统工具目录');
INSERT INTO `sys_menu` VALUES (4, '若依官网', 0, 4, 'http://ruoyi.vip', NULL, '', '', 0, 0, 'M', '1', '0', '', 'guide', 'admin', '2025-05-30 17:29:14', 'admin', '2025-06-06 18:16:30', '若依官网地址');
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
INSERT INTO `sys_menu` VALUES (2065, '游戏信息管理', 2022, 1, 'gameInfo', 'system/gameInfo/index', NULL, '', 1, 0, 'C', '0', '0', 'system:gameInfo:list', '#', 'admin', '2025-06-06 19:20:54', '', NULL, '游戏信息管理菜单');
INSERT INTO `sys_menu` VALUES (2066, '游戏信息管理查询', 2065, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:gameInfo:query', '#', 'admin', '2025-06-06 19:20:54', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2067, '游戏信息管理新增', 2065, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:gameInfo:add', '#', 'admin', '2025-06-06 19:20:54', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2068, '游戏信息管理修改', 2065, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:gameInfo:edit', '#', 'admin', '2025-06-06 19:20:54', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2069, '游戏信息管理删除', 2065, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:gameInfo:remove', '#', 'admin', '2025-06-06 19:20:54', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2070, '游戏信息管理导出', 2065, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:gameInfo:export', '#', 'admin', '2025-06-06 19:20:54', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2071, '游戏用户管理', 2022, 1, 'gameUser', 'system/gameUser/index', NULL, '', 1, 0, 'C', '0', '0', 'system:gameUser:list', '#', 'admin', '2025-06-06 19:53:40', '', NULL, '游戏用户管理菜单');
INSERT INTO `sys_menu` VALUES (2072, '游戏用户管理查询', 2071, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:gameUser:query', '#', 'admin', '2025-06-06 19:53:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2073, '游戏用户管理新增', 2071, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:gameUser:add', '#', 'admin', '2025-06-06 19:53:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2074, '游戏用户管理修改', 2071, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:gameUser:edit', '#', 'admin', '2025-06-06 19:53:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2075, '游戏用户管理删除', 2071, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:gameUser:remove', '#', 'admin', '2025-06-06 19:53:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2076, '游戏用户管理导出', 2071, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:gameUser:export', '#', 'admin', '2025-06-06 19:53:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2077, '游戏记录管理', 2022, 1, 'gameRecord', 'system/gameRecord/index', NULL, '', 1, 0, 'C', '0', '0', 'system:gameRecord:list', '#', 'admin', '2025-06-06 19:53:49', '', NULL, '游戏记录管理菜单');
INSERT INTO `sys_menu` VALUES (2078, '游戏记录管理查询', 2077, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:gameRecord:query', '#', 'admin', '2025-06-06 19:53:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2079, '游戏记录管理新增', 2077, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:gameRecord:add', '#', 'admin', '2025-06-06 19:53:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2080, '游戏记录管理修改', 2077, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:gameRecord:edit', '#', 'admin', '2025-06-06 19:53:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2081, '游戏记录管理删除', 2077, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:gameRecord:remove', '#', 'admin', '2025-06-06 19:53:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2082, '游戏记录管理导出', 2077, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:gameRecord:export', '#', 'admin', '2025-06-06 19:53:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2083, '直播网站管理', 2022, 1, 'liveStream', 'system/liveStream/index', NULL, '', 1, 0, 'C', '0', '0', 'system:liveStream:list', '#', 'admin', '2025-06-06 19:54:06', '', NULL, '直播网站管理菜单');
INSERT INTO `sys_menu` VALUES (2084, '直播网站管理查询', 2083, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:liveStream:query', '#', 'admin', '2025-06-06 19:54:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2085, '直播网站管理新增', 2083, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:liveStream:add', '#', 'admin', '2025-06-06 19:54:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2086, '直播网站管理修改', 2083, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:liveStream:edit', '#', 'admin', '2025-06-06 19:54:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2087, '直播网站管理删除', 2083, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:liveStream:remove', '#', 'admin', '2025-06-06 19:54:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2088, '直播网站管理导出', 2083, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:liveStream:export', '#', 'admin', '2025-06-06 19:54:06', '', NULL, '');

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
) ENGINE = InnoDB AUTO_INCREMENT = 219 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '操作日志记录' ROW_FORMAT = DYNAMIC;

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
INSERT INTO `sys_oper_log` VALUES (157, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', '研发部门', '/tool/gen/9', '127.0.0.1', '内网IP', '[9]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-06 19:03:47', 34);
INSERT INTO `sys_oper_log` VALUES (158, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', '研发部门', '/tool/gen/5', '127.0.0.1', '内网IP', '[5]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-06 19:03:49', 11);
INSERT INTO `sys_oper_log` VALUES (159, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', '研发部门', '/tool/gen/6', '127.0.0.1', '内网IP', '[6]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-06 19:03:50', 10);
INSERT INTO `sys_oper_log` VALUES (160, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"fb_game_record,fb_game_info,fb_live_stream,fb_game_user\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-06 19:04:18', 123);
INSERT INTO `sys_oper_log` VALUES (161, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', '研发部门', '/tool/gen/10,11,12,13', '127.0.0.1', '内网IP', '[10,11,12,13]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-06 19:07:53', 10);
INSERT INTO `sys_oper_log` VALUES (162, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"fb_live_stream,fb_game_info,fb_game_record,fb_game_user\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-06 19:09:18', 81);
INSERT INTO `sys_oper_log` VALUES (163, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"gameInfo\",\"className\":\"FbGameInfo\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"游戏ID\",\"columnId\":86,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-06-06 19:09:18\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":14,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"GameName\",\"columnComment\":\"游戏名称\",\"columnId\":87,\"columnName\":\"game_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-06-06 19:09:18\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"gameName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":14,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"GameHost\",\"columnComment\":\"游戏主播\",\"columnId\":88,\"columnName\":\"game_host\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-06-06 19:09:18\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"gameHost\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":14,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"LiveStreamId\",\"columnComment\":\"房间号\",\"columnId\":89,\"columnName\":\"live_stream_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-06-06 19:09:18\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-06 19:19:23', 39);
INSERT INTO `sys_oper_log` VALUES (164, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"fb_game_info\"}', NULL, 0, NULL, '2025-06-06 19:19:34', 164);
INSERT INTO `sys_oper_log` VALUES (165, '游戏信息管理', 1, 'com.ruoyi.system.controller.FbGameInfoController.add()', 'POST', 1, 'admin', '研发部门', '/system/gameInfo', '127.0.0.1', '内网IP', '{\"closeTime\":\"2025-06-06\",\"endTime\":\"2025-06-06\",\"gameHost\":\"1\",\"gameName\":\"1\",\"gameRound\":1,\"gameSerialNumber\":\"1\",\"gameStatus\":\"Y\",\"liveStreamId\":1,\"params\":{},\"result\":\"1\",\"startTime\":\"2025-06-06\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Data truncated for column \'game_status\' at row 1\r\n### The error may exist in file [D:\\fbproject\\admin\\ruoyi-admin\\target\\classes\\mapper\\system\\FbGameInfoMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.FbGameInfoMapper.insertFbGameInfo-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into fb_game_info          ( game_name,             game_host,             live_stream_id,             game_round,             result,             game_status,             game_serial_number,             start_time,             close_time,             end_time )           values ( ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ? )\r\n### Cause: java.sql.SQLException: Data truncated for column \'game_status\' at row 1\n; Data truncated for column \'game_status\' at row 1; nested exception is java.sql.SQLException: Data truncated for column \'game_status\' at row 1', '2025-06-06 19:28:32', 15);
INSERT INTO `sys_oper_log` VALUES (166, '游戏信息管理', 1, 'com.ruoyi.system.controller.FbGameInfoController.add()', 'POST', 1, 'admin', '研发部门', '/system/gameInfo', '127.0.0.1', '内网IP', '{\"closeTime\":\"2025-06-06\",\"endTime\":\"2025-06-06\",\"gameHost\":\"1\",\"gameName\":\"1\",\"gameRound\":1,\"gameSerialNumber\":\"1\",\"gameStatus\":\"Y\",\"liveStreamId\":1,\"params\":{},\"result\":\"1\",\"startTime\":\"2025-06-06\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Data truncated for column \'game_status\' at row 1\r\n### The error may exist in file [D:\\fbproject\\admin\\ruoyi-admin\\target\\classes\\mapper\\system\\FbGameInfoMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.FbGameInfoMapper.insertFbGameInfo-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into fb_game_info          ( game_name,             game_host,             live_stream_id,             game_round,             result,             game_status,             game_serial_number,             start_time,             close_time,             end_time )           values ( ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ? )\r\n### Cause: java.sql.SQLException: Data truncated for column \'game_status\' at row 1\n; Data truncated for column \'game_status\' at row 1; nested exception is java.sql.SQLException: Data truncated for column \'game_status\' at row 1', '2025-06-06 19:28:36', 3);
INSERT INTO `sys_oper_log` VALUES (167, '游戏信息管理', 1, 'com.ruoyi.system.controller.FbGameInfoController.add()', 'POST', 1, 'admin', '研发部门', '/system/gameInfo', '127.0.0.1', '内网IP', '{\"closeTime\":\"2025-06-06\",\"endTime\":\"2025-06-06\",\"gameHost\":\"1\",\"gameName\":\"1\",\"gameRound\":1,\"gameSerialNumber\":\"1\",\"gameStatus\":\"Y\",\"liveStreamId\":1,\"params\":{},\"result\":\"1\",\"startTime\":\"2025-06-06\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Data truncated for column \'game_status\' at row 1\r\n### The error may exist in file [D:\\fbproject\\admin\\ruoyi-admin\\target\\classes\\mapper\\system\\FbGameInfoMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.FbGameInfoMapper.insertFbGameInfo-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into fb_game_info          ( game_name,             game_host,             live_stream_id,             game_round,             result,             game_status,             game_serial_number,             start_time,             close_time,             end_time )           values ( ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ? )\r\n### Cause: java.sql.SQLException: Data truncated for column \'game_status\' at row 1\n; Data truncated for column \'game_status\' at row 1; nested exception is java.sql.SQLException: Data truncated for column \'game_status\' at row 1', '2025-06-06 19:28:38', 3);
INSERT INTO `sys_oper_log` VALUES (168, '游戏信息管理', 1, 'com.ruoyi.system.controller.FbGameInfoController.add()', 'POST', 1, 'admin', '研发部门', '/system/gameInfo', '127.0.0.1', '内网IP', '{\"closeTime\":\"2025-06-06\",\"endTime\":\"2025-06-06\",\"gameHost\":\"1\",\"gameName\":\"1\",\"gameRound\":1,\"gameSerialNumber\":\"1\",\"gameStatus\":\"Y\",\"liveStreamId\":1,\"params\":{},\"result\":\"1\",\"startTime\":\"2025-06-06\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Data truncated for column \'game_status\' at row 1\r\n### The error may exist in file [D:\\fbproject\\admin\\ruoyi-admin\\target\\classes\\mapper\\system\\FbGameInfoMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.FbGameInfoMapper.insertFbGameInfo-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into fb_game_info          ( game_name,             game_host,             live_stream_id,             game_round,             result,             game_status,             game_serial_number,             start_time,             close_time,             end_time )           values ( ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ? )\r\n### Cause: java.sql.SQLException: Data truncated for column \'game_status\' at row 1\n; Data truncated for column \'game_status\' at row 1; nested exception is java.sql.SQLException: Data truncated for column \'game_status\' at row 1', '2025-06-06 19:28:42', 3);
INSERT INTO `sys_oper_log` VALUES (169, '游戏信息管理', 1, 'com.ruoyi.system.controller.FbGameInfoController.add()', 'POST', 1, 'admin', '研发部门', '/system/gameInfo', '127.0.0.1', '内网IP', '{\"closeTime\":\"2025-06-06\",\"endTime\":\"2025-06-06\",\"gameHost\":\"1\",\"gameName\":\"1\",\"gameRound\":1,\"gameSerialNumber\":\"1\",\"gameStatus\":\"Y\",\"liveStreamId\":1,\"params\":{},\"result\":\"1\",\"startTime\":\"2025-06-06\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Data truncated for column \'game_status\' at row 1\r\n### The error may exist in file [D:\\fbproject\\admin\\ruoyi-admin\\target\\classes\\mapper\\system\\FbGameInfoMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.FbGameInfoMapper.insertFbGameInfo-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into fb_game_info          ( game_name,             game_host,             live_stream_id,             game_round,             result,             game_status,             game_serial_number,             start_time,             close_time,             end_time )           values ( ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ? )\r\n### Cause: java.sql.SQLException: Data truncated for column \'game_status\' at row 1\n; Data truncated for column \'game_status\' at row 1; nested exception is java.sql.SQLException: Data truncated for column \'game_status\' at row 1', '2025-06-06 19:28:46', 3);
INSERT INTO `sys_oper_log` VALUES (170, '游戏信息管理', 1, 'com.ruoyi.system.controller.FbGameInfoController.add()', 'POST', 1, 'admin', '研发部门', '/system/gameInfo', '127.0.0.1', '内网IP', '{\"closeTime\":\"2025-06-06\",\"endTime\":\"2025-06-06\",\"gameHost\":\"1\",\"gameName\":\"1\",\"gameRound\":1,\"gameSerialNumber\":\"1\",\"gameStatus\":\"Y\",\"liveStreamId\":1,\"params\":{},\"result\":\"1\",\"startTime\":\"2025-06-06\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Data truncated for column \'game_status\' at row 1\r\n### The error may exist in file [D:\\fbproject\\admin\\ruoyi-admin\\target\\classes\\mapper\\system\\FbGameInfoMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.FbGameInfoMapper.insertFbGameInfo-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into fb_game_info          ( game_name,             game_host,             live_stream_id,             game_round,             result,             game_status,             game_serial_number,             start_time,             close_time,             end_time )           values ( ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ? )\r\n### Cause: java.sql.SQLException: Data truncated for column \'game_status\' at row 1\n; Data truncated for column \'game_status\' at row 1; nested exception is java.sql.SQLException: Data truncated for column \'game_status\' at row 1', '2025-06-06 19:28:50', 3);
INSERT INTO `sys_oper_log` VALUES (171, '游戏信息管理', 1, 'com.ruoyi.system.controller.FbGameInfoController.add()', 'POST', 1, 'admin', '研发部门', '/system/gameInfo', '127.0.0.1', '内网IP', '{\"closeTime\":\"2025-06-06\",\"endTime\":\"2025-06-06\",\"gameHost\":\"1\",\"gameName\":\"1\",\"gameRound\":1,\"gameSerialNumber\":\"1\",\"gameStatus\":\"Y\",\"liveStreamId\":1,\"params\":{},\"result\":\"1\",\"startTime\":\"2025-06-06\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Data truncated for column \'game_status\' at row 1\r\n### The error may exist in file [D:\\fbproject\\admin\\ruoyi-admin\\target\\classes\\mapper\\system\\FbGameInfoMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.FbGameInfoMapper.insertFbGameInfo-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into fb_game_info          ( game_name,             game_host,             live_stream_id,             game_round,             result,             game_status,             game_serial_number,             start_time,             close_time,             end_time )           values ( ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ? )\r\n### Cause: java.sql.SQLException: Data truncated for column \'game_status\' at row 1\n; Data truncated for column \'game_status\' at row 1; nested exception is java.sql.SQLException: Data truncated for column \'game_status\' at row 1', '2025-06-06 19:29:51', 4);
INSERT INTO `sys_oper_log` VALUES (172, '游戏信息管理', 1, 'com.ruoyi.system.controller.FbGameInfoController.add()', 'POST', 1, 'admin', '研发部门', '/system/gameInfo', '127.0.0.1', '内网IP', '{\"closeTime\":\"2025-06-04\",\"endTime\":\"2025-06-11\",\"gameHost\":\"1\",\"gameName\":\"1\",\"gameRound\":1,\"gameSerialNumber\":\"1\",\"gameStatus\":\"Y\",\"liveStreamId\":1,\"params\":{},\"result\":\"1\",\"startTime\":\"2025-06-10\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Data truncated for column \'game_status\' at row 1\r\n### The error may exist in file [D:\\fbproject\\admin\\ruoyi-admin\\target\\classes\\mapper\\system\\FbGameInfoMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.FbGameInfoMapper.insertFbGameInfo-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into fb_game_info          ( game_name,             game_host,             live_stream_id,             game_round,             result,             game_status,             game_serial_number,             start_time,             close_time,             end_time )           values ( ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ? )\r\n### Cause: java.sql.SQLException: Data truncated for column \'game_status\' at row 1\n; Data truncated for column \'game_status\' at row 1; nested exception is java.sql.SQLException: Data truncated for column \'game_status\' at row 1', '2025-06-06 19:34:46', 68);
INSERT INTO `sys_oper_log` VALUES (173, '游戏信息管理', 1, 'com.ruoyi.system.controller.FbGameInfoController.add()', 'POST', 1, 'admin', '研发部门', '/system/gameInfo', '127.0.0.1', '内网IP', '{\"closeTime\":\"2025-06-04\",\"endTime\":\"2025-06-11\",\"gameHost\":\"1\",\"gameName\":\"1\",\"gameRound\":1,\"gameSerialNumber\":\"1\",\"gameStatus\":\"Y\",\"liveStreamId\":1,\"params\":{},\"result\":\"1\",\"startTime\":\"2025-06-10\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Data truncated for column \'game_status\' at row 1\r\n### The error may exist in file [D:\\fbproject\\admin\\ruoyi-admin\\target\\classes\\mapper\\system\\FbGameInfoMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.FbGameInfoMapper.insertFbGameInfo-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into fb_game_info          ( game_name,             game_host,             live_stream_id,             game_round,             result,             game_status,             game_serial_number,             start_time,             close_time,             end_time )           values ( ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ? )\r\n### Cause: java.sql.SQLException: Data truncated for column \'game_status\' at row 1\n; Data truncated for column \'game_status\' at row 1; nested exception is java.sql.SQLException: Data truncated for column \'game_status\' at row 1', '2025-06-06 19:34:50', 4);
INSERT INTO `sys_oper_log` VALUES (174, '游戏信息管理', 1, 'com.ruoyi.system.controller.FbGameInfoController.add()', 'POST', 1, 'admin', '研发部门', '/system/gameInfo', '127.0.0.1', '内网IP', '{\"closeTime\":\"2025-06-04\",\"endTime\":\"2025-06-11\",\"gameHost\":\"1\",\"gameName\":\"1\",\"gameRound\":1,\"gameSerialNumber\":\"1\",\"gameStatus\":\"Y\",\"liveStreamId\":1,\"params\":{},\"result\":\"1\",\"startTime\":\"2025-06-10\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Data truncated for column \'game_status\' at row 1\r\n### The error may exist in file [D:\\fbproject\\admin\\ruoyi-admin\\target\\classes\\mapper\\system\\FbGameInfoMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.FbGameInfoMapper.insertFbGameInfo-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into fb_game_info          ( game_name,             game_host,             live_stream_id,             game_round,             result,             game_status,             game_serial_number,             start_time,             close_time,             end_time )           values ( ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ? )\r\n### Cause: java.sql.SQLException: Data truncated for column \'game_status\' at row 1\n; Data truncated for column \'game_status\' at row 1; nested exception is java.sql.SQLException: Data truncated for column \'game_status\' at row 1', '2025-06-06 19:34:54', 4);
INSERT INTO `sys_oper_log` VALUES (175, '游戏信息管理', 1, 'com.ruoyi.system.controller.FbGameInfoController.add()', 'POST', 1, 'admin', '研发部门', '/system/gameInfo', '127.0.0.1', '内网IP', '{\"closeTime\":\"2025-06-04\",\"endTime\":\"2025-06-11\",\"gameHost\":\"1\",\"gameName\":\"1\",\"gameRound\":1,\"gameSerialNumber\":\"1\",\"gameStatus\":\"Y\",\"liveStreamId\":1,\"params\":{},\"result\":\"1\",\"startTime\":\"2025-06-10\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Data truncated for column \'game_status\' at row 1\r\n### The error may exist in file [D:\\fbproject\\admin\\ruoyi-admin\\target\\classes\\mapper\\system\\FbGameInfoMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.FbGameInfoMapper.insertFbGameInfo-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into fb_game_info          ( game_name,             game_host,             live_stream_id,             game_round,             result,             game_status,             game_serial_number,             start_time,             close_time,             end_time )           values ( ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ? )\r\n### Cause: java.sql.SQLException: Data truncated for column \'game_status\' at row 1\n; Data truncated for column \'game_status\' at row 1; nested exception is java.sql.SQLException: Data truncated for column \'game_status\' at row 1', '2025-06-06 19:34:58', 3);
INSERT INTO `sys_oper_log` VALUES (176, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"gameInfo\",\"className\":\"FbGameInfo\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"游戏ID\",\"columnId\":86,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-06-06 19:09:18\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":14,\"updateBy\":\"\",\"updateTime\":\"2025-06-06 19:19:23\",\"usableColumn\":false},{\"capJavaField\":\"GameName\",\"columnComment\":\"游戏名称\",\"columnId\":87,\"columnName\":\"game_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-06-06 19:09:18\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"gameName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":14,\"updateBy\":\"\",\"updateTime\":\"2025-06-06 19:19:23\",\"usableColumn\":false},{\"capJavaField\":\"GameHost\",\"columnComment\":\"游戏主播\",\"columnId\":88,\"columnName\":\"game_host\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-06-06 19:09:18\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"gameHost\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":14,\"updateBy\":\"\",\"updateTime\":\"2025-06-06 19:19:23\",\"usableColumn\":false},{\"capJavaField\":\"LiveStreamId\",\"columnComment\":\"房间号\",\"columnId\":89,\"columnName\":\"live_stream_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-06-06 19:09:18\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":t', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-06 19:37:09', 64);
INSERT INTO `sys_oper_log` VALUES (177, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"fb_game_info\"}', NULL, 0, NULL, '2025-06-06 19:37:18', 147);
INSERT INTO `sys_oper_log` VALUES (178, '游戏信息管理', 1, 'com.ruoyi.system.controller.FbGameInfoController.add()', 'POST', 1, 'admin', '研发部门', '/system/gameInfo', '127.0.0.1', '内网IP', '{\"gameHost\":\"1\",\"gameName\":\"1\",\"gameRound\":1,\"gameSerialNumber\":\"1\",\"id\":1,\"liveStreamId\":1,\"params\":{},\"result\":\"1\",\"startTime\":\"2025-06-02\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-06 19:38:28', 33);
INSERT INTO `sys_oper_log` VALUES (179, '游戏信息管理', 2, 'com.ruoyi.system.controller.FbGameInfoController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/gameInfo', '127.0.0.1', '内网IP', '{\"closeTime\":\"2025-06-24\",\"endTime\":\"2025-06-11\",\"gameHost\":\"1\",\"gameName\":\"1\",\"gameRound\":1,\"gameSerialNumber\":\"1\",\"gameStatus\":\"投注中\",\"id\":1,\"liveStreamId\":1,\"params\":{},\"result\":\"1\",\"startTime\":\"2025-06-02\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-06 19:38:37', 12);
INSERT INTO `sys_oper_log` VALUES (180, '游戏信息管理', 3, 'com.ruoyi.system.controller.FbGameInfoController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/gameInfo/1', '127.0.0.1', '内网IP', '[1]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-06 19:38:41', 15);
INSERT INTO `sys_oper_log` VALUES (181, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"gameRecord\",\"className\":\"FbGameRecord\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"下注ID\",\"columnId\":97,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-06-06 19:09:18\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":15,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"GameUserId\",\"columnComment\":\"下注用户ID\",\"columnId\":98,\"columnName\":\"game_user_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-06-06 19:09:18\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"gameUserId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":15,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"GameUserAccount\",\"columnComment\":\"下注用户账号\",\"columnId\":99,\"columnName\":\"game_user_account\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-06-06 19:09:18\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"gameUserAccount\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":15,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"LiveStreamId\",\"columnComment\":\"直播房间ID\",\"columnId\":100,\"columnName\":\"live_stream_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-06-06 19:09:18\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQu', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-06 19:39:45', 60);
INSERT INTO `sys_oper_log` VALUES (182, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"fb_game_record\"}', NULL, 0, NULL, '2025-06-06 19:39:47', 192);
INSERT INTO `sys_oper_log` VALUES (183, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"user\",\"className\":\"FbGameUser\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"用户ID\",\"columnId\":108,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-06-06 19:09:18\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":16,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Account\",\"columnComment\":\"用户账号\",\"columnId\":109,\"columnName\":\"account\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-06-06 19:09:18\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"account\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":16,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Password\",\"columnComment\":\"用户密码\",\"columnId\":110,\"columnName\":\"password\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-06-06 19:09:18\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"password\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":16,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"用户名\",\"columnId\":111,\"columnName\":\"name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-06-06 19:09:18\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"name\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-06 19:40:10', 25);
INSERT INTO `sys_oper_log` VALUES (184, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"stream\",\"className\":\"FbLiveStream\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"直播ID\",\"columnId\":113,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-06-06 19:09:18\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":17,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"直播名称\",\"columnId\":114,\"columnName\":\"name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-06-06 19:09:18\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":17,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Description\",\"columnComment\":\"直播描述\",\"columnId\":115,\"columnName\":\"description\",\"columnType\":\"text\",\"createBy\":\"admin\",\"createTime\":\"2025-06-06 19:09:18\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"textarea\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"description\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":17,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Url\",\"columnComment\":\"直播链接\",\"columnId\":116,\"columnName\":\"url\",\"columnType\":\"varchar(500)\",\"createBy\":\"admin\",\"createTime\":\"2025-06-06 19:09:18\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"textarea\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"u', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-06 19:40:37', 26);
INSERT INTO `sys_oper_log` VALUES (185, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"fb_game_user\"}', NULL, 0, NULL, '2025-06-06 19:40:39', 60);
INSERT INTO `sys_oper_log` VALUES (186, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"fb_live_stream\"}', NULL, 0, NULL, '2025-06-06 19:40:40', 65);
INSERT INTO `sys_oper_log` VALUES (187, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"gameUser\",\"className\":\"FbGameUser\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"用户ID\",\"columnId\":108,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-06-06 19:09:18\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":16,\"updateBy\":\"\",\"updateTime\":\"2025-06-06 19:40:09\",\"usableColumn\":false},{\"capJavaField\":\"Account\",\"columnComment\":\"用户账号\",\"columnId\":109,\"columnName\":\"account\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-06-06 19:09:18\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"account\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":16,\"updateBy\":\"\",\"updateTime\":\"2025-06-06 19:40:09\",\"usableColumn\":false},{\"capJavaField\":\"Password\",\"columnComment\":\"用户密码\",\"columnId\":110,\"columnName\":\"password\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-06-06 19:09:18\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"password\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":16,\"updateBy\":\"\",\"updateTime\":\"2025-06-06 19:40:09\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"用户名\",\"columnId\":111,\"columnName\":\"name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-06-06 19:09:18\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-06 19:52:18', 46);
INSERT INTO `sys_oper_log` VALUES (188, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"liveStream\",\"className\":\"FbLiveStream\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"直播ID\",\"columnId\":113,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-06-06 19:09:18\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":17,\"updateBy\":\"\",\"updateTime\":\"2025-06-06 19:40:37\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"直播名称\",\"columnId\":114,\"columnName\":\"name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-06-06 19:09:18\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":17,\"updateBy\":\"\",\"updateTime\":\"2025-06-06 19:40:37\",\"usableColumn\":false},{\"capJavaField\":\"Description\",\"columnComment\":\"直播描述\",\"columnId\":115,\"columnName\":\"description\",\"columnType\":\"text\",\"createBy\":\"admin\",\"createTime\":\"2025-06-06 19:09:18\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"textarea\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"description\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":17,\"updateBy\":\"\",\"updateTime\":\"2025-06-06 19:40:37\",\"usableColumn\":false},{\"capJavaField\":\"Url\",\"columnComment\":\"直播链接\",\"columnId\":116,\"columnName\":\"url\",\"columnType\":\"varchar(500)\",\"createBy\":\"admin\",\"createTime\":\"2025-06-06 19:09:18\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"textarea\",\"increment\":false,\"insert\":true,\"isEdi', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-06 19:52:28', 33);
INSERT INTO `sys_oper_log` VALUES (189, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"fb_game_info,fb_game_record,fb_game_user,fb_live_stream\"}', NULL, 0, NULL, '2025-06-06 19:52:33', 221);
INSERT INTO `sys_oper_log` VALUES (190, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2025-05-30 17:29:14\",\"icon\":\"guide\",\"isCache\":\"0\",\"isFrame\":\"0\",\"menuId\":4,\"menuName\":\"若依官网\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"http://ruoyi.vip\",\"perms\":\"\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-06 18:16:30', 25);
INSERT INTO `sys_oper_log` VALUES (191, '游戏用户管理', 1, 'com.ruoyi.system.controller.FbGameUserController.add()', 'POST', 1, 'admin', '研发部门', '/system/gameUser', '127.0.0.1', '内网IP', '{\"account\":\"1\",\"id\":1,\"name\":\"1\",\"params\":{},\"points\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-06 18:33:19', 18);
INSERT INTO `sys_oper_log` VALUES (192, '游戏用户管理', 3, 'com.ruoyi.system.controller.FbGameUserController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/gameUser/1', '127.0.0.1', '内网IP', '[1]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-06 18:33:26', 11);
INSERT INTO `sys_oper_log` VALUES (193, '游戏用户管理', 1, 'com.ruoyi.system.controller.FbGameUserController.add()', 'POST', 1, 'admin', '研发部门', '/system/gameUser', '127.0.0.1', '内网IP', '{\"account\":\"1\",\"id\":2,\"name\":\"1\",\"params\":{},\"points\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-06 18:33:41', 7);
INSERT INTO `sys_oper_log` VALUES (194, '游戏用户管理', 3, 'com.ruoyi.system.controller.FbGameUserController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/gameUser/2', '127.0.0.1', '内网IP', '[2]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-06 18:33:50', 14);
INSERT INTO `sys_oper_log` VALUES (195, '游戏用户管理', 1, 'com.ruoyi.system.controller.FbGameUserController.add()', 'POST', 1, 'admin', '研发部门', '/system/gameUser', '127.0.0.1', '内网IP', '{\"account\":\"1\",\"id\":3,\"name\":\"1\",\"params\":{},\"points\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-06 18:41:58', 31);
INSERT INTO `sys_oper_log` VALUES (196, '游戏用户管理', 1, 'com.ruoyi.system.controller.FbGameUserController.add()', 'POST', 1, 'admin', '研发部门', '/system/gameUser', '127.0.0.1', '内网IP', '{\"account\":\"2\",\"id\":4,\"name\":\"2\",\"params\":{},\"points\":2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-06 18:42:01', 14);
INSERT INTO `sys_oper_log` VALUES (197, '结算', 2, 'com.ruoyi.system.controller.FbGameRecordController.settle()', 'POST', 1, 'admin', '研发部门', '/system/gameRecord/settle', '127.0.0.1', '内网IP', '{\"betContent\":\"鹿\",\"liveStreamId\":1,\"nextRoundEnabled\":false,\"odds\":2}', '{\"msg\":\"处理完成\",\"code\":200}', 0, NULL, '2025-06-12 15:58:40', 26);
INSERT INTO `sys_oper_log` VALUES (198, '结算', 2, 'com.ruoyi.system.controller.FbGameRecordController.settle()', 'POST', 1, 'admin', '研发部门', '/system/gameRecord/settle', '127.0.0.1', '内网IP', '{\"betContent\":\"鹿\",\"liveStreamId\":1,\"nextRoundEnabled\":false,\"odds\":2}', '{\"msg\":\"处理完成\",\"code\":200}', 0, NULL, '2025-06-12 15:58:43', 1);
INSERT INTO `sys_oper_log` VALUES (199, '结算', 2, 'com.ruoyi.system.controller.FbGameRecordController.settle()', 'POST', 1, 'admin', '研发部门', '/system/gameRecord/settle', '127.0.0.1', '内网IP', '{\"betContent\":\"鹿\",\"liveStreamId\":1,\"nextRoundEnabled\":false,\"odds\":2}', '{\"msg\":\"处理完成\",\"code\":200}', 0, NULL, '2025-06-12 15:58:47', 2);
INSERT INTO `sys_oper_log` VALUES (200, '游戏记录管理', 1, 'com.ruoyi.system.controller.FbGameRecordController.add()', 'POST', 1, 'admin', '研发部门', '/system/gameRecord', '127.0.0.1', '内网IP', '{\"betContent\":\"1\",\"betName\":\"1\",\"betNum\":1,\"betTime\":\"2025-06-12 15:59:50\",\"gameRound\":1,\"gameType\":\"1\",\"gameUserAccount\":\"1\",\"gameUserId\":1,\"id\":3,\"isActive\":1,\"liveStreamId\":1,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-12 15:59:51', 7);
INSERT INTO `sys_oper_log` VALUES (201, '结算', 2, 'com.ruoyi.system.controller.FbGameRecordController.settle()', 'POST', 1, 'admin', '研发部门', '/system/gameRecord/settle', '127.0.0.1', '内网IP', '{\"betContent\":\"鹿\",\"liveStreamId\":1,\"nextRoundEnabled\":false,\"odds\":2}', '{\"msg\":\"处理完成\",\"code\":200}', 0, NULL, '2025-06-12 16:00:02', 8);
INSERT INTO `sys_oper_log` VALUES (202, '结算', 2, 'com.ruoyi.system.controller.FbGameRecordController.settle()', 'POST', 1, 'admin', '研发部门', '/system/gameRecord/settle', '127.0.0.1', '内网IP', '{\"betContent\":\"鹿\",\"liveStreamId\":1,\"nextRoundEnabled\":false,\"odds\":2}', '{\"msg\":\"处理完成\",\"code\":200}', 0, NULL, '2025-06-12 16:00:05', 1);
INSERT INTO `sys_oper_log` VALUES (203, '结算', 2, 'com.ruoyi.system.controller.FbGameRecordController.settle()', 'POST', 1, 'admin', '研发部门', '/system/gameRecord/settle', '127.0.0.1', '内网IP', '{\"betContent\":\"鹿\",\"liveStreamId\":1,\"nextRoundEnabled\":false,\"odds\":2}', '{\"msg\":\"处理完成\",\"code\":200}', 0, NULL, '2025-06-12 16:00:17', 2);
INSERT INTO `sys_oper_log` VALUES (204, '游戏记录管理', 1, 'com.ruoyi.system.controller.FbGameRecordController.add()', 'POST', 1, 'admin', '研发部门', '/system/gameRecord', '127.0.0.1', '内网IP', '{\"betContent\":\"鹿\",\"betName\":\"1\",\"betNum\":1,\"betTime\":\"2025-06-12 16:01:06\",\"gameRound\":1,\"gameType\":\"1\",\"gameUserAccount\":\"1\",\"gameUserId\":1,\"id\":4,\"isActive\":1,\"liveStreamId\":1,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-12 16:01:07', 3);
INSERT INTO `sys_oper_log` VALUES (205, '结算', 2, 'com.ruoyi.system.controller.FbGameRecordController.settle()', 'POST', 1, 'admin', '研发部门', '/system/gameRecord/settle', '127.0.0.1', '内网IP', '{\"betContent\":\"鹿\",\"liveStreamId\":1,\"nextRoundEnabled\":false,\"odds\":2}', '{\"msg\":\"处理完成\",\"code\":200}', 0, NULL, '2025-06-12 16:01:13', 9);
INSERT INTO `sys_oper_log` VALUES (206, '结算', 2, 'com.ruoyi.system.controller.FbGameRecordController.settle()', 'POST', 1, 'admin', '研发部门', '/system/gameRecord/settle', '127.0.0.1', '内网IP', '{\"betContent\":\"鹿\",\"liveStreamId\":1,\"nextRoundEnabled\":false,\"odds\":2}', '{\"msg\":\"处理完成\",\"code\":200}', 0, NULL, '2025-06-12 20:03:51', 42);
INSERT INTO `sys_oper_log` VALUES (207, '结算', 2, 'com.ruoyi.system.controller.FbGameRecordController.settle()', 'POST', 1, 'admin', '研发部门', '/system/gameRecord/settle', '127.0.0.1', '内网IP', '{\"betContent\":\"鹿\",\"liveStreamId\":1,\"nextRoundEnabled\":false,\"odds\":3}', '{\"msg\":\"处理完成\",\"code\":200}', 0, NULL, '2025-06-12 20:04:44', 9);
INSERT INTO `sys_oper_log` VALUES (208, '结算', 2, 'com.ruoyi.system.controller.FbGameRecordController.settle()', 'POST', 1, 'admin', '研发部门', '/system/gameRecord/settle', '127.0.0.1', '内网IP', '{\"betContent\":\"鸡\",\"liveStreamId\":1,\"nextRoundEnabled\":false,\"odds\":3}', '{\"msg\":\"处理完成\",\"code\":200}', 0, NULL, '2025-06-12 20:05:13', 14);
INSERT INTO `sys_oper_log` VALUES (209, '游戏信息管理', 3, 'com.ruoyi.system.controller.FbGameInfoController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/gameInfo/1', '127.0.0.1', '内网IP', '[1]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-12 20:06:17', 5);
INSERT INTO `sys_oper_log` VALUES (210, '游戏信息管理', 1, 'com.ruoyi.system.controller.FbGameInfoController.add()', 'POST', 1, 'admin', '研发部门', '/system/gameInfo', '127.0.0.1', '内网IP', '{\"closeTime\":\"2025-06-12 20:12:25\",\"endTime\":\"2025-06-12 20:15:35\",\"gameHost\":\"testhost\",\"gameName\":\"testgame\",\"gameRound\":2,\"gameSerialNumber\":\"00012\",\"gameStatus\":\"投注中\",\"id\":2,\"liveStreamId\":1,\"params\":{},\"result\":\"鸡\",\"startTime\":\"2025-06-12 20:07:21\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-12 20:07:43', 18);
INSERT INTO `sys_oper_log` VALUES (211, '游戏信息管理', 2, 'com.ruoyi.system.controller.FbGameInfoController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/gameInfo', '127.0.0.1', '内网IP', '{\"closeTime\":\"2025-06-12 20:12:25\",\"endTime\":\"2025-06-12 20:15:35\",\"gameHost\":\"testhost\",\"gameName\":\"testgame\",\"gameRound\":2,\"gameSerialNumber\":\"00012\",\"gameStatus\":\"封盘\",\"id\":2,\"liveStreamId\":1,\"params\":{},\"result\":\"鸡\",\"startTime\":\"2025-06-12 20:07:21\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-12 20:12:43', 5);
INSERT INTO `sys_oper_log` VALUES (212, '游戏信息管理', 2, 'com.ruoyi.system.controller.FbGameInfoController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/gameInfo', '127.0.0.1', '内网IP', '{\"closeTime\":\"2025-06-12 20:13:07\",\"endTime\":\"2025-06-12 20:15:35\",\"gameHost\":\"testhost\",\"gameName\":\"testgame\",\"gameRound\":2,\"gameSerialNumber\":\"00012\",\"gameStatus\":\"封盘\",\"id\":2,\"liveStreamId\":1,\"params\":{},\"result\":\"鸡\",\"startTime\":\"2025-06-12 20:07:21\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-12 20:13:08', 5);
INSERT INTO `sys_oper_log` VALUES (213, '结算', 2, 'com.ruoyi.system.controller.FbGameRecordController.settle()', 'POST', 1, 'admin', '研发部门', '/system/gameRecord/settle', '127.0.0.1', '内网IP', '{\"betContent\":\"鹿\",\"liveStreamId\":1,\"nextRoundEnabled\":false,\"odds\":2}', '{\"msg\":\"处理完成\",\"code\":200}', 0, NULL, '2025-06-12 20:15:06', 8);
INSERT INTO `sys_oper_log` VALUES (214, '游戏信息管理', 1, 'com.ruoyi.system.controller.FbGameInfoController.add()', 'POST', 1, 'admin', '研发部门', '/system/gameInfo', '127.0.0.1', '内网IP', '{\"closeTime\":\"2025-06-12 20:20:43\",\"endTime\":\"2025-06-12 20:20:44\",\"gameHost\":\"testhost\",\"gameName\":\"etete\",\"gameRound\":3,\"gameSerialNumber\":\"00013\",\"gameStatus\":\"投注中\",\"id\":3,\"liveStreamId\":1,\"params\":{},\"result\":\"鱼\",\"startTime\":\"2025-06-12 20:20:42\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-12 20:20:45', 3);
INSERT INTO `sys_oper_log` VALUES (215, '游戏信息管理', 2, 'com.ruoyi.system.controller.FbGameInfoController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/gameInfo', '127.0.0.1', '内网IP', '{\"closeTime\":\"2025-06-12 20:20:43\",\"endTime\":\"2025-06-12 20:20:44\",\"gameHost\":\"testhost\",\"gameName\":\"etete\",\"gameRound\":3,\"gameSerialNumber\":\"00013\",\"gameStatus\":\"封盘\",\"id\":3,\"liveStreamId\":1,\"params\":{},\"result\":\"鱼\",\"startTime\":\"2025-06-12 20:20:42\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-12 20:33:42', 3);
INSERT INTO `sys_oper_log` VALUES (216, '结算', 2, 'com.ruoyi.system.controller.FbGameRecordController.settle()', 'POST', 1, 'admin', '研发部门', '/system/gameRecord/settle', '127.0.0.1', '内网IP', '{\"betContent\":\"鱼\",\"liveStreamId\":1,\"nextRoundEnabled\":false,\"odds\":2}', '{\"msg\":\"处理完成\",\"code\":200}', 0, NULL, '2025-06-12 20:42:58', 11);
INSERT INTO `sys_oper_log` VALUES (217, '结算', 2, 'com.ruoyi.system.controller.FbGameRecordController.settle()', 'POST', 1, 'admin', '研发部门', '/system/gameRecord/settle', '127.0.0.1', '内网IP', '{\"betContent\":\"鱼\",\"liveStreamId\":1,\"nextRoundEnabled\":true,\"odds\":2}', '{\"msg\":\"处理完成\",\"code\":200}', 0, NULL, '2025-06-12 20:42:59', 2);
INSERT INTO `sys_oper_log` VALUES (218, '结算', 2, 'com.ruoyi.system.controller.FbGameRecordController.settle()', 'POST', 1, 'admin', '研发部门', '/system/gameRecord/settle', '127.0.0.1', '内网IP', '{\"betContent\":\"12\",\"liveStreamId\":1,\"nextRoundEnabled\":true,\"odds\":2}', '{\"msg\":\"处理完成\",\"code\":200}', 0, NULL, '2025-06-12 20:43:21', 2);

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
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '若依', '00', 'ry@163.com', '15888888888', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2025-06-12 20:00:50', '2025-05-30 17:29:14', 'admin', '2025-05-30 17:29:14', '', '2025-06-12 20:00:50', '管理员');
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
