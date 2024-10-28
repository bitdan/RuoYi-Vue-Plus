/*
 Navicat Premium Data Transfer

 Source Server         : remote_mysql
 Source Server Type    : MySQL
 Source Server Version : 80200 (8.2.0)
 Source Host           : 139.159.140.112:30306
 Source Schema         : ry-vue

 Target Server Type    : MySQL
 Target Server Version : 80200 (8.2.0)
 File Encoding         : 65001

 Date: 28/10/2024 22:58:15
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for base_tlogo_info
-- ----------------------------
DROP TABLE IF EXISTS `base_tlogo_info`;
CREATE TABLE `base_tlogo_info`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `fnsku` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'FNSKU',
  `account` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '账号',
  `product_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '产品名称',
  `product_sku` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '产品SKU',
  `logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Logo（品牌）',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 46 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '产品Logo（品牌）表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of base_tlogo_info
-- ----------------------------

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint NOT NULL COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `package_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代码生成业务表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (1760908642858213378, 't_global_app', '全局应用表', NULL, NULL, 'TGlobalApp', 'crud', 'com.ruoyi.system', 'system', 'globalApp', '全局应用', 'ruoyi', '1', '/', '{\"treeCode\":null,\"treeName\":null,\"treeParentCode\":null,\"parentMenuId\":null}', 'admin', '2024-02-23 14:04:03', 'admin', '2024-03-12 10:05:33', NULL);
INSERT INTO `gen_table` VALUES (1767367781897641985, 'test_tree', '测试树表', NULL, NULL, 'TestTree', 'crud', 'com.ruoyi.system', 'system', 'tree', '测试树', 'ruoyi', '0', '/', NULL, 'admin', '2023-11-05 13:57:30', 'admin', '2023-11-05 13:57:30', NULL);
INSERT INTO `gen_table` VALUES (1802527166575939585, 'test_demo', '测试单表', NULL, NULL, 'TestDemo', 'crud', 'com.ruoyi.system', 'system', 'demo', '测试单', 'ruoyi', '0', '/', NULL, 'admin', '2024-04-16 15:20:56', 'admin', '2024-04-16 15:20:56', NULL);
INSERT INTO `gen_table` VALUES (1838747272514560001, 'base_tlogo_info', '产品Logo（品牌）表', NULL, NULL, 'BaseTlogoInfo', 'crud', 'com.ruoyi.system', 'system', 'tlogoInfo', '产品Logo（品牌）', 'ruoyi', '0', '/', NULL, 'admin', '2024-09-25 01:07:56', 'admin', '2024-09-25 01:07:56', NULL);

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint NOT NULL COMMENT '编号',
  `table_id` bigint NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `sort` int NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (1760908643105677313, 1760908642858213378, 'id', '应用ID', 'bigint', 'Long', 'id', '1', '1', '1', NULL, '1', '1', NULL, 'EQ', 'input', '', 1, 'admin', '2024-02-23 14:05:11', 'admin', '2024-03-12 10:05:33');
INSERT INTO `gen_table_column` VALUES (1760908643114065922, 1760908642858213378, 'code', '应用标识', 'varchar(100)', 'String', 'code', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2024-02-23 14:05:11', 'admin', '2024-03-12 10:05:33');
INSERT INTO `gen_table_column` VALUES (1760908643118260225, 1760908642858213378, 'description', '应用描述', 'varchar(100)', 'String', 'description', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2024-02-23 14:05:11', 'admin', '2024-03-12 10:05:33');
INSERT INTO `gen_table_column` VALUES (1760908643126648833, 1760908642858213378, 'auth_type', '认证方式 1 访问密钥  0 无认证', 'tinyint', 'Long', 'authType', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', '', 4, 'admin', '2024-02-23 14:05:11', 'admin', '2024-03-12 10:05:33');
INSERT INTO `gen_table_column` VALUES (1760908643130843137, 1760908642858213378, 'svc_authorization', '是否需要服务授权 0 否  1 是', 'tinyint', 'Long', 'svcAuthorization', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2024-02-23 14:05:11', 'admin', '2024-03-12 10:05:33');
INSERT INTO `gen_table_column` VALUES (1760908643139231746, 1760908642858213378, 'status', '应用状态, 状态：0: 停用  1：启用', 'tinyint', 'Long', 'status', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'radio', '', 6, 'admin', '2024-02-23 14:05:11', 'admin', '2024-03-12 10:05:34');
INSERT INTO `gen_table_column` VALUES (1760908643139231747, 1760908642858213378, 'create_by', '创建人', 'varchar(100)', 'String', 'createBy', '0', '0', '0', NULL, NULL, NULL, NULL, 'EQ', 'input', '', 7, 'admin', '2024-02-23 14:05:11', 'admin', '2024-03-12 10:05:34');
INSERT INTO `gen_table_column` VALUES (1760908643143426049, 1760908642858213378, 'create_on', '创建时间', 'datetime', 'Date', 'createOn', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', 8, 'admin', '2024-02-23 14:05:11', 'admin', '2024-03-12 10:05:34');
INSERT INTO `gen_table_column` VALUES (1760908643160203265, 1760908642858213378, 'update_by', '修改人', 'varchar(100)', 'String', 'updateBy', '0', '0', '0', NULL, NULL, NULL, NULL, 'EQ', 'input', '', 9, 'admin', '2024-02-23 14:05:11', 'admin', '2024-03-12 10:05:34');
INSERT INTO `gen_table_column` VALUES (1760908643164397569, 1760908642858213378, 'update_on', '修改时间', 'datetime', 'Date', 'updateOn', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', 10, 'admin', '2024-02-23 14:05:11', 'admin', '2024-03-12 10:05:34');
INSERT INTO `gen_table_column` VALUES (1760908643168591873, 1760908642858213378, 'extend1', '扩展字段1', 'varchar(255)', 'String', 'extend1', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 11, 'admin', '2024-02-23 14:05:11', 'admin', '2024-03-12 10:05:34');
INSERT INTO `gen_table_column` VALUES (1760908643168591874, 1760908642858213378, 'extend2', '扩展字段2', 'varchar(255)', 'String', 'extend2', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 12, 'admin', '2024-02-23 14:05:11', 'admin', '2024-03-12 10:05:34');
INSERT INTO `gen_table_column` VALUES (1760908643172786178, 1760908642858213378, 'extend3', '扩展字段3', 'varchar(255)', 'String', 'extend3', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 13, 'admin', '2024-02-23 14:05:11', 'admin', '2024-03-12 10:05:34');
INSERT INTO `gen_table_column` VALUES (1760908643172786179, 1760908642858213378, 'version', '', 'bigint', 'Long', 'version', '0', '0', '1', NULL, NULL, NULL, NULL, 'EQ', 'input', '', 14, 'admin', '2024-02-23 14:05:11', 'admin', '2024-03-12 10:05:34');
INSERT INTO `gen_table_column` VALUES (1767367781952167937, 1767367781897641985, 'id', '主键', 'bigint', 'Long', 'id', '1', '0', '1', NULL, '1', '1', NULL, 'EQ', 'input', '', 1, 'admin', '2024-03-12 09:51:30', 'admin', '2024-03-12 09:51:30');
INSERT INTO `gen_table_column` VALUES (1767367781952167938, 1767367781897641985, 'parent_id', '父id', 'bigint', 'Long', 'parentId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2024-03-12 09:51:30', 'admin', '2024-03-12 09:51:30');
INSERT INTO `gen_table_column` VALUES (1767367782006693890, 1767367781897641985, 'dept_id', '部门id', 'bigint', 'Long', 'deptId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2024-03-12 09:51:30', 'admin', '2024-03-12 09:51:30');
INSERT INTO `gen_table_column` VALUES (1767367782010888193, 1767367781897641985, 'user_id', '用户id', 'bigint', 'Long', 'userId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2024-03-12 09:51:30', 'admin', '2024-03-12 09:51:30');
INSERT INTO `gen_table_column` VALUES (1767367782015082498, 1767367781897641985, 'tree_name', '值', 'varchar(255)', 'String', 'treeName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 5, 'admin', '2024-03-12 09:51:30', 'admin', '2024-03-12 09:51:30');
INSERT INTO `gen_table_column` VALUES (1767367782015082499, 1767367781897641985, 'version', '版本', 'int', 'Long', 'version', '0', '0', '0', NULL, NULL, NULL, NULL, 'EQ', 'input', '', 6, 'admin', '2024-03-12 09:51:30', 'admin', '2024-03-12 09:51:30');
INSERT INTO `gen_table_column` VALUES (1767367782023471106, 1767367781897641985, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', NULL, NULL, NULL, NULL, 'EQ', 'datetime', '', 7, 'admin', '2024-03-12 09:51:30', 'admin', '2024-03-12 09:51:30');
INSERT INTO `gen_table_column` VALUES (1767367782023471107, 1767367781897641985, 'create_by', '创建人', 'varchar(64)', 'String', 'createBy', '0', '0', '0', NULL, NULL, NULL, NULL, 'EQ', 'input', '', 8, 'admin', '2024-03-12 09:51:30', 'admin', '2024-03-12 09:51:30');
INSERT INTO `gen_table_column` VALUES (1767367782036054017, 1767367781897641985, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', NULL, NULL, NULL, NULL, 'EQ', 'datetime', '', 9, 'admin', '2024-03-12 09:51:30', 'admin', '2024-03-12 09:51:30');
INSERT INTO `gen_table_column` VALUES (1767367782044442626, 1767367781897641985, 'update_by', '更新人', 'varchar(64)', 'String', 'updateBy', '0', '0', '0', NULL, NULL, NULL, NULL, 'EQ', 'input', '', 10, 'admin', '2024-03-12 09:51:30', 'admin', '2024-03-12 09:51:30');
INSERT INTO `gen_table_column` VALUES (1767367782044442627, 1767367781897641985, 'del_flag', '删除标志', 'int', 'Long', 'delFlag', '0', '0', '0', NULL, NULL, NULL, NULL, 'EQ', 'input', '', 11, 'admin', '2024-03-12 09:51:30', 'admin', '2024-03-12 09:51:30');
INSERT INTO `gen_table_column` VALUES (1802527166735323138, 1802527166575939585, 'id', '主键', 'bigint', 'Long', 'id', '1', '0', '1', NULL, '1', '1', NULL, 'EQ', 'input', '', 1, 'admin', '2024-06-17 10:22:21', 'admin', '2024-06-17 10:22:21');
INSERT INTO `gen_table_column` VALUES (1802527166743711745, 1802527166575939585, 'dept_id', '部门id', 'bigint', 'Long', 'deptId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2024-06-17 10:22:21', 'admin', '2024-06-17 10:22:21');
INSERT INTO `gen_table_column` VALUES (1802527166747906049, 1802527166575939585, 'user_id', '用户id', 'bigint', 'Long', 'userId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2024-06-17 10:22:21', 'admin', '2024-06-17 10:22:21');
INSERT INTO `gen_table_column` VALUES (1802527166752100354, 1802527166575939585, 'order_num', '排序号', 'int', 'Long', 'orderNum', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2024-06-17 10:22:21', 'admin', '2024-06-17 10:22:21');
INSERT INTO `gen_table_column` VALUES (1802527166756294657, 1802527166575939585, 'test_key', 'key键', 'varchar(255)', 'String', 'testKey', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2024-06-17 10:22:21', 'admin', '2024-06-17 10:22:21');
INSERT INTO `gen_table_column` VALUES (1802527166768877570, 1802527166575939585, 'value', '值', 'varchar(255)', 'String', 'value', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2024-06-17 10:22:21', 'admin', '2024-06-17 10:22:21');
INSERT INTO `gen_table_column` VALUES (1802527166768877571, 1802527166575939585, 'version', '版本', 'int', 'Long', 'version', '0', '0', '0', NULL, NULL, NULL, NULL, 'EQ', 'input', '', 7, 'admin', '2024-06-17 10:22:21', 'admin', '2024-06-17 10:22:21');
INSERT INTO `gen_table_column` VALUES (1802527166773071873, 1802527166575939585, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', NULL, NULL, NULL, NULL, 'EQ', 'datetime', '', 8, 'admin', '2024-06-17 10:22:21', 'admin', '2024-06-17 10:22:21');
INSERT INTO `gen_table_column` VALUES (1802527166777266177, 1802527166575939585, 'create_by', '创建人', 'varchar(64)', 'String', 'createBy', '0', '0', '0', NULL, NULL, NULL, NULL, 'EQ', 'input', '', 9, 'admin', '2024-06-17 10:22:21', 'admin', '2024-06-17 10:22:21');
INSERT INTO `gen_table_column` VALUES (1802527166781460481, 1802527166575939585, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', NULL, NULL, NULL, NULL, 'EQ', 'datetime', '', 10, 'admin', '2024-06-17 10:22:21', 'admin', '2024-06-17 10:22:21');
INSERT INTO `gen_table_column` VALUES (1802527166785654785, 1802527166575939585, 'update_by', '更新人', 'varchar(64)', 'String', 'updateBy', '0', '0', '0', NULL, NULL, NULL, NULL, 'EQ', 'input', '', 11, 'admin', '2024-06-17 10:22:21', 'admin', '2024-06-17 10:22:21');
INSERT INTO `gen_table_column` VALUES (1802527166785654786, 1802527166575939585, 'del_flag', '删除标志', 'int', 'Long', 'delFlag', '0', '0', '0', NULL, NULL, NULL, NULL, 'EQ', 'input', '', 12, 'admin', '2024-06-17 10:22:21', 'admin', '2024-06-17 10:22:21');
INSERT INTO `gen_table_column` VALUES (1838747272917213185, 1838747272514560001, 'id', 'ID', 'bigint', 'Long', 'id', '1', '1', '1', NULL, '1', '1', NULL, 'EQ', 'input', '', 1, 'admin', '2024-09-25 09:08:07', 'admin', '2024-09-25 09:08:07');
INSERT INTO `gen_table_column` VALUES (1838747272917213186, 1838747272514560001, 'fnsku', 'FNSKU', 'varchar(50)', 'String', 'fnsku', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2024-09-25 09:08:07', 'admin', '2024-09-25 09:08:07');
INSERT INTO `gen_table_column` VALUES (1838747272959156226, 1838747272514560001, 'account', '账号', 'varchar(50)', 'String', 'account', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2024-09-25 09:08:07', 'admin', '2024-09-25 09:08:07');
INSERT INTO `gen_table_column` VALUES (1838747272959156227, 1838747272514560001, 'product_name', '产品名称', 'varchar(255)', 'String', 'productName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 4, 'admin', '2024-09-25 09:08:07', 'admin', '2024-09-25 09:08:07');
INSERT INTO `gen_table_column` VALUES (1838747272963350530, 1838747272514560001, 'product_sku', '产品SKU', 'varchar(50)', 'String', 'productSku', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2024-09-25 09:08:07', 'admin', '2024-09-25 09:08:07');
INSERT INTO `gen_table_column` VALUES (1838747272967544834, 1838747272514560001, 'logo', 'Logo（品牌）', 'varchar(255)', 'String', 'logo', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2024-09-25 09:08:07', 'admin', '2024-09-25 09:08:07');
INSERT INTO `gen_table_column` VALUES (1838747272980127746, 1838747272514560001, 'remark', '备注', 'varchar(255)', 'String', 'remark', '0', '0', '1', '1', '1', '1', NULL, 'EQ', 'input', '', 7, 'admin', '2024-09-25 09:08:07', 'admin', '2024-09-25 09:08:07');
INSERT INTO `gen_table_column` VALUES (1838747272980127747, 1838747272514560001, 'creator', '创建者', 'varchar(64)', 'String', 'creator', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2024-09-25 09:08:07', 'admin', '2024-09-25 09:08:07');
INSERT INTO `gen_table_column` VALUES (1838747272980127748, 1838747272514560001, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '1', NULL, NULL, NULL, NULL, 'EQ', 'datetime', '', 9, 'admin', '2024-09-25 09:08:07', 'admin', '2024-09-25 09:08:07');
INSERT INTO `gen_table_column` VALUES (1838747272996904962, 1838747272514560001, 'updater', '更新者', 'varchar(64)', 'String', 'updater', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', '2024-09-25 09:08:07', 'admin', '2024-09-25 09:08:07');
INSERT INTO `gen_table_column` VALUES (1838747272996904963, 1838747272514560001, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '1', NULL, NULL, NULL, NULL, 'EQ', 'datetime', '', 11, 'admin', '2024-09-25 09:08:07', 'admin', '2024-09-25 09:08:07');
INSERT INTO `gen_table_column` VALUES (1838747272996904964, 1838747272514560001, 'deleted', '是否删除', 'bit(1)', 'Integer', 'deleted', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 12, 'admin', '2024-09-25 09:08:07', 'admin', '2024-09-25 09:08:07');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` bigint NOT NULL COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '参数配置表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-purple', 'Y', 'admin', '2023-11-05 13:57:22', 'admin', '2023-11-10 13:52:16', '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', 'test', 'Y', 'admin', '2023-11-05 13:57:22', 'admin', '2023-11-10 13:53:19', '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2023-11-05 13:57:22', '', NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES (4, '账号自助-验证码开关', 'sys.account.captchaEnabled', 'true', 'Y', 'admin', '2023-11-05 13:57:22', '', NULL, '是否开启验证码功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'true', 'Y', 'admin', '2023-11-05 13:57:22', 'admin', '2023-11-10 13:54:33', '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (11, 'OSS预览列表资源开关', 'sys.oss.previewListResource', 'true', 'Y', 'admin', '2023-11-05 13:57:22', 'admin', '2024-06-20 20:35:12', 'true:开启, false:关闭');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint NOT NULL COMMENT '部门id',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '部门表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '若依科技', 0, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-11-05 13:57:22', '', NULL);
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '深圳总公司', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-11-05 13:57:22', '', NULL);
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '长沙分公司', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-11-05 13:57:22', '', NULL);
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '研发部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-11-05 13:57:22', '', NULL);
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-11-05 13:57:22', '', NULL);
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '测试部门', 3, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-11-05 13:57:22', '', NULL);
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-11-05 13:57:22', '', NULL);
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-11-05 13:57:22', '', NULL);
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-11-05 13:57:22', '', NULL);
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-11-05 13:57:22', '', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint NOT NULL COMMENT '字典编码',
  `dict_sort` int NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典数据表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2023-11-05 13:57:22', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2023-11-05 13:57:22', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2023-11-05 13:57:22', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2023-11-05 13:57:22', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2023-11-05 13:57:22', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2023-11-05 13:57:22', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2023-11-05 13:57:22', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2023-11-05 13:57:22', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2023-11-05 13:57:22', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2023-11-05 13:57:22', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2023-11-05 13:57:22', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2023-11-05 13:57:22', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2023-11-05 13:57:22', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2023-11-05 13:57:22', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (19, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2023-11-05 13:57:22', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (20, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2023-11-05 13:57:22', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (21, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2023-11-05 13:57:22', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (22, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2023-11-05 13:57:22', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (23, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2023-11-05 13:57:22', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (24, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2023-11-05 13:57:22', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (25, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2023-11-05 13:57:22', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (26, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2023-11-05 13:57:22', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (27, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2023-11-05 13:57:22', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (28, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2023-11-05 13:57:22', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (29, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2023-11-05 13:57:22', '', NULL, '其他操作');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint NOT NULL COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典类型表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2023-11-05 13:57:22', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2023-11-05 13:57:22', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2023-11-05 13:57:22', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2023-11-05 13:57:22', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2023-11-05 13:57:22', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2023-11-05 13:57:22', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2023-11-05 13:57:22', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2023-11-05 13:57:22', '', NULL, '登录状态列表');

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint NOT NULL COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE,
  INDEX `idx_sys_logininfor_s`(`status` ASC) USING BTREE,
  INDEX `idx_sys_logininfor_lt`(`login_time` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统访问记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (1721044212235362306, 'admin', '119.34.162.5', '中国|广东省|广州市|珠江宽频', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2023-11-05 13:58:10');
INSERT INTO `sys_logininfor` VALUES (1721044966199255041, 'admin', '183.145.171.176', '中国|浙江省|绍兴市|电信', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2023-11-05 14:01:10');
INSERT INTO `sys_logininfor` VALUES (1721045367376044033, 'admin', '119.34.162.5', '中国|广东省|广州市|珠江宽频', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '退出成功', '2023-11-05 14:02:46');
INSERT INTO `sys_logininfor` VALUES (1721045407372926977, 'admin', '119.34.162.5', '中国|广东省|广州市|珠江宽频', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2023-11-05 14:02:55');
INSERT INTO `sys_logininfor` VALUES (1721055578304274434, 'admin', '119.34.162.5', '中国|广东省|广州市|珠江宽频', 'Chrome', 'Windows 10 or Windows Server 2016', '1', '密码输入错误1次', '2023-11-05 14:43:20');
INSERT INTO `sys_logininfor` VALUES (1721055633962688513, 'admin', '119.34.162.5', '中国|广东省|广州市|珠江宽频', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2023-11-05 14:43:33');
INSERT INTO `sys_logininfor` VALUES (1721060015915655170, 'admin', '183.145.171.176', '中国|浙江省|绍兴市|电信', 'Chrome', 'Windows 10 or Windows Server 2016', '1', '密码输入错误1次', '2023-11-05 15:00:58');
INSERT INTO `sys_logininfor` VALUES (1721060045154148354, 'admin', '183.145.171.176', '中国|浙江省|绍兴市|电信', 'Chrome', 'Windows 10 or Windows Server 2016', '1', '验证码错误', '2023-11-05 15:01:05');
INSERT INTO `sys_logininfor` VALUES (1721060061847478273, 'admin', '183.145.171.176', '中国|浙江省|绍兴市|电信', 'Chrome', 'Windows 10 or Windows Server 2016', '1', '验证码错误', '2023-11-05 15:01:09');
INSERT INTO `sys_logininfor` VALUES (1721060076531736578, 'admin', '183.145.171.176', '中国|浙江省|绍兴市|电信', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2023-11-05 15:01:13');
INSERT INTO `sys_logininfor` VALUES (1721074715818713089, 'admin', '119.34.162.5', '中国|广东省|广州市|珠江宽频', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2023-11-05 15:59:23');
INSERT INTO `sys_logininfor` VALUES (1721097559608909826, 'admin', '119.34.162.5', '中国|广东省|广州市|珠江宽频', 'Chrome', 'Windows 10 or Windows Server 2016', '1', '验证码错误', '2023-11-05 17:30:09');
INSERT INTO `sys_logininfor` VALUES (1721097586527952897, 'admin', '119.34.162.5', '中国|广东省|广州市|珠江宽频', 'Chrome', 'Windows 10 or Windows Server 2016', '1', '密码输入错误1次', '2023-11-05 17:30:16');
INSERT INTO `sys_logininfor` VALUES (1721097614860476417, 'admin', '119.34.162.5', '中国|广东省|广州市|珠江宽频', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2023-11-05 17:30:22');
INSERT INTO `sys_logininfor` VALUES (1721179368430493698, 'admin', '119.34.162.5', '中国|广东省|广州市|珠江宽频', 'Chrome', 'Windows 10 or Windows Server 2016', '1', '验证码已失效', '2023-11-05 22:55:14');
INSERT INTO `sys_logininfor` VALUES (1721179387069980673, 'admin', '119.34.162.5', '中国|广东省|广州市|珠江宽频', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2023-11-05 22:55:19');
INSERT INTO `sys_logininfor` VALUES (1721409106440871938, 'admin', '113.111.11.110', '中国|广东省|广州市|电信', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2023-11-06 14:08:08');
INSERT INTO `sys_logininfor` VALUES (1721459950066589698, 'admin', '183.145.171.176', '中国|浙江省|绍兴市|电信', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2023-11-06 17:30:10');
INSERT INTO `sys_logininfor` VALUES (1721507462727065602, 'admin', '119.34.173.71', '中国|广东省|广州市|珠江宽频', 'Chrome', 'Windows 10 or Windows Server 2016', '1', '密码输入错误1次', '2023-11-06 20:38:58');
INSERT INTO `sys_logininfor` VALUES (1721507484977848322, 'admin', '119.34.173.71', '中国|广东省|广州市|珠江宽频', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2023-11-06 20:39:03');
INSERT INTO `sys_logininfor` VALUES (1721905096960761857, 'admin', '119.34.173.71', '中国|广东省|广州市|珠江宽频', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2023-11-07 22:59:01');
INSERT INTO `sys_logininfor` VALUES (1722459158642941954, 'admin', '113.111.11.110', '中国|广东省|广州市|电信', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2023-11-09 11:40:40');
INSERT INTO `sys_logininfor` VALUES (1722820404198236161, 'admin', '113.111.11.110', '中国|广东省|广州市|电信', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2023-11-10 11:36:07');
INSERT INTO `sys_logininfor` VALUES (1722854160565002241, 'admin', '113.111.11.110', '中国|广东省|广州市|电信', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2023-11-10 13:50:16');
INSERT INTO `sys_logininfor` VALUES (1722855276543467521, 'admin', '113.111.11.110', '中国|广东省|广州市|电信', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '退出成功', '2023-11-10 13:54:42');
INSERT INTO `sys_logininfor` VALUES (1722855322118774786, 'admin', '113.111.11.110', '中国|广东省|广州市|电信', 'Chrome', 'Windows 10 or Windows Server 2016', '1', '密码输入错误1次', '2023-11-10 13:54:53');
INSERT INTO `sys_logininfor` VALUES (1722855351831224321, 'admin', '113.111.11.110', '中国|广东省|广州市|电信', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2023-11-10 13:55:00');
INSERT INTO `sys_logininfor` VALUES (1722855455216623617, 'admin', '113.111.11.110', '中国|广东省|广州市|电信', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '退出成功', '2023-11-10 13:55:24');
INSERT INTO `sys_logininfor` VALUES (1722855537567588354, 'admin', '113.111.11.110', '中国|广东省|广州市|电信', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2023-11-10 13:55:44');
INSERT INTO `sys_logininfor` VALUES (1723994267338661889, 'admin', '113.65.206.116', '中国|广东省|广州市|电信', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2023-11-13 17:20:38');
INSERT INTO `sys_logininfor` VALUES (1725356836674592770, 'admin', '113.65.204.146', '中国|广东省|广州市|电信', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2023-11-17 11:35:00');
INSERT INTO `sys_logininfor` VALUES (1725356859030233089, 'admin', '113.65.204.146', '中国|广东省|广州市|电信', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '退出成功', '2023-11-17 11:35:05');
INSERT INTO `sys_logininfor` VALUES (1725508088255471617, 'admin', '119.34.170.110', '中国|广东省|广州市|珠江宽频', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2023-11-17 21:36:01');
INSERT INTO `sys_logininfor` VALUES (1725871620440449026, 'admin', '119.34.170.110', '中国|广东省|广州市|珠江宽频', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2023-11-18 21:40:34');
INSERT INTO `sys_logininfor` VALUES (1725884551806836737, 'admin', '119.34.170.110', '中国|广东省|广州市|珠江宽频', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '退出成功', '2023-11-18 22:31:57');
INSERT INTO `sys_logininfor` VALUES (1726213920551067649, 'admin', '112.96.63.4', '中国|广东省|广州市|联通', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2023-11-19 20:20:45');
INSERT INTO `sys_logininfor` VALUES (1726815584077209602, 'admin', '122.237.104.238', '中国|浙江省|绍兴市|电信', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2023-11-21 12:11:33');
INSERT INTO `sys_logininfor` VALUES (1727351340231286786, 'admin', '120.85.170.8', '中国|广东省|广州市|联通', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2023-11-22 23:40:27');
INSERT INTO `sys_logininfor` VALUES (1732686057247731714, 'admin', '113.111.9.243', '中国|广东省|广州市|电信', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2023-12-07 16:58:42');
INSERT INTO `sys_logininfor` VALUES (1734446008244760577, 'admin', '183.145.168.59', '中国|浙江省|绍兴市|电信', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2023-12-12 13:32:07');
INSERT INTO `sys_logininfor` VALUES (1737813817150533633, 'admin', '60.187.138.146', '中国|浙江省|绍兴市|电信', 'Chrome', 'Windows 10 or Windows Server 2016', '1', '验证码错误', '2023-12-21 20:34:36');
INSERT INTO `sys_logininfor` VALUES (1737813832619126785, 'admin', '60.187.138.146', '中国|浙江省|绍兴市|电信', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2023-12-21 20:34:39');
INSERT INTO `sys_logininfor` VALUES (1749357038139772930, 'admin', '113.111.8.58', '中国|广东省|广州市|电信', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-01-22 17:03:14');
INSERT INTO `sys_logininfor` VALUES (1749361243378323457, 'admin', '113.111.8.58', '中国|广东省|广州市|电信', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '退出成功', '2024-01-22 17:19:57');
INSERT INTO `sys_logininfor` VALUES (1749361511717310465, 'admin', '113.111.8.58', '中国|广东省|广州市|电信', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-01-22 17:21:01');
INSERT INTO `sys_logininfor` VALUES (1749361531954827265, 'admin', '113.111.8.58', '中国|广东省|广州市|电信', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '退出成功', '2024-01-22 17:21:05');
INSERT INTO `sys_logininfor` VALUES (1749361553794568193, 'admin', '113.111.8.58', '中国|广东省|广州市|电信', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-01-22 17:21:11');
INSERT INTO `sys_logininfor` VALUES (1749678376138215426, 'admin', '35.76.108.129', '美国|密歇根', 'Chrome', 'Windows 10 or Windows Server 2016', '1', '密码输入错误1次', '2024-01-23 14:20:07');
INSERT INTO `sys_logininfor` VALUES (1749678411450060802, 'admin', '35.76.108.129', '美国|密歇根', 'Chrome', 'Windows 10 or Windows Server 2016', '1', '密码输入错误2次', '2024-01-23 14:20:15');
INSERT INTO `sys_logininfor` VALUES (1749678443343548418, 'admin', '35.76.108.129', '美国|密歇根', 'Chrome', 'Windows 10 or Windows Server 2016', '1', '密码输入错误3次', '2024-01-23 14:20:23');
INSERT INTO `sys_logininfor` VALUES (1749730175415128065, 'admin', '113.111.8.58', '中国|广东省|广州市|电信', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-01-23 17:45:57');
INSERT INTO `sys_logininfor` VALUES (1752277982132215809, 'admin', '113.65.206.215', '中国|广东省|广州市|电信', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-01-30 18:30:01');
INSERT INTO `sys_logininfor` VALUES (1752956138900070402, 'admin', '113.111.8.87', '中国|广东省|广州市|电信', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-02-01 15:24:47');
INSERT INTO `sys_logininfor` VALUES (1755512460883435522, 'admin', '117.61.112.112', '中国|江苏省|南京市|电信', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-02-08 16:42:41');
INSERT INTO `sys_logininfor` VALUES (1760852502975782913, 'admin', '113.65.205.79', '中国|广东省|广州市|电信', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-02-23 10:22:06');
INSERT INTO `sys_logininfor` VALUES (1760907980896378881, 'admin', '113.65.205.79', '中国|广东省|广州市|电信', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-02-23 14:02:33');
INSERT INTO `sys_logininfor` VALUES (1760959126419709953, 'admin', '113.65.205.79', '中国|广东省|广州市|电信', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-02-23 17:25:47');
INSERT INTO `sys_logininfor` VALUES (1761777618660270082, 'admin', '119.162.111.20', '中国|山东省|济南市|联通', 'Chrome', 'Windows 10 or Windows Server 2016', '1', '密码输入错误1次', '2024-02-25 23:38:11');
INSERT INTO `sys_logininfor` VALUES (1766343166467416066, 'admin', '120.85.168.20', '中国|广东省|广州市|联通', 'Chrome', 'Windows 10 or Windows Server 2016', '1', '密码输入错误1次', '2024-03-09 14:00:03');
INSERT INTO `sys_logininfor` VALUES (1766343188114219010, 'admin', '120.85.168.20', '中国|广东省|广州市|联通', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-03-09 14:00:08');
INSERT INTO `sys_logininfor` VALUES (1767072299317108738, 'admin', '113.111.9.125', '中国|广东省|广州市|电信', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-03-11 14:17:21');
INSERT INTO `sys_logininfor` VALUES (1767367706224009218, 'admin', '113.111.9.125', '中国|广东省|广州市|电信', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-03-12 09:51:12');
INSERT INTO `sys_logininfor` VALUES (1767399449115140098, 'admin', '113.111.9.125', '中国|广东省|广州市|电信', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-03-12 11:57:20');
INSERT INTO `sys_logininfor` VALUES (1767436291512377346, 'admin', '113.111.9.125', '中国|广东省|广州市|电信', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-03-12 14:23:44');
INSERT INTO `sys_logininfor` VALUES (1767838791692361729, 'admin', '113.111.9.125', '中国|广东省|广州市|电信', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-03-13 17:03:07');
INSERT INTO `sys_logininfor` VALUES (1768523632763117570, 'admin', '113.111.9.125', '中国|广东省|广州市|电信', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-03-15 14:24:26');
INSERT INTO `sys_logininfor` VALUES (1768536232699797506, 'admin', '113.111.9.125', '中国|广东省|广州市|电信', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-03-15 15:14:30');
INSERT INTO `sys_logininfor` VALUES (1770388284228935681, 'admin', '113.65.207.228', '中国|广东省|广州市|电信', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-03-20 17:53:54');
INSERT INTO `sys_logininfor` VALUES (1770823474252259329, 'admin', '120.85.171.215', '中国|广东省|广州市|联通', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-03-21 22:43:11');
INSERT INTO `sys_logininfor` VALUES (1776866472534646786, 'admin', '113.65.207.85', '中国|广东省|广州市|电信', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-04-07 14:55:54');
INSERT INTO `sys_logininfor` VALUES (1776866795932262401, 'admin', '113.65.207.85', '中国|广东省|广州市|电信', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '退出成功', '2024-04-07 14:57:11');
INSERT INTO `sys_logininfor` VALUES (1776869567532539905, 'admin', '113.65.207.85', '中国|广东省|广州市|电信', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-04-07 15:08:12');
INSERT INTO `sys_logininfor` VALUES (1780500363856752642, 'admin', '113.111.10.234', '中国|广东省|广州市|电信', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-04-17 15:35:41');
INSERT INTO `sys_logininfor` VALUES (1780844476867194881, 'admin', '113.111.9.247', '中国|广东省|广州市|电信', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-04-18 14:23:04');
INSERT INTO `sys_logininfor` VALUES (1785910166783438850, 'admin', '120.85.168.162', '中国|广东省|广州市|联通', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-05-02 13:52:19');
INSERT INTO `sys_logininfor` VALUES (1792565971431632898, 'admin', '120.85.168.238', '中国|广东省|广州市|联通', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-05-20 22:40:07');
INSERT INTO `sys_logininfor` VALUES (1796102687815806978, 'admin', '45.88.42.155', '荷兰|Drenthe', 'Chrome', 'Windows 10 or Windows Server 2016', '1', '密码输入错误1次', '2024-05-30 16:53:45');
INSERT INTO `sys_logininfor` VALUES (1796105892620578818, 'admin', '120.85.171.230', '中国|广东省|广州市|联通', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-05-30 17:06:29');
INSERT INTO `sys_logininfor` VALUES (1796105957347078146, 'admin', '120.85.171.230', '中国|广东省|广州市|联通', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '退出成功', '2024-05-30 17:06:45');
INSERT INTO `sys_logininfor` VALUES (1796105977584594945, 'admin', '120.85.171.230', '中国|广东省|广州市|联通', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-05-30 17:06:50');
INSERT INTO `sys_logininfor` VALUES (1796111430649556993, 'admin', '120.85.171.230', '中国|广东省|广州市|联通', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '退出成功', '2024-05-30 17:28:30');
INSERT INTO `sys_logininfor` VALUES (1796394000574492674, 'admin', '120.85.170.67', '中国|广东省|广州市|联通', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-05-31 12:11:20');
INSERT INTO `sys_logininfor` VALUES (1798663042882514946, 'admin', '120.238.252.230', '中国|广东省|广州市|移动', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-06-06 18:27:42');
INSERT INTO `sys_logininfor` VALUES (1798960317601067010, 'admin', '120.238.252.230', '中国|广东省|广州市|移动', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-06-07 14:08:57');
INSERT INTO `sys_logininfor` VALUES (1801519165218140161, 'admin', '120.238.252.230', '中国|广东省|广州市|移动', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-06-14 15:36:54');
INSERT INTO `sys_logininfor` VALUES (1802526445906432002, 'admin', '120.238.252.230', '中国|广东省|广州市|移动', 'Chrome', 'Windows 10 or Windows Server 2016', '1', '密码输入错误1次', '2024-06-17 10:19:29');
INSERT INTO `sys_logininfor` VALUES (1802526471990808578, 'admin', '120.238.252.230', '中国|广东省|广州市|移动', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-06-17 10:19:35');
INSERT INTO `sys_logininfor` VALUES (1802538291770167297, 'admin', '120.238.252.230', '中国|广东省|广州市|移动', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-06-17 11:06:33');
INSERT INTO `sys_logininfor` VALUES (1802623376666136578, 'admin', '120.238.252.230', '中国|广东省|广州市|移动', 'Chrome', 'Windows 10 or Windows Server 2016', '1', '验证码已失效', '2024-06-17 16:44:39');
INSERT INTO `sys_logininfor` VALUES (1802623393644679169, 'admin', '120.238.252.230', '中国|广东省|广州市|移动', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-06-17 16:44:43');
INSERT INTO `sys_logininfor` VALUES (1803244898472693761, 'admin', '120.238.252.230', '中国|广东省|广州市|移动', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-06-19 09:54:21');
INSERT INTO `sys_logininfor` VALUES (1803427462512644097, 'admin', '120.85.171.82', '中国|广东省|广州市|联通', 'Chrome', 'Windows 10 or Windows Server 2016', '1', '验证码错误', '2024-06-19 21:59:48');
INSERT INTO `sys_logininfor` VALUES (1803427493017817089, 'admin', '120.85.171.82', '中国|广东省|广州市|联通', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-06-19 21:59:55');
INSERT INTO `sys_logininfor` VALUES (1803440917202341890, 'admin', '120.85.171.82', '中国|广东省|广州市|联通', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-06-19 22:53:16');
INSERT INTO `sys_logininfor` VALUES (1803609245921316865, 'admin', '120.238.252.230', '中国|广东省|广州市|移动', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-06-20 10:02:08');
INSERT INTO `sys_logininfor` VALUES (1803703314827710466, 'admin', '120.238.252.230', '中国|广东省|广州市|移动', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-06-20 16:15:56');
INSERT INTO `sys_logininfor` VALUES (1803711988943745025, 'admin', '10.42.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-06-20 16:50:24');
INSERT INTO `sys_logininfor` VALUES (1803713212355112961, 'admin', '10.42.0.1', '内网IP', 'MicroMessenger', 'Android', '1', '密码输入错误1次', '2024-06-20 16:55:16');
INSERT INTO `sys_logininfor` VALUES (1803713233116917762, 'admin', '10.42.0.1', '内网IP', 'MicroMessenger', 'Android', '1', '密码输入错误2次', '2024-06-20 16:55:21');
INSERT INTO `sys_logininfor` VALUES (1803713871733256193, 'admin', '10.42.0.1', '内网IP', 'MicroMessenger', 'Android', '0', '登录成功', '2024-06-20 16:57:53');
INSERT INTO `sys_logininfor` VALUES (1803763645220564993, 'admin', '10.42.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-06-20 20:15:40');
INSERT INTO `sys_logininfor` VALUES (1803769680192606209, 'admin', '120.85.171.82', '中国|广东省|广州市|联通', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-06-20 20:39:39');
INSERT INTO `sys_logininfor` VALUES (1803968592872648705, 'admin', '10.42.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-06-21 09:50:03');
INSERT INTO `sys_logininfor` VALUES (1804340493505531906, 'admin', '114.138.161.128', '中国|贵州省|黔南|电信', 'Chrome', 'Linux', '1', '密码输入错误1次', '2024-06-22 10:27:51');
INSERT INTO `sys_logininfor` VALUES (1804373469213929473, 'admin', '10.42.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-06-22 12:38:53');
INSERT INTO `sys_logininfor` VALUES (1804723314860666882, 'admin', '10.42.0.1', '内网IP', 'Chrome', 'Android', '1', '密码输入错误1次', '2024-06-23 11:49:03');
INSERT INTO `sys_logininfor` VALUES (1804723361757179905, 'admin', '10.42.0.1', '内网IP', 'Chrome', 'Android', '0', '登录成功', '2024-06-23 11:49:14');
INSERT INTO `sys_logininfor` VALUES (1805167640153600002, 'admin', '10.42.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-06-24 17:14:38');
INSERT INTO `sys_logininfor` VALUES (1805429763089805313, 'admin', '10.42.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-06-25 10:36:13');
INSERT INTO `sys_logininfor` VALUES (1805511500629192706, 'admin', '10.42.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-06-25 16:01:01');
INSERT INTO `sys_logininfor` VALUES (1805610022185472001, 'admin', '120.85.171.81', '中国|广东省|广州市|联通', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-06-25 22:32:31');
INSERT INTO `sys_logininfor` VALUES (1805985184051367938, 'admin', '120.85.171.81', '中国|广东省|广州市|联通', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-06-26 23:23:16');
INSERT INTO `sys_logininfor` VALUES (1806167290647941121, 'admin', '120.238.252.230', '中国|广东省|广州市|移动', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-06-27 11:26:54');
INSERT INTO `sys_logininfor` VALUES (1806337251536576513, 'admin', '10.42.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-06-27 22:42:16');
INSERT INTO `sys_logininfor` VALUES (1806358380774989826, 'admin', '10.42.0.1', '内网IP', 'Chrome', 'Android', '0', '登录成功', '2024-06-28 00:06:13');
INSERT INTO `sys_logininfor` VALUES (1806597021921222658, 'admin', '10.42.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-06-28 15:54:30');
INSERT INTO `sys_logininfor` VALUES (1816021777141252097, 'admin', '10.244.0.0', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-07-24 16:05:06');
INSERT INTO `sys_logininfor` VALUES (1816031315118571521, 'admin', '10.244.0.0', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-07-24 16:43:00');
INSERT INTO `sys_logininfor` VALUES (1816298725918687233, 'admin', '10.244.0.0', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '1', '密码输入错误1次', '2024-07-25 10:25:36');
INSERT INTO `sys_logininfor` VALUES (1816298755014574082, 'admin', '10.244.0.0', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-07-25 10:25:43');
INSERT INTO `sys_logininfor` VALUES (1816301421270712322, 'admin', '120.238.252.230', '中国|广东省|广州市|移动', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '退出成功', '2024-07-25 10:36:19');
INSERT INTO `sys_logininfor` VALUES (1816301514778525697, 'admin', '120.238.252.230', '中国|广东省|广州市|移动', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-07-25 10:36:41');
INSERT INTO `sys_logininfor` VALUES (1816315162712391682, 'admin', '120.238.252.230', '中国|广东省|广州市|移动', 'Chrome', 'Windows 10 or Windows Server 2016', '1', '验证码已失效', '2024-07-25 11:30:55');
INSERT INTO `sys_logininfor` VALUES (1816315197185376257, 'admin', '120.238.252.230', '中国|广东省|广州市|移动', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-07-25 11:31:03');
INSERT INTO `sys_logininfor` VALUES (1816315772820045826, 'admin', '120.238.252.230', '中国|广东省|广州市|移动', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '退出成功', '2024-07-25 11:33:20');
INSERT INTO `sys_logininfor` VALUES (1816315796605943809, 'guest', '120.238.252.230', '中国|广东省|广州市|移动', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-07-25 11:33:26');
INSERT INTO `sys_logininfor` VALUES (1816315892894580738, 'guest', '120.238.252.230', '中国|广东省|广州市|移动', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '退出成功', '2024-07-25 11:33:49');
INSERT INTO `sys_logininfor` VALUES (1816315913144680450, 'admin', '120.238.252.230', '中国|广东省|广州市|移动', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-07-25 11:33:54');
INSERT INTO `sys_logininfor` VALUES (1816358946397536258, 'admin', '120.238.252.230', '中国|广东省|广州市|移动', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-07-25 14:24:54');
INSERT INTO `sys_logininfor` VALUES (1816360015202664450, 'admin', '220.195.105.198', '中国|内蒙古|联通', 'MSEdge', 'Windows 10 or Windows Server 2016', '1', '密码输入错误1次', '2024-07-25 14:29:09');
INSERT INTO `sys_logininfor` VALUES (1816360070043189249, 'ruoyi', '220.195.105.198', '中国|内蒙古|联通', 'MSEdge', 'Windows 10 or Windows Server 2016', '1', '验证码错误', '2024-07-25 14:29:22');
INSERT INTO `sys_logininfor` VALUES (1816360169930539010, 'admin', '220.195.105.198', '中国|内蒙古|联通', 'MSEdge', 'Windows 10 or Windows Server 2016', '1', '验证码错误', '2024-07-25 14:29:46');
INSERT INTO `sys_logininfor` VALUES (1816360194295250945, 'admin', '220.195.105.198', '中国|内蒙古|联通', 'MSEdge', 'Windows 10 or Windows Server 2016', '1', '密码输入错误2次', '2024-07-25 14:29:51');
INSERT INTO `sys_logininfor` VALUES (1816380444004892673, 'admin', '120.238.252.230', '中国|广东省|广州市|移动', 'Chrome', 'Windows 10 or Windows Server 2016', '1', '密码输入错误1次', '2024-07-25 15:50:19');
INSERT INTO `sys_logininfor` VALUES (1816380464628285442, 'admin', '120.238.252.230', '中国|广东省|广州市|移动', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-07-25 15:50:24');
INSERT INTO `sys_logininfor` VALUES (1816428341845082114, 'admin', '112.96.48.217', '中国|广东省|广州市|联通', 'Chrome', 'Android', '0', '登录成功', '2024-07-25 19:00:39');
INSERT INTO `sys_logininfor` VALUES (1816458831515074561, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-07-25 21:01:48');
INSERT INTO `sys_logininfor` VALUES (1816458939614871553, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '退出成功', '2024-07-25 21:02:14');
INSERT INTO `sys_logininfor` VALUES (1816463374453817346, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '1', '验证码已失效', '2024-07-25 21:19:51');
INSERT INTO `sys_logininfor` VALUES (1816463387896561666, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-07-25 21:19:55');
INSERT INTO `sys_logininfor` VALUES (1816463869352329218, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '退出成功', '2024-07-25 21:21:49');
INSERT INTO `sys_logininfor` VALUES (1816465418384183298, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '1', '密码输入错误1次', '2024-07-25 21:27:59');
INSERT INTO `sys_logininfor` VALUES (1816465440832098305, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-07-25 21:28:04');
INSERT INTO `sys_logininfor` VALUES (1816467050103619585, 'admin', '120.85.169.232', '中国|广东省|广州市|联通', 'Chrome', 'Windows 10 or Windows Server 2016', '1', '密码输入错误1次', '2024-07-25 21:34:28');
INSERT INTO `sys_logininfor` VALUES (1816467071653953538, 'admin', '120.85.169.232', '中国|广东省|广州市|联通', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-07-25 21:34:33');
INSERT INTO `sys_logininfor` VALUES (1816647770700824577, 'admin', '120.238.252.230', '中国|广东省|广州市|移动', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-07-26 09:32:35');
INSERT INTO `sys_logininfor` VALUES (1816649197342998530, 'admin', '120.238.252.230', '中国|广东省|广州市|移动', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '退出成功', '2024-07-26 09:38:15');
INSERT INTO `sys_logininfor` VALUES (1817031955512868865, 'admin', '42.89.51.255', '中国|甘肃省|临夏|电信', 'Chrome', 'Windows 10 or Windows Server 2016', '1', '密码输入错误1次', '2024-07-27 10:59:12');
INSERT INTO `sys_logininfor` VALUES (1817031988517847042, 'admin', '42.89.51.255', '中国|甘肃省|临夏|电信', 'Chrome', 'Windows 10 or Windows Server 2016', '1', '密码输入错误2次', '2024-07-27 10:59:20');
INSERT INTO `sys_logininfor` VALUES (1817032022504292353, 'admin', '42.89.51.255', '中国|甘肃省|临夏|电信', 'Chrome', 'Windows 10 or Windows Server 2016', '1', '密码输入错误3次', '2024-07-27 10:59:28');
INSERT INTO `sys_logininfor` VALUES (1817461898608689154, 'admin', '120.85.168.91', '中国|广东省|广州市|联通', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-07-28 15:27:38');
INSERT INTO `sys_logininfor` VALUES (1817472217636716545, 'admin', '120.85.168.91', '中国|广东省|广州市|联通', 'Chrome', 'Windows 10 or Windows Server 2016', '1', '密码输入错误1次', '2024-07-28 16:08:38');
INSERT INTO `sys_logininfor` VALUES (1817472253015670786, 'admin', '120.85.168.91', '中国|广东省|广州市|联通', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-07-28 16:08:47');
INSERT INTO `sys_logininfor` VALUES (1817733340894117890, 'admin', '120.238.252.230', '中国|广东省|广州市|移动', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-07-29 09:26:15');
INSERT INTO `sys_logininfor` VALUES (1817761752060837889, 'admin', '120.238.252.230', '中国|广东省|广州市|移动', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-07-29 11:19:09');
INSERT INTO `sys_logininfor` VALUES (1817826792419934210, 'admin', '120.238.252.230', '中国|广东省|广州市|移动', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-07-29 15:37:36');
INSERT INTO `sys_logininfor` VALUES (1817843444159135745, 'admin', '120.238.252.230', '中国|广东省|广州市|移动', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-07-29 16:43:46');
INSERT INTO `sys_logininfor` VALUES (1817849017017749506, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-07-29 17:05:54');
INSERT INTO `sys_logininfor` VALUES (1817853583016640513, 'admin', '120.238.252.230', '中国|广东省|广州市|移动', 'Chrome', 'Windows 10 or Windows Server 2016', '1', '密码输入错误1次', '2024-07-29 17:24:03');
INSERT INTO `sys_logininfor` VALUES (1817853618223628290, 'admin', '120.238.252.230', '中国|广东省|广州市|移动', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-07-29 17:24:11');
INSERT INTO `sys_logininfor` VALUES (1817855011760160769, 'admin', '120.238.252.230', '中国|广东省|广州市|移动', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '退出成功', '2024-07-29 17:29:44');
INSERT INTO `sys_logininfor` VALUES (1817883960775065602, 'admin', '120.85.168.91', '中国|广东省|广州市|联通', 'Chrome', 'Android', '0', '登录成功', '2024-07-29 19:24:46');
INSERT INTO `sys_logininfor` VALUES (1818099132181561346, 'admin', '120.238.252.230', '中国|广东省|广州市|移动', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-07-30 09:39:46');
INSERT INTO `sys_logininfor` VALUES (1818110882557771778, 'admin', '120.238.252.230', '中国|广东省|广州市|移动', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-07-30 10:26:28');
INSERT INTO `sys_logininfor` VALUES (1818172081634852865, 'admin', '120.238.252.230', '中国|广东省|广州市|移动', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-07-30 14:29:39');
INSERT INTO `sys_logininfor` VALUES (1818199610739441666, 'admin', '120.238.252.230', '中国|广东省|广州市|移动', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-07-30 16:19:02');
INSERT INTO `sys_logininfor` VALUES (1818229493922316289, 'admin', '120.238.252.230', '中国|广东省|广州市|移动', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-07-30 18:17:47');
INSERT INTO `sys_logininfor` VALUES (1818231167927762945, 'admin', '112.96.54.193', '中国|广东省|广州市|联通', 'Chrome', 'Android', '0', '登录成功', '2024-07-30 18:24:26');
INSERT INTO `sys_logininfor` VALUES (1818460799339905025, 'admin', '120.238.252.230', '中国|广东省|广州市|移动', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-07-31 09:36:55');
INSERT INTO `sys_logininfor` VALUES (1818473650808995842, 'admin', '120.238.252.230', '中国|广东省|广州市|移动', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-07-31 10:27:59');
INSERT INTO `sys_logininfor` VALUES (1818527940168695809, 'admin', '120.238.252.230', '中国|广东省|广州市|移动', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-07-31 14:03:42');
INSERT INTO `sys_logininfor` VALUES (1818560438370091010, 'admin', '120.238.252.230', '中国|广东省|广州市|移动', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-07-31 16:12:50');
INSERT INTO `sys_logininfor` VALUES (1818632440468520961, 'admin', '120.85.168.91', '中国|广东省|广州市|联通', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-07-31 20:58:57');
INSERT INTO `sys_logininfor` VALUES (1818644776807219202, 'admin', '120.85.168.91', '中国|广东省|广州市|联通', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-07-31 21:47:58');
INSERT INTO `sys_logininfor` VALUES (1818649052472328194, 'admin', '120.85.168.91', '中国|广东省|广州市|联通', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '退出成功', '2024-07-31 22:04:58');
INSERT INTO `sys_logininfor` VALUES (1818649095346503682, 'admin', '120.85.168.91', '中国|广东省|广州市|联通', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-07-31 22:05:08');
INSERT INTO `sys_logininfor` VALUES (1819183695839805442, 'admin', '117.136.12.244', '中国|广东省|佛山市|移动', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-08-02 09:29:27');
INSERT INTO `sys_logininfor` VALUES (1819192789908766721, 'admin', '117.136.12.244', '中国|广东省|佛山市|移动', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-08-02 10:05:35');
INSERT INTO `sys_logininfor` VALUES (1819257859330195458, 'admin', '112.96.57.239', '中国|广东省|广州市|联通', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-08-02 14:24:08');
INSERT INTO `sys_logininfor` VALUES (1819289430363914242, 'admin', '112.96.57.239', '中国|广东省|广州市|联通', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-08-02 16:29:36');
INSERT INTO `sys_logininfor` VALUES (1819560510890622978, 'admin', '120.85.169.27', '中国|广东省|广州市|联通', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-08-03 10:26:46');
INSERT INTO `sys_logininfor` VALUES (1820272978776473601, 'admin', '120.238.252.230', '中国|广东省|广州市|移动', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-08-05 09:37:52');
INSERT INTO `sys_logininfor` VALUES (1821023669002354690, 'admin', '120.85.169.27', '中国|广东省|广州市|联通', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-08-07 11:20:50');
INSERT INTO `sys_logininfor` VALUES (1821086466864234498, 'admin', '120.85.169.27', '中国|广东省|广州市|联通', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-08-07 15:30:23');
INSERT INTO `sys_logininfor` VALUES (1821510973290627074, 'admin', '120.85.169.27', '中国|广东省|广州市|联通', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-08-08 19:37:13');
INSERT INTO `sys_logininfor` VALUES (1822904941895139329, 'admin', '120.85.168.41', '中国|广东省|广州市|联通', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-08-12 15:56:21');
INSERT INTO `sys_logininfor` VALUES (1824390790232645633, 'admin', '120.85.168.111', '中国|广东省|广州市|联通', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-08-16 18:20:35');
INSERT INTO `sys_logininfor` VALUES (1825883084062646274, 'admin', '120.85.168.111', '中国|广东省|广州市|联通', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-08-20 21:10:25');
INSERT INTO `sys_logininfor` VALUES (1825921403089772545, 'admin', '120.85.168.111', '中国|广东省|广州市|联通', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-08-20 23:42:41');
INSERT INTO `sys_logininfor` VALUES (1825933047052296193, 'admin', '120.85.168.111', '中国|广东省|广州市|联通', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '退出成功', '2024-08-21 00:28:57');
INSERT INTO `sys_logininfor` VALUES (1825933078887063554, 'admin', '120.85.168.111', '中国|广东省|广州市|联通', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-08-21 00:29:05');
INSERT INTO `sys_logininfor` VALUES (1825944141611327489, 'admin', '120.85.168.111', '中国|广东省|广州市|联通', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-08-21 01:13:02');
INSERT INTO `sys_logininfor` VALUES (1826074865853194241, 'admin', '120.85.168.111', '中国|广东省|广州市|联通', 'Chrome', 'Android', '1', '验证码已失效', '2024-08-21 09:52:30');
INSERT INTO `sys_logininfor` VALUES (1826074888263360514, 'admin', '120.85.168.111', '中国|广东省|广州市|联通', 'Chrome', 'Android', '0', '登录成功', '2024-08-21 09:52:35');
INSERT INTO `sys_logininfor` VALUES (1826638583225835521, 'guest', '120.85.168.111', '中国|广东省|广州市|联通', 'Chrome', 'Android', '0', '登录成功', '2024-08-22 23:12:30');
INSERT INTO `sys_logininfor` VALUES (1827569243356585986, 'admin', '120.85.171.122', '中国|广东省|广州市|联通', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-08-25 12:50:37');
INSERT INTO `sys_logininfor` VALUES (1828324233591316482, 'admin', '120.85.171.122', '中国|广东省|广州市|联通', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-08-27 14:50:41');
INSERT INTO `sys_logininfor` VALUES (1834864448019554305, 'admin', '113.116.178.35', '中国|广东省|深圳市|电信', 'Chrome', 'Windows 10 or Windows Server 2016', '1', '验证码错误', '2024-09-14 15:59:09');
INSERT INTO `sys_logininfor` VALUES (1834864467271409666, 'admin', '113.116.178.35', '中国|广东省|深圳市|电信', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-09-14 15:59:14');
INSERT INTO `sys_logininfor` VALUES (1838746349717348354, 'admin', '113.116.178.24', '中国|广东省|深圳市|电信', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-09-25 09:04:27');
INSERT INTO `sys_logininfor` VALUES (1843504341771804673, 'admin', '119.136.90.5', '中国|广东省|深圳市|电信', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-10-08 12:11:00');
INSERT INTO `sys_logininfor` VALUES (1843937386890977281, 'admin', '119.136.90.5', '中国|广东省|深圳市|电信', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-10-09 16:51:46');
INSERT INTO `sys_logininfor` VALUES (1849345839822200834, 'admin', '119.136.88.34', '中国|广东省|深圳市|电信', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-10-24 15:03:02');
INSERT INTO `sys_logininfor` VALUES (1849362381867769857, 'admin', '119.136.88.34', '中国|广东省|深圳市|电信', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '退出成功', '2024-10-24 16:08:46');
INSERT INTO `sys_logininfor` VALUES (1849362417393524737, 'guest', '119.136.88.34', '中国|广东省|深圳市|电信', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-10-24 16:08:54');
INSERT INTO `sys_logininfor` VALUES (1849362453649088514, 'guest', '119.136.88.34', '中国|广东省|深圳市|电信', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '退出成功', '2024-10-24 16:09:03');
INSERT INTO `sys_logininfor` VALUES (1849362479028822018, 'admin', '119.136.88.34', '中国|广东省|深圳市|电信', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-10-24 16:09:09');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组件路径',
  `query_param` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '路由参数',
  `is_frame` int NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '显示状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '菜单权限表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, 'system', NULL, '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2023-11-05 13:57:22', '', NULL, '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 2, 'monitor', NULL, '', 1, 0, 'M', '0', '0', '', 'monitor', 'admin', '2023-11-05 13:57:22', '', NULL, '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 3, 'tool', NULL, '', 1, 0, 'M', '0', '0', '', 'tool', 'admin', '2023-11-05 13:57:22', '', NULL, '系统工具目录');
INSERT INTO `sys_menu` VALUES (4, 'PLUS官网', 0, 4, 'https://gitee.com/dromara/RuoYi-Vue-Plus', NULL, '', 0, 0, 'M', '1', '0', '', 'guide', 'admin', '2023-11-05 13:57:22', 'admin', '2023-11-05 14:43:47', 'RuoYi-Vue-Plus官网地址');
INSERT INTO `sys_menu` VALUES (5, '测试菜单', 0, 5, 'demo', NULL, NULL, 1, 0, 'M', '0', '0', NULL, 'star', 'admin', '2023-11-05 13:57:30', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2023-11-05 13:57:22', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2023-11-05 13:57:22', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2023-11-05 13:57:22', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', '', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2023-11-05 13:57:22', '', NULL, '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', '', 1, 0, 'C', '0', '0', 'system:post:list', 'post', 'admin', '2023-11-05 13:57:22', '', NULL, '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2023-11-05 13:57:22', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', '', 1, 0, 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2023-11-05 13:57:22', '', NULL, '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', '', 1, 0, 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2023-11-05 13:57:22', '', NULL, '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, 'log', '', '', 1, 0, 'M', '0', '0', '', 'log', 'admin', '2023-11-05 13:57:22', '', NULL, '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', '', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2023-11-05 13:57:22', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES (112, '缓存列表', 2, 6, 'cacheList', 'monitor/cache/list', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis-list', 'admin', '2023-11-05 13:57:22', '', NULL, '缓存列表菜单');
INSERT INTO `sys_menu` VALUES (113, '缓存监控', 2, 5, 'cache', 'monitor/cache/index', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis', 'admin', '2023-11-05 13:57:22', '', NULL, '缓存监控菜单');
INSERT INTO `sys_menu` VALUES (114, '表单构建', 3, 1, 'build', 'tool/build/index', '', 1, 0, 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2023-11-05 13:57:22', '', NULL, '表单构建菜单');
INSERT INTO `sys_menu` VALUES (115, '代码生成', 3, 2, 'gen', 'tool/gen/index', '', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2023-11-05 13:57:22', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu` VALUES (117, 'Admin监控', 2, 5, 'Admin', 'monitor/admin/index', '', 1, 0, 'C', '0', '0', 'monitor:admin:list', 'dashboard', 'admin', '2023-11-05 13:57:22', '', NULL, 'Admin监控菜单');
INSERT INTO `sys_menu` VALUES (118, '文件管理', 1, 10, 'oss', 'system/oss/index', '', 1, 0, 'C', '0', '0', 'system:oss:list', 'upload', 'admin', '2023-11-05 13:57:22', '', NULL, '文件管理菜单');
INSERT INTO `sys_menu` VALUES (120, '任务调度中心', 2, 5, 'XxlJob', 'monitor/xxljob/index', '', 1, 0, 'C', '0', '0', 'monitor:xxljob:list', 'job', 'admin', '2023-11-05 13:57:22', '', NULL, 'Xxl-Job控制台菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', '', 1, 0, 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2023-11-05 13:57:22', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', '', 1, 0, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2023-11-05 13:57:22', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1001, '用户查询', 100, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2023-11-05 13:57:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户新增', 100, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2023-11-05 13:57:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户修改', 100, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2023-11-05 13:57:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户删除', 100, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2023-11-05 13:57:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导出', 100, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2023-11-05 13:57:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '用户导入', 100, 6, '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2023-11-05 13:57:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '重置密码', 100, 7, '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2023-11-05 13:57:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色查询', 101, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2023-11-05 13:57:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色新增', 101, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2023-11-05 13:57:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色修改', 101, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2023-11-05 13:57:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色删除', 101, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2023-11-05 13:57:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '角色导出', 101, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2023-11-05 13:57:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单查询', 102, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2023-11-05 13:57:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单新增', 102, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2023-11-05 13:57:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单修改', 102, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2023-11-05 13:57:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '菜单删除', 102, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2023-11-05 13:57:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门查询', 103, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2023-11-05 13:57:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门新增', 103, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2023-11-05 13:57:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门修改', 103, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2023-11-05 13:57:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '部门删除', 103, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2023-11-05 13:57:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位查询', 104, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin', '2023-11-05 13:57:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位新增', 104, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin', '2023-11-05 13:57:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位修改', 104, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2023-11-05 13:57:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位删除', 104, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2023-11-05 13:57:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '岗位导出', 104, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin', '2023-11-05 13:57:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典查询', 105, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2023-11-05 13:57:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典新增', 105, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2023-11-05 13:57:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典修改', 105, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2023-11-05 13:57:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典删除', 105, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2023-11-05 13:57:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '字典导出', 105, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2023-11-05 13:57:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数查询', 106, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', '2023-11-05 13:57:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数新增', 106, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', '2023-11-05 13:57:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数修改', 106, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2023-11-05 13:57:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数删除', 106, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2023-11-05 13:57:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '参数导出', 106, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', '2023-11-05 13:57:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告查询', 107, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2023-11-05 13:57:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告新增', 107, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2023-11-05 13:57:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告修改', 107, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2023-11-05 13:57:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '公告删除', 107, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2023-11-05 13:57:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作查询', 500, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2023-11-05 13:57:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '操作删除', 500, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2023-11-05 13:57:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '日志导出', 500, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2023-11-05 13:57:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录查询', 501, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2023-11-05 13:57:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '登录删除', 501, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2023-11-05 13:57:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '日志导出', 501, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2023-11-05 13:57:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2023-11-05 13:57:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2023-11-05 13:57:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2023-11-05 13:57:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '账户解锁', 501, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:unlock', '#', 'admin', '2023-11-05 13:57:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '生成查询', 115, 1, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2023-11-05 13:57:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '生成修改', 115, 2, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2023-11-05 13:57:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成删除', 115, 3, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2023-11-05 13:57:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '导入代码', 115, 2, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2023-11-05 13:57:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '预览代码', 115, 4, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2023-11-05 13:57:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '生成代码', 115, 5, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2023-11-05 13:57:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1500, '测试单表', 5, 1, 'demo', 'demo/demo/index', NULL, 1, 0, 'C', '0', '0', 'demo:demo:list', '#', 'admin', '2023-11-05 13:57:30', '', NULL, '测试单表菜单');
INSERT INTO `sys_menu` VALUES (1501, '测试单表查询', 1500, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'demo:demo:query', '#', 'admin', '2023-11-05 13:57:30', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1502, '测试单表新增', 1500, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'demo:demo:add', '#', 'admin', '2023-11-05 13:57:30', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1503, '测试单表修改', 1500, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'demo:demo:edit', '#', 'admin', '2023-11-05 13:57:30', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1504, '测试单表删除', 1500, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'demo:demo:remove', '#', 'admin', '2023-11-05 13:57:30', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1505, '测试单表导出', 1500, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'demo:demo:export', '#', 'admin', '2023-11-05 13:57:30', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1506, '测试树表', 5, 1, 'tree', 'demo/tree/index', NULL, 1, 0, 'C', '0', '0', 'demo:tree:list', '#', 'admin', '2023-11-05 13:57:30', '', NULL, '测试树表菜单');
INSERT INTO `sys_menu` VALUES (1507, '测试树表查询', 1506, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'demo:tree:query', '#', 'admin', '2023-11-05 13:57:30', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1508, '测试树表新增', 1506, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'demo:tree:add', '#', 'admin', '2023-11-05 13:57:30', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1509, '测试树表修改', 1506, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'demo:tree:edit', '#', 'admin', '2023-11-05 13:57:30', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1510, '测试树表删除', 1506, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'demo:tree:remove', '#', 'admin', '2023-11-05 13:57:30', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1511, '测试树表导出', 1506, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'demo:tree:export', '#', 'admin', '2023-11-05 13:57:30', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1600, '文件查询', 118, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:oss:query', '#', 'admin', '2023-11-05 13:57:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1601, '文件上传', 118, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:oss:upload', '#', 'admin', '2023-11-05 13:57:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1602, '文件下载', 118, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:oss:download', '#', 'admin', '2023-11-05 13:57:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1603, '文件删除', 118, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:oss:remove', '#', 'admin', '2023-11-05 13:57:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1604, '配置添加', 118, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:oss:add', '#', 'admin', '2023-11-05 13:57:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1605, '配置编辑', 118, 6, '#', '', '', 1, 0, 'F', '0', '0', 'system:oss:edit', '#', 'admin', '2023-11-05 13:57:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1760908759807991810, '全局应用', 0, 1, 'globalApp', 'system/globalApp/index', NULL, 1, 0, 'C', '1', '0', 'system:globalApp:list', '#', 'admin', '2024-02-23 14:12:37', 'admin', '2024-07-25 21:28:58', '全局应用菜单');
INSERT INTO `sys_menu` VALUES (1760908759807991811, '全局应用查询', 1760908759807991810, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:globalApp:query', '#', 'admin', '2024-02-23 14:12:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1760908759807991812, '全局应用新增', 1760908759807991810, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:globalApp:add', '#', 'admin', '2024-02-23 14:12:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1760908759807991813, '全局应用修改', 1760908759807991810, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:globalApp:edit', '#', 'admin', '2024-02-23 14:12:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1760908759807991814, '全局应用删除', 1760908759807991810, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:globalApp:remove', '#', 'admin', '2024-02-23 14:12:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1760908759807991815, '全局应用导出', 1760908759807991810, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:globalApp:export', '#', 'admin', '2024-02-23 14:12:37', '', NULL, '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` bigint NOT NULL COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '通知公告表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2018-07-01 新版本发布啦', '2', 0xE696B0E78988E69CACE58685E5AEB9, '0', 'admin', '2023-11-05 13:57:22', '', NULL, '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：2018-07-01 系统凌晨维护', '1', 0xE7BBB4E68AA4E58685E5AEB9, '0', 'admin', '2023-11-05 13:57:22', '', NULL, '管理员');
INSERT INTO `sys_notice` VALUES (1722459375215828993, '公告测试', '1', 0x3C703E74657374E5958A3C2F703E, '0', 'admin', '2023-11-09 11:41:31', 'admin', '2023-11-09 11:41:31', NULL);
INSERT INTO `sys_notice` VALUES (1849362347164098561, '哈哈哈', '2', 0x3C703EE591B1E591B1E591B1E591B1E591B13C2F703E, '0', 'admin', '2024-10-24 16:08:38', 'admin', '2024-10-24 16:08:38', NULL);

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint NOT NULL COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`) USING BTREE,
  INDEX `idx_sys_oper_log_bt`(`business_type` ASC) USING BTREE,
  INDEX `idx_sys_oper_log_s`(`status` ASC) USING BTREE,
  INDEX `idx_sys_oper_log_ot`(`oper_time` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '操作日志记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (1721044827514593281, '对象存储配置', 2, 'com.ruoyi.web.controller.system.SysOssConfigController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/oss/config', '119.34.162.5', '中国|广东省|广州市|珠江宽频', '{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"ossConfigId\":1,\"configKey\":\"minio\",\"accessKey\":\"admin\",\"secretKey\":\"dudu0.0!@-=\",\"bucketName\":\"ruoyi\",\"prefix\":\"\",\"endpoint\":\"127.0.0.1:9000\",\"domain\":\"\",\"isHttps\":\"N\",\"status\":\"0\",\"region\":\"\",\"ext1\":\"\",\"remark\":null,\"accessPolicy\":\"1\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-11-05 14:00:37');
INSERT INTO `sys_oper_log` VALUES (1721044945609416705, 'OSS对象存储', 1, 'com.ruoyi.web.controller.system.SysOssController.upload()', 'POST', 1, 'admin', '研发部门', '/system/oss/upload', '119.34.162.5', '中国|广东省|广州市|珠江宽频', '', '{\"code\":200,\"msg\":\"操作成功\",\"data\":{\"ossId\":\"1721044945546502146\",\"url\":\"http://127.0.0.1:9000/ruoyi/2023/11/05/7340a1a32e8c41ddb660042ae0c35ee1.png\",\"fileName\":\"Snipaste_2023-06-23_21-55-45.png\"}}', 0, '', '2023-11-05 14:01:05');
INSERT INTO `sys_oper_log` VALUES (1721045338133356546, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.updatePwd()', 'PUT', 1, 'admin', '研发部门', '/system/user/profile/updatePwd', '183.145.171.176', '中国|浙江省|绍兴市|电信', '{}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-11-05 14:02:39');
INSERT INTO `sys_oper_log` VALUES (1721055692699721729, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '119.34.162.5', '中国|广东省|广州市|珠江宽频', '{\"createBy\":\"admin\",\"createTime\":\"2023-11-05 13:57:22\",\"updateBy\":\"admin\",\"updateTime\":\"2023-11-05 14:43:47\",\"parentName\":null,\"parentId\":0,\"children\":[],\"menuId\":4,\"menuName\":\"PLUS官网\",\"orderNum\":4,\"path\":\"https://gitee.com/dromara/RuoYi-Vue-Plus\",\"component\":null,\"queryParam\":\"\",\"isFrame\":\"0\",\"isCache\":\"0\",\"menuType\":\"M\",\"visible\":\"1\",\"status\":\"0\",\"perms\":\"\",\"icon\":\"guide\",\"remark\":\"RuoYi-Vue-Plus官网地址\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-11-05 14:43:47');
INSERT INTO `sys_oper_log` VALUES (1721059678748139522, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/system/user/changeStatus', '119.34.162.5', '中国|广东省|广州市|珠江宽频', '{\"createBy\":null,\"createTime\":null,\"updateBy\":\"admin\",\"updateTime\":\"2023-11-05 14:59:37\",\"userId\":2,\"deptId\":null,\"userName\":null,\"nickName\":null,\"userType\":null,\"email\":null,\"phonenumber\":null,\"sex\":null,\"avatar\":null,\"status\":\"1\",\"delFlag\":null,\"loginIp\":null,\"loginDate\":null,\"remark\":null,\"dept\":null,\"roles\":null,\"roleIds\":null,\"postIds\":null,\"roleId\":null,\"admin\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-11-05 14:59:38');
INSERT INTO `sys_oper_log` VALUES (1721059685249310722, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/system/user/changeStatus', '119.34.162.5', '中国|广东省|广州市|珠江宽频', '{\"createBy\":null,\"createTime\":null,\"updateBy\":\"admin\",\"updateTime\":\"2023-11-05 14:59:39\",\"userId\":3,\"deptId\":null,\"userName\":null,\"nickName\":null,\"userType\":null,\"email\":null,\"phonenumber\":null,\"sex\":null,\"avatar\":null,\"status\":\"1\",\"delFlag\":null,\"loginIp\":null,\"loginDate\":null,\"remark\":null,\"dept\":null,\"roles\":null,\"roleIds\":null,\"postIds\":null,\"roleId\":null,\"admin\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-11-05 14:59:39');
INSERT INTO `sys_oper_log` VALUES (1721062723787677698, 'OSS对象存储', 1, 'com.ruoyi.web.controller.system.SysOssController.upload()', 'POST', 1, 'admin', '研发部门', '/system/oss/upload', '183.145.171.176', '中国|浙江省|绍兴市|电信', '', '{\"code\":200,\"msg\":\"操作成功\",\"data\":{\"ossId\":\"1721062723749928962\",\"url\":\"http://127.0.0.1:9000/ruoyi/2023/11/05/f1183583327a42e7b3b6cacae572b97b.jpg\",\"fileName\":\"beauty_202302140012195338.jpg\"}}', 0, '', '2023-11-05 15:11:44');
INSERT INTO `sys_oper_log` VALUES (1721062734533484546, 'OSS对象存储', 3, 'com.ruoyi.web.controller.system.SysOssController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/oss/1721062723749928962', '183.145.171.176', '中国|浙江省|绍兴市|电信', '{}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-11-05 15:11:46');
INSERT INTO `sys_oper_log` VALUES (1721062760496226306, 'OSS对象存储', 1, 'com.ruoyi.web.controller.system.SysOssController.upload()', 'POST', 1, 'admin', '研发部门', '/system/oss/upload', '183.145.171.176', '中国|浙江省|绍兴市|电信', '', '{\"code\":200,\"msg\":\"操作成功\",\"data\":{\"ossId\":\"1721062760458477570\",\"url\":\"http://127.0.0.1:9000/ruoyi/2023/11/05/03be98b5fb0c4150a3cf86282794c6a5.jpg\",\"fileName\":\"beauty_202210041630589354.jpg\"}}', 0, '', '2023-11-05 15:11:53');
INSERT INTO `sys_oper_log` VALUES (1722459375245189122, '通知公告', 1, 'com.ruoyi.web.controller.system.SysNoticeController.add()', 'POST', 1, 'admin', '研发部门', '/system/notice', '113.111.11.110', '中国|广东省|广州市|电信', '{\"createBy\":\"admin\",\"createTime\":\"2023-11-09 11:41:31\",\"updateBy\":\"admin\",\"updateTime\":\"2023-11-09 11:41:31\",\"noticeId\":\"1722459375215828993\",\"noticeTitle\":\"公告测试\",\"noticeType\":\"1\",\"noticeContent\":\"<p>test啊</p>\",\"status\":\"0\",\"remark\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-11-09 11:41:31');
INSERT INTO `sys_oper_log` VALUES (1722820611141001218, '对象存储配置', 2, 'com.ruoyi.web.controller.system.SysOssConfigController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/oss/config', '113.111.11.110', '中国|广东省|广州市|电信', '{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"ossConfigId\":1,\"configKey\":\"minio\",\"accessKey\":\"admin\",\"secretKey\":\"dudu0.0!@-=\",\"bucketName\":\"ruoyi\",\"prefix\":\"\",\"endpoint\":\"139.159.140.112:9000\",\"domain\":\"\",\"isHttps\":\"N\",\"status\":\"0\",\"region\":\"\",\"ext1\":\"\",\"remark\":\"\",\"accessPolicy\":\"1\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-11-10 11:36:57');
INSERT INTO `sys_oper_log` VALUES (1722820850086305793, 'OSS对象存储', 1, 'com.ruoyi.web.controller.system.SysOssController.upload()', 'POST', 1, 'admin', '研发部门', '/system/oss/upload', '113.111.11.110', '中国|广东省|广州市|电信', '', '', 1, '创建Bucket失败, 请核对配置信息:[Unable to execute HTTP request: Connect to 139.159.140.112:9000 [/139.159.140.112] failed: connect timed out]', '2023-11-10 11:37:54');
INSERT INTO `sys_oper_log` VALUES (1722820867824017410, '对象存储配置', 2, 'com.ruoyi.web.controller.system.SysOssConfigController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/oss/config', '113.111.11.110', '中国|广东省|广州市|电信', '{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"ossConfigId\":1,\"configKey\":\"minio\",\"accessKey\":\"admin\",\"secretKey\":\"dudu0.0!@-=\",\"bucketName\":\"ruoyi\",\"prefix\":\"\",\"endpoint\":\"127.0.0.1:9000\",\"domain\":\"\",\"isHttps\":\"N\",\"status\":\"0\",\"region\":\"\",\"ext1\":\"\",\"remark\":\"\",\"accessPolicy\":\"1\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-11-10 11:37:58');
INSERT INTO `sys_oper_log` VALUES (1722854664942641153, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/config', '113.111.11.110', '中国|广东省|广州市|电信', '{\"createBy\":\"admin\",\"createTime\":\"2023-11-05 13:57:22\",\"updateBy\":\"admin\",\"updateTime\":\"2023-11-10 13:52:15\",\"configId\":1,\"configName\":\"主框架页-默认皮肤样式名称\",\"configKey\":\"sys.index.skinName\",\"configValue\":\"skin-purple\",\"configType\":\"Y\",\"remark\":\"蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-11-10 13:52:16');
INSERT INTO `sys_oper_log` VALUES (1722854929414479873, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/config', '113.111.11.110', '中国|广东省|广州市|电信', '{\"createBy\":\"admin\",\"createTime\":\"2023-11-05 13:57:22\",\"updateBy\":\"admin\",\"updateTime\":\"2023-11-10 13:53:18\",\"configId\":2,\"configName\":\"用户管理-账号初始密码\",\"configKey\":\"sys.user.initPassword\",\"configValue\":\"test\",\"configType\":\"Y\",\"remark\":\"初始化密码 123456\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-11-10 13:53:19');
INSERT INTO `sys_oper_log` VALUES (1722855238941532161, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/config', '113.111.11.110', '中国|广东省|广州市|电信', '{\"createBy\":\"admin\",\"createTime\":\"2023-11-05 13:57:22\",\"updateBy\":\"admin\",\"updateTime\":\"2023-11-10 13:54:32\",\"configId\":5,\"configName\":\"账号自助-是否开启用户注册功能\",\"configKey\":\"sys.account.registerUser\",\"configValue\":\"true\",\"configType\":\"Y\",\"remark\":\"是否开启注册用户功能（true开启，false关闭）\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-11-10 13:54:33');
INSERT INTO `sys_oper_log` VALUES (1722855430197600257, '参数管理', 9, 'com.ruoyi.web.controller.system.SysConfigController.refreshCache()', 'DELETE', 1, 'admin', '研发部门', '/system/config/refreshCache', '113.111.11.110', '中国|广东省|广州市|电信', '{}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-11-10 13:55:18');
INSERT INTO `sys_oper_log` VALUES (1722855433498517506, '参数管理', 9, 'com.ruoyi.web.controller.system.SysConfigController.refreshCache()', 'DELETE', 1, 'admin', '研发部门', '/system/config/refreshCache', '113.111.11.110', '中国|广东省|广州市|电信', '{}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-11-10 13:55:19');
INSERT INTO `sys_oper_log` VALUES (1722855435654389761, '参数管理', 9, 'com.ruoyi.web.controller.system.SysConfigController.refreshCache()', 'DELETE', 1, 'admin', '研发部门', '/system/config/refreshCache', '113.111.11.110', '中国|广东省|广州市|电信', '{}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-11-10 13:55:20');
INSERT INTO `sys_oper_log` VALUES (1722855436291923970, '参数管理', 9, 'com.ruoyi.web.controller.system.SysConfigController.refreshCache()', 'DELETE', 1, 'admin', '研发部门', '/system/config/refreshCache', '113.111.11.110', '中国|广东省|广州市|电信', '{}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-11-10 13:55:20');
INSERT INTO `sys_oper_log` VALUES (1725873770461650946, '测试单表', 1, 'com.ruoyi.demo.controller.TestDemoController.add()', 'POST', 1, 'admin', '研发部门', '/demo/demo/', '119.34.170.110', '中国|广东省|广州市|珠江宽频', '{\"createBy\":\"\",\"createTime\":\"2023-11-18 21:48:20\",\"updateBy\":\"\",\"updateTime\":\"2023-11-18 21:48:20\",\"id\":1,\"deptId\":1,\"userId\":1,\"orderNum\":1,\"testKey\":\"\",\"value\":\"\"}', '', 1, '参数校验异常', '2023-11-18 21:49:07');
INSERT INTO `sys_oper_log` VALUES (1725873857040474114, '测试单表', 1, 'com.ruoyi.demo.controller.TestDemoController.add()', 'POST', 1, 'admin', '研发部门', '/demo/demo/', '119.34.170.110', '中国|广东省|广州市|珠江宽频', '{\"createBy\":\"\",\"createTime\":\"2023-11-18 21:48:20\",\"updateBy\":\"\",\"updateTime\":\"2023-11-18 21:48:20\",\"id\":1,\"deptId\":1,\"userId\":1,\"orderNum\":1,\"testKey\":\"1\",\"value\":\"1\"}', '', 1, '\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'1\' for key \'test_demo.PRIMARY\'\n### The error may exist in com/ruoyi/demo/mapper/TestDemoMapper.java (best guess)\n### The error may involve com.ruoyi.demo.mapper.TestDemoMapper.insert-Inline\n### The error occurred while setting parameters\n### SQL: INSERT INTO test_demo  ( id, dept_id, user_id, order_num, test_key, value,   create_by, create_time, update_by, update_time )  VALUES (  ?, ?, ?, ?, ?, ?,   ?, ?, ?, ?  )\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'1\' for key \'test_demo.PRIMARY\'\n; Duplicate entry \'1\' for key \'test_demo.PRIMARY\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'1\' for key \'test_demo.PRIMARY\'', '2023-11-18 21:49:27');
INSERT INTO `sys_oper_log` VALUES (1725873910824034306, '测试单表', 1, 'com.ruoyi.demo.controller.TestDemoController.add()', 'POST', 1, 'admin', '研发部门', '/demo/demo/', '119.34.170.110', '中国|广东省|广州市|珠江宽频', '{\"createBy\":\"\",\"createTime\":\"2023-11-18 21:48:20\",\"updateBy\":\"\",\"updateTime\":\"2023-11-18 21:48:20\",\"id\":1,\"deptId\":1,\"userId\":1,\"orderNum\":1,\"testKey\":\"10\",\"value\":\"10\"}', '', 1, '\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'1\' for key \'test_demo.PRIMARY\'\n### The error may exist in com/ruoyi/demo/mapper/TestDemoMapper.java (best guess)\n### The error may involve com.ruoyi.demo.mapper.TestDemoMapper.insert-Inline\n### The error occurred while setting parameters\n### SQL: INSERT INTO test_demo  ( id, dept_id, user_id, order_num, test_key, value,   create_by, create_time, update_by, update_time )  VALUES (  ?, ?, ?, ?, ?, ?,   ?, ?, ?, ?  )\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'1\' for key \'test_demo.PRIMARY\'\n; Duplicate entry \'1\' for key \'test_demo.PRIMARY\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'1\' for key \'test_demo.PRIMARY\'', '2023-11-18 21:49:40');
INSERT INTO `sys_oper_log` VALUES (1725873914066231297, '测试单表', 1, 'com.ruoyi.demo.controller.TestDemoController.add()', 'POST', 1, 'admin', '研发部门', '/demo/demo/', '119.34.170.110', '中国|广东省|广州市|珠江宽频', '{\"createBy\":\"\",\"createTime\":\"2023-11-18 21:48:20\",\"updateBy\":\"\",\"updateTime\":\"2023-11-18 21:48:20\",\"id\":1,\"deptId\":1,\"userId\":1,\"orderNum\":1,\"testKey\":\"10\",\"value\":\"10\"}', '', 1, '\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'1\' for key \'test_demo.PRIMARY\'\n### The error may exist in com/ruoyi/demo/mapper/TestDemoMapper.java (best guess)\n### The error may involve com.ruoyi.demo.mapper.TestDemoMapper.insert-Inline\n### The error occurred while setting parameters\n### SQL: INSERT INTO test_demo  ( id, dept_id, user_id, order_num, test_key, value,   create_by, create_time, update_by, update_time )  VALUES (  ?, ?, ?, ?, ?, ?,   ?, ?, ?, ?  )\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'1\' for key \'test_demo.PRIMARY\'\n; Duplicate entry \'1\' for key \'test_demo.PRIMARY\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'1\' for key \'test_demo.PRIMARY\'', '2023-11-18 21:49:41');
INSERT INTO `sys_oper_log` VALUES (1725873916708642818, '测试单表', 1, 'com.ruoyi.demo.controller.TestDemoController.add()', 'POST', 1, 'admin', '研发部门', '/demo/demo/', '119.34.170.110', '中国|广东省|广州市|珠江宽频', '{\"createBy\":\"\",\"createTime\":\"2023-11-18 21:48:20\",\"updateBy\":\"\",\"updateTime\":\"2023-11-18 21:48:20\",\"id\":1,\"deptId\":1,\"userId\":1,\"orderNum\":1,\"testKey\":\"10\",\"value\":\"10\"}', '', 1, '\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'1\' for key \'test_demo.PRIMARY\'\n### The error may exist in com/ruoyi/demo/mapper/TestDemoMapper.java (best guess)\n### The error may involve com.ruoyi.demo.mapper.TestDemoMapper.insert-Inline\n### The error occurred while setting parameters\n### SQL: INSERT INTO test_demo  ( id, dept_id, user_id, order_num, test_key, value,   create_by, create_time, update_by, update_time )  VALUES (  ?, ?, ?, ?, ?, ?,   ?, ?, ?, ?  )\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'1\' for key \'test_demo.PRIMARY\'\n; Duplicate entry \'1\' for key \'test_demo.PRIMARY\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'1\' for key \'test_demo.PRIMARY\'', '2023-11-18 21:49:42');
INSERT INTO `sys_oper_log` VALUES (1725873919372025858, '测试单表', 1, 'com.ruoyi.demo.controller.TestDemoController.add()', 'POST', 1, 'admin', '研发部门', '/demo/demo/', '119.34.170.110', '中国|广东省|广州市|珠江宽频', '{\"createBy\":\"\",\"createTime\":\"2023-11-18 21:48:20\",\"updateBy\":\"\",\"updateTime\":\"2023-11-18 21:48:20\",\"id\":1,\"deptId\":1,\"userId\":1,\"orderNum\":1,\"testKey\":\"10\",\"value\":\"10\"}', '', 1, '\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'1\' for key \'test_demo.PRIMARY\'\n### The error may exist in com/ruoyi/demo/mapper/TestDemoMapper.java (best guess)\n### The error may involve com.ruoyi.demo.mapper.TestDemoMapper.insert-Inline\n### The error occurred while setting parameters\n### SQL: INSERT INTO test_demo  ( id, dept_id, user_id, order_num, test_key, value,   create_by, create_time, update_by, update_time )  VALUES (  ?, ?, ?, ?, ?, ?,   ?, ?, ?, ?  )\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'1\' for key \'test_demo.PRIMARY\'\n; Duplicate entry \'1\' for key \'test_demo.PRIMARY\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'1\' for key \'test_demo.PRIMARY\'', '2023-11-18 21:49:42');
INSERT INTO `sys_oper_log` VALUES (1725873920726786050, '测试单表', 1, 'com.ruoyi.demo.controller.TestDemoController.add()', 'POST', 1, 'admin', '研发部门', '/demo/demo/', '119.34.170.110', '中国|广东省|广州市|珠江宽频', '{\"createBy\":\"\",\"createTime\":\"2023-11-18 21:48:20\",\"updateBy\":\"\",\"updateTime\":\"2023-11-18 21:48:20\",\"id\":1,\"deptId\":1,\"userId\":1,\"orderNum\":1,\"testKey\":\"10\",\"value\":\"10\"}', '', 1, '\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'1\' for key \'test_demo.PRIMARY\'\n### The error may exist in com/ruoyi/demo/mapper/TestDemoMapper.java (best guess)\n### The error may involve com.ruoyi.demo.mapper.TestDemoMapper.insert-Inline\n### The error occurred while setting parameters\n### SQL: INSERT INTO test_demo  ( id, dept_id, user_id, order_num, test_key, value,   create_by, create_time, update_by, update_time )  VALUES (  ?, ?, ?, ?, ?, ?,   ?, ?, ?, ?  )\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'1\' for key \'test_demo.PRIMARY\'\n; Duplicate entry \'1\' for key \'test_demo.PRIMARY\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'1\' for key \'test_demo.PRIMARY\'', '2023-11-18 21:49:43');
INSERT INTO `sys_oper_log` VALUES (1725873939555016705, '测试单表', 1, 'com.ruoyi.demo.controller.TestDemoController.add()', 'POST', 1, 'admin', '研发部门', '/demo/demo/', '119.34.170.110', '中国|广东省|广州市|珠江宽频', '{\"createBy\":\"\",\"createTime\":\"2023-11-18 21:48:20\",\"updateBy\":\"\",\"updateTime\":\"2023-11-18 21:48:20\",\"id\":10,\"deptId\":1,\"userId\":1,\"orderNum\":1,\"testKey\":\"10\",\"value\":\"10\"}', '', 1, '\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'10\' for key \'test_demo.PRIMARY\'\n### The error may exist in com/ruoyi/demo/mapper/TestDemoMapper.java (best guess)\n### The error may involve com.ruoyi.demo.mapper.TestDemoMapper.insert-Inline\n### The error occurred while setting parameters\n### SQL: INSERT INTO test_demo  ( id, dept_id, user_id, order_num, test_key, value,   create_by, create_time, update_by, update_time )  VALUES (  ?, ?, ?, ?, ?, ?,   ?, ?, ?, ?  )\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'10\' for key \'test_demo.PRIMARY\'\n; Duplicate entry \'10\' for key \'test_demo.PRIMARY\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'10\' for key \'test_demo.PRIMARY\'', '2023-11-18 21:49:47');
INSERT INTO `sys_oper_log` VALUES (1725873943011123202, '测试单表', 1, 'com.ruoyi.demo.controller.TestDemoController.add()', 'POST', 1, 'admin', '研发部门', '/demo/demo/', '119.34.170.110', '中国|广东省|广州市|珠江宽频', '{\"createBy\":\"\",\"createTime\":\"2023-11-18 21:48:20\",\"updateBy\":\"\",\"updateTime\":\"2023-11-18 21:48:20\",\"id\":10,\"deptId\":1,\"userId\":1,\"orderNum\":1,\"testKey\":\"10\",\"value\":\"10\"}', '', 1, '\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'10\' for key \'test_demo.PRIMARY\'\n### The error may exist in com/ruoyi/demo/mapper/TestDemoMapper.java (best guess)\n### The error may involve com.ruoyi.demo.mapper.TestDemoMapper.insert-Inline\n### The error occurred while setting parameters\n### SQL: INSERT INTO test_demo  ( id, dept_id, user_id, order_num, test_key, value,   create_by, create_time, update_by, update_time )  VALUES (  ?, ?, ?, ?, ?, ?,   ?, ?, ?, ?  )\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'10\' for key \'test_demo.PRIMARY\'\n; Duplicate entry \'10\' for key \'test_demo.PRIMARY\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'10\' for key \'test_demo.PRIMARY\'', '2023-11-18 21:49:48');
INSERT INTO `sys_oper_log` VALUES (1725873945737420802, '测试单表', 1, 'com.ruoyi.demo.controller.TestDemoController.add()', 'POST', 1, 'admin', '研发部门', '/demo/demo/', '119.34.170.110', '中国|广东省|广州市|珠江宽频', '{\"createBy\":\"\",\"createTime\":\"2023-11-18 21:48:20\",\"updateBy\":\"\",\"updateTime\":\"2023-11-18 21:48:20\",\"id\":10,\"deptId\":1,\"userId\":1,\"orderNum\":1,\"testKey\":\"10\",\"value\":\"10\"}', '', 1, '\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'10\' for key \'test_demo.PRIMARY\'\n### The error may exist in com/ruoyi/demo/mapper/TestDemoMapper.java (best guess)\n### The error may involve com.ruoyi.demo.mapper.TestDemoMapper.insert-Inline\n### The error occurred while setting parameters\n### SQL: INSERT INTO test_demo  ( id, dept_id, user_id, order_num, test_key, value,   create_by, create_time, update_by, update_time )  VALUES (  ?, ?, ?, ?, ?, ?,   ?, ?, ?, ?  )\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'10\' for key \'test_demo.PRIMARY\'\n; Duplicate entry \'10\' for key \'test_demo.PRIMARY\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'10\' for key \'test_demo.PRIMARY\'', '2023-11-18 21:49:49');
INSERT INTO `sys_oper_log` VALUES (1725873947029266433, '测试单表', 1, 'com.ruoyi.demo.controller.TestDemoController.add()', 'POST', 1, 'admin', '研发部门', '/demo/demo/', '119.34.170.110', '中国|广东省|广州市|珠江宽频', '{\"createBy\":\"\",\"createTime\":\"2023-11-18 21:48:20\",\"updateBy\":\"\",\"updateTime\":\"2023-11-18 21:48:20\",\"id\":10,\"deptId\":1,\"userId\":1,\"orderNum\":1,\"testKey\":\"10\",\"value\":\"10\"}', '', 1, '\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'10\' for key \'test_demo.PRIMARY\'\n### The error may exist in com/ruoyi/demo/mapper/TestDemoMapper.java (best guess)\n### The error may involve com.ruoyi.demo.mapper.TestDemoMapper.insert-Inline\n### The error occurred while setting parameters\n### SQL: INSERT INTO test_demo  ( id, dept_id, user_id, order_num, test_key, value,   create_by, create_time, update_by, update_time )  VALUES (  ?, ?, ?, ?, ?, ?,   ?, ?, ?, ?  )\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'10\' for key \'test_demo.PRIMARY\'\n; Duplicate entry \'10\' for key \'test_demo.PRIMARY\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'10\' for key \'test_demo.PRIMARY\'', '2023-11-18 21:49:49');
INSERT INTO `sys_oper_log` VALUES (1725873948484689921, '测试单表', 1, 'com.ruoyi.demo.controller.TestDemoController.add()', 'POST', 1, 'admin', '研发部门', '/demo/demo/', '119.34.170.110', '中国|广东省|广州市|珠江宽频', '{\"createBy\":\"\",\"createTime\":\"2023-11-18 21:48:20\",\"updateBy\":\"\",\"updateTime\":\"2023-11-18 21:48:20\",\"id\":10,\"deptId\":1,\"userId\":1,\"orderNum\":1,\"testKey\":\"10\",\"value\":\"10\"}', '', 1, '\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'10\' for key \'test_demo.PRIMARY\'\n### The error may exist in com/ruoyi/demo/mapper/TestDemoMapper.java (best guess)\n### The error may involve com.ruoyi.demo.mapper.TestDemoMapper.insert-Inline\n### The error occurred while setting parameters\n### SQL: INSERT INTO test_demo  ( id, dept_id, user_id, order_num, test_key, value,   create_by, create_time, update_by, update_time )  VALUES (  ?, ?, ?, ?, ?, ?,   ?, ?, ?, ?  )\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'10\' for key \'test_demo.PRIMARY\'\n; Duplicate entry \'10\' for key \'test_demo.PRIMARY\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'10\' for key \'test_demo.PRIMARY\'', '2023-11-18 21:49:49');
INSERT INTO `sys_oper_log` VALUES (1725874160578060289, '测试单表', 1, 'com.ruoyi.demo.controller.TestDemoController.add()', 'POST', 1, 'admin', '研发部门', '/demo/demo/', '119.34.170.110', '中国|广东省|广州市|珠江宽频', '{\"createBy\":\"\",\"createTime\":\"2023-11-18 21:48:20\",\"updateBy\":\"\",\"updateTime\":\"2023-11-18 21:48:20\",\"id\":11,\"deptId\":11,\"userId\":11,\"orderNum\":11,\"testKey\":\"11\",\"value\":\"11\"}', '', 1, '\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'11\' for key \'test_demo.PRIMARY\'\n### The error may exist in com/ruoyi/demo/mapper/TestDemoMapper.java (best guess)\n### The error may involve com.ruoyi.demo.mapper.TestDemoMapper.insert-Inline\n### The error occurred while setting parameters\n### SQL: INSERT INTO test_demo  ( id, dept_id, user_id, order_num, test_key, value,   create_by, create_time, update_by, update_time )  VALUES (  ?, ?, ?, ?, ?, ?,   ?, ?, ?, ?  )\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'11\' for key \'test_demo.PRIMARY\'\n; Duplicate entry \'11\' for key \'test_demo.PRIMARY\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'11\' for key \'test_demo.PRIMARY\'', '2023-11-18 21:50:40');
INSERT INTO `sys_oper_log` VALUES (1725874186947649538, '测试单表', 1, 'com.ruoyi.demo.controller.TestDemoController.add()', 'POST', 1, 'admin', '研发部门', '/demo/demo/', '119.34.170.110', '中国|广东省|广州市|珠江宽频', '{\"createBy\":\"\",\"createTime\":\"2023-11-18 21:48:20\",\"updateBy\":\"\",\"updateTime\":\"2023-11-18 21:48:20\",\"id\":11,\"deptId\":11,\"userId\":11,\"orderNum\":11,\"testKey\":\"11\",\"value\":\"11\"}', '', 1, '\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'11\' for key \'test_demo.PRIMARY\'\n### The error may exist in com/ruoyi/demo/mapper/TestDemoMapper.java (best guess)\n### The error may involve com.ruoyi.demo.mapper.TestDemoMapper.insert-Inline\n### The error occurred while setting parameters\n### SQL: INSERT INTO test_demo  ( id, dept_id, user_id, order_num, test_key, value,   create_by, create_time, update_by, update_time )  VALUES (  ?, ?, ?, ?, ?, ?,   ?, ?, ?, ?  )\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'11\' for key \'test_demo.PRIMARY\'\n; Duplicate entry \'11\' for key \'test_demo.PRIMARY\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'11\' for key \'test_demo.PRIMARY\'', '2023-11-18 21:50:46');
INSERT INTO `sys_oper_log` VALUES (1725874190064017409, '测试单表', 1, 'com.ruoyi.demo.controller.TestDemoController.add()', 'POST', 1, 'admin', '研发部门', '/demo/demo/', '119.34.170.110', '中国|广东省|广州市|珠江宽频', '{\"createBy\":\"\",\"createTime\":\"2023-11-18 21:48:20\",\"updateBy\":\"\",\"updateTime\":\"2023-11-18 21:48:20\",\"id\":11,\"deptId\":11,\"userId\":11,\"orderNum\":11,\"testKey\":\"11\",\"value\":\"11\"}', '', 1, '\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'11\' for key \'test_demo.PRIMARY\'\n### The error may exist in com/ruoyi/demo/mapper/TestDemoMapper.java (best guess)\n### The error may involve com.ruoyi.demo.mapper.TestDemoMapper.insert-Inline\n### The error occurred while setting parameters\n### SQL: INSERT INTO test_demo  ( id, dept_id, user_id, order_num, test_key, value,   create_by, create_time, update_by, update_time )  VALUES (  ?, ?, ?, ?, ?, ?,   ?, ?, ?, ?  )\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'11\' for key \'test_demo.PRIMARY\'\n; Duplicate entry \'11\' for key \'test_demo.PRIMARY\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'11\' for key \'test_demo.PRIMARY\'', '2023-11-18 21:50:47');
INSERT INTO `sys_oper_log` VALUES (1725874192882589697, '测试单表', 1, 'com.ruoyi.demo.controller.TestDemoController.add()', 'POST', 1, 'admin', '研发部门', '/demo/demo/', '119.34.170.110', '中国|广东省|广州市|珠江宽频', '{\"createBy\":\"\",\"createTime\":\"2023-11-18 21:48:20\",\"updateBy\":\"\",\"updateTime\":\"2023-11-18 21:48:20\",\"id\":11,\"deptId\":11,\"userId\":11,\"orderNum\":11,\"testKey\":\"11\",\"value\":\"11\"}', '', 1, '\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'11\' for key \'test_demo.PRIMARY\'\n### The error may exist in com/ruoyi/demo/mapper/TestDemoMapper.java (best guess)\n### The error may involve com.ruoyi.demo.mapper.TestDemoMapper.insert-Inline\n### The error occurred while setting parameters\n### SQL: INSERT INTO test_demo  ( id, dept_id, user_id, order_num, test_key, value,   create_by, create_time, update_by, update_time )  VALUES (  ?, ?, ?, ?, ?, ?,   ?, ?, ?, ?  )\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'11\' for key \'test_demo.PRIMARY\'\n; Duplicate entry \'11\' for key \'test_demo.PRIMARY\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'11\' for key \'test_demo.PRIMARY\'', '2023-11-18 21:50:47');
INSERT INTO `sys_oper_log` VALUES (1725874194329624577, '测试单表', 1, 'com.ruoyi.demo.controller.TestDemoController.add()', 'POST', 1, 'admin', '研发部门', '/demo/demo/', '119.34.170.110', '中国|广东省|广州市|珠江宽频', '{\"createBy\":\"\",\"createTime\":\"2023-11-18 21:48:20\",\"updateBy\":\"\",\"updateTime\":\"2023-11-18 21:48:20\",\"id\":11,\"deptId\":11,\"userId\":11,\"orderNum\":11,\"testKey\":\"11\",\"value\":\"11\"}', '', 1, '\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'11\' for key \'test_demo.PRIMARY\'\n### The error may exist in com/ruoyi/demo/mapper/TestDemoMapper.java (best guess)\n### The error may involve com.ruoyi.demo.mapper.TestDemoMapper.insert-Inline\n### The error occurred while setting parameters\n### SQL: INSERT INTO test_demo  ( id, dept_id, user_id, order_num, test_key, value,   create_by, create_time, update_by, update_time )  VALUES (  ?, ?, ?, ?, ?, ?,   ?, ?, ?, ?  )\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'11\' for key \'test_demo.PRIMARY\'\n; Duplicate entry \'11\' for key \'test_demo.PRIMARY\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'11\' for key \'test_demo.PRIMARY\'', '2023-11-18 21:50:48');
INSERT INTO `sys_oper_log` VALUES (1725874195831185409, '测试单表', 1, 'com.ruoyi.demo.controller.TestDemoController.add()', 'POST', 1, 'admin', '研发部门', '/demo/demo/', '119.34.170.110', '中国|广东省|广州市|珠江宽频', '{\"createBy\":\"\",\"createTime\":\"2023-11-18 21:48:20\",\"updateBy\":\"\",\"updateTime\":\"2023-11-18 21:48:20\",\"id\":11,\"deptId\":11,\"userId\":11,\"orderNum\":11,\"testKey\":\"11\",\"value\":\"11\"}', '', 1, '\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'11\' for key \'test_demo.PRIMARY\'\n### The error may exist in com/ruoyi/demo/mapper/TestDemoMapper.java (best guess)\n### The error may involve com.ruoyi.demo.mapper.TestDemoMapper.insert-Inline\n### The error occurred while setting parameters\n### SQL: INSERT INTO test_demo  ( id, dept_id, user_id, order_num, test_key, value,   create_by, create_time, update_by, update_time )  VALUES (  ?, ?, ?, ?, ?, ?,   ?, ?, ?, ?  )\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'11\' for key \'test_demo.PRIMARY\'\n; Duplicate entry \'11\' for key \'test_demo.PRIMARY\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'11\' for key \'test_demo.PRIMARY\'', '2023-11-18 21:50:48');
INSERT INTO `sys_oper_log` VALUES (1732686091775242241, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/system/user/changeStatus', '113.111.9.243', '中国|广东省|广州市|电信', '{\"createBy\":null,\"createTime\":null,\"updateBy\":\"admin\",\"updateTime\":\"2023-12-07 16:58:50\",\"userId\":4,\"deptId\":null,\"userName\":null,\"nickName\":null,\"userType\":null,\"email\":null,\"phonenumber\":null,\"sex\":null,\"avatar\":null,\"status\":\"1\",\"delFlag\":null,\"loginIp\":null,\"loginDate\":null,\"remark\":null,\"dept\":null,\"roles\":null,\"roleIds\":null,\"postIds\":null,\"roleId\":null,\"admin\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-12-07 16:58:51');
INSERT INTO `sys_oper_log` VALUES (1749731013659365378, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/system/user/changeStatus', '113.111.8.58', '中国|广东省|广州市|电信', '{\"createBy\":null,\"createTime\":null,\"updateBy\":\"admin\",\"updateTime\":\"2024-01-23 17:49:16\",\"userId\":3,\"deptId\":null,\"userName\":null,\"nickName\":null,\"userType\":null,\"email\":null,\"phonenumber\":null,\"sex\":null,\"avatar\":null,\"status\":\"0\",\"delFlag\":null,\"loginIp\":null,\"loginDate\":null,\"remark\":null,\"dept\":null,\"roles\":null,\"roleIds\":null,\"postIds\":null,\"roleId\":null,\"admin\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2024-01-23 17:49:17');
INSERT INTO `sys_oper_log` VALUES (1749731032399515650, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/system/user/changeStatus', '113.111.8.58', '中国|广东省|广州市|电信', '{\"createBy\":null,\"createTime\":null,\"updateBy\":\"admin\",\"updateTime\":\"2024-01-23 17:49:21\",\"userId\":3,\"deptId\":null,\"userName\":null,\"nickName\":null,\"userType\":null,\"email\":null,\"phonenumber\":null,\"sex\":null,\"avatar\":null,\"status\":\"1\",\"delFlag\":null,\"loginIp\":null,\"loginDate\":null,\"remark\":null,\"dept\":null,\"roles\":null,\"roleIds\":null,\"postIds\":null,\"roleId\":null,\"admin\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2024-01-23 17:49:21');
INSERT INTO `sys_oper_log` VALUES (1760908643457998849, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '113.65.205.79', '中国|广东省|广州市|电信', '\"t_global_app\"', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2024-02-23 14:05:11');
INSERT INTO `sys_oper_log` VALUES (1760908760231616514, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '113.65.205.79', '中国|广东省|广州市|电信', '{\"tables\":\"t_global_app\"}', '', 0, '', '2024-02-23 14:05:39');
INSERT INTO `sys_oper_log` VALUES (1760959950348787713, '对象存储配置', 2, 'com.ruoyi.web.controller.system.SysOssConfigController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/oss/config', '113.65.205.79', '中国|广东省|广州市|电信', '{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"ossConfigId\":1,\"configKey\":\"minio\",\"accessKey\":\"admin\",\"secretKey\":\"dudu0.0!@-=\",\"bucketName\":\"ruoyi\",\"prefix\":\"\",\"endpoint\":\"127.0.0.1:9001\",\"domain\":\"\",\"isHttps\":\"N\",\"status\":\"0\",\"region\":\"\",\"ext1\":\"\",\"remark\":\"\",\"accessPolicy\":\"1\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2024-02-23 17:29:04');
INSERT INTO `sys_oper_log` VALUES (1760960023539392514, '对象存储配置', 2, 'com.ruoyi.web.controller.system.SysOssConfigController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/oss/config', '113.65.205.79', '中国|广东省|广州市|电信', '{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"ossConfigId\":1,\"configKey\":\"minio\",\"accessKey\":\"admin\",\"secretKey\":\"dudu0.0!@-=\",\"bucketName\":\"ruoyi\",\"prefix\":\"\",\"endpoint\":\"127.0.0.1:9000\",\"domain\":\"\",\"isHttps\":\"N\",\"status\":\"0\",\"region\":\"\",\"ext1\":\"\",\"remark\":\"\",\"accessPolicy\":\"1\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2024-02-23 17:29:21');
INSERT INTO `sys_oper_log` VALUES (1760962586527571970, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.updateByKey()', 'PUT', 1, 'admin', '研发部门', '/system/config/updateByKey', '113.65.205.79', '中国|广东省|广州市|电信', '{\"createBy\":null,\"createTime\":null,\"updateBy\":\"admin\",\"updateTime\":\"2024-02-23 17:39:32\",\"configId\":null,\"configName\":null,\"configKey\":\"sys.oss.previewListResource\",\"configValue\":\"false\",\"configType\":null,\"remark\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2024-02-23 17:39:32');
INSERT INTO `sys_oper_log` VALUES (1760962994369110017, 'OSS对象存储', 3, 'com.ruoyi.web.controller.system.SysOssController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/oss/1721044945546502146,1721062760458477570', '113.65.205.79', '中国|广东省|广州市|电信', '{}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2024-02-23 17:41:10');
INSERT INTO `sys_oper_log` VALUES (1760963510264307714, '对象存储配置', 2, 'com.ruoyi.web.controller.system.SysOssConfigController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/oss/config', '113.65.205.79', '中国|广东省|广州市|电信', '{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"ossConfigId\":1,\"configKey\":\"minio\",\"accessKey\":\"admin\",\"secretKey\":\"dudu0.0!@-=\",\"bucketName\":\"ruoyi\",\"prefix\":\"\",\"endpoint\":\"139.159.140.112:9000\",\"domain\":\"\",\"isHttps\":\"N\",\"status\":\"0\",\"region\":\"\",\"ext1\":\"\",\"remark\":\"\",\"accessPolicy\":\"1\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2024-02-23 17:43:13');
INSERT INTO `sys_oper_log` VALUES (1767367782153494530, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '113.111.9.125', '中国|广东省|广州市|电信', '\"test_tree\"', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2024-03-12 09:51:30');
INSERT INTO `sys_oper_log` VALUES (1767368159796043777, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '113.111.9.125', '中国|广东省|广州市|电信', '{\"tables\":\"test_tree\"}', '', 0, '', '2024-03-12 09:53:00');
INSERT INTO `sys_oper_log` VALUES (1767371320015364098, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '113.111.9.125', '中国|广东省|广州市|电信', '{\"createBy\":null,\"createTime\":null,\"updateBy\":\"admin\",\"updateTime\":\"2024-03-12 10:05:33\",\"params\":{\"treeCode\":null,\"treeName\":null,\"treeParentCode\":null,\"parentMenuId\":null},\"tableId\":\"1760908642858213378\",\"tableName\":\"t_global_app\",\"tableComment\":\"全局应用表\",\"subTableName\":null,\"subTableFkName\":null,\"className\":\"TGlobalApp\",\"tplCategory\":\"crud\",\"packageName\":\"com.ruoyi.system\",\"moduleName\":\"system\",\"businessName\":\"globalApp\",\"functionName\":\"全局应用\",\"functionAuthor\":\"ruoyi\",\"genType\":\"1\",\"genPath\":\"/\",\"pkColumn\":null,\"subTable\":null,\"columns\":[{\"createBy\":\"admin\",\"createTime\":\"2024-02-23 14:05:11\",\"updateBy\":\"admin\",\"updateTime\":\"2024-03-12 10:05:33\",\"columnId\":\"1760908643105677313\",\"tableId\":\"1760908642858213378\",\"columnName\":\"id\",\"columnComment\":\"应用ID\",\"columnType\":\"bigint\",\"javaType\":\"Long\",\"javaField\":\"id\",\"isPk\":\"1\",\"isIncrement\":\"1\",\"isRequired\":\"1\",\"isInsert\":null,\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":null,\"queryType\":\"EQ\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":1,\"list\":true,\"required\":true,\"query\":false,\"capJavaField\":\"Id\",\"pk\":true,\"insert\":false,\"edit\":true,\"usableColumn\":false,\"superColumn\":false,\"increment\":true},{\"createBy\":\"admin\",\"createTime\":\"2024-02-23 14:05:11\",\"updateBy\":\"admin\",\"updateTime\":\"2024-03-12 10:05:33\",\"columnId\":\"1760908643114065922\",\"tableId\":\"1760908642858213378\",\"columnName\":\"code\",\"columnComment\":\"应用标识\",\"columnType\":\"varchar(100)\",\"javaType\":\"String\",\"javaField\":\"code\",\"isPk\":\"0\",\"isIncrement\":\"0\",\"isRequired\":\"1\",\"isInsert\":\"1\",\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"queryType\":\"EQ\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":2,\"list\":true,\"required\":true,\"query\":true,\"capJavaField\":\"Code\",\"pk\":false,\"insert\":true,\"edit\":true,\"usableColumn\":false,\"superColumn\":false,\"increment\":false},{\"createBy\":\"admin\",\"createTime\":\"2024-02-23 14:05:11\",\"updateBy\":\"admin\",\"updateTime\":\"2024-03-12 10:05:33\",\"columnId\":\"1760908643118260225\",\"tableId\":\"1760908642858213378\",\"columnName\":\"description\",\"columnComment\":\"应用描述\",\"columnType\":\"varchar(100)\",\"javaTyp', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2024-03-12 10:05:34');
INSERT INTO `sys_oper_log` VALUES (1767371339430797314, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.genCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/genCode/t_global_app', '113.111.9.125', '中国|广东省|广州市|电信', '{}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2024-03-12 10:05:38');
INSERT INTO `sys_oper_log` VALUES (1776866537537970178, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/system/user/changeStatus', '113.65.207.85', '中国|广东省|广州市|电信', '{\"createBy\":null,\"createTime\":null,\"updateBy\":\"admin\",\"updateTime\":\"2024-04-07 14:56:09\",\"userId\":3,\"deptId\":null,\"userName\":null,\"nickName\":null,\"userType\":null,\"email\":null,\"phonenumber\":null,\"sex\":null,\"avatar\":null,\"status\":\"0\",\"delFlag\":null,\"loginIp\":null,\"loginDate\":null,\"remark\":null,\"dept\":null,\"roles\":null,\"roleIds\":null,\"postIds\":null,\"roleId\":null,\"admin\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2024-04-07 14:56:10');
INSERT INTO `sys_oper_log` VALUES (1776866613010276353, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/system/user/changeStatus', '113.65.207.85', '中国|广东省|广州市|电信', '{\"createBy\":null,\"createTime\":null,\"updateBy\":\"admin\",\"updateTime\":\"2024-04-07 14:56:27\",\"userId\":3,\"deptId\":null,\"userName\":null,\"nickName\":null,\"userType\":null,\"email\":null,\"phonenumber\":null,\"sex\":null,\"avatar\":null,\"status\":\"1\",\"delFlag\":null,\"loginIp\":null,\"loginDate\":null,\"remark\":null,\"dept\":null,\"roles\":null,\"roleIds\":null,\"postIds\":null,\"roleId\":null,\"admin\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2024-04-07 14:56:28');
INSERT INTO `sys_oper_log` VALUES (1776869631579561986, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.resetPwd()', 'PUT', 1, 'admin', '研发部门', '/system/user/resetPwd', '113.65.207.85', '中国|广东省|广州市|电信', '{\"createBy\":null,\"createTime\":null,\"updateBy\":\"admin\",\"updateTime\":\"2024-04-07 15:08:27\",\"userId\":4,\"deptId\":null,\"userName\":null,\"nickName\":null,\"userType\":null,\"email\":null,\"phonenumber\":null,\"sex\":null,\"avatar\":null,\"status\":null,\"delFlag\":null,\"loginIp\":null,\"loginDate\":null,\"remark\":null,\"dept\":null,\"roles\":null,\"roleIds\":null,\"postIds\":null,\"roleId\":null,\"admin\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2024-04-07 15:08:27');
INSERT INTO `sys_oper_log` VALUES (1802527167062478849, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '120.238.252.230', '中国|广东省|广州市|移动', '\"test_demo\"', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2024-06-17 10:22:21');
INSERT INTO `sys_oper_log` VALUES (1802527194614861825, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '120.238.252.230', '中国|广东省|广州市|移动', '{\"tables\":\"test_demo\"}', '', 0, '', '2024-06-17 10:22:27');
INSERT INTO `sys_oper_log` VALUES (1802538345083965441, 'OSS对象存储', 1, 'com.ruoyi.web.controller.system.SysOssController.upload()', 'POST', 1, 'admin', '研发部门', '/system/oss/upload', '120.238.252.230', '中国|广东省|广州市|移动', '', '{\"code\":200,\"msg\":\"操作成功\",\"data\":{\"ossId\":\"1802538345042022401\",\"url\":\"http://139.159.140.112:9000/ruoyi/2024/06/17/0168e4d4fcbd4ffe818daf193651c3ed.png\",\"fileName\":\"Snipaste_2024-06-17_10-32-49.png\"}}', 0, '', '2024-06-17 11:06:46');
INSERT INTO `sys_oper_log` VALUES (1802538414625525762, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.updateByKey()', 'PUT', 1, 'admin', '研发部门', '/system/config/updateByKey', '120.238.252.230', '中国|广东省|广州市|移动', '{\"createBy\":null,\"createTime\":null,\"updateBy\":\"admin\",\"updateTime\":\"2024-06-17 11:07:02\",\"configId\":null,\"configName\":null,\"configKey\":\"sys.oss.previewListResource\",\"configValue\":\"true\",\"configType\":null,\"remark\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2024-06-17 11:07:02');
INSERT INTO `sys_oper_log` VALUES (1802538517025263617, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.updateByKey()', 'PUT', 1, 'admin', '研发部门', '/system/config/updateByKey', '120.238.252.230', '中国|广东省|广州市|移动', '{\"createBy\":null,\"createTime\":null,\"updateBy\":\"admin\",\"updateTime\":\"2024-06-17 11:07:26\",\"configId\":null,\"configName\":null,\"configKey\":\"sys.oss.previewListResource\",\"configValue\":\"false\",\"configType\":null,\"remark\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2024-06-17 11:07:27');
INSERT INTO `sys_oper_log` VALUES (1802544465475276801, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/1760908759807991810', '120.238.252.230', '中国|广东省|广州市|移动', '{}', '{\"code\":601,\"msg\":\"存在子菜单,不允许删除\",\"data\":null}', 0, '', '2024-06-17 11:31:05');
INSERT INTO `sys_oper_log` VALUES (1802544567057125377, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '120.238.252.230', '中国|广东省|广州市|移动', '{\"createBy\":\"admin\",\"createTime\":\"2024-02-23 14:12:37\",\"updateBy\":\"admin\",\"updateTime\":\"2024-06-17 11:31:29\",\"parentName\":null,\"parentId\":0,\"children\":[],\"menuId\":\"1760908759807991810\",\"menuName\":\"全局应用\",\"orderNum\":1,\"path\":\"globalApp\",\"component\":\"system/globalApp/index\",\"queryParam\":null,\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"system:globalApp:list\",\"icon\":\"#\",\"remark\":\"全局应用菜单\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2024-06-17 11:31:29');
INSERT INTO `sys_oper_log` VALUES (1803768563339800578, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.updateByKey()', 'PUT', 1, 'admin', '研发部门', '/system/config/updateByKey', '10.42.0.1', '内网IP', '{\"createBy\":null,\"createTime\":null,\"updateBy\":\"admin\",\"updateTime\":\"2024-06-20 20:35:12\",\"configId\":null,\"configName\":null,\"configKey\":\"sys.oss.previewListResource\",\"configValue\":\"true\",\"configType\":null,\"remark\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2024-06-20 20:35:13');
INSERT INTO `sys_oper_log` VALUES (1816022033497112578, '对象存储配置', 2, 'com.ruoyi.web.controller.system.SysOssConfigController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/oss/config', '10.244.0.0', '内网IP', '{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"ossConfigId\":1,\"configKey\":\"minio\",\"accessKey\":\"minio\",\"secretKey\":\"dudu0.0@\",\"bucketName\":\"ruoyi\",\"prefix\":\"\",\"endpoint\":\"139.159.140.112:30900\",\"domain\":\"\",\"isHttps\":\"N\",\"status\":\"0\",\"region\":\"\",\"ext1\":\"\",\"remark\":\"\",\"accessPolicy\":\"1\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2024-07-24 16:06:08');
INSERT INTO `sys_oper_log` VALUES (1816022238028152833, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '10.244.0.0', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-02-23 14:12:37\",\"updateBy\":\"admin\",\"updateTime\":\"2024-07-24 16:06:56\",\"parentName\":null,\"parentId\":0,\"children\":[],\"menuId\":\"1760908759807991810\",\"menuName\":\"全局应用\",\"orderNum\":1,\"path\":\"globalApp\",\"component\":\"system/globalApp/index\",\"queryParam\":null,\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"1\",\"status\":\"0\",\"perms\":\"system:globalApp:list\",\"icon\":\"#\",\"remark\":\"全局应用菜单\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2024-07-24 16:06:56');
INSERT INTO `sys_oper_log` VALUES (1816315618905866242, '角色管理', 1, 'com.ruoyi.web.controller.system.SysRoleController.add()', 'POST', 1, 'admin', '研发部门', '/system/role', '120.238.252.230', '中国|广东省|广州市|移动', '{\"createBy\":\"admin\",\"createTime\":\"2024-07-25 11:32:43\",\"updateBy\":\"admin\",\"updateTime\":\"2024-07-25 11:32:43\",\"roleId\":\"1816315618536767490\",\"roleName\":\"guest\",\"roleKey\":\"guest\",\"roleSort\":5,\"dataScope\":null,\"menuCheckStrictly\":true,\"deptCheckStrictly\":true,\"status\":\"0\",\"delFlag\":null,\"remark\":null,\"flag\":false,\"menuIds\":[5,1500,1501,1502,1503,1504,1505,1506,1507,1508,1509,1510,1511],\"deptIds\":[],\"admin\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2024-07-25 11:32:44');
INSERT INTO `sys_oper_log` VALUES (1816315710509465601, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', '研发部门', '/system/user', '120.238.252.230', '中国|广东省|广州市|移动', '{\"createBy\":\"admin\",\"createTime\":\"2024-07-25 11:33:05\",\"updateBy\":\"admin\",\"updateTime\":\"2024-07-25 11:33:05\",\"userId\":\"1816315710186504194\",\"deptId\":100,\"userName\":\"guest\",\"nickName\":\"guest\",\"userType\":null,\"email\":null,\"phonenumber\":null,\"sex\":null,\"avatar\":null,\"status\":\"0\",\"delFlag\":null,\"loginIp\":null,\"loginDate\":null,\"remark\":null,\"dept\":null,\"roles\":null,\"roleIds\":[\"1816315618536767490\"],\"postIds\":[4],\"roleId\":null,\"admin\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2024-07-25 11:33:06');
INSERT INTO `sys_oper_log` VALUES (1816463431559266305, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-02-23 14:12:37\",\"updateBy\":\"admin\",\"updateTime\":\"2024-07-25 21:20:04\",\"parentName\":null,\"parentId\":0,\"children\":[],\"menuId\":\"1760908759807991810\",\"menuName\":\"全局应用\",\"orderNum\":1,\"path\":\"globalApp\",\"component\":\"system/globalApp/index\",\"queryParam\":null,\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"system:globalApp:list\",\"icon\":\"#\",\"remark\":\"全局应用菜单\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2024-07-25 21:20:05');
INSERT INTO `sys_oper_log` VALUES (1816463643669413890, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-02-23 14:12:37\",\"updateBy\":\"admin\",\"updateTime\":\"2024-07-25 21:20:55\",\"parentName\":null,\"parentId\":0,\"children\":[],\"menuId\":\"1760908759807991810\",\"menuName\":\"全局应用\",\"orderNum\":1,\"path\":\"globalApp\",\"component\":\"system/globalApp/index\",\"queryParam\":null,\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"1\",\"status\":\"0\",\"perms\":\"system:globalApp:list\",\"icon\":\"#\",\"remark\":\"全局应用菜单\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2024-07-25 21:20:56');
INSERT INTO `sys_oper_log` VALUES (1816465598617620481, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-02-23 14:12:37\",\"updateBy\":\"admin\",\"updateTime\":\"2024-07-25 21:28:41\",\"parentName\":null,\"parentId\":0,\"children\":[],\"menuId\":\"1760908759807991810\",\"menuName\":\"全局应用\",\"orderNum\":1,\"path\":\"globalApp\",\"component\":\"system/globalApp/index\",\"queryParam\":null,\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"system:globalApp:list\",\"icon\":\"#\",\"remark\":\"全局应用菜单\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2024-07-25 21:28:42');
INSERT INTO `sys_oper_log` VALUES (1816465665663569921, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-02-23 14:12:37\",\"updateBy\":\"admin\",\"updateTime\":\"2024-07-25 21:28:57\",\"parentName\":null,\"parentId\":0,\"children\":[],\"menuId\":\"1760908759807991810\",\"menuName\":\"全局应用\",\"orderNum\":1,\"path\":\"globalApp\",\"component\":\"system/globalApp/index\",\"queryParam\":null,\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"1\",\"status\":\"0\",\"perms\":\"system:globalApp:list\",\"icon\":\"#\",\"remark\":\"全局应用菜单\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2024-07-25 21:28:58');
INSERT INTO `sys_oper_log` VALUES (1825883150684971010, 'OSS对象存储', 3, 'com.ruoyi.web.controller.system.SysOssController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/oss/1802538345042022401', '120.85.168.111', '中国|广东省|广州市|联通', '{}', '', 1, '删除文件失败，请检查配置信息:[Object name contains unsupported characters. (Service: Amazon S3; Status Code: 400; Error Code: XMinioInvalidObjectName; Request ID: 17ED71E0685F755C; S3 Extended Request ID: dd9025bab4ad464b049177c95eb6ebf374d3b3fd1af9251148b658df7ac2e3e8; Proxy: null)]', '2024-08-20 21:10:41');
INSERT INTO `sys_oper_log` VALUES (1827575146151600130, 'OSS对象存储', 1, 'com.ruoyi.web.controller.system.SysOssController.upload()', 'POST', 1, 'admin', '研发部门', '/system/oss/upload', '120.85.171.122', '中国|广东省|广州市|联通', '', '{\"code\":200,\"msg\":\"操作成功\",\"data\":{\"ossId\":\"1827575145983827970\",\"url\":\"http://139.159.140.112:30900/ruoyi/2024/08/25/4ba7b00b3b4d452e8c36e7be626b3e48.jpg\",\"fileName\":\"cat-4403647_1280.jpg\"}}', 0, '', '2024-08-25 13:14:04');
INSERT INTO `sys_oper_log` VALUES (1838747273751879681, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '113.116.178.24', '中国|广东省|深圳市|电信', '\"base_tlogo_info\"', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2024-09-25 09:08:07');
INSERT INTO `sys_oper_log` VALUES (1849362347306704897, '通知公告', 1, 'com.ruoyi.web.controller.system.SysNoticeController.add()', 'POST', 1, 'admin', '研发部门', '/system/notice', '119.136.88.34', '中国|广东省|深圳市|电信', '{\"createBy\":\"admin\",\"createTime\":\"2024-10-24 16:08:37\",\"updateBy\":\"admin\",\"updateTime\":\"2024-10-24 16:08:37\",\"noticeId\":\"1849362347164098561\",\"noticeTitle\":\"哈哈哈\",\"noticeType\":\"2\",\"noticeContent\":\"<p>呱呱呱呱呱</p>\",\"status\":\"0\",\"remark\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2024-10-24 16:08:38');

-- ----------------------------
-- Table structure for sys_oss
-- ----------------------------
DROP TABLE IF EXISTS `sys_oss`;
CREATE TABLE `sys_oss`  (
  `oss_id` bigint NOT NULL COMMENT '对象存储主键',
  `file_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '文件名',
  `original_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '原名',
  `file_suffix` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '文件后缀名',
  `url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'URL地址',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '上传人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新人',
  `service` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'minio' COMMENT '服务商',
  PRIMARY KEY (`oss_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'OSS对象存储表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_oss
-- ----------------------------
INSERT INTO `sys_oss` VALUES (1827575145983827970, '2024/08/25/4ba7b00b3b4d452e8c36e7be626b3e48.jpg', 'cat-4403647_1280.jpg', '.jpg', 'http://139.159.140.112:30900/ruoyi/2024/08/25/4ba7b00b3b4d452e8c36e7be626b3e48.jpg', '2024-08-25 13:14:04', 'admin', '2024-08-25 13:14:04', 'admin', 'minio');

-- ----------------------------
-- Table structure for sys_oss_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_oss_config`;
CREATE TABLE `sys_oss_config`  (
  `oss_config_id` bigint NOT NULL COMMENT '主建',
  `config_key` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '配置key',
  `access_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT 'accessKey',
  `secret_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '秘钥',
  `bucket_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '桶名称',
  `prefix` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '前缀',
  `endpoint` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '访问站点',
  `domain` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '自定义域名',
  `is_https` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'N' COMMENT '是否https（Y=是,N=否）',
  `region` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '域',
  `access_policy` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '1' COMMENT '桶权限类型(0=private 1=public 2=custom)',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1' COMMENT '是否默认（0=是,1=否）',
  `ext1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '扩展字段',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`oss_config_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '对象存储配置表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_oss_config
-- ----------------------------
INSERT INTO `sys_oss_config` VALUES (1, 'minio', 'minio', 'dudu0.0@', 'ruoyi', '', '139.159.140.112:30900', '', 'N', '', '1', '0', '', 'admin', '2023-11-05 13:57:22', 'admin', '2024-07-24 16:06:07', '');
INSERT INTO `sys_oss_config` VALUES (2, 'qiniu', 'XXXXXXXXXXXXXXX', 'XXXXXXXXXXXXXXX', 'ruoyi', '', 's3-cn-north-1.qiniucs.com', '', 'N', '', '1', '1', '', 'admin', '2023-11-05 13:57:22', 'admin', '2023-11-05 13:57:22', NULL);
INSERT INTO `sys_oss_config` VALUES (3, 'aliyun', 'XXXXXXXXXXXXXXX', 'XXXXXXXXXXXXXXX', 'ruoyi', '', 'oss-cn-beijing.aliyuncs.com', '', 'N', '', '1', '1', '', 'admin', '2023-11-05 13:57:22', 'admin', '2023-11-05 13:57:22', NULL);
INSERT INTO `sys_oss_config` VALUES (4, 'qcloud', 'XXXXXXXXXXXXXXX', 'XXXXXXXXXXXXXXX', 'ruoyi-1250000000', '', 'cos.ap-beijing.myqcloud.com', '', 'N', 'ap-beijing', '1', '1', '', 'admin', '2023-11-05 13:57:22', 'admin', '2023-11-05 13:57:22', NULL);
INSERT INTO `sys_oss_config` VALUES (5, 'image', 'ruoyi', 'ruoyi123', 'ruoyi', 'image', '127.0.0.1:9000', '', 'N', '', '1', '1', '', 'admin', '2023-11-05 13:57:22', 'admin', '2023-11-05 13:57:22', NULL);

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint NOT NULL COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '岗位信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2023-11-05 13:57:22', '', NULL, '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2023-11-05 13:57:22', '', NULL, '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2023-11-05 13:57:22', '', NULL, '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2023-11-05 13:57:22', '', NULL, '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2023-11-05 13:57:22', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', 1, 1, '0', '0', 'admin', '2023-11-05 13:57:22', '', NULL, '普通角色');
INSERT INTO `sys_role` VALUES (3, '本部门及以下', 'test1', 3, '4', 1, 1, '0', '0', 'admin', '2023-11-05 13:57:30', 'admin', NULL, NULL);
INSERT INTO `sys_role` VALUES (4, '仅本人', 'test2', 4, '5', 1, 1, '0', '0', 'admin', '2023-11-05 13:57:30', 'admin', NULL, NULL);
INSERT INTO `sys_role` VALUES (1816315618536767490, 'guest', 'guest', 5, '1', 1, 1, '0', '0', 'admin', '2024-07-25 11:32:44', 'admin', '2024-07-25 11:32:44', NULL);

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `dept_id` bigint NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色和部门关联表' ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = DYNAMIC;

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
INSERT INTO `sys_role_menu` VALUES (2, 1050);
INSERT INTO `sys_role_menu` VALUES (2, 1055);
INSERT INTO `sys_role_menu` VALUES (2, 1056);
INSERT INTO `sys_role_menu` VALUES (2, 1057);
INSERT INTO `sys_role_menu` VALUES (2, 1058);
INSERT INTO `sys_role_menu` VALUES (2, 1059);
INSERT INTO `sys_role_menu` VALUES (2, 1060);
INSERT INTO `sys_role_menu` VALUES (3, 1);
INSERT INTO `sys_role_menu` VALUES (3, 5);
INSERT INTO `sys_role_menu` VALUES (3, 100);
INSERT INTO `sys_role_menu` VALUES (3, 101);
INSERT INTO `sys_role_menu` VALUES (3, 102);
INSERT INTO `sys_role_menu` VALUES (3, 103);
INSERT INTO `sys_role_menu` VALUES (3, 104);
INSERT INTO `sys_role_menu` VALUES (3, 105);
INSERT INTO `sys_role_menu` VALUES (3, 106);
INSERT INTO `sys_role_menu` VALUES (3, 107);
INSERT INTO `sys_role_menu` VALUES (3, 108);
INSERT INTO `sys_role_menu` VALUES (3, 500);
INSERT INTO `sys_role_menu` VALUES (3, 501);
INSERT INTO `sys_role_menu` VALUES (3, 1001);
INSERT INTO `sys_role_menu` VALUES (3, 1002);
INSERT INTO `sys_role_menu` VALUES (3, 1003);
INSERT INTO `sys_role_menu` VALUES (3, 1004);
INSERT INTO `sys_role_menu` VALUES (3, 1005);
INSERT INTO `sys_role_menu` VALUES (3, 1006);
INSERT INTO `sys_role_menu` VALUES (3, 1007);
INSERT INTO `sys_role_menu` VALUES (3, 1008);
INSERT INTO `sys_role_menu` VALUES (3, 1009);
INSERT INTO `sys_role_menu` VALUES (3, 1010);
INSERT INTO `sys_role_menu` VALUES (3, 1011);
INSERT INTO `sys_role_menu` VALUES (3, 1012);
INSERT INTO `sys_role_menu` VALUES (3, 1013);
INSERT INTO `sys_role_menu` VALUES (3, 1014);
INSERT INTO `sys_role_menu` VALUES (3, 1015);
INSERT INTO `sys_role_menu` VALUES (3, 1016);
INSERT INTO `sys_role_menu` VALUES (3, 1017);
INSERT INTO `sys_role_menu` VALUES (3, 1018);
INSERT INTO `sys_role_menu` VALUES (3, 1019);
INSERT INTO `sys_role_menu` VALUES (3, 1020);
INSERT INTO `sys_role_menu` VALUES (3, 1021);
INSERT INTO `sys_role_menu` VALUES (3, 1022);
INSERT INTO `sys_role_menu` VALUES (3, 1023);
INSERT INTO `sys_role_menu` VALUES (3, 1024);
INSERT INTO `sys_role_menu` VALUES (3, 1025);
INSERT INTO `sys_role_menu` VALUES (3, 1026);
INSERT INTO `sys_role_menu` VALUES (3, 1027);
INSERT INTO `sys_role_menu` VALUES (3, 1028);
INSERT INTO `sys_role_menu` VALUES (3, 1029);
INSERT INTO `sys_role_menu` VALUES (3, 1030);
INSERT INTO `sys_role_menu` VALUES (3, 1031);
INSERT INTO `sys_role_menu` VALUES (3, 1032);
INSERT INTO `sys_role_menu` VALUES (3, 1033);
INSERT INTO `sys_role_menu` VALUES (3, 1034);
INSERT INTO `sys_role_menu` VALUES (3, 1035);
INSERT INTO `sys_role_menu` VALUES (3, 1036);
INSERT INTO `sys_role_menu` VALUES (3, 1037);
INSERT INTO `sys_role_menu` VALUES (3, 1038);
INSERT INTO `sys_role_menu` VALUES (3, 1039);
INSERT INTO `sys_role_menu` VALUES (3, 1040);
INSERT INTO `sys_role_menu` VALUES (3, 1041);
INSERT INTO `sys_role_menu` VALUES (3, 1042);
INSERT INTO `sys_role_menu` VALUES (3, 1043);
INSERT INTO `sys_role_menu` VALUES (3, 1044);
INSERT INTO `sys_role_menu` VALUES (3, 1045);
INSERT INTO `sys_role_menu` VALUES (3, 1500);
INSERT INTO `sys_role_menu` VALUES (3, 1501);
INSERT INTO `sys_role_menu` VALUES (3, 1502);
INSERT INTO `sys_role_menu` VALUES (3, 1503);
INSERT INTO `sys_role_menu` VALUES (3, 1504);
INSERT INTO `sys_role_menu` VALUES (3, 1505);
INSERT INTO `sys_role_menu` VALUES (3, 1506);
INSERT INTO `sys_role_menu` VALUES (3, 1507);
INSERT INTO `sys_role_menu` VALUES (3, 1508);
INSERT INTO `sys_role_menu` VALUES (3, 1509);
INSERT INTO `sys_role_menu` VALUES (3, 1510);
INSERT INTO `sys_role_menu` VALUES (3, 1511);
INSERT INTO `sys_role_menu` VALUES (4, 5);
INSERT INTO `sys_role_menu` VALUES (4, 1500);
INSERT INTO `sys_role_menu` VALUES (4, 1501);
INSERT INTO `sys_role_menu` VALUES (4, 1502);
INSERT INTO `sys_role_menu` VALUES (4, 1503);
INSERT INTO `sys_role_menu` VALUES (4, 1504);
INSERT INTO `sys_role_menu` VALUES (4, 1505);
INSERT INTO `sys_role_menu` VALUES (4, 1506);
INSERT INTO `sys_role_menu` VALUES (4, 1507);
INSERT INTO `sys_role_menu` VALUES (4, 1508);
INSERT INTO `sys_role_menu` VALUES (4, 1509);
INSERT INTO `sys_role_menu` VALUES (4, 1510);
INSERT INTO `sys_role_menu` VALUES (4, 1511);
INSERT INTO `sys_role_menu` VALUES (1816315618536767490, 5);
INSERT INTO `sys_role_menu` VALUES (1816315618536767490, 1500);
INSERT INTO `sys_role_menu` VALUES (1816315618536767490, 1501);
INSERT INTO `sys_role_menu` VALUES (1816315618536767490, 1502);
INSERT INTO `sys_role_menu` VALUES (1816315618536767490, 1503);
INSERT INTO `sys_role_menu` VALUES (1816315618536767490, 1504);
INSERT INTO `sys_role_menu` VALUES (1816315618536767490, 1505);
INSERT INTO `sys_role_menu` VALUES (1816315618536767490, 1506);
INSERT INTO `sys_role_menu` VALUES (1816315618536767490, 1507);
INSERT INTO `sys_role_menu` VALUES (1816315618536767490, 1508);
INSERT INTO `sys_role_menu` VALUES (1816315618536767490, 1509);
INSERT INTO `sys_role_menu` VALUES (1816315618536767490, 1510);
INSERT INTO `sys_role_menu` VALUES (1816315618536767490, 1511);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `dept_id` bigint NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'sys_user' COMMENT '用户类型（sys_user系统用户）',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '疯狂的狮子Li', 'sys_user', 'crazyLionLi@163.com', '15888888888', '1', '', '$2a$10$ep3IKKOZsXjBXUsUWgJWE.Xu2HtHWNfjzEOvO1n.20MRmn0QxLV1e', '0', '0', '119.136.88.34', '2024-10-24 16:09:09', 'admin', '2023-11-05 13:57:22', 'admin', '2024-10-24 16:09:09', '管理员');
INSERT INTO `sys_user` VALUES (2, 105, 'lionli', '疯狂的狮子Li', 'sys_user', 'crazyLionLi@qq.com', '15666666666', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '1', '0', '127.0.0.1', '2023-11-05 13:57:22', 'admin', '2023-11-05 13:57:22', 'admin', '2023-11-05 14:59:38', '测试员');
INSERT INTO `sys_user` VALUES (3, 108, 'test', '本部门及以下 密码666666', 'sys_user', '', '', '0', '', '$2a$10$b8yUzN0C71sbz.PhNOCgJe.Tu1yWC3RNrTyjSQ8p1W0.aaUXUJ.Ne', '1', '0', '127.0.0.1', '2023-11-05 13:57:30', 'admin', '2023-11-05 13:57:30', 'admin', '2024-04-07 14:56:28', NULL);
INSERT INTO `sys_user` VALUES (4, 102, 'test1', '仅本人 密码666666', 'sys_user', '', '', '0', '', '$2a$10$.FQ1Cd1oSnxEyeob8pcVBebKnj75BwGyATlcf6iI4ljWyLCWaqGZ6', '1', '0', '127.0.0.1', '2023-11-05 13:57:30', 'admin', '2023-11-05 13:57:30', 'admin', '2024-04-07 15:08:27', NULL);
INSERT INTO `sys_user` VALUES (1816315710186504194, 100, 'guest', 'guest', 'sys_user', '', '', '0', '', '$2a$10$HBtwJBP15xDsk7YJUAPdOej4ECjcXTIxVGYGkOM7vDz6ou5Ey.Qzm', '0', '0', '119.136.88.34', '2024-10-24 16:08:54', 'admin', '2024-07-25 11:33:05', 'guest', '2024-10-24 16:08:54', NULL);

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `post_id` bigint NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (2, 2);
INSERT INTO `sys_user_post` VALUES (1816315710186504194, 4);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户和角色关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);
INSERT INTO `sys_user_role` VALUES (3, 3);
INSERT INTO `sys_user_role` VALUES (4, 4);
INSERT INTO `sys_user_role` VALUES (1816315710186504194, 1816315618536767490);

-- ----------------------------
-- Table structure for t_global_app
-- ----------------------------
DROP TABLE IF EXISTS `t_global_app`;
CREATE TABLE `t_global_app`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '应用ID',
  `code` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '应用标识',
  `description` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '应用描述',
  `auth_type` tinyint NULL DEFAULT 1 COMMENT '认证方式 1 访问密钥  0 无认证',
  `svc_authorization` tinyint NULL DEFAULT 0 COMMENT '是否需要服务授权 0 否  1 是',
  `status` tinyint NULL DEFAULT 1 COMMENT '应用状态, 状态：0: 停用  1：启用',
  `create_by` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_on` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_on` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `extend1` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '扩展字段1',
  `extend2` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '扩展字段2',
  `extend3` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '扩展字段3',
  `version` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uniq_global_app_code`(`code` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '全局应用表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_global_app
-- ----------------------------

-- ----------------------------
-- Table structure for test_demo
-- ----------------------------
DROP TABLE IF EXISTS `test_demo`;
CREATE TABLE `test_demo`  (
  `id` bigint NOT NULL COMMENT '主键',
  `dept_id` bigint NULL DEFAULT NULL COMMENT '部门id',
  `user_id` bigint NULL DEFAULT NULL COMMENT '用户id',
  `order_num` int NULL DEFAULT 0 COMMENT '排序号',
  `test_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'key键',
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '值',
  `version` int NULL DEFAULT 0 COMMENT '版本',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `del_flag` int NULL DEFAULT 0 COMMENT '删除标志',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '测试单表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of test_demo
-- ----------------------------
INSERT INTO `test_demo` VALUES (1, 102, 4, 1, '测试数据权限', '测试', 0, '2023-11-05 13:57:30', 'admin', NULL, NULL, 0);
INSERT INTO `test_demo` VALUES (2, 102, 3, 2, '子节点1', '111', 0, '2023-11-05 13:57:30', 'admin', NULL, NULL, 0);
INSERT INTO `test_demo` VALUES (3, 102, 3, 3, '子节点2', '222', 0, '2023-11-05 13:57:30', 'admin', NULL, NULL, 0);
INSERT INTO `test_demo` VALUES (4, 108, 4, 4, '测试数据', 'demo', 0, '2023-11-05 13:57:30', 'admin', NULL, NULL, 0);
INSERT INTO `test_demo` VALUES (5, 108, 3, 13, '子节点11', '1111', 0, '2023-11-05 13:57:30', 'admin', NULL, NULL, 0);
INSERT INTO `test_demo` VALUES (6, 108, 3, 12, '子节点22', '2222', 0, '2023-11-05 13:57:30', 'admin', NULL, NULL, 0);
INSERT INTO `test_demo` VALUES (7, 108, 3, 11, '子节点33', '3333', 0, '2023-11-05 13:57:30', 'admin', NULL, NULL, 0);
INSERT INTO `test_demo` VALUES (8, 108, 3, 10, '子节点44', '4444', 0, '2023-11-05 13:57:30', 'admin', NULL, NULL, 0);
INSERT INTO `test_demo` VALUES (9, 108, 3, 9, '子节点55', '5555', 0, '2023-11-05 13:57:30', 'admin', NULL, NULL, 0);
INSERT INTO `test_demo` VALUES (10, 108, 3, 8, '子节点66', '6666', 0, '2023-11-05 13:57:30', 'admin', NULL, NULL, 0);
INSERT INTO `test_demo` VALUES (11, 108, 3, 7, '子节点77', '7777', 0, '2023-11-05 13:57:30', 'admin', NULL, NULL, 0);
INSERT INTO `test_demo` VALUES (12, 108, 3, 6, '子节点88', '8888', 0, '2023-11-05 13:57:30', 'admin', NULL, NULL, 0);
INSERT INTO `test_demo` VALUES (13, 108, 3, 5, '子节点99', '9999', 0, '2023-11-05 13:57:30', 'admin', NULL, NULL, 0);

-- ----------------------------
-- Table structure for test_tree
-- ----------------------------
DROP TABLE IF EXISTS `test_tree`;
CREATE TABLE `test_tree`  (
  `id` bigint NOT NULL COMMENT '主键',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父id',
  `dept_id` bigint NULL DEFAULT NULL COMMENT '部门id',
  `user_id` bigint NULL DEFAULT NULL COMMENT '用户id',
  `tree_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '值',
  `version` int NULL DEFAULT 0 COMMENT '版本',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `del_flag` int NULL DEFAULT 0 COMMENT '删除标志',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '测试树表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of test_tree
-- ----------------------------
INSERT INTO `test_tree` VALUES (1, 0, 102, 4, '测试数据权限', 0, '2023-11-05 13:57:30', 'admin', NULL, NULL, 0);
INSERT INTO `test_tree` VALUES (2, 1, 102, 3, '子节点1', 0, '2023-11-05 13:57:30', 'admin', NULL, NULL, 0);
INSERT INTO `test_tree` VALUES (3, 2, 102, 3, '子节点2', 0, '2023-11-05 13:57:30', 'admin', NULL, NULL, 0);
INSERT INTO `test_tree` VALUES (4, 0, 108, 4, '测试树1', 0, '2023-11-05 13:57:30', 'admin', NULL, NULL, 0);
INSERT INTO `test_tree` VALUES (5, 4, 108, 3, '子节点11', 0, '2023-11-05 13:57:30', 'admin', NULL, NULL, 0);
INSERT INTO `test_tree` VALUES (6, 4, 108, 3, '子节点22', 0, '2023-11-05 13:57:30', 'admin', NULL, NULL, 0);
INSERT INTO `test_tree` VALUES (7, 4, 108, 3, '子节点33', 0, '2023-11-05 13:57:30', 'admin', NULL, NULL, 0);
INSERT INTO `test_tree` VALUES (8, 5, 108, 3, '子节点44', 0, '2023-11-05 13:57:30', 'admin', NULL, NULL, 0);
INSERT INTO `test_tree` VALUES (9, 6, 108, 3, '子节点55', 0, '2023-11-05 13:57:30', 'admin', NULL, NULL, 0);
INSERT INTO `test_tree` VALUES (10, 7, 108, 3, '子节点66', 0, '2023-11-05 13:57:30', 'admin', NULL, NULL, 0);
INSERT INTO `test_tree` VALUES (11, 7, 108, 3, '子节点77', 0, '2023-11-05 13:57:30', 'admin', NULL, NULL, 0);
INSERT INTO `test_tree` VALUES (12, 10, 108, 3, '子节点88', 0, '2023-11-05 13:57:30', 'admin', NULL, NULL, 0);
INSERT INTO `test_tree` VALUES (13, 10, 108, 3, '子节点99', 0, '2023-11-05 13:57:30', 'admin', NULL, NULL, 0);

-- ----------------------------
-- Table structure for xxl_job_group
-- ----------------------------
DROP TABLE IF EXISTS `xxl_job_group`;
CREATE TABLE `xxl_job_group`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '执行器AppName',
  `title` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '执行器名称',
  `address_type` tinyint NOT NULL DEFAULT 0 COMMENT '执行器地址类型：0=自动注册、1=手动录入',
  `address_list` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '执行器地址列表，多地址逗号分隔',
  `update_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of xxl_job_group
-- ----------------------------
INSERT INTO `xxl_job_group` VALUES (1, 'xxl-job-executor', '示例执行器', 0, 'http://172.19.0.1:28080/', '2024-04-18 14:29:09');

-- ----------------------------
-- Table structure for xxl_job_info
-- ----------------------------
DROP TABLE IF EXISTS `xxl_job_info`;
CREATE TABLE `xxl_job_info`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `job_group` int NOT NULL COMMENT '执行器主键ID',
  `job_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `add_time` datetime NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  `author` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '作者',
  `alarm_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '报警邮件',
  `schedule_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'NONE' COMMENT '调度类型',
  `schedule_conf` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '调度配置，值含义取决于调度类型',
  `misfire_strategy` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'DO_NOTHING' COMMENT '调度过期策略',
  `executor_route_strategy` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '执行器路由策略',
  `executor_handler` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '执行器任务handler',
  `executor_param` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '执行器任务参数',
  `executor_block_strategy` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '阻塞处理策略',
  `executor_timeout` int NOT NULL DEFAULT 0 COMMENT '任务执行超时时间，单位秒',
  `executor_fail_retry_count` int NOT NULL DEFAULT 0 COMMENT '失败重试次数',
  `glue_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'GLUE类型',
  `glue_source` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT 'GLUE源代码',
  `glue_remark` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'GLUE备注',
  `glue_updatetime` datetime NULL DEFAULT NULL COMMENT 'GLUE更新时间',
  `child_jobid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '子任务ID，多个逗号分隔',
  `trigger_status` tinyint NOT NULL DEFAULT 0 COMMENT '调度状态：0-停止，1-运行',
  `trigger_last_time` bigint NOT NULL DEFAULT 0 COMMENT '上次调度时间',
  `trigger_next_time` bigint NOT NULL DEFAULT 0 COMMENT '下次调度时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of xxl_job_info
-- ----------------------------
INSERT INTO `xxl_job_info` VALUES (1, 1, '测试任务1', '2018-11-03 22:21:31', '2018-11-03 22:21:31', 'XXL', '', 'CRON', '0 0 0 * * ? *', 'DO_NOTHING', 'FIRST', 'demoJobHandler', '', 'SERIAL_EXECUTION', 0, 0, 'BEAN', '', 'GLUE代码初始化', '2018-11-03 22:21:31', '', 0, 0, 0);

-- ----------------------------
-- Table structure for xxl_job_lock
-- ----------------------------
DROP TABLE IF EXISTS `xxl_job_lock`;
CREATE TABLE `xxl_job_lock`  (
  `lock_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '锁名称',
  PRIMARY KEY (`lock_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of xxl_job_lock
-- ----------------------------
INSERT INTO `xxl_job_lock` VALUES ('schedule_lock');

-- ----------------------------
-- Table structure for xxl_job_log
-- ----------------------------
DROP TABLE IF EXISTS `xxl_job_log`;
CREATE TABLE `xxl_job_log`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `job_group` int NOT NULL COMMENT '执行器主键ID',
  `job_id` int NOT NULL COMMENT '任务，主键ID',
  `executor_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '执行器地址，本次执行的地址',
  `executor_handler` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '执行器任务handler',
  `executor_param` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '执行器任务参数',
  `executor_sharding_param` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '执行器任务分片参数，格式如 1/2',
  `executor_fail_retry_count` int NOT NULL DEFAULT 0 COMMENT '失败重试次数',
  `trigger_time` datetime NULL DEFAULT NULL COMMENT '调度-时间',
  `trigger_code` int NOT NULL COMMENT '调度-结果',
  `trigger_msg` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '调度-日志',
  `handle_time` datetime NULL DEFAULT NULL COMMENT '执行-时间',
  `handle_code` int NOT NULL COMMENT '执行-状态',
  `handle_msg` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '执行-日志',
  `alarm_status` tinyint NOT NULL DEFAULT 0 COMMENT '告警状态：0-默认、1-无需告警、2-告警成功、3-告警失败',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `I_trigger_time`(`trigger_time` ASC) USING BTREE,
  INDEX `I_handle_code`(`handle_code` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of xxl_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for xxl_job_log_report
-- ----------------------------
DROP TABLE IF EXISTS `xxl_job_log_report`;
CREATE TABLE `xxl_job_log_report`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `trigger_day` datetime NULL DEFAULT NULL COMMENT '调度-时间',
  `running_count` int NOT NULL DEFAULT 0 COMMENT '运行中-日志数量',
  `suc_count` int NOT NULL DEFAULT 0 COMMENT '执行成功-日志数量',
  `fail_count` int NOT NULL DEFAULT 0 COMMENT '执行失败-日志数量',
  `update_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `i_trigger_day`(`trigger_day` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 169 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of xxl_job_log_report
-- ----------------------------
INSERT INTO `xxl_job_log_report` VALUES (1, '2023-11-05 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (2, '2023-11-04 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (3, '2023-11-03 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (4, '2023-11-06 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (5, '2023-11-07 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (6, '2023-11-08 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (7, '2023-11-09 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (8, '2023-11-10 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (9, '2023-11-11 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (10, '2023-11-12 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (11, '2023-11-13 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (12, '2023-11-14 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (13, '2023-11-15 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (14, '2023-11-16 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (15, '2023-11-17 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (16, '2023-11-18 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (17, '2023-11-19 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (18, '2023-11-20 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (19, '2023-11-21 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (20, '2023-11-22 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (21, '2023-11-23 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (22, '2023-11-24 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (23, '2023-11-25 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (24, '2023-11-26 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (25, '2023-11-27 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (26, '2023-11-28 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (27, '2023-11-29 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (28, '2023-11-30 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (29, '2023-12-01 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (30, '2023-12-02 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (31, '2023-12-03 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (32, '2023-12-04 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (33, '2023-12-05 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (34, '2023-12-06 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (35, '2023-12-07 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (36, '2023-12-08 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (37, '2023-12-09 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (38, '2023-12-10 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (39, '2023-12-11 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (40, '2023-12-12 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (41, '2023-12-13 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (42, '2023-12-14 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (43, '2023-12-15 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (44, '2023-12-16 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (45, '2023-12-17 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (46, '2023-12-18 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (47, '2023-12-19 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (48, '2023-12-20 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (49, '2023-12-21 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (50, '2023-12-22 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (51, '2023-12-23 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (52, '2023-12-24 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (53, '2023-12-25 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (54, '2023-12-26 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (55, '2023-12-27 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (56, '2023-12-28 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (57, '2023-12-29 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (58, '2023-12-30 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (59, '2023-12-31 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (60, '2024-01-01 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (61, '2024-01-02 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (62, '2024-01-03 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (63, '2024-01-04 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (64, '2024-01-05 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (65, '2024-01-06 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (66, '2024-01-07 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (67, '2024-01-08 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (68, '2024-01-09 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (69, '2024-01-10 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (70, '2024-01-11 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (71, '2024-01-12 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (72, '2024-01-13 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (73, '2024-01-14 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (74, '2024-01-15 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (75, '2024-01-16 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (76, '2024-01-17 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (77, '2024-01-18 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (78, '2024-01-19 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (79, '2024-01-20 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (80, '2024-01-21 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (81, '2024-01-22 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (82, '2024-01-23 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (83, '2024-01-24 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (84, '2024-01-25 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (85, '2024-01-26 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (86, '2024-01-27 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (87, '2024-01-28 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (88, '2024-01-29 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (89, '2024-01-30 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (90, '2024-01-31 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (91, '2024-02-01 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (92, '2024-02-02 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (93, '2024-02-03 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (94, '2024-02-04 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (95, '2024-02-05 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (96, '2024-02-06 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (97, '2024-02-07 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (98, '2024-02-08 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (99, '2024-02-09 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (100, '2024-02-10 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (101, '2024-02-11 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (102, '2024-02-12 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (103, '2024-02-13 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (104, '2024-02-14 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (105, '2024-02-15 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (106, '2024-02-16 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (107, '2024-02-17 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (108, '2024-02-18 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (109, '2024-02-19 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (110, '2024-02-20 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (111, '2024-02-21 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (112, '2024-02-22 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (113, '2024-02-23 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (114, '2024-02-24 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (115, '2024-02-25 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (116, '2024-02-26 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (117, '2024-02-27 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (118, '2024-02-28 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (119, '2024-02-29 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (120, '2024-03-01 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (121, '2024-03-02 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (122, '2024-03-03 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (123, '2024-03-04 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (124, '2024-03-05 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (125, '2024-03-06 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (126, '2024-03-07 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (127, '2024-03-08 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (128, '2024-03-09 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (129, '2024-03-10 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (130, '2024-03-11 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (131, '2024-03-12 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (132, '2024-03-13 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (133, '2024-03-14 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (134, '2024-03-15 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (135, '2024-03-16 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (136, '2024-03-17 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (137, '2024-03-18 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (138, '2024-03-19 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (139, '2024-03-20 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (140, '2024-03-21 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (141, '2024-03-22 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (142, '2024-03-23 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (143, '2024-03-24 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (144, '2024-03-25 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (145, '2024-03-26 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (146, '2024-03-27 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (147, '2024-03-28 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (148, '2024-03-29 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (149, '2024-03-30 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (150, '2024-03-31 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (151, '2024-04-01 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (152, '2024-04-02 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (153, '2024-04-03 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (154, '2024-04-04 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (155, '2024-04-05 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (156, '2024-04-06 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (157, '2024-04-07 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (158, '2024-04-08 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (159, '2024-04-09 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (160, '2024-04-10 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (161, '2024-04-11 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (162, '2024-04-12 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (163, '2024-04-13 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (164, '2024-04-14 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (165, '2024-04-15 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (166, '2024-04-16 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (167, '2024-04-17 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (168, '2024-04-18 00:00:00', 0, 0, 0, NULL);

-- ----------------------------
-- Table structure for xxl_job_logglue
-- ----------------------------
DROP TABLE IF EXISTS `xxl_job_logglue`;
CREATE TABLE `xxl_job_logglue`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `job_id` int NOT NULL COMMENT '任务，主键ID',
  `glue_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'GLUE类型',
  `glue_source` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT 'GLUE源代码',
  `glue_remark` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'GLUE备注',
  `add_time` datetime NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of xxl_job_logglue
-- ----------------------------

-- ----------------------------
-- Table structure for xxl_job_registry
-- ----------------------------
DROP TABLE IF EXISTS `xxl_job_registry`;
CREATE TABLE `xxl_job_registry`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `registry_group` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `registry_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `registry_value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `i_g_k_v`(`registry_group` ASC, `registry_key` ASC, `registry_value` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of xxl_job_registry
-- ----------------------------
INSERT INTO `xxl_job_registry` VALUES (8, 'EXECUTOR', 'xxl-job-executor', 'http://172.19.0.1:28080/', '2024-04-18 14:28:44');

-- ----------------------------
-- Table structure for xxl_job_user
-- ----------------------------
DROP TABLE IF EXISTS `xxl_job_user`;
CREATE TABLE `xxl_job_user`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '账号',
  `password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '密码',
  `role` tinyint NOT NULL COMMENT '角色：0-普通用户、1-管理员',
  `permission` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '权限：执行器ID列表，多个逗号分割',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `i_username`(`username` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of xxl_job_user
-- ----------------------------
INSERT INTO `xxl_job_user` VALUES (1, 'admin', 'e10adc3949ba59abbe56e057f20f883e', 1, NULL);

SET FOREIGN_KEY_CHECKS = 1;
