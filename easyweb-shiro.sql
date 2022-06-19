/*
 Navicat MySQL Data Transfer

 Source Server         : IMP
 Source Server Type    : MySQL
 Source Server Version : 50721
 Source Host           : localhost:3306
 Source Schema         : easyweb-shiro

 Target Server Type    : MySQL
 Target Server Version : 50721
 File Encoding         : 65001

 Date: 08/07/2021 09:18:34
*/

-- drop database easyweb_shiro;

create database easyweb_shiro;
use easyweb_shiro;

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for cms_equipment_info
-- ----------------------------
DROP TABLE IF EXISTS `cms_equipment_info`;
CREATE TABLE `cms_equipment_info`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '*主键',
  `equipment_number` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '*设备型号',
  `equipment_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '*设备名称',
  `alxe_number` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '*设备轴数',
  `manufacturer` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '制造商',
  `create_by` int(11) NULL DEFAULT NULL COMMENT '创建者',
--  `create_time` datetime NULL COMMENT '创建时间',
 `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` int(11) NULL DEFAULT NULL COMMENT '修改人',
--  `update_time` datetime NULL COMMENT '更新时间',
 `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` int(1) NULL DEFAULT 0 COMMENT '逻辑删除 1是 0否'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '制造资源-设备信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_equipment_info
-- ----------------------------
INSERT INTO `cms_equipment_info` VALUES ('26603e9fab1ea7a9f9af71bde7734a0d', 'THM6363IV', '宁江卧式五轴加工中心', '5', '普什宁江', NULL, '2021-03-08 16:00:26', NULL, '2021-03-08 16:00:26', 0);
INSERT INTO `cms_equipment_info` VALUES ('427323640e2ac4f839dc8060cc70f4d6', 'JW50M5', '精锐卧式五轴加工中心', '5', '沈阳精锐', NULL, '2021-03-08 16:00:48', NULL, '2021-03-08 16:00:48', 0);
INSERT INTO `cms_equipment_info` VALUES ('600d7fc93c57d10d0e38ebcc92639b6e', 'KTV1500VA', 'KTV1500VA', '5', '', NULL, '2021-03-09 10:49:15', NULL, '2021-03-09 10:49:15', 0);
INSERT INTO `cms_equipment_info` VALUES ('86663ed97230379b851035fa33f5b1fb', 'VTC200', 'VTC200', '5', '', NULL, '2021-03-09 10:49:25', NULL, '2021-03-09 10:49:25', 0);
INSERT INTO `cms_equipment_info` VALUES ('3fd4c1623cd76859affed601219ee4ff', 'VTC-200BN', 'VTC-200BN', '5', '', NULL, '2021-03-09 11:46:01', NULL, '2021-03-09 11:46:24', 0);

-- ----------------------------
-- Table structure for sys_dictionary
-- ----------------------------
DROP TABLE IF EXISTS `sys_dictionary`;
CREATE TABLE `sys_dictionary`  (
  `dict_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '字典id',
  `dict_code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '字典标识',
  `dict_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '字典名称',
  `sort_number` int(11) NOT NULL DEFAULT 1 COMMENT '排序号',
  `comments` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `deleted` int(1) NOT NULL DEFAULT 0 COMMENT '是否删除,0否,1是',
--  `create_time` timestamp NOT NULL COMMENT '创建时间',
    `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
--  `update_time` timestamp NOT NULL COMMENT '修改时间',
 `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_code`(`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dictionary
-- ----------------------------
INSERT INTO `sys_dictionary` VALUES (1, 'sex', '性别', 1, '', 0, '2020-03-15 13:04:39', '2020-03-15 13:04:39');
INSERT INTO `sys_dictionary` VALUES (2, 'organization_type', '机构类型', 2, '', 0, '2020-03-16 00:32:36', '2020-03-16 00:32:36');

-- ----------------------------
-- Table structure for sys_dictionary_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dictionary_data`;
CREATE TABLE `sys_dictionary_data`  (
  `dict_data_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '字典项id',
  `dict_id` int(11) NOT NULL COMMENT '字典id',
  `dict_data_code` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '字典项标识',
  `dict_data_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '字典项名称',
  `sort_number` int(11) NOT NULL DEFAULT 1 COMMENT '排序号',
  `comments` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `deleted` int(1) NOT NULL DEFAULT 0 COMMENT '是否删除,0否,1是',
--  `create_time` timestamp NOT NULL COMMENT '创建时间',
 `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
--  `update_time` timestamp NOT NULL COMMENT '修改时间',
 `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`dict_data_id`) USING BTREE,
  INDEX `dict_id`(`dict_id`) USING BTREE,
  CONSTRAINT `sys_dictionary_data_ibfk_1` FOREIGN KEY (`dict_id`) REFERENCES `sys_dictionary` (`dict_id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典项' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dictionary_data
-- ----------------------------
INSERT INTO `sys_dictionary_data` VALUES (1, 1, 'male', '男', 1, '', 0, '2020-03-15 13:07:28', '2020-03-15 13:07:28');
INSERT INTO `sys_dictionary_data` VALUES (2, 1, 'female', '女', 2, '', 0, '2020-03-15 13:07:41', '2020-03-15 15:58:04');
INSERT INTO `sys_dictionary_data` VALUES (3, 2, 'company', '公司', 1, '', 0, '2020-03-16 00:34:32', '2020-03-16 00:34:32');
INSERT INTO `sys_dictionary_data` VALUES (4, 2, 'subsidiary', '子公司', 2, '', 0, '2020-03-16 00:35:02', '2020-03-16 00:35:02');
INSERT INTO `sys_dictionary_data` VALUES (5, 2, 'department', '部门', 3, '', 0, '2020-03-16 00:35:18', '2020-03-16 00:35:18');
INSERT INTO `sys_dictionary_data` VALUES (6, 2, 'group', '小组', 4, '', 0, '2020-03-16 00:35:36', '2020-03-16 00:35:36');

-- ----------------------------
-- Table structure for sys_login_record
-- ----------------------------
DROP TABLE IF EXISTS `sys_login_record`;
CREATE TABLE `sys_login_record`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户账号',
  `os` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作系统',
  `device` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '设备名',
  `browser` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '浏览器类型',
  `ip` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'ip地址',
  `oper_type` int(11) NOT NULL COMMENT '操作类型,0登录成功,1登录失败,2退出登录,3刷新token',
  `comments` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
--  `create_time` timestamp NOT NULL COMMENT '操作时间',
--  `update_time` timestamp NOT NULL COMMENT '修改时间',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '操作时间',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '登录日志' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_login_record
-- ----------------------------
INSERT INTO `sys_login_record` VALUES (1, 'admin', 'Windows 10', 'Windows 10', 'Chrome 8', '192.168.5.123', 1, '验证码错误', '2020-08-04 13:42:38', '2020-08-04 13:42:38');
INSERT INTO `sys_login_record` VALUES (2, 'admin', 'Windows 10', 'Windows 10', 'Chrome 8', '192.168.5.123', 0, NULL, '2020-08-04 13:42:46', '2020-08-04 13:42:46');
INSERT INTO `sys_login_record` VALUES (3, 'admin', 'Windows 10', 'Windows 10', 'Chrome 8', '192.168.5.123', 0, NULL, '2020-08-04 13:46:10', '2020-08-04 13:46:10');
INSERT INTO `sys_login_record` VALUES (4, 'admin', 'Windows 10', 'Windows 10', 'Chrome 8', '192.168.5.123', 0, NULL, '2020-08-04 13:49:06', '2020-08-04 13:49:06');
INSERT INTO `sys_login_record` VALUES (5, 'admin', 'Windows 10', 'Windows 10', 'Chrome 8', '192.168.5.123', 0, NULL, '2020-08-04 14:36:38', '2020-08-04 14:36:38');
INSERT INTO `sys_login_record` VALUES (6, 'admin', 'Windows 10', 'Windows 10', 'Chrome 8', '192.168.5.123', 0, NULL, '2020-08-04 14:39:32', '2020-08-04 14:39:32');
INSERT INTO `sys_login_record` VALUES (7, 'admin', 'Windows 10', 'Windows 10', 'Chrome 8', '192.168.5.123', 0, NULL, '2020-08-05 11:05:32', '2020-08-05 11:05:32');
INSERT INTO `sys_login_record` VALUES (8, 'admin', 'Windows 10', 'Windows 10', 'Chrome 8', '192.168.5.123', 0, NULL, '2020-08-05 11:11:44', '2020-08-05 11:11:44');
INSERT INTO `sys_login_record` VALUES (9, 'admin', 'Windows 10', 'Windows 10', 'Chrome 8', '192.168.5.123', 0, NULL, '2020-08-05 13:31:44', '2020-08-05 13:31:44');
INSERT INTO `sys_login_record` VALUES (10, 'admin', 'Windows 10', 'Windows 10', 'Chrome 8', '192.168.5.123', 0, NULL, '2020-08-05 14:16:39', '2020-08-05 14:16:39');
INSERT INTO `sys_login_record` VALUES (11, 'admin', 'Windows 10', 'Windows 10', 'Chrome 8', '192.168.5.123', 0, NULL, '2020-08-05 15:52:18', '2020-08-05 15:52:18');
INSERT INTO `sys_login_record` VALUES (12, 'admin', 'Windows 10', 'Windows 10', 'Chrome 8', '192.168.5.123', 0, NULL, '2020-08-10 10:47:32', '2020-08-10 10:47:32');
INSERT INTO `sys_login_record` VALUES (13, 'admin', 'Windows 10', 'Windows 10', 'Chrome 8', '192.168.5.123', 0, NULL, '2020-08-10 13:45:34', '2020-08-10 13:45:34');
INSERT INTO `sys_login_record` VALUES (14, 'admin', 'Windows 10', 'Windows 10', 'Chrome 8', '192.168.5.123', 0, NULL, '2020-08-10 15:51:36', '2020-08-10 15:51:36');
INSERT INTO `sys_login_record` VALUES (15, 'admin', 'Windows 10', 'Windows 10', 'Chrome 8', '192.168.5.123', 0, NULL, '2020-08-11 10:21:02', '2020-08-11 10:21:02');
INSERT INTO `sys_login_record` VALUES (16, 'admin', 'Windows 10', 'Windows 10', 'Chrome 8', '192.168.5.123', 0, NULL, '2020-08-19 14:00:50', '2020-08-19 14:00:50');
INSERT INTO `sys_login_record` VALUES (17, 'admin', 'Windows 7', 'Windows 7', 'Chrome', '192.168.5.113', 1, '验证码错误', '2020-12-16 10:39:56', '2020-12-16 10:39:56');
INSERT INTO `sys_login_record` VALUES (18, 'admin', 'Windows 7', 'Windows 7', 'Chrome', '192.168.5.113', 0, NULL, '2020-12-16 10:40:04', '2020-12-16 10:40:04');
INSERT INTO `sys_login_record` VALUES (19, 'admin', 'Windows 7', 'Windows 7', 'Chrome 9', '127.0.0.1', 1, '密码错误', '2021-07-06 11:17:40', '2021-07-06 11:17:40');
INSERT INTO `sys_login_record` VALUES (20, 'admin', 'Windows 7', 'Windows 7', 'Chrome 9', '127.0.0.1', 1, '密码错误', '2021-07-06 11:17:47', '2021-07-06 11:17:47');
INSERT INTO `sys_login_record` VALUES (21, 'admin', 'Windows 7', 'Windows 7', 'Chrome 9', '127.0.0.1', 1, '密码错误', '2021-07-06 11:17:53', '2021-07-06 11:17:53');
INSERT INTO `sys_login_record` VALUES (22, 'admin', 'Windows 7', 'Windows 7', 'Chrome 9', '127.0.0.1', 1, '密码错误', '2021-07-06 11:17:59', '2021-07-06 11:17:59');
INSERT INTO `sys_login_record` VALUES (23, 'admin', 'Windows 7', 'Windows 7', 'Chrome 9', '127.0.0.1', 0, NULL, '2021-07-06 11:18:03', '2021-07-06 11:18:03');
INSERT INTO `sys_login_record` VALUES (24, 'admin', 'Windows 7', 'Windows 7', 'Chrome 9', '127.0.0.1', 1, '密码错误', '2021-07-06 11:28:12', '2021-07-06 11:28:12');
INSERT INTO `sys_login_record` VALUES (25, 'admin', 'Windows 7', 'Windows 7', 'Chrome 9', '127.0.0.1', 0, NULL, '2021-07-06 11:28:16', '2021-07-06 11:28:16');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '菜单id',
  `parent_id` int(11) NOT NULL DEFAULT 0 COMMENT '上级id,0是顶级',
  `menu_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '菜单名称',
  `menu_icon` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '菜单图标',
  `path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '菜单地址',
  `menu_type` int(11) NULL DEFAULT 0 COMMENT '类型,0菜单,1按钮',
  `sort_number` int(11) NOT NULL DEFAULT 1 COMMENT '排序号',
  `authority` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `target` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '_self' COMMENT '打开位置',
  `icon_color` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图标颜色',
  `hide` int(11) NOT NULL DEFAULT 0 COMMENT '是否隐藏,0否,1是',
  `deleted` int(1) NOT NULL DEFAULT 0 COMMENT '是否删除,0否,1是',
--  `create_time` timestamp NOT NULL  COMMENT '创建时间',
--  `update_time` timestamp NOT NULL  COMMENT '修改时间',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 121 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '菜单' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, 0, '系统管理', 'layui-icon layui-icon-set-sm', '', 0, 101, '', '_self', NULL, 0, 0, '2020-02-26 12:51:23', '2020-08-04 13:47:09');
INSERT INTO `sys_menu` VALUES (2, 1, '用户管理', NULL, 'sys/user', 0, 1, 'sys:user:view', '_self', NULL, 0, 0, '2020-02-26 12:51:55', '2020-03-21 18:45:26');
INSERT INTO `sys_menu` VALUES (3, 2, '查询用户', NULL, NULL, 1, 1, 'sys:user:list', '_self', NULL, 0, 0, '2020-02-26 12:52:06', '2020-03-21 18:45:28');
INSERT INTO `sys_menu` VALUES (4, 2, '添加用户', NULL, NULL, 1, 2, 'sys:user:save', '_self', NULL, 0, 0, '2020-02-26 12:52:26', '2020-03-21 18:45:29');
INSERT INTO `sys_menu` VALUES (5, 2, '修改用户', NULL, NULL, 1, 3, 'sys:user:update', '_self', NULL, 0, 0, '2020-02-26 12:52:50', '2020-03-21 18:45:30');
INSERT INTO `sys_menu` VALUES (6, 2, '删除用户', NULL, NULL, 1, 4, 'sys:user:remove', '_self', NULL, 0, 0, '2020-02-26 12:53:13', '2020-03-21 18:45:32');
INSERT INTO `sys_menu` VALUES (7, 1, '角色管理', NULL, 'sys/role', 0, 2, 'sys:role:view', '_self', NULL, 0, 0, '2020-03-13 13:29:08', '2020-03-21 18:45:33');
INSERT INTO `sys_menu` VALUES (8, 7, '查询角色', NULL, NULL, 1, 1, 'sys:role:list', '_self', NULL, 0, 0, '2020-03-13 13:30:41', '2020-03-21 18:45:34');
INSERT INTO `sys_menu` VALUES (9, 7, '添加角色', NULL, NULL, 1, 2, 'sys:role:save', '_self', NULL, 0, 0, '2020-03-15 13:02:07', '2020-03-21 18:45:35');
INSERT INTO `sys_menu` VALUES (10, 7, '修改角色', NULL, NULL, 1, 3, 'sys:role:update', '_self', NULL, 0, 0, '2020-03-15 13:02:49', '2020-03-21 18:45:36');
INSERT INTO `sys_menu` VALUES (11, 7, '删除角色', NULL, NULL, 1, 4, 'sys:role:remove', '_self', NULL, 0, 0, '2020-03-20 17:58:51', '2020-03-21 18:45:38');
INSERT INTO `sys_menu` VALUES (12, 1, '权限管理', '', 'sys/menu', 0, 3, 'sys:menu:view', '_self', NULL, 0, 0, '2020-03-21 01:07:13', '2020-08-04 13:47:02');
INSERT INTO `sys_menu` VALUES (13, 12, '查询菜单', NULL, NULL, 1, 1, 'sys:menu:list', '_self', NULL, 0, 0, '2020-03-21 16:43:30', '2020-03-21 18:45:40');
INSERT INTO `sys_menu` VALUES (14, 12, '添加菜单', NULL, NULL, 1, 2, 'sys:menu:save', '_self', NULL, 0, 0, '2020-03-21 16:43:54', '2020-03-21 18:45:41');
INSERT INTO `sys_menu` VALUES (15, 12, '修改菜单', NULL, NULL, 1, 3, 'sys:menu:update', '_self', NULL, 0, 0, '2020-03-21 18:24:17', '2020-03-21 18:45:43');
INSERT INTO `sys_menu` VALUES (16, 12, '删除菜单', NULL, NULL, 1, 4, 'sys:menu:remove', '_self', NULL, 0, 0, '2020-03-21 18:24:18', '2020-03-21 18:45:44');
INSERT INTO `sys_menu` VALUES (17, 1, '机构管理', NULL, 'sys/organization', 0, 4, 'sys:org:view', '_self', NULL, 0, 0, '2020-03-21 18:24:20', '2020-03-21 18:45:49');
INSERT INTO `sys_menu` VALUES (18, 17, '查询机构', NULL, NULL, 1, 1, 'sys:org:list', '_self', NULL, 0, 0, '2020-03-21 18:24:21', '2020-03-21 18:44:36');
INSERT INTO `sys_menu` VALUES (19, 17, '添加机构', NULL, NULL, 1, 2, 'sys:org:save', '_self', NULL, 0, 0, '2020-03-21 18:24:22', '2020-03-21 18:45:51');
INSERT INTO `sys_menu` VALUES (20, 17, '修改机构', NULL, NULL, 1, 3, 'sys:org:update', '_self', NULL, 0, 0, '2020-03-21 18:24:24', '2020-03-21 18:45:52');
INSERT INTO `sys_menu` VALUES (21, 17, '删除机构', NULL, NULL, 1, 4, 'sys:org:remove', '_self', NULL, 0, 0, '2020-03-21 18:24:25', '2020-03-21 18:45:54');
INSERT INTO `sys_menu` VALUES (22, 1, '字典管理', NULL, 'sys/dict', 0, 5, 'sys:dict:view', '_self', NULL, 0, 0, '2020-03-21 18:24:26', '2020-03-21 18:45:56');
INSERT INTO `sys_menu` VALUES (23, 22, '查询字典', NULL, NULL, 1, 1, 'sys:dict:list', '_self', NULL, 0, 0, '2020-03-21 18:24:27', '2020-03-21 18:44:42');
INSERT INTO `sys_menu` VALUES (24, 22, '添加字典', NULL, NULL, 1, 2, 'sys:dict:save', '_self', NULL, 0, 0, '2020-03-21 18:24:28', '2020-03-21 18:45:59');
INSERT INTO `sys_menu` VALUES (25, 22, '修改字典', NULL, NULL, 1, 3, 'sys:dict:update', '_self', NULL, 0, 0, '2020-03-21 18:24:29', '2020-03-21 18:46:01');
INSERT INTO `sys_menu` VALUES (26, 22, '删除字典', NULL, NULL, 1, 4, 'sys:dict:remove', '_self', NULL, 0, 0, '2020-03-21 18:24:31', '2020-03-21 18:46:02');
INSERT INTO `sys_menu` VALUES (27, 0, '日志管理', 'layui-icon layui-icon-list', '', 0, 102, '', '_self', NULL, 0, 0, '2020-03-21 18:24:32', '2020-08-04 13:47:18');
INSERT INTO `sys_menu` VALUES (28, 1, '登录日志', '', 'sys/loginRecord', 0, 4, 'sys:login_record:view', '_self', NULL, 0, 0, '2020-03-21 18:24:33', '2020-08-04 13:48:02');
INSERT INTO `sys_menu` VALUES (29, 27, '操作日志', NULL, 'sys/operRecord', 0, 2, 'sys:oper_record:view', '_self', NULL, 0, 0, '2020-03-21 18:24:34', '2020-03-21 18:46:10');
INSERT INTO `sys_menu` VALUES (30, 27, '数据监控', NULL, 'druid', 0, 3, NULL, '_self', NULL, 0, 0, '2020-03-21 18:24:35', '2020-03-22 14:46:21');
INSERT INTO `sys_menu` VALUES (31, 0, '系统工具', 'layui-icon layui-icon-slider', '', 0, 103, '', '_self', NULL, 0, 0, '2020-03-21 18:24:36', '2020-08-04 13:47:38');
INSERT INTO `sys_menu` VALUES (32, 31, '文件管理', NULL, 'file/manage', 0, 1, 'sys:file:view', '_self', NULL, 0, 0, '2020-03-21 18:24:38', '2020-03-22 14:46:57');
INSERT INTO `sys_menu` VALUES (33, 32, '查询文件', NULL, NULL, 1, 1, 'sys:file:list', '_self', NULL, 0, 0, '2020-03-21 18:24:39', '2020-03-22 14:47:32');
INSERT INTO `sys_menu` VALUES (34, 32, '删除文件', NULL, NULL, 1, 2, 'sys:file:remove', '_self', NULL, 0, 0, '2020-03-21 18:24:40', '2020-03-22 14:46:54');
INSERT INTO `sys_menu` VALUES (35, 31, '发送邮件', NULL, 'sys/email', 0, 2, 'sys:email:view', '_self', NULL, 0, 0, '2020-03-21 18:24:41', '2020-03-22 14:47:35');
INSERT INTO `sys_menu` VALUES (36, 31, '项目生成', NULL, NULL, 0, 3, NULL, '_self', NULL, 0, 0, '2020-03-21 18:24:42', '2020-03-22 14:47:36');
INSERT INTO `sys_menu` VALUES (37, 0, '物流调度建模', 'layui-icon layui-icon-senior', '', 0, 2, '', '_self', NULL, 0, 1, '2020-08-05 11:06:12', '2021-07-06 11:20:59');
INSERT INTO `sys_menu` VALUES (38, 37, '配送点管理', '', 'wlddjm/peisongdian', 0, 1, 'wlddjm:peisongdian:view', '_self', NULL, 0, 1, '2020-08-05 11:06:12', '2021-07-06 11:21:07');
INSERT INTO `sys_menu` VALUES (39, 38, '查询配送点', '', '', 1, 1, 'wlddjm:peisongdian:list', '_self', NULL, 0, 1, '2020-08-05 11:06:12', '2021-07-06 11:21:15');
INSERT INTO `sys_menu` VALUES (40, 38, '添加配送点', '', '', 1, 2, 'wlddjm:peisongdian:save', '_self', NULL, 0, 1, '2020-08-05 11:06:12', '2021-07-06 11:22:28');
INSERT INTO `sys_menu` VALUES (43, 37, '配送路径管理', '', 'wlddjm/peisonglujing', 0, 1, 'wlddjm:peisonglujing:view', '_self', NULL, 0, 1, '2020-08-05 11:06:12', '2021-07-06 11:21:20');
INSERT INTO `sys_menu` VALUES (44, 43, '查询配送路径', '', '', 1, 1, 'wlddjm:peisonglujing:list', '_self', NULL, 0, 1, '2020-08-05 11:06:12', '2021-07-06 11:21:24');
INSERT INTO `sys_menu` VALUES (49, 0, '配送作业管理', 'layui-icon layui-icon-senior', '', 0, 3, '', '_self', NULL, 0, 1, '2020-08-05 11:06:12', '2021-07-06 11:19:24');
INSERT INTO `sys_menu` VALUES (50, 49, '配送任务管理', '', 'pszygl/peisongrenwu', 0, 1, 'pszygl:peisongrenwu:view', '_self', NULL, 0, 1, '2020-08-05 11:06:12', '2021-07-06 11:21:28');
INSERT INTO `sys_menu` VALUES (51, 50, '查询配送任务', '', '', 1, 1, 'pszygl:peisongrenwu:list', '_self', NULL, 0, 1, '2020-08-05 11:06:12', '2021-07-06 11:21:32');
INSERT INTO `sys_menu` VALUES (55, 49, '配送作业排程管理', '', 'pszygl/peisongzuoyepaicheng', 0, 1, 'pszygl:peisongzuoyepaicheng:view', '_self', NULL, 0, 1, '2020-08-05 11:06:12', '2021-07-06 11:21:36');
INSERT INTO `sys_menu` VALUES (56, 55, '查询配送作业排程', '', '', 1, 1, 'pszygl:peisongzuoyepaicheng:list', '_self', NULL, 0, 1, '2020-08-05 11:06:12', '2021-07-06 11:21:40');
INSERT INTO `sys_menu` VALUES (60, 49, '配送作业执行管理', '', 'pszygl/peisongzuoyezhixing', 0, 1, 'pszygl:peisongzuoyezhixing:view', '_self', NULL, 0, 1, '2020-08-05 11:06:12', '2021-07-06 11:21:44');
INSERT INTO `sys_menu` VALUES (61, 60, '查询配送作业执行', '', '', 1, 1, 'pszygl:peisongzuoyezhixing:list', '_self', NULL, 0, 1, '2020-08-05 11:06:12', '2021-07-06 11:21:49');
INSERT INTO `sys_menu` VALUES (65, 49, '自动路径规划管理', '', 'pszygl/zidonglujing', 0, 1, 'pszygl:zidonglujing:view', '_self', NULL, 1, 1, '2020-08-05 11:06:12', '2021-07-06 11:21:55');
INSERT INTO `sys_menu` VALUES (66, 65, '查询自动路径规划', '', '', 1, 1, 'pszygl:zidonglujing:list', '_self', NULL, 0, 1, '2020-08-05 11:06:12', '2021-07-06 11:21:59');
INSERT INTO `sys_menu` VALUES (101, 0, '基础信息配置', 'layui-icon layui-icon-senior', '', 0, 1, '', '_self', NULL, 0, 1, '2020-08-04 13:40:26', '2021-07-06 11:22:02');
INSERT INTO `sys_menu` VALUES (102, 101, '运送方式管理', '', 'transport/transportWay', 0, 1, 'transport:transportWay:view', '_self', NULL, 0, 1, '2020-08-04 13:40:26', '2021-07-06 11:22:05');
INSERT INTO `sys_menu` VALUES (103, 102, '查询运送方式', '', '', 1, 1, 'transport:transportWay:list', '_self', NULL, 0, 1, '2020-08-04 13:40:26', '2021-07-06 11:22:09');
INSERT INTO `sys_menu` VALUES (119, 0, '设备管理', '', '', 0, 1, '', '_self', NULL, 0, 0, '2021-07-06 11:24:08', '2021-07-06 11:24:08');
INSERT INTO `sys_menu` VALUES (120, 119, '设备基本信息', '', '/equipment/EquipmentInfoController', 0, 1, '', '_self', NULL, 0, 0, '2021-07-06 11:27:43', '2021-07-06 11:27:43');

-- ----------------------------
-- Table structure for sys_oper_record
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_record`;
CREATE TABLE `sys_oper_record`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户id',
  `model` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作模块',
  `description` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作方法',
  `url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '请求地址',
  `request_method` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '请求方式',
  `oper_method` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '调用方法',
  `param` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '请求参数',
  `result` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '返回结果',
  `ip` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'ip地址',
  `comments` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `spend_time` int(11) NULL DEFAULT NULL COMMENT '请求耗时,单位毫秒',
  `state` int(11) NOT NULL DEFAULT 0 COMMENT '状态,0成功,1异常',
--  `create_time` timestamp NOT NULL COMMENT '操作时间',
--  `update_time` timestamp NOT NULL COMMENT '修改时间',
 `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '操作时间',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  CONSTRAINT `sys_oper_record_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `sys_user` (`user_id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 191 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '操作日志' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oper_record
-- ----------------------------
INSERT INTO `sys_oper_record` VALUES (1, 1, '角色管理', '分页查询', '/sys/role/page', 'GET', 'com.egao.common.system.controller.RoleController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '192.168.5.123', NULL, 151, 0, '2020-08-04 13:42:56', '2020-08-04 13:42:56');
INSERT INTO `sys_oper_record` VALUES (2, 1, '角色管理', '查询角色菜单', '/sys/role/menu/list', 'GET', 'com.egao.common.system.controller.RoleMenuController.list', '{\"roleId\":[\"1\"]}', NULL, '192.168.5.123', NULL, 124, 0, '2020-08-04 13:42:57', '2020-08-04 13:42:57');
INSERT INTO `sys_oper_record` VALUES (3, 1, '角色管理', '修改角色菜单', '/sys/role/menu/update/1', 'POST', 'com.egao.common.system.controller.RoleMenuController.setRoleAuth', '{}', NULL, '192.168.5.123', NULL, 178, 0, '2020-08-04 13:43:20', '2020-08-04 13:43:20');
INSERT INTO `sys_oper_record` VALUES (4, 1, '角色管理', '分页查询', '/sys/role/page', 'GET', 'com.egao.common.system.controller.RoleController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '192.168.5.123', NULL, 18, 0, '2020-08-04 13:43:22', '2020-08-04 13:43:22');
INSERT INTO `sys_oper_record` VALUES (5, 1, '用户管理', '分页查询', '/sys/user/page', 'GET', 'com.egao.common.system.controller.UserController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '192.168.5.123', NULL, 49, 0, '2020-08-04 13:43:25', '2020-08-04 13:43:25');
INSERT INTO `sys_oper_record` VALUES (6, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.egao.common.system.controller.MenuController.list', '{}', NULL, '192.168.5.123', NULL, 16, 0, '2020-08-04 13:43:27', '2020-08-04 13:43:27');
INSERT INTO `sys_oper_record` VALUES (7, 1, '登录日志', '分页查询', '/sys/loginRecord/page', 'GET', 'com.egao.common.system.controller.LoginRecordController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '192.168.5.123', NULL, 46, 0, '2020-08-04 13:43:28', '2020-08-04 13:43:28');
INSERT INTO `sys_oper_record` VALUES (8, 1, '操作日志', '分页查询', '/sys/operRecord/page', 'GET', 'com.egao.common.system.controller.OperRecordController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '192.168.5.123', NULL, 56, 0, '2020-08-04 13:43:29', '2020-08-04 13:43:29');
INSERT INTO `sys_oper_record` VALUES (9, 1, '角色管理', '分页查询', '/sys/role/page', 'GET', 'com.egao.common.system.controller.RoleController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '192.168.5.123', NULL, 27, 0, '2020-08-04 13:43:46', '2020-08-04 13:43:46');
INSERT INTO `sys_oper_record` VALUES (10, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.egao.common.system.controller.MenuController.list', '{}', NULL, '192.168.5.123', NULL, 20, 0, '2020-08-04 13:43:57', '2020-08-04 13:43:57');
INSERT INTO `sys_oper_record` VALUES (11, 1, '菜单管理', '修改', '/sys/menu/update', 'POST', 'com.egao.common.system.controller.MenuController.update', NULL, '{\"msg\":\"修改成功\",\"code\":0}', '192.168.5.123', NULL, 50, 0, '2020-08-04 13:44:21', '2020-08-04 13:44:21');
INSERT INTO `sys_oper_record` VALUES (12, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.egao.common.system.controller.MenuController.list', '{}', NULL, '192.168.5.123', NULL, 47, 0, '2020-08-04 13:44:21', '2020-08-04 13:44:21');
INSERT INTO `sys_oper_record` VALUES (13, 1, '菜单管理', '修改', '/sys/menu/update', 'POST', 'com.egao.common.system.controller.MenuController.update', NULL, '{\"msg\":\"修改成功\",\"code\":0}', '192.168.5.123', NULL, 13, 0, '2020-08-04 13:44:34', '2020-08-04 13:44:34');
INSERT INTO `sys_oper_record` VALUES (14, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.egao.common.system.controller.MenuController.list', '{}', NULL, '192.168.5.123', NULL, 12, 0, '2020-08-04 13:44:34', '2020-08-04 13:44:34');
INSERT INTO `sys_oper_record` VALUES (15, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.egao.common.system.controller.MenuController.list', '{}', NULL, '192.168.5.123', NULL, 15, 0, '2020-08-04 13:44:38', '2020-08-04 13:44:38');
INSERT INTO `sys_oper_record` VALUES (16, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.egao.common.system.controller.MenuController.list', '{}', NULL, '192.168.5.123', NULL, 56, 0, '2020-08-04 13:46:16', '2020-08-04 13:46:16');
INSERT INTO `sys_oper_record` VALUES (17, 1, '登录日志', '分页查询', '/sys/loginRecord/page', 'GET', 'com.egao.common.system.controller.LoginRecordController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '192.168.5.123', NULL, 131, 0, '2020-08-04 13:46:39', '2020-08-04 13:46:39');
INSERT INTO `sys_oper_record` VALUES (18, 1, '操作日志', '分页查询', '/sys/operRecord/page', 'GET', 'com.egao.common.system.controller.OperRecordController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '192.168.5.123', NULL, 38, 0, '2020-08-04 13:46:40', '2020-08-04 13:46:40');
INSERT INTO `sys_oper_record` VALUES (19, 1, '菜单管理', '修改', '/sys/menu/update', 'POST', 'com.egao.common.system.controller.MenuController.update', NULL, '{\"msg\":\"修改成功\",\"code\":0}', '192.168.5.123', NULL, 59, 0, '2020-08-04 13:47:02', '2020-08-04 13:47:02');
INSERT INTO `sys_oper_record` VALUES (20, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.egao.common.system.controller.MenuController.list', '{}', NULL, '192.168.5.123', NULL, 20, 0, '2020-08-04 13:47:02', '2020-08-04 13:47:02');
INSERT INTO `sys_oper_record` VALUES (21, 1, '菜单管理', '修改', '/sys/menu/update', 'POST', 'com.egao.common.system.controller.MenuController.update', NULL, '{\"msg\":\"修改成功\",\"code\":0}', '192.168.5.123', NULL, 38, 0, '2020-08-04 13:47:09', '2020-08-04 13:47:09');
INSERT INTO `sys_oper_record` VALUES (22, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.egao.common.system.controller.MenuController.list', '{}', NULL, '192.168.5.123', NULL, 41, 0, '2020-08-04 13:47:09', '2020-08-04 13:47:09');
INSERT INTO `sys_oper_record` VALUES (23, 1, '菜单管理', '修改', '/sys/menu/update', 'POST', 'com.egao.common.system.controller.MenuController.update', NULL, '{\"msg\":\"修改成功\",\"code\":0}', '192.168.5.123', NULL, 17, 0, '2020-08-04 13:47:18', '2020-08-04 13:47:18');
INSERT INTO `sys_oper_record` VALUES (24, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.egao.common.system.controller.MenuController.list', '{}', NULL, '192.168.5.123', NULL, 21, 0, '2020-08-04 13:47:18', '2020-08-04 13:47:18');
INSERT INTO `sys_oper_record` VALUES (25, 1, '菜单管理', '修改', '/sys/menu/update', 'POST', 'com.egao.common.system.controller.MenuController.update', NULL, '{\"msg\":\"修改成功\",\"code\":0}', '192.168.5.123', NULL, 37, 0, '2020-08-04 13:47:38', '2020-08-04 13:47:38');
INSERT INTO `sys_oper_record` VALUES (26, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.egao.common.system.controller.MenuController.list', '{}', NULL, '192.168.5.123', NULL, 28, 0, '2020-08-04 13:47:38', '2020-08-04 13:47:38');
INSERT INTO `sys_oper_record` VALUES (27, 1, '菜单管理', '修改', '/sys/menu/update', 'POST', 'com.egao.common.system.controller.MenuController.update', NULL, '{\"msg\":\"修改成功\",\"code\":0}', '192.168.5.123', NULL, 16, 0, '2020-08-04 13:48:02', '2020-08-04 13:48:02');
INSERT INTO `sys_oper_record` VALUES (28, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.egao.common.system.controller.MenuController.list', '{}', NULL, '192.168.5.123', NULL, 24, 0, '2020-08-04 13:48:02', '2020-08-04 13:48:02');
INSERT INTO `sys_oper_record` VALUES (29, 1, '角色管理', '分页查询', '/sys/role/page', 'GET', 'com.egao.common.system.controller.RoleController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '192.168.5.123', NULL, 49, 0, '2020-08-04 13:48:04', '2020-08-04 13:48:04');
INSERT INTO `sys_oper_record` VALUES (30, 1, '角色管理', '查询角色菜单', '/sys/role/menu/list', 'GET', 'com.egao.common.system.controller.RoleMenuController.list', '{\"roleId\":[\"1\"]}', NULL, '192.168.5.123', NULL, 72, 0, '2020-08-04 13:48:05', '2020-08-04 13:48:05');
INSERT INTO `sys_oper_record` VALUES (31, 1, '角色管理', '修改角色菜单', '/sys/role/menu/update/1', 'POST', 'com.egao.common.system.controller.RoleMenuController.setRoleAuth', '{}', NULL, '192.168.5.123', NULL, 119, 0, '2020-08-04 13:48:14', '2020-08-04 13:48:14');
INSERT INTO `sys_oper_record` VALUES (32, 1, '角色管理', '分页查询', '/sys/role/page', 'GET', 'com.egao.common.system.controller.RoleController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '192.168.5.123', NULL, 20, 0, '2020-08-04 13:48:16', '2020-08-04 13:48:16');
INSERT INTO `sys_oper_record` VALUES (33, 1, '登录日志', '分页查询', '/sys/loginRecord/page', 'GET', 'com.egao.common.system.controller.LoginRecordController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '192.168.5.123', NULL, 40, 0, '2020-08-04 13:48:17', '2020-08-04 13:48:17');
INSERT INTO `sys_oper_record` VALUES (34, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.egao.common.system.controller.MenuController.list', '{}', NULL, '192.168.5.123', NULL, 15, 0, '2020-08-04 13:48:20', '2020-08-04 13:48:20');
INSERT INTO `sys_oper_record` VALUES (35, 1, '用户管理', '分页查询', '/sys/user/page', 'GET', 'com.egao.common.system.controller.UserController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '192.168.5.123', NULL, 40, 0, '2020-08-04 13:48:20', '2020-08-04 13:48:20');
INSERT INTO `sys_oper_record` VALUES (36, 1, '用户管理', '分页查询', '/sys/user/page', 'GET', 'com.egao.common.system.controller.UserController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '192.168.5.123', NULL, 33, 0, '2020-08-04 13:48:25', '2020-08-04 13:48:25');
INSERT INTO `sys_oper_record` VALUES (37, 1, '角色管理', '分页查询', '/sys/role/page', 'GET', 'com.egao.common.system.controller.RoleController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '192.168.5.123', NULL, 22, 0, '2020-08-04 13:48:26', '2020-08-04 13:48:26');
INSERT INTO `sys_oper_record` VALUES (38, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.egao.common.system.controller.MenuController.list', '{}', NULL, '192.168.5.123', NULL, 15, 0, '2020-08-04 13:48:27', '2020-08-04 13:48:27');
INSERT INTO `sys_oper_record` VALUES (39, 1, '登录日志', '分页查询', '/sys/loginRecord/page', 'GET', 'com.egao.common.system.controller.LoginRecordController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '192.168.5.123', NULL, 21, 0, '2020-08-04 13:48:28', '2020-08-04 13:48:28');
INSERT INTO `sys_oper_record` VALUES (40, 1, '角色管理', '查询角色菜单', '/sys/role/menu/list', 'GET', 'com.egao.common.system.controller.RoleMenuController.list', '{\"roleId\":[\"1\"]}', NULL, '192.168.5.123', NULL, 47, 0, '2020-08-04 13:48:33', '2020-08-04 13:48:33');
INSERT INTO `sys_oper_record` VALUES (41, 1, '角色管理', '修改角色菜单', '/sys/role/menu/update/1', 'POST', 'com.egao.common.system.controller.RoleMenuController.setRoleAuth', '{}', NULL, '192.168.5.123', NULL, 110, 0, '2020-08-04 13:48:37', '2020-08-04 13:48:37');
INSERT INTO `sys_oper_record` VALUES (42, 1, '角色管理', '分页查询', '/sys/role/page', 'GET', 'com.egao.common.system.controller.RoleController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '192.168.5.123', NULL, 18, 0, '2020-08-04 13:48:39', '2020-08-04 13:48:39');
INSERT INTO `sys_oper_record` VALUES (43, 1, '角色管理', '分页查询', '/sys/role/page', 'GET', 'com.egao.common.system.controller.RoleController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '192.168.5.123', NULL, 18, 0, '2020-08-04 13:48:49', '2020-08-04 13:48:49');
INSERT INTO `sys_oper_record` VALUES (44, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.egao.common.system.controller.MenuController.list', '{}', NULL, '192.168.5.123', NULL, 16, 0, '2020-08-04 13:48:51', '2020-08-04 13:48:51');
INSERT INTO `sys_oper_record` VALUES (45, 1, '用户管理', '分页查询', '/sys/user/page', 'GET', 'com.egao.common.system.controller.UserController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '192.168.5.123', NULL, 37, 0, '2020-08-04 13:49:18', '2020-08-04 13:49:18');
INSERT INTO `sys_oper_record` VALUES (46, 1, '角色管理', '分页查询', '/sys/role/page', 'GET', 'com.egao.common.system.controller.RoleController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '192.168.5.123', NULL, 19, 0, '2020-08-04 13:49:19', '2020-08-04 13:49:19');
INSERT INTO `sys_oper_record` VALUES (47, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.egao.common.system.controller.MenuController.list', '{}', NULL, '192.168.5.123', NULL, 21, 0, '2020-08-04 13:49:21', '2020-08-04 13:49:21');
INSERT INTO `sys_oper_record` VALUES (48, 1, '登录日志', '分页查询', '/sys/loginRecord/page', 'GET', 'com.egao.common.system.controller.LoginRecordController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '192.168.5.123', NULL, 30, 0, '2020-08-04 13:49:21', '2020-08-04 13:49:21');
INSERT INTO `sys_oper_record` VALUES (49, 1, '用户管理', '分页查询', '/sys/user/page', 'GET', 'com.egao.common.system.controller.UserController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '192.168.5.123', NULL, 64, 0, '2020-08-04 13:49:31', '2020-08-04 13:49:31');
INSERT INTO `sys_oper_record` VALUES (50, 1, '用户管理', '分页查询', '/sys/user/page', 'GET', 'com.egao.common.system.controller.UserController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '192.168.5.123', NULL, 38, 0, '2020-08-04 13:50:25', '2020-08-04 13:50:25');
INSERT INTO `sys_oper_record` VALUES (51, 1, '用户管理', '分页查询', '/sys/user/page', 'GET', 'com.egao.common.system.controller.UserController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '192.168.5.123', NULL, 33, 0, '2020-08-04 13:50:43', '2020-08-04 13:50:43');
INSERT INTO `sys_oper_record` VALUES (52, 1, '角色管理', '分页查询', '/sys/role/page', 'GET', 'com.egao.common.system.controller.RoleController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '192.168.5.123', NULL, 37, 0, '2020-08-04 13:54:35', '2020-08-04 13:54:35');
INSERT INTO `sys_oper_record` VALUES (53, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.egao.common.system.controller.MenuController.list', '{}', NULL, '192.168.5.123', NULL, 32, 0, '2020-08-04 13:54:38', '2020-08-04 13:54:38');
INSERT INTO `sys_oper_record` VALUES (54, 1, '用户管理', '分页查询', '/sys/user/page', 'GET', 'com.egao.common.system.controller.UserController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '192.168.5.123', NULL, 68, 0, '2020-08-04 14:16:27', '2020-08-04 14:16:27');
INSERT INTO `sys_oper_record` VALUES (55, 1, '用户管理', '添加', '/sys/user/save', 'POST', 'com.egao.common.system.controller.UserController.save', NULL, NULL, '192.168.5.123', 'com.egao.common.core.exception.BusinessException: 手机号已存在', 47, 1, '2020-08-04 14:17:25', '2020-08-04 14:17:25');
INSERT INTO `sys_oper_record` VALUES (56, 1, '用户管理', '添加', '/sys/user/save', 'POST', 'com.egao.common.system.controller.UserController.save', NULL, '{\"msg\":\"添加成功\",\"code\":0}', '192.168.5.123', NULL, 88, 0, '2020-08-04 14:18:40', '2020-08-04 14:18:40');
INSERT INTO `sys_oper_record` VALUES (57, 1, '用户管理', '分页查询', '/sys/user/page', 'GET', 'com.egao.common.system.controller.UserController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '192.168.5.123', NULL, 50, 0, '2020-08-04 14:18:40', '2020-08-04 14:18:40');
INSERT INTO `sys_oper_record` VALUES (58, 1, '用户管理', '修改', '/sys/user/update', 'POST', 'com.egao.common.system.controller.UserController.update', NULL, '{\"msg\":\"修改成功\",\"code\":0}', '192.168.5.123', NULL, 63, 0, '2020-08-04 14:18:48', '2020-08-04 14:18:48');
INSERT INTO `sys_oper_record` VALUES (59, 1, '用户管理', '分页查询', '/sys/user/page', 'GET', 'com.egao.common.system.controller.UserController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '192.168.5.123', NULL, 37, 0, '2020-08-04 14:18:48', '2020-08-04 14:18:48');
INSERT INTO `sys_oper_record` VALUES (60, 1, '用户管理', '删除', '/sys/user/remove', 'GET', 'com.egao.common.system.controller.UserController.remove', '{\"id\":[\"2\"]}', '{\"msg\":\"删除成功\",\"code\":0}', '192.168.5.123', NULL, 48, 0, '2020-08-04 14:18:55', '2020-08-04 14:18:55');
INSERT INTO `sys_oper_record` VALUES (61, 1, '用户管理', '分页查询', '/sys/user/page', 'GET', 'com.egao.common.system.controller.UserController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '192.168.5.123', NULL, 38, 0, '2020-08-04 14:18:55', '2020-08-04 14:18:55');
INSERT INTO `sys_oper_record` VALUES (62, 1, '用户管理', '分页查询', '/sys/user/page', 'GET', 'com.egao.common.system.controller.UserController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"],\"username\":[\"test\"],\"nickName\":[\"\"],\"sex\":[\"\"]}', NULL, '192.168.5.123', NULL, 35, 0, '2020-08-04 14:19:02', '2020-08-04 14:19:02');
INSERT INTO `sys_oper_record` VALUES (63, 1, '用户管理', '分页查询', '/sys/user/page', 'GET', 'com.egao.common.system.controller.UserController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"],\"username\":[\"admin\"],\"nickName\":[\"\"],\"sex\":[\"\"]}', NULL, '192.168.5.123', NULL, 53, 0, '2020-08-04 14:19:08', '2020-08-04 14:19:08');
INSERT INTO `sys_oper_record` VALUES (64, 1, '角色管理', '分页查询', '/sys/role/page', 'GET', 'com.egao.common.system.controller.RoleController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '192.168.5.123', NULL, 35, 0, '2020-08-04 14:20:57', '2020-08-04 14:20:57');
INSERT INTO `sys_oper_record` VALUES (65, 1, '角色管理', '添加', '/sys/role/save', 'POST', 'com.egao.common.system.controller.RoleController.save', NULL, '{\"msg\":\"添加成功\",\"code\":0}', '192.168.5.123', NULL, 83, 0, '2020-08-04 14:21:49', '2020-08-04 14:21:49');
INSERT INTO `sys_oper_record` VALUES (66, 1, '角色管理', '分页查询', '/sys/role/page', 'GET', 'com.egao.common.system.controller.RoleController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '192.168.5.123', NULL, 34, 0, '2020-08-04 14:21:49', '2020-08-04 14:21:49');
INSERT INTO `sys_oper_record` VALUES (67, 1, '角色管理', '修改', '/sys/role/update', 'POST', 'com.egao.common.system.controller.RoleController.update', NULL, '{\"msg\":\"修改成功\",\"code\":0}', '192.168.5.123', NULL, 42, 0, '2020-08-04 14:22:02', '2020-08-04 14:22:02');
INSERT INTO `sys_oper_record` VALUES (68, 1, '角色管理', '分页查询', '/sys/role/page', 'GET', 'com.egao.common.system.controller.RoleController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '192.168.5.123', NULL, 26, 0, '2020-08-04 14:22:02', '2020-08-04 14:22:02');
INSERT INTO `sys_oper_record` VALUES (69, 1, '角色管理', '删除', '/sys/role/remove', 'GET', 'com.egao.common.system.controller.RoleController.remove', '{\"id\":[\"4\"]}', '{\"msg\":\"删除成功\",\"code\":0}', '192.168.5.123', NULL, 24, 0, '2020-08-04 14:22:06', '2020-08-04 14:22:06');
INSERT INTO `sys_oper_record` VALUES (70, 1, '角色管理', '分页查询', '/sys/role/page', 'GET', 'com.egao.common.system.controller.RoleController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '192.168.5.123', NULL, 16, 0, '2020-08-04 14:22:06', '2020-08-04 14:22:06');
INSERT INTO `sys_oper_record` VALUES (71, 1, '角色管理', '分页查询', '/sys/role/page', 'GET', 'com.egao.common.system.controller.RoleController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"],\"roleName\":[\"管理\"],\"roleCode\":[\"\"]}', NULL, '192.168.5.123', NULL, 27, 0, '2020-08-04 14:22:14', '2020-08-04 14:22:14');
INSERT INTO `sys_oper_record` VALUES (72, 1, '角色管理', '分页查询', '/sys/role/page', 'GET', 'com.egao.common.system.controller.RoleController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"],\"roleName\":[\"\"],\"roleCode\":[\"\"]}', NULL, '192.168.5.123', NULL, 15, 0, '2020-08-04 14:22:18', '2020-08-04 14:22:18');
INSERT INTO `sys_oper_record` VALUES (73, 1, '角色管理', '查询角色菜单', '/sys/role/menu/list', 'GET', 'com.egao.common.system.controller.RoleMenuController.list', '{\"roleId\":[\"3\"]}', NULL, '192.168.5.123', NULL, 46, 0, '2020-08-04 14:22:22', '2020-08-04 14:22:22');
INSERT INTO `sys_oper_record` VALUES (74, 1, '角色管理', '修改角色菜单', '/sys/role/menu/update/3', 'POST', 'com.egao.common.system.controller.RoleMenuController.setRoleAuth', '{}', NULL, '192.168.5.123', NULL, 450, 0, '2020-08-04 14:22:27', '2020-08-04 14:22:27');
INSERT INTO `sys_oper_record` VALUES (75, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.egao.common.system.controller.MenuController.list', '{}', NULL, '192.168.5.123', NULL, 16, 0, '2020-08-04 14:24:00', '2020-08-04 14:24:00');
INSERT INTO `sys_oper_record` VALUES (76, 1, '菜单管理', '添加', '/sys/menu/save', 'POST', 'com.egao.common.system.controller.MenuController.save', NULL, '{\"msg\":\"添加成功\",\"code\":0}', '192.168.5.123', NULL, 17, 0, '2020-08-04 14:24:26', '2020-08-04 14:24:26');
INSERT INTO `sys_oper_record` VALUES (77, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.egao.common.system.controller.MenuController.list', '{}', NULL, '192.168.5.123', NULL, 12, 0, '2020-08-04 14:24:26', '2020-08-04 14:24:26');
INSERT INTO `sys_oper_record` VALUES (78, 1, '菜单管理', '添加', '/sys/menu/save', 'POST', 'com.egao.common.system.controller.MenuController.save', NULL, '{\"msg\":\"添加成功\",\"code\":0}', '192.168.5.123', NULL, 24, 0, '2020-08-04 14:24:48', '2020-08-04 14:24:48');
INSERT INTO `sys_oper_record` VALUES (79, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.egao.common.system.controller.MenuController.list', '{}', NULL, '192.168.5.123', NULL, 19, 0, '2020-08-04 14:24:48', '2020-08-04 14:24:48');
INSERT INTO `sys_oper_record` VALUES (80, 1, '菜单管理', '删除', '/sys/menu/remove', 'GET', 'com.egao.common.system.controller.MenuController.remove', '{\"id\":[\"118\"]}', '{\"msg\":\"删除成功\",\"code\":0}', '192.168.5.123', NULL, 15, 0, '2020-08-04 14:24:57', '2020-08-04 14:24:57');
INSERT INTO `sys_oper_record` VALUES (81, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.egao.common.system.controller.MenuController.list', '{}', NULL, '192.168.5.123', NULL, 15, 0, '2020-08-04 14:24:57', '2020-08-04 14:24:57');
INSERT INTO `sys_oper_record` VALUES (82, 1, '菜单管理', '删除', '/sys/menu/remove', 'GET', 'com.egao.common.system.controller.MenuController.remove', '{\"id\":[\"117\"]}', '{\"msg\":\"删除成功\",\"code\":0}', '192.168.5.123', NULL, 132, 0, '2020-08-04 14:25:05', '2020-08-04 14:25:05');
INSERT INTO `sys_oper_record` VALUES (83, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.egao.common.system.controller.MenuController.list', '{}', NULL, '192.168.5.123', NULL, 12, 0, '2020-08-04 14:25:05', '2020-08-04 14:25:05');
INSERT INTO `sys_oper_record` VALUES (84, 1, '角色管理', '分页查询', '/sys/role/page', 'GET', 'com.egao.common.system.controller.RoleController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '192.168.5.123', NULL, 17, 0, '2020-08-04 14:27:07', '2020-08-04 14:27:07');
INSERT INTO `sys_oper_record` VALUES (85, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.egao.common.system.controller.MenuController.list', '{}', NULL, '192.168.5.123', NULL, 14, 0, '2020-08-04 14:27:08', '2020-08-04 14:27:08');
INSERT INTO `sys_oper_record` VALUES (86, 1, '菜单管理', '修改', '/sys/menu/update', 'POST', 'com.egao.common.system.controller.MenuController.update', NULL, '{\"msg\":\"修改成功\",\"code\":0}', '192.168.5.123', NULL, 15, 0, '2020-08-04 14:27:22', '2020-08-04 14:27:22');
INSERT INTO `sys_oper_record` VALUES (87, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.egao.common.system.controller.MenuController.list', '{}', NULL, '192.168.5.123', NULL, 12, 0, '2020-08-04 14:27:22', '2020-08-04 14:27:22');
INSERT INTO `sys_oper_record` VALUES (88, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.egao.common.system.controller.MenuController.list', '{}', NULL, '192.168.5.123', NULL, 16, 0, '2020-08-04 14:27:25', '2020-08-04 14:27:25');
INSERT INTO `sys_oper_record` VALUES (89, 1, '登录日志', '分页查询', '/sys/loginRecord/page', 'GET', 'com.egao.common.system.controller.LoginRecordController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '192.168.5.123', NULL, 218, 0, '2020-08-04 14:39:37', '2020-08-04 14:39:37');
INSERT INTO `sys_oper_record` VALUES (90, 1, '登录日志', '分页查询', '/sys/loginRecord/page', 'GET', 'com.egao.common.system.controller.LoginRecordController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"],\"sort\":[\"username\"],\"order\":[\"asc\"]}', NULL, '192.168.5.123', NULL, 39, 0, '2020-08-04 14:39:49', '2020-08-04 14:39:49');
INSERT INTO `sys_oper_record` VALUES (91, 1, '登录日志', '分页查询', '/sys/loginRecord/page', 'GET', 'com.egao.common.system.controller.LoginRecordController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"],\"sort\":[\"ip\"],\"order\":[\"asc\"]}', NULL, '192.168.5.123', NULL, 43, 0, '2020-08-04 14:39:51', '2020-08-04 14:39:51');
INSERT INTO `sys_oper_record` VALUES (92, 1, '登录日志', '分页查询', '/sys/loginRecord/page', 'GET', 'com.egao.common.system.controller.LoginRecordController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"],\"sort\":[\"browser\"],\"order\":[\"asc\"]}', NULL, '192.168.5.123', NULL, 49, 0, '2020-08-04 14:39:53', '2020-08-04 14:39:53');
INSERT INTO `sys_oper_record` VALUES (93, 1, '登录日志', '分页查询', '/sys/loginRecord/page', 'GET', 'com.egao.common.system.controller.LoginRecordController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"],\"sort\":[\"createTime\"],\"order\":[\"asc\"]}', NULL, '192.168.5.123', NULL, 51, 0, '2020-08-04 14:39:56', '2020-08-04 14:39:56');
INSERT INTO `sys_oper_record` VALUES (94, 1, '登录日志', '分页查询', '/sys/loginRecord/page', 'GET', 'com.egao.common.system.controller.LoginRecordController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"],\"sort\":[\"createTime\"],\"order\":[\"asc\"],\"username\":[\"admin\"],\"loginRecordDateSel\":[\"\"],\"createTimeStart\":[\"\"],\"createTimeEnd\":[\"\"]}', NULL, '192.168.5.123', NULL, 61, 0, '2020-08-04 14:40:00', '2020-08-04 14:40:00');
INSERT INTO `sys_oper_record` VALUES (95, 1, '登录日志', '分页查询', '/sys/loginRecord/page', 'GET', 'com.egao.common.system.controller.LoginRecordController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"],\"sort\":[\"createTime\"],\"order\":[\"asc\"],\"username\":[\"admin\"],\"loginRecordDateSel\":[\"2020-08-01 - 2020-08-05\"],\"createTimeStart\":[\"2020-08-01 00:00:00\"],\"createTimeEnd\":[\"2020-08-05 23:59:59\"]}', NULL, '192.168.5.123', NULL, 58, 0, '2020-08-04 14:40:07', '2020-08-04 14:40:07');
INSERT INTO `sys_oper_record` VALUES (96, 1, '登录日志', '分页查询', '/sys/loginRecord/page', 'GET', 'com.egao.common.system.controller.LoginRecordController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"],\"sort\":[\"createTime\"],\"order\":[\"asc\"],\"username\":[\"admin\"],\"loginRecordDateSel\":[\"2020-08-01 - 2020-08-03\"],\"createTimeStart\":[\"2020-08-01 00:00:00\"],\"createTimeEnd\":[\"2020-08-03 23:59:59\"]}', NULL, '192.168.5.123', NULL, 30, 0, '2020-08-04 14:40:15', '2020-08-04 14:40:15');
INSERT INTO `sys_oper_record` VALUES (97, 1, '登录日志', '分页查询', '/sys/loginRecord/page', 'GET', 'com.egao.common.system.controller.LoginRecordController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"],\"sort\":[\"createTime\"],\"order\":[\"asc\"],\"username\":[\"\"],\"loginRecordDateSel\":[\"\"],\"createTimeStart\":[\"\"],\"createTimeEnd\":[\"\"]}', NULL, '192.168.5.123', NULL, 48, 0, '2020-08-04 14:40:23', '2020-08-04 14:40:23');
INSERT INTO `sys_oper_record` VALUES (98, 1, '角色管理', '分页查询', '/sys/role/page', 'GET', 'com.egao.common.system.controller.RoleController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '192.168.5.123', NULL, 69, 0, '2020-08-05 11:06:25', '2020-08-05 11:06:25');
INSERT INTO `sys_oper_record` VALUES (99, 1, '用户管理', '分页查询', '/sys/user/page', 'GET', 'com.egao.common.system.controller.UserController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '192.168.5.123', NULL, 149, 0, '2020-08-05 11:06:25', '2020-08-05 11:06:25');
INSERT INTO `sys_oper_record` VALUES (100, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.egao.common.system.controller.MenuController.list', '{}', NULL, '192.168.5.123', NULL, 59, 0, '2020-08-05 11:06:26', '2020-08-05 11:06:26');
INSERT INTO `sys_oper_record` VALUES (101, 1, '登录日志', '分页查询', '/sys/loginRecord/page', 'GET', 'com.egao.common.system.controller.LoginRecordController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '192.168.5.123', NULL, 27, 0, '2020-08-05 11:06:26', '2020-08-05 11:06:26');
INSERT INTO `sys_oper_record` VALUES (102, 1, '角色管理', '查询角色菜单', '/sys/role/menu/list', 'GET', 'com.egao.common.system.controller.RoleMenuController.list', '{\"roleId\":[\"1\"]}', NULL, '192.168.5.123', NULL, 52, 0, '2020-08-05 11:06:48', '2020-08-05 11:06:48');
INSERT INTO `sys_oper_record` VALUES (103, 1, '角色管理', '修改角色菜单', '/sys/role/menu/update/1', 'POST', 'com.egao.common.system.controller.RoleMenuController.setRoleAuth', '{}', NULL, '192.168.5.123', NULL, 207, 0, '2020-08-05 11:07:00', '2020-08-05 11:07:00');
INSERT INTO `sys_oper_record` VALUES (104, 1, '角色管理', '分页查询', '/sys/role/page', 'GET', 'com.egao.common.system.controller.RoleController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '192.168.5.123', NULL, 16, 0, '2020-08-05 11:07:03', '2020-08-05 11:07:03');
INSERT INTO `sys_oper_record` VALUES (105, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.egao.common.system.controller.MenuController.list', '{}', NULL, '192.168.5.123', NULL, 25, 0, '2020-08-05 11:09:06', '2020-08-05 11:09:06');
INSERT INTO `sys_oper_record` VALUES (106, 1, '菜单管理', '修改', '/sys/menu/update', 'POST', 'com.egao.common.system.controller.MenuController.update', NULL, '{\"msg\":\"修改成功\",\"code\":0}', '192.168.5.123', NULL, 23, 0, '2020-08-05 11:09:23', '2020-08-05 11:09:23');
INSERT INTO `sys_oper_record` VALUES (107, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.egao.common.system.controller.MenuController.list', '{}', NULL, '192.168.5.123', NULL, 17, 0, '2020-08-05 11:09:23', '2020-08-05 11:09:23');
INSERT INTO `sys_oper_record` VALUES (108, 1, '菜单管理', '修改', '/sys/menu/update', 'POST', 'com.egao.common.system.controller.MenuController.update', NULL, '{\"msg\":\"修改成功\",\"code\":0}', '192.168.5.123', NULL, 15, 0, '2020-08-05 11:09:38', '2020-08-05 11:09:38');
INSERT INTO `sys_oper_record` VALUES (109, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.egao.common.system.controller.MenuController.list', '{}', NULL, '192.168.5.123', NULL, 24, 0, '2020-08-05 11:09:38', '2020-08-05 11:09:38');
INSERT INTO `sys_oper_record` VALUES (110, 1, '菜单管理', '修改', '/sys/menu/update', 'POST', 'com.egao.common.system.controller.MenuController.update', NULL, '{\"msg\":\"修改成功\",\"code\":0}', '192.168.5.123', NULL, 50, 0, '2020-08-05 11:09:49', '2020-08-05 11:09:49');
INSERT INTO `sys_oper_record` VALUES (111, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.egao.common.system.controller.MenuController.list', '{}', NULL, '192.168.5.123', NULL, 25, 0, '2020-08-05 11:09:49', '2020-08-05 11:09:49');
INSERT INTO `sys_oper_record` VALUES (112, 1, '菜单管理', '修改', '/sys/menu/update', 'POST', 'com.egao.common.system.controller.MenuController.update', NULL, '{\"msg\":\"修改成功\",\"code\":0}', '192.168.5.123', NULL, 17, 0, '2020-08-05 11:09:55', '2020-08-05 11:09:55');
INSERT INTO `sys_oper_record` VALUES (113, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.egao.common.system.controller.MenuController.list', '{}', NULL, '192.168.5.123', NULL, 16, 0, '2020-08-05 11:09:55', '2020-08-05 11:09:55');
INSERT INTO `sys_oper_record` VALUES (114, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.egao.common.system.controller.MenuController.list', '{}', NULL, '192.168.5.123', NULL, 16, 0, '2020-08-05 11:09:57', '2020-08-05 11:09:57');
INSERT INTO `sys_oper_record` VALUES (115, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.egao.common.system.controller.MenuController.list', '{}', NULL, '192.168.5.123', NULL, 17, 0, '2020-08-05 11:09:58', '2020-08-05 11:09:58');
INSERT INTO `sys_oper_record` VALUES (116, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.egao.common.system.controller.MenuController.list', '{}', NULL, '192.168.5.123', NULL, 23, 0, '2020-08-05 11:41:30', '2020-08-05 11:41:30');
INSERT INTO `sys_oper_record` VALUES (117, 1, '菜单管理', '修改', '/sys/menu/update', 'POST', 'com.egao.common.system.controller.MenuController.update', NULL, '{\"msg\":\"修改成功\",\"code\":0}', '192.168.5.123', NULL, 12, 0, '2020-08-05 11:41:53', '2020-08-05 11:41:53');
INSERT INTO `sys_oper_record` VALUES (118, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.egao.common.system.controller.MenuController.list', '{}', NULL, '192.168.5.123', NULL, 15, 0, '2020-08-05 11:41:53', '2020-08-05 11:41:53');
INSERT INTO `sys_oper_record` VALUES (119, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.egao.common.system.controller.MenuController.list', '{}', NULL, '192.168.5.123', NULL, 13, 0, '2020-08-05 11:41:56', '2020-08-05 11:41:56');
INSERT INTO `sys_oper_record` VALUES (120, 1, '用户管理', '分页查询', '/sys/user/page', 'GET', 'com.egao.common.system.controller.UserController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '192.168.5.123', NULL, 146, 0, '2020-08-10 10:47:37', '2020-08-10 10:47:37');
INSERT INTO `sys_oper_record` VALUES (121, 1, '用户管理', '分页查询', '/sys/user/page', 'GET', 'com.egao.common.system.controller.UserController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '192.168.5.123', NULL, 34, 0, '2020-08-10 13:45:39', '2020-08-10 13:45:39');
INSERT INTO `sys_oper_record` VALUES (122, 1, '角色管理', '分页查询', '/sys/role/page', 'GET', 'com.egao.common.system.controller.RoleController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '192.168.5.123', NULL, 25, 0, '2020-08-10 13:55:27', '2020-08-10 13:55:27');
INSERT INTO `sys_oper_record` VALUES (123, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.egao.common.system.controller.MenuController.list', '{}', NULL, '192.168.5.123', NULL, 29, 0, '2020-08-10 13:58:46', '2020-08-10 13:58:46');
INSERT INTO `sys_oper_record` VALUES (124, 1, '登录日志', '分页查询', '/sys/loginRecord/page', 'GET', 'com.egao.common.system.controller.LoginRecordController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '192.168.5.123', NULL, 30, 0, '2020-08-10 14:14:03', '2020-08-10 14:14:03');
INSERT INTO `sys_oper_record` VALUES (125, 1, '用户管理', '分页查询', '/sys/user/page', 'GET', 'com.egao.common.system.controller.UserController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '192.168.5.123', NULL, 77, 0, '2020-08-19 14:17:50', '2020-08-19 14:17:50');
INSERT INTO `sys_oper_record` VALUES (126, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.egao.common.system.controller.MenuController.list', '{}', NULL, '192.168.5.123', NULL, 27, 0, '2020-08-19 14:18:29', '2020-08-19 14:18:29');
INSERT INTO `sys_oper_record` VALUES (127, 1, '登录日志', '分页查询', '/sys/loginRecord/page', 'GET', 'com.egao.common.system.controller.LoginRecordController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '192.168.5.123', NULL, 29, 0, '2020-08-19 14:18:54', '2020-08-19 14:18:54');
INSERT INTO `sys_oper_record` VALUES (128, 1, '用户管理', '分页查询', '/sys/user/page', 'GET', 'com.egao.common.system.controller.UserController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '192.168.5.123', NULL, 61, 0, '2020-08-19 14:52:09', '2020-08-19 14:52:09');
INSERT INTO `sys_oper_record` VALUES (129, 1, '角色管理', '分页查询', '/sys/role/page', 'GET', 'com.egao.common.system.controller.RoleController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '192.168.5.123', NULL, 40, 0, '2020-08-19 14:52:09', '2020-08-19 14:52:09');
INSERT INTO `sys_oper_record` VALUES (130, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.egao.common.system.controller.MenuController.list', '{}', NULL, '192.168.5.123', NULL, 60, 0, '2020-08-19 14:52:37', '2020-08-19 14:52:37');
INSERT INTO `sys_oper_record` VALUES (131, 1, '角色管理', '分页查询', '/sys/role/page', 'GET', 'com.egao.common.system.controller.RoleController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '192.168.5.123', NULL, 37, 0, '2020-08-19 14:53:32', '2020-08-19 14:53:32');
INSERT INTO `sys_oper_record` VALUES (132, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.egao.common.system.controller.MenuController.list', '{}', NULL, '192.168.5.123', NULL, 36, 0, '2020-08-19 14:53:33', '2020-08-19 14:53:33');
INSERT INTO `sys_oper_record` VALUES (133, 1, '登录日志', '分页查询', '/sys/loginRecord/page', 'GET', 'com.egao.common.system.controller.LoginRecordController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '192.168.5.123', NULL, 21, 0, '2020-08-19 14:55:33', '2020-08-19 14:55:33');
INSERT INTO `sys_oper_record` VALUES (134, 1, '用户管理', '分页查询', '/sys/user/page', 'GET', 'com.egao.common.system.controller.UserController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '192.168.5.113', NULL, 192, 0, '2020-12-16 10:40:21', '2020-12-16 10:40:21');
INSERT INTO `sys_oper_record` VALUES (135, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.egao.common.system.controller.MenuController.list', '{}', NULL, '127.0.0.1', NULL, 101, 0, '2021-07-06 11:18:33', '2021-07-06 11:18:33');
INSERT INTO `sys_oper_record` VALUES (136, 1, '登录日志', '分页查询', '/sys/loginRecord/page', 'GET', 'com.egao.common.system.controller.LoginRecordController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 328, 0, '2021-07-06 11:19:14', '2021-07-06 11:19:14');
INSERT INTO `sys_oper_record` VALUES (137, 1, '菜单管理', '删除', '/sys/menu/remove', 'GET', 'com.egao.common.system.controller.MenuController.remove', '{\"id\":[\"49\"]}', '{\"msg\":\"删除成功\",\"code\":0}', '127.0.0.1', NULL, 187, 0, '2021-07-06 11:19:25', '2021-07-06 11:19:25');
INSERT INTO `sys_oper_record` VALUES (138, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.egao.common.system.controller.MenuController.list', '{}', NULL, '127.0.0.1', NULL, 120, 0, '2021-07-06 11:19:25', '2021-07-06 11:19:25');
INSERT INTO `sys_oper_record` VALUES (139, 1, '菜单管理', '删除', '/sys/menu/remove', 'GET', 'com.egao.common.system.controller.MenuController.remove', '{\"id\":[\"37\"]}', '{\"msg\":\"删除成功\",\"code\":0}', '127.0.0.1', NULL, 110, 0, '2021-07-06 11:20:59', '2021-07-06 11:20:59');
INSERT INTO `sys_oper_record` VALUES (140, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.egao.common.system.controller.MenuController.list', '{}', NULL, '127.0.0.1', NULL, 208, 0, '2021-07-06 11:20:59', '2021-07-06 11:20:59');
INSERT INTO `sys_oper_record` VALUES (141, 1, '菜单管理', '删除', '/sys/menu/remove', 'GET', 'com.egao.common.system.controller.MenuController.remove', '{\"id\":[\"38\"]}', '{\"msg\":\"删除成功\",\"code\":0}', '127.0.0.1', NULL, 55, 0, '2021-07-06 11:21:08', '2021-07-06 11:21:08');
INSERT INTO `sys_oper_record` VALUES (142, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.egao.common.system.controller.MenuController.list', '{}', NULL, '127.0.0.1', NULL, 54, 0, '2021-07-06 11:21:08', '2021-07-06 11:21:08');
INSERT INTO `sys_oper_record` VALUES (143, 1, '菜单管理', '删除', '/sys/menu/remove', 'GET', 'com.egao.common.system.controller.MenuController.remove', '{\"id\":[\"39\"]}', '{\"msg\":\"删除成功\",\"code\":0}', '127.0.0.1', NULL, 69, 0, '2021-07-06 11:21:15', '2021-07-06 11:21:15');
INSERT INTO `sys_oper_record` VALUES (144, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.egao.common.system.controller.MenuController.list', '{}', NULL, '127.0.0.1', NULL, 57, 0, '2021-07-06 11:21:15', '2021-07-06 11:21:15');
INSERT INTO `sys_oper_record` VALUES (145, 1, '菜单管理', '删除', '/sys/menu/remove', 'GET', 'com.egao.common.system.controller.MenuController.remove', '{\"id\":[\"43\"]}', '{\"msg\":\"删除成功\",\"code\":0}', '127.0.0.1', NULL, 92, 0, '2021-07-06 11:21:20', '2021-07-06 11:21:20');
INSERT INTO `sys_oper_record` VALUES (146, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.egao.common.system.controller.MenuController.list', '{}', NULL, '127.0.0.1', NULL, 39, 0, '2021-07-06 11:21:20', '2021-07-06 11:21:20');
INSERT INTO `sys_oper_record` VALUES (147, 1, '菜单管理', '删除', '/sys/menu/remove', 'GET', 'com.egao.common.system.controller.MenuController.remove', '{\"id\":[\"44\"]}', '{\"msg\":\"删除成功\",\"code\":0}', '127.0.0.1', NULL, 70, 0, '2021-07-06 11:21:24', '2021-07-06 11:21:24');
INSERT INTO `sys_oper_record` VALUES (148, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.egao.common.system.controller.MenuController.list', '{}', NULL, '127.0.0.1', NULL, 27, 0, '2021-07-06 11:21:24', '2021-07-06 11:21:24');
INSERT INTO `sys_oper_record` VALUES (149, 1, '菜单管理', '删除', '/sys/menu/remove', 'GET', 'com.egao.common.system.controller.MenuController.remove', '{\"id\":[\"50\"]}', '{\"msg\":\"删除成功\",\"code\":0}', '127.0.0.1', NULL, 64, 0, '2021-07-06 11:21:28', '2021-07-06 11:21:28');
INSERT INTO `sys_oper_record` VALUES (150, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.egao.common.system.controller.MenuController.list', '{}', NULL, '127.0.0.1', NULL, 57, 0, '2021-07-06 11:21:28', '2021-07-06 11:21:28');
INSERT INTO `sys_oper_record` VALUES (151, 1, '菜单管理', '删除', '/sys/menu/remove', 'GET', 'com.egao.common.system.controller.MenuController.remove', '{\"id\":[\"51\"]}', '{\"msg\":\"删除成功\",\"code\":0}', '127.0.0.1', NULL, 73, 0, '2021-07-06 11:21:32', '2021-07-06 11:21:32');
INSERT INTO `sys_oper_record` VALUES (152, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.egao.common.system.controller.MenuController.list', '{}', NULL, '127.0.0.1', NULL, 28, 0, '2021-07-06 11:21:32', '2021-07-06 11:21:32');
INSERT INTO `sys_oper_record` VALUES (153, 1, '菜单管理', '删除', '/sys/menu/remove', 'GET', 'com.egao.common.system.controller.MenuController.remove', '{\"id\":[\"55\"]}', '{\"msg\":\"删除成功\",\"code\":0}', '127.0.0.1', NULL, 78, 0, '2021-07-06 11:21:37', '2021-07-06 11:21:37');
INSERT INTO `sys_oper_record` VALUES (154, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.egao.common.system.controller.MenuController.list', '{}', NULL, '127.0.0.1', NULL, 35, 0, '2021-07-06 11:21:37', '2021-07-06 11:21:37');
INSERT INTO `sys_oper_record` VALUES (155, 1, '菜单管理', '删除', '/sys/menu/remove', 'GET', 'com.egao.common.system.controller.MenuController.remove', '{\"id\":[\"56\"]}', '{\"msg\":\"删除成功\",\"code\":0}', '127.0.0.1', NULL, 56, 0, '2021-07-06 11:21:40', '2021-07-06 11:21:40');
INSERT INTO `sys_oper_record` VALUES (156, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.egao.common.system.controller.MenuController.list', '{}', NULL, '127.0.0.1', NULL, 35, 0, '2021-07-06 11:21:40', '2021-07-06 11:21:40');
INSERT INTO `sys_oper_record` VALUES (157, 1, '菜单管理', '删除', '/sys/menu/remove', 'GET', 'com.egao.common.system.controller.MenuController.remove', '{\"id\":[\"60\"]}', '{\"msg\":\"删除成功\",\"code\":0}', '127.0.0.1', NULL, 96, 0, '2021-07-06 11:21:44', '2021-07-06 11:21:44');
INSERT INTO `sys_oper_record` VALUES (158, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.egao.common.system.controller.MenuController.list', '{}', NULL, '127.0.0.1', NULL, 62, 0, '2021-07-06 11:21:44', '2021-07-06 11:21:44');
INSERT INTO `sys_oper_record` VALUES (159, 1, '菜单管理', '删除', '/sys/menu/remove', 'GET', 'com.egao.common.system.controller.MenuController.remove', '{\"id\":[\"61\"]}', '{\"msg\":\"删除成功\",\"code\":0}', '127.0.0.1', NULL, 69, 0, '2021-07-06 11:21:49', '2021-07-06 11:21:49');
INSERT INTO `sys_oper_record` VALUES (160, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.egao.common.system.controller.MenuController.list', '{}', NULL, '127.0.0.1', NULL, 26, 0, '2021-07-06 11:21:49', '2021-07-06 11:21:49');
INSERT INTO `sys_oper_record` VALUES (161, 1, '菜单管理', '删除', '/sys/menu/remove', 'GET', 'com.egao.common.system.controller.MenuController.remove', '{\"id\":[\"65\"]}', '{\"msg\":\"删除成功\",\"code\":0}', '127.0.0.1', NULL, 122, 0, '2021-07-06 11:21:55', '2021-07-06 11:21:55');
INSERT INTO `sys_oper_record` VALUES (162, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.egao.common.system.controller.MenuController.list', '{}', NULL, '127.0.0.1', NULL, 35, 0, '2021-07-06 11:21:55', '2021-07-06 11:21:55');
INSERT INTO `sys_oper_record` VALUES (163, 1, '菜单管理', '删除', '/sys/menu/remove', 'GET', 'com.egao.common.system.controller.MenuController.remove', '{\"id\":[\"66\"]}', '{\"msg\":\"删除成功\",\"code\":0}', '127.0.0.1', NULL, 108, 0, '2021-07-06 11:21:59', '2021-07-06 11:21:59');
INSERT INTO `sys_oper_record` VALUES (164, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.egao.common.system.controller.MenuController.list', '{}', NULL, '127.0.0.1', NULL, 31, 0, '2021-07-06 11:21:59', '2021-07-06 11:21:59');
INSERT INTO `sys_oper_record` VALUES (165, 1, '菜单管理', '删除', '/sys/menu/remove', 'GET', 'com.egao.common.system.controller.MenuController.remove', '{\"id\":[\"101\"]}', '{\"msg\":\"删除成功\",\"code\":0}', '127.0.0.1', NULL, 92, 0, '2021-07-06 11:22:02', '2021-07-06 11:22:02');
INSERT INTO `sys_oper_record` VALUES (166, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.egao.common.system.controller.MenuController.list', '{}', NULL, '127.0.0.1', NULL, 20, 0, '2021-07-06 11:22:02', '2021-07-06 11:22:02');
INSERT INTO `sys_oper_record` VALUES (167, 1, '菜单管理', '删除', '/sys/menu/remove', 'GET', 'com.egao.common.system.controller.MenuController.remove', '{\"id\":[\"102\"]}', '{\"msg\":\"删除成功\",\"code\":0}', '127.0.0.1', NULL, 108, 0, '2021-07-06 11:22:06', '2021-07-06 11:22:06');
INSERT INTO `sys_oper_record` VALUES (168, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.egao.common.system.controller.MenuController.list', '{}', NULL, '127.0.0.1', NULL, 22, 0, '2021-07-06 11:22:06', '2021-07-06 11:22:06');
INSERT INTO `sys_oper_record` VALUES (169, 1, '菜单管理', '删除', '/sys/menu/remove', 'GET', 'com.egao.common.system.controller.MenuController.remove', '{\"id\":[\"103\"]}', '{\"msg\":\"删除成功\",\"code\":0}', '127.0.0.1', NULL, 85, 0, '2021-07-06 11:22:09', '2021-07-06 11:22:09');
INSERT INTO `sys_oper_record` VALUES (170, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.egao.common.system.controller.MenuController.list', '{}', NULL, '127.0.0.1', NULL, 23, 0, '2021-07-06 11:22:09', '2021-07-06 11:22:09');
INSERT INTO `sys_oper_record` VALUES (171, 1, '菜单管理', '删除', '/sys/menu/remove', 'GET', 'com.egao.common.system.controller.MenuController.remove', '{\"id\":[\"107\"]}', '{\"msg\":\"删除成功\",\"code\":0}', '127.0.0.1', NULL, 174, 0, '2021-07-06 11:22:12', '2021-07-06 11:22:12');
INSERT INTO `sys_oper_record` VALUES (172, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.egao.common.system.controller.MenuController.list', '{}', NULL, '127.0.0.1', NULL, 31, 0, '2021-07-06 11:22:12', '2021-07-06 11:22:12');
INSERT INTO `sys_oper_record` VALUES (173, 1, '菜单管理', '删除', '/sys/menu/remove', 'GET', 'com.egao.common.system.controller.MenuController.remove', '{\"id\":[\"108\"]}', '{\"msg\":\"删除成功\",\"code\":0}', '127.0.0.1', NULL, 94, 0, '2021-07-06 11:22:16', '2021-07-06 11:22:16');
INSERT INTO `sys_oper_record` VALUES (174, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.egao.common.system.controller.MenuController.list', '{}', NULL, '127.0.0.1', NULL, 42, 0, '2021-07-06 11:22:16', '2021-07-06 11:22:16');
INSERT INTO `sys_oper_record` VALUES (175, 1, '菜单管理', '删除', '/sys/menu/remove', 'GET', 'com.egao.common.system.controller.MenuController.remove', '{\"id\":[\"112\"]}', '{\"msg\":\"删除成功\",\"code\":0}', '127.0.0.1', NULL, 72, 0, '2021-07-06 11:22:19', '2021-07-06 11:22:19');
INSERT INTO `sys_oper_record` VALUES (176, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.egao.common.system.controller.MenuController.list', '{}', NULL, '127.0.0.1', NULL, 25, 0, '2021-07-06 11:22:19', '2021-07-06 11:22:19');
INSERT INTO `sys_oper_record` VALUES (177, 1, '菜单管理', '删除', '/sys/menu/remove', 'GET', 'com.egao.common.system.controller.MenuController.remove', '{\"id\":[\"113\"]}', '{\"msg\":\"删除成功\",\"code\":0}', '127.0.0.1', NULL, 69, 0, '2021-07-06 11:22:24', '2021-07-06 11:22:24');
INSERT INTO `sys_oper_record` VALUES (178, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.egao.common.system.controller.MenuController.list', '{}', NULL, '127.0.0.1', NULL, 73, 0, '2021-07-06 11:22:24', '2021-07-06 11:22:24');
INSERT INTO `sys_oper_record` VALUES (179, 1, '菜单管理', '删除', '/sys/menu/remove', 'GET', 'com.egao.common.system.controller.MenuController.remove', '{\"id\":[\"40\"]}', '{\"msg\":\"删除成功\",\"code\":0}', '127.0.0.1', NULL, 110, 0, '2021-07-06 11:22:28', '2021-07-06 11:22:28');
INSERT INTO `sys_oper_record` VALUES (180, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.egao.common.system.controller.MenuController.list', '{}', NULL, '127.0.0.1', NULL, 45, 0, '2021-07-06 11:22:28', '2021-07-06 11:22:28');
INSERT INTO `sys_oper_record` VALUES (181, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.egao.common.system.controller.MenuController.list', '{}', NULL, '127.0.0.1', NULL, 28, 0, '2021-07-06 11:23:25', '2021-07-06 11:23:25');
INSERT INTO `sys_oper_record` VALUES (182, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.egao.common.system.controller.MenuController.list', '{}', NULL, '127.0.0.1', NULL, 27, 0, '2021-07-06 11:23:45', '2021-07-06 11:23:45');
INSERT INTO `sys_oper_record` VALUES (183, 1, '菜单管理', '添加', '/sys/menu/save', 'POST', 'com.egao.common.system.controller.MenuController.save', NULL, '{\"msg\":\"添加成功\",\"code\":0}', '127.0.0.1', NULL, 96, 0, '2021-07-06 11:24:08', '2021-07-06 11:24:08');
INSERT INTO `sys_oper_record` VALUES (184, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.egao.common.system.controller.MenuController.list', '{}', NULL, '127.0.0.1', NULL, 29, 0, '2021-07-06 11:24:08', '2021-07-06 11:24:08');
INSERT INTO `sys_oper_record` VALUES (185, 1, '菜单管理', '添加', '/sys/menu/save', 'POST', 'com.egao.common.system.controller.MenuController.save', NULL, '{\"msg\":\"添加成功\",\"code\":0}', '127.0.0.1', NULL, 125, 0, '2021-07-06 11:27:43', '2021-07-06 11:27:43');
INSERT INTO `sys_oper_record` VALUES (186, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.egao.common.system.controller.MenuController.list', '{}', NULL, '127.0.0.1', NULL, 34, 0, '2021-07-06 11:27:43', '2021-07-06 11:27:43');
INSERT INTO `sys_oper_record` VALUES (187, 1, '角色管理', '分页查询', '/sys/role/page', 'GET', 'com.egao.common.system.controller.RoleController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 67, 0, '2021-07-06 11:27:48', '2021-07-06 11:27:48');
INSERT INTO `sys_oper_record` VALUES (188, 1, '角色管理', '查询角色菜单', '/sys/role/menu/list', 'GET', 'com.egao.common.system.controller.RoleMenuController.list', '{\"roleId\":[\"1\"]}', NULL, '127.0.0.1', NULL, 187, 0, '2021-07-06 11:27:52', '2021-07-06 11:27:52');
INSERT INTO `sys_oper_record` VALUES (189, 1, '角色管理', '修改角色菜单', '/sys/role/menu/update/1', 'POST', 'com.egao.common.system.controller.RoleMenuController.setRoleAuth', '{}', NULL, '127.0.0.1', NULL, 251, 0, '2021-07-06 11:28:00', '2021-07-06 11:28:00');
INSERT INTO `sys_oper_record` VALUES (190, 1, '用户管理', '分页查询', '/sys/user/page', 'GET', 'com.egao.common.system.controller.UserController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 83, 0, '2021-07-06 11:28:27', '2021-07-06 11:28:27');

-- ----------------------------
-- Table structure for sys_organization
-- ----------------------------
DROP TABLE IF EXISTS `sys_organization`;
CREATE TABLE `sys_organization`  (
  `organization_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '机构id',
  `parent_id` int(11) NOT NULL DEFAULT 0 COMMENT '上级id,0是顶级',
  `organization_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '机构名称',
  `organization_full_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '机构全称',
  `organization_type` int(11) NOT NULL COMMENT '机构类型',
  `leader_id` int(11) NULL DEFAULT NULL COMMENT '负责人id',
  `sort_number` int(11) NOT NULL DEFAULT 1 COMMENT '排序号',
  `comments` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `deleted` int(1) NOT NULL DEFAULT 0 COMMENT '是否删除,0否,1是',
--  `create_time` timestamp NOT NULL COMMENT '创建时间',
--  `update_time` timestamp NOT NULL COMMENT '修改时间',
 `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
 `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`organization_id`) USING BTREE,
  INDEX `leader_id`(`leader_id`) USING BTREE,
  CONSTRAINT `sys_organization_ibfk_1` FOREIGN KEY (`leader_id`) REFERENCES `sys_user` (`user_id`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '组织机构' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_organization
-- ----------------------------
INSERT INTO `sys_organization` VALUES (1, 0, 'XXX公司', 'XXXXXXXXX科技有限公司', 3, NULL, 1, '', 0, '2020-03-15 13:14:55', '2020-03-21 15:12:49');
INSERT INTO `sys_organization` VALUES (2, 1, '研发部', '研发部', 5, NULL, 2, '', 0, '2020-03-15 13:15:16', '2020-03-16 00:43:09');
INSERT INTO `sys_organization` VALUES (3, 2, '高教组', '高等教育行业项目组', 6, NULL, 3, '', 0, '2020-03-15 13:15:45', '2020-03-16 00:42:49');
INSERT INTO `sys_organization` VALUES (4, 2, '政务组', '政务行业项目组', 6, NULL, 4, '', 0, '2020-03-15 13:16:15', '2020-03-16 00:42:54');
INSERT INTO `sys_organization` VALUES (5, 2, '制造组', '生产制造行业项目组', 6, NULL, 5, '', 0, '2020-03-15 13:16:37', '2020-03-21 15:13:05');
INSERT INTO `sys_organization` VALUES (6, 2, '仿真组', '虚拟仿真行业项目组', 6, NULL, 6, '', 0, '2020-03-15 13:16:57', '2020-03-16 00:43:03');
INSERT INTO `sys_organization` VALUES (7, 1, '测试部', '测试部', 5, NULL, 6, '', 0, '2020-03-15 13:17:19', '2020-03-16 00:43:14');
INSERT INTO `sys_organization` VALUES (8, 1, '设计部', 'UI设计部门', 5, NULL, 7, '', 0, '2020-03-15 13:17:56', '2020-03-16 00:43:18');
INSERT INTO `sys_organization` VALUES (9, 1, '市场部', '市场部', 5, NULL, 8, '', 0, '2020-03-15 13:18:15', '2020-03-16 00:43:23');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色id',
  `role_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色名称',
  `role_code` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '角色标识',
  `comments` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `deleted` int(1) NOT NULL DEFAULT 0 COMMENT '是否删除,0否,1是',
--  `create_time` timestamp NOT NULL COMMENT '创建时间',
--  `update_time` timestamp NOT NULL COMMENT '修改时间',
 `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
 `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '管理员', 'admin', '管理员', 0, '2020-02-26 15:18:37', '2020-03-21 15:15:54');
INSERT INTO `sys_role` VALUES (2, '普通用户', 'user', '普通用户', 0, '2020-02-26 15:18:52', '2020-03-21 15:16:02');
INSERT INTO `sys_role` VALUES (3, '游客', 'guest', '游客', 0, '2020-02-26 15:19:49', '2020-03-21 15:16:57');
INSERT INTO `sys_role` VALUES (4, '测试角色', 'testrole', '测试角色', 1, '2020-08-04 14:21:49', '2020-08-04 14:22:06');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `role_id` int(11) NOT NULL COMMENT '角色id',
  `menu_id` int(11) NOT NULL COMMENT '菜单id',
--  `create_time` timestamp NOT NULL COMMENT '创建时间',
--  `update_time` timestamp NOT NULL COMMENT '修改时间',
 `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
 `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_sys_role_permission_role`(`role_id`) USING BTREE,
  INDEX `menu_id`(`menu_id`) USING BTREE,
  CONSTRAINT `sys_role_menu_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `sys_role` (`role_id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `sys_role_menu_ibfk_2` FOREIGN KEY (`menu_id`) REFERENCES `sys_menu` (`menu_id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 267 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色权限' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (140, 3, 101, '2020-08-04 14:22:27', '2020-08-04 14:22:27');
INSERT INTO `sys_role_menu` VALUES (141, 3, 102, '2020-08-04 14:22:27', '2020-08-04 14:22:27');
INSERT INTO `sys_role_menu` VALUES (142, 3, 103, '2020-08-04 14:22:27', '2020-08-04 14:22:27');
INSERT INTO `sys_role_menu` VALUES (156, 3, 1, '2020-08-04 14:22:27', '2020-08-04 14:22:27');
INSERT INTO `sys_role_menu` VALUES (157, 3, 2, '2020-08-04 14:22:27', '2020-08-04 14:22:27');
INSERT INTO `sys_role_menu` VALUES (158, 3, 3, '2020-08-04 14:22:27', '2020-08-04 14:22:27');
INSERT INTO `sys_role_menu` VALUES (159, 3, 4, '2020-08-04 14:22:27', '2020-08-04 14:22:27');
INSERT INTO `sys_role_menu` VALUES (160, 3, 5, '2020-08-04 14:22:27', '2020-08-04 14:22:27');
INSERT INTO `sys_role_menu` VALUES (161, 3, 6, '2020-08-04 14:22:27', '2020-08-04 14:22:27');
INSERT INTO `sys_role_menu` VALUES (162, 3, 7, '2020-08-04 14:22:27', '2020-08-04 14:22:27');
INSERT INTO `sys_role_menu` VALUES (163, 3, 8, '2020-08-04 14:22:27', '2020-08-04 14:22:27');
INSERT INTO `sys_role_menu` VALUES (164, 3, 9, '2020-08-04 14:22:27', '2020-08-04 14:22:27');
INSERT INTO `sys_role_menu` VALUES (165, 3, 10, '2020-08-04 14:22:27', '2020-08-04 14:22:27');
INSERT INTO `sys_role_menu` VALUES (166, 3, 11, '2020-08-04 14:22:27', '2020-08-04 14:22:27');
INSERT INTO `sys_role_menu` VALUES (167, 3, 12, '2020-08-04 14:22:27', '2020-08-04 14:22:27');
INSERT INTO `sys_role_menu` VALUES (168, 3, 13, '2020-08-04 14:22:27', '2020-08-04 14:22:27');
INSERT INTO `sys_role_menu` VALUES (169, 3, 14, '2020-08-04 14:22:27', '2020-08-04 14:22:27');
INSERT INTO `sys_role_menu` VALUES (170, 3, 15, '2020-08-04 14:22:27', '2020-08-04 14:22:27');
INSERT INTO `sys_role_menu` VALUES (171, 3, 16, '2020-08-04 14:22:27', '2020-08-04 14:22:27');
INSERT INTO `sys_role_menu` VALUES (172, 3, 17, '2020-08-04 14:22:27', '2020-08-04 14:22:27');
INSERT INTO `sys_role_menu` VALUES (173, 3, 18, '2020-08-04 14:22:27', '2020-08-04 14:22:27');
INSERT INTO `sys_role_menu` VALUES (174, 3, 19, '2020-08-04 14:22:27', '2020-08-04 14:22:27');
INSERT INTO `sys_role_menu` VALUES (175, 3, 20, '2020-08-04 14:22:27', '2020-08-04 14:22:27');
INSERT INTO `sys_role_menu` VALUES (176, 3, 21, '2020-08-04 14:22:27', '2020-08-04 14:22:27');
INSERT INTO `sys_role_menu` VALUES (177, 3, 28, '2020-08-04 14:22:27', '2020-08-04 14:22:27');
INSERT INTO `sys_role_menu` VALUES (178, 3, 22, '2020-08-04 14:22:27', '2020-08-04 14:22:27');
INSERT INTO `sys_role_menu` VALUES (179, 3, 23, '2020-08-04 14:22:27', '2020-08-04 14:22:27');
INSERT INTO `sys_role_menu` VALUES (180, 3, 24, '2020-08-04 14:22:27', '2020-08-04 14:22:27');
INSERT INTO `sys_role_menu` VALUES (181, 3, 25, '2020-08-04 14:22:27', '2020-08-04 14:22:27');
INSERT INTO `sys_role_menu` VALUES (182, 3, 26, '2020-08-04 14:22:27', '2020-08-04 14:22:27');
INSERT INTO `sys_role_menu` VALUES (248, 1, 119, '2021-07-06 11:28:00', '2021-07-06 11:28:00');
INSERT INTO `sys_role_menu` VALUES (249, 1, 120, '2021-07-06 11:28:00', '2021-07-06 11:28:00');
INSERT INTO `sys_role_menu` VALUES (250, 1, 1, '2021-07-06 11:28:00', '2021-07-06 11:28:00');
INSERT INTO `sys_role_menu` VALUES (251, 1, 2, '2021-07-06 11:28:00', '2021-07-06 11:28:00');
INSERT INTO `sys_role_menu` VALUES (252, 1, 3, '2021-07-06 11:28:00', '2021-07-06 11:28:00');
INSERT INTO `sys_role_menu` VALUES (253, 1, 4, '2021-07-06 11:28:00', '2021-07-06 11:28:00');
INSERT INTO `sys_role_menu` VALUES (254, 1, 5, '2021-07-06 11:28:00', '2021-07-06 11:28:00');
INSERT INTO `sys_role_menu` VALUES (255, 1, 6, '2021-07-06 11:28:00', '2021-07-06 11:28:00');
INSERT INTO `sys_role_menu` VALUES (256, 1, 7, '2021-07-06 11:28:00', '2021-07-06 11:28:00');
INSERT INTO `sys_role_menu` VALUES (257, 1, 8, '2021-07-06 11:28:00', '2021-07-06 11:28:00');
INSERT INTO `sys_role_menu` VALUES (258, 1, 9, '2021-07-06 11:28:00', '2021-07-06 11:28:00');
INSERT INTO `sys_role_menu` VALUES (259, 1, 10, '2021-07-06 11:28:00', '2021-07-06 11:28:00');
INSERT INTO `sys_role_menu` VALUES (260, 1, 11, '2021-07-06 11:28:00', '2021-07-06 11:28:00');
INSERT INTO `sys_role_menu` VALUES (261, 1, 12, '2021-07-06 11:28:00', '2021-07-06 11:28:00');
INSERT INTO `sys_role_menu` VALUES (262, 1, 13, '2021-07-06 11:28:00', '2021-07-06 11:28:00');
INSERT INTO `sys_role_menu` VALUES (263, 1, 14, '2021-07-06 11:28:00', '2021-07-06 11:28:00');
INSERT INTO `sys_role_menu` VALUES (264, 1, 15, '2021-07-06 11:28:00', '2021-07-06 11:28:00');
INSERT INTO `sys_role_menu` VALUES (265, 1, 16, '2021-07-06 11:28:00', '2021-07-06 11:28:00');
INSERT INTO `sys_role_menu` VALUES (266, 1, 28, '2021-07-06 11:28:00', '2021-07-06 11:28:00');

-- ----------------------------
-- Table structure for sys_test
-- ----------------------------
DROP TABLE IF EXISTS `sys_test`;
CREATE TABLE `sys_test`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键标识',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '测试表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `username` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '账号',
  `password` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '密码',
  `nick_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '昵称',
  `avatar` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '头像',
  `sex` int(11) NULL DEFAULT NULL COMMENT '性别',
  `phone` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `email` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `email_verified` int(1) NOT NULL DEFAULT 0 COMMENT '邮箱是否验证,0否,1是',
  `true_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '真实姓名',
  `id_card` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '身份证号',
  `birthday` date NULL DEFAULT NULL COMMENT '出生日期',
  `introduction` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '个人简介',
  `organization_id` int(11) NULL DEFAULT NULL COMMENT '机构id',
  `state` int(1) NOT NULL DEFAULT 0 COMMENT '状态,0正常,1冻结',
  `deleted` int(1) NOT NULL DEFAULT 0 COMMENT '是否删除,0否,1是',
--  `create_time` timestamp NOT NULL COMMENT '注册时间',
--  `update_time` timestamp NOT NULL COMMENT '修改时间',
 `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '注册时间',
 `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE,
  INDEX `organization_id`(`organization_id`) USING BTREE,
  CONSTRAINT `sys_user_ibfk_1` FOREIGN KEY (`organization_id`) REFERENCES `sys_organization` (`organization_id`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 'admin', '21232f297a57a5a743894a0e4a801fc3', '管理员', NULL, 1, '', NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, 0, '2020-01-13 14:43:52', '2020-03-21 12:49:48');
INSERT INTO `sys_user` VALUES (2, 'test', 'e10adc3949ba59abbe56e057f20f883e', '测试用户', NULL, 2, '13212345678', NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, 1, '2020-08-04 14:18:40', '2020-08-04 14:18:55');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `role_id` int(11) NOT NULL COMMENT '角色id',
--  `create_time` timestamp NOT NULL COMMENT '创建时间',
--  `update_time` timestamp NOT NULL COMMENT '修改时间',
 `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
 `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_sys_user_role`(`user_id`) USING BTREE,
  INDEX `FK_sys_user_role_role`(`role_id`) USING BTREE,
  CONSTRAINT `sys_user_role_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `sys_user` (`user_id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `sys_user_role_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `sys_role` (`role_id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户角色' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1, 1, '2020-03-12 23:20:08', '2020-03-21 15:18:00');
INSERT INTO `sys_user_role` VALUES (3, 2, 1, '2020-08-04 14:18:48', '2020-08-04 14:18:48');

SET FOREIGN_KEY_CHECKS = 1;
