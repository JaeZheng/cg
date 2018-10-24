/*
Navicat MySQL Data Transfer

Source Server         : 本地
Source Server Version : 50723
Source Host           : localhost:3307
Source Database       : cg

Target Server Type    : MYSQL
Target Server Version : 50723
File Encoding         : 65001

Date: 2018-10-24 15:37:32
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `blank_record`
-- ----------------------------
DROP TABLE IF EXISTS `blank_record`;
CREATE TABLE `blank_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '胚料记录id',
  `consume_num` char(14) NOT NULL COMMENT '损耗编号',
  `product_model_info_id` int(11) NOT NULL COMMENT '产品型号id',
  `staff_id` int(11) NOT NULL COMMENT '登记者id',
  `staff_name` varchar(20) NOT NULL COMMENT '登记者名字',
  `blowon_date` bigint(20) NOT NULL COMMENT '开炉日期',
  `material_consume` float(9,2) NOT NULL COMMENT '原料消耗总量',
  `blank_produce` float(9,2) NOT NULL COMMENT '胚料产出总量',
  `loss_ratio` float(4,2) NOT NULL COMMENT '开炉损耗比',
  PRIMARY KEY (`id`),
  KEY `staff_id` (`staff_id`),
  KEY `product_model_info_id` (`product_model_info_id`),
  CONSTRAINT `blank_record_ibfk_1` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`staff_id`),
  CONSTRAINT `blank_record_ibfk_2` FOREIGN KEY (`product_model_info_id`) REFERENCES `product_model_info` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='胚料记录';

-- ----------------------------
-- Records of blank_record
-- ----------------------------

-- ----------------------------
-- Table structure for `blowon_record`
-- ----------------------------
DROP TABLE IF EXISTS `blowon_record`;
CREATE TABLE `blowon_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '开炉记录id',
  `blowon_num` char(14) NOT NULL COMMENT '开炉编号',
  `staff_id` int(11) NOT NULL COMMENT '登记者id',
  `staff_name` varchar(20) NOT NULL COMMENT '登记者名字',
  `product_model_info_id` int(11) NOT NULL COMMENT '产品型号id',
  `blowon_date` bigint(20) NOT NULL COMMENT '开炉日期',
  `consume_ag` float(9,2) NOT NULL DEFAULT '0.00' COMMENT '银',
  `consume_cu` float(9,2) NOT NULL DEFAULT '0.00' COMMENT '铜',
  `consume_zn` float(9,2) NOT NULL DEFAULT '0.00' COMMENT '锌',
  `consume_cd` float(9,2) NOT NULL DEFAULT '0.00' COMMENT '镉',
  `consume_sn` float(9,2) NOT NULL DEFAULT '0.00' COMMENT '锡',
  `material_consume` float(9,2) NOT NULL COMMENT '原料消耗总量',
  `waste_consume` float(9,2) NOT NULL DEFAULT '0.00' COMMENT '废料消耗量',
  `leftover_consume` float(9,2) NOT NULL DEFAULT '0.00' COMMENT '边角料消耗量',
  PRIMARY KEY (`id`),
  KEY `staff_id` (`staff_id`),
  KEY `product_model_info_id` (`product_model_info_id`),
  CONSTRAINT `blowon_record_ibfk_1` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`staff_id`),
  CONSTRAINT `blowon_record_ibfk_2` FOREIGN KEY (`product_model_info_id`) REFERENCES `product_model_info` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='开炉记录';

-- ----------------------------
-- Records of blowon_record
-- ----------------------------

-- ----------------------------
-- Table structure for `check_warehouse_others_record`
-- ----------------------------
DROP TABLE IF EXISTS `check_warehouse_others_record`;
CREATE TABLE `check_warehouse_others_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '其他清仓记录id',
  `check_num` char(14) NOT NULL COMMENT '清仓编号',
  `staff_id` int(11) NOT NULL COMMENT '登记者id',
  `staff_name` varchar(20) NOT NULL COMMENT '登记者名字',
  `product_model_info_id` int(11) NOT NULL COMMENT '产品型号id',
  `check_date` bigint(20) NOT NULL COMMENT '清仓日期',
  `blank_inventory` float(9,2) NOT NULL COMMENT '胚料',
  `semifinished_product_inventory` float(9,2) NOT NULL COMMENT '半成品',
  `waste_inventory` float(9,2) NOT NULL COMMENT '废料',
  `leftover_inventory` float(9,2) NOT NULL COMMENT '边角料',
  PRIMARY KEY (`id`),
  KEY `product_model_info_id` (`product_model_info_id`),
  KEY `staff_id` (`staff_id`),
  CONSTRAINT `check_warehouse_others_record_ibfk_1` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`staff_id`),
  CONSTRAINT `check_warehouse_others_record_ibfk_2` FOREIGN KEY (`product_model_info_id`) REFERENCES `product_model_info` (`id`),
  CONSTRAINT `check_warehouse_others_record_ibfk_3` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`staff_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='其他清仓记录';

-- ----------------------------
-- Records of check_warehouse_others_record
-- ----------------------------

-- ----------------------------
-- Table structure for `check_warehouse_product_record`
-- ----------------------------
DROP TABLE IF EXISTS `check_warehouse_product_record`;
CREATE TABLE `check_warehouse_product_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '产品清仓记录id',
  `check_num` char(14) NOT NULL COMMENT '产品清仓编号',
  `staff_id` int(11) NOT NULL COMMENT '登记者id',
  `staff_name` varchar(20) NOT NULL COMMENT '登记者名字',
  `product_id` int(11) NOT NULL COMMENT '产品id',
  `check_date` bigint(20) NOT NULL COMMENT '清仓日期',
  `product_inventory` float(9,2) NOT NULL COMMENT '产品数量',
  PRIMARY KEY (`id`),
  KEY `staff_id` (`staff_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `check_warehouse_product_record_ibfk_1` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`staff_id`),
  CONSTRAINT `check_warehouse_product_record_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='产品清仓记录';

-- ----------------------------
-- Records of check_warehouse_product_record
-- ----------------------------

-- ----------------------------
-- Table structure for `customer`
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '客户id',
  `customer_name` varchar(20) NOT NULL COMMENT '客户姓名',
  `customer_phone` char(11) NOT NULL COMMENT '联系方式',
  `customer_address` varchar(200) NOT NULL COMMENT '收货地址',
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='客户信息';

-- ----------------------------
-- Records of customer
-- ----------------------------
INSERT INTO `customer` VALUES ('1', '客户1', '18826077180', 'C10');
INSERT INTO `customer` VALUES ('2', '客户2', '18826077180', 'C10');
INSERT INTO `customer` VALUES ('3', '客户3', '18826077180', 'C10');
INSERT INTO `customer` VALUES ('4', '客户4', '18826077180', 'C10');

-- ----------------------------
-- Table structure for `factory_out_storage_record`
-- ----------------------------
DROP TABLE IF EXISTS `factory_out_storage_record`;
CREATE TABLE `factory_out_storage_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '工厂出库记录id',
  `out_storage_num` char(14) NOT NULL COMMENT '出库编号',
  `staff_id` int(11) NOT NULL COMMENT '登记者id',
  `staff_name` varchar(20) NOT NULL COMMENT '登记者名字',
  `product_id` int(11) NOT NULL COMMENT '产品id',
  `out_storage_date` bigint(20) NOT NULL COMMENT '出库日期',
  `out_storage_quantity` float(9,2) NOT NULL COMMENT '出库总量',
  PRIMARY KEY (`id`),
  KEY `staff_id` (`staff_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `factory_out_storage_record_ibfk_1` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`staff_id`),
  CONSTRAINT `factory_out_storage_record_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='工厂出库记录';

-- ----------------------------
-- Records of factory_out_storage_record
-- ----------------------------

-- ----------------------------
-- Table structure for `factory_product_inventory`
-- ----------------------------
DROP TABLE IF EXISTS `factory_product_inventory`;
CREATE TABLE `factory_product_inventory` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '工厂产品库存id',
  `product_id` int(11) NOT NULL COMMENT '产品id',
  `product_inventory` float(9,2) NOT NULL DEFAULT '0.00' COMMENT '库存总量',
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `factory_product_inventory_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='工厂产品库存';

-- ----------------------------
-- Records of factory_product_inventory
-- ----------------------------

-- ----------------------------
-- Table structure for `material`
-- ----------------------------
DROP TABLE IF EXISTS `material`;
CREATE TABLE `material` (
  `material_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '原料id',
  `material_class` char(1) NOT NULL COMMENT '原料种类',
  `material_inventory` float(7,2) NOT NULL DEFAULT '0.00' COMMENT '原料库存,单位:千克',
  PRIMARY KEY (`material_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='原料表';

-- ----------------------------
-- Records of material
-- ----------------------------
INSERT INTO `material` VALUES ('1', '银', '100.00');
INSERT INTO `material` VALUES ('2', '铜', '100.00');
INSERT INTO `material` VALUES ('3', '锌', '100.00');
INSERT INTO `material` VALUES ('4', '镉', '100.00');
INSERT INTO `material` VALUES ('5', '锡', '100.00');

-- ----------------------------
-- Table structure for `material_purchase_record`
-- ----------------------------
DROP TABLE IF EXISTS `material_purchase_record`;
CREATE TABLE `material_purchase_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '原料采购记录id',
  `material_id` int(11) NOT NULL COMMENT '原料id',
  `staff_id` int(11) NOT NULL COMMENT '登记者id',
  `staff_name` varchar(20) NOT NULL COMMENT '员工名字不能修改，所以用冗余字段',
  `purchase_num` char(14) NOT NULL COMMENT '采购编号',
  `purchase_date` bigint(20) NOT NULL COMMENT '采购日期',
  `purchase_quantity` float(9,2) NOT NULL COMMENT '采购量',
  `unit_price` float(9,2) NOT NULL COMMENT '单价',
  `total_price` float(20,2) NOT NULL COMMENT '总价',
  PRIMARY KEY (`id`),
  KEY `material_id` (`material_id`),
  KEY `staff_id` (`staff_id`),
  CONSTRAINT `material_purchase_record_ibfk_1` FOREIGN KEY (`material_id`) REFERENCES `material` (`material_id`),
  CONSTRAINT `material_purchase_record_ibfk_2` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`staff_id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8 COMMENT='原料采购记录';

-- ----------------------------
-- Records of material_purchase_record
-- ----------------------------
INSERT INTO `material_purchase_record` VALUES ('1', '1', '3', '詹育壕', 'GR201707010001', '1498838400000', '10.00', '1.00', '10.00');
INSERT INTO `material_purchase_record` VALUES ('2', '1', '3', '詹育壕', 'GR201707010002', '1498838400000', '10.00', '1.00', '10.00');
INSERT INTO `material_purchase_record` VALUES ('3', '1', '3', '詹育壕', 'GR201707010003', '1498838400000', '10.00', '1.00', '10.00');
INSERT INTO `material_purchase_record` VALUES ('4', '1', '3', '詹育壕', 'GR201707010004', '1498838400000', '10.00', '1.00', '10.00');
INSERT INTO `material_purchase_record` VALUES ('5', '1', '3', '詹育壕', 'GR201707010005', '1498838400000', '10.00', '1.00', '10.00');
INSERT INTO `material_purchase_record` VALUES ('6', '1', '3', '詹育壕', 'GR201707010006', '1498838400000', '10.00', '1.00', '10.00');
INSERT INTO `material_purchase_record` VALUES ('7', '1', '3', '詹育壕', 'GR201707010007', '1498838400000', '10.00', '1.00', '10.00');
INSERT INTO `material_purchase_record` VALUES ('8', '1', '3', '詹育壕', 'GR201707010008', '1498838400000', '10.00', '1.00', '10.00');
INSERT INTO `material_purchase_record` VALUES ('9', '1', '3', '詹育壕', 'GR201707010009', '1498838400000', '10.00', '1.00', '10.00');
INSERT INTO `material_purchase_record` VALUES ('10', '1', '3', '詹育壕', 'GR201707010010', '1498838400000', '10.00', '1.00', '10.00');
INSERT INTO `material_purchase_record` VALUES ('11', '2', '3', '詹育壕', 'GR201707010011', '1498838400000', '10.00', '1.00', '10.00');
INSERT INTO `material_purchase_record` VALUES ('12', '2', '3', '詹育壕', 'GR201707010012', '1498838400000', '10.00', '1.00', '10.00');
INSERT INTO `material_purchase_record` VALUES ('13', '2', '3', '詹育壕', 'GR201707010013', '1498838400000', '10.00', '1.00', '10.00');
INSERT INTO `material_purchase_record` VALUES ('14', '2', '3', '詹育壕', 'GR201707010014', '1498838400000', '10.00', '1.00', '10.00');
INSERT INTO `material_purchase_record` VALUES ('15', '2', '3', '詹育壕', 'GR201707010015', '1498838400000', '10.00', '1.00', '10.00');
INSERT INTO `material_purchase_record` VALUES ('16', '2', '3', '詹育壕', 'GR201707010016', '1498838400000', '10.00', '1.00', '10.00');
INSERT INTO `material_purchase_record` VALUES ('17', '2', '3', '詹育壕', 'GR201707010017', '1498838400000', '10.00', '1.00', '10.00');
INSERT INTO `material_purchase_record` VALUES ('18', '2', '3', '詹育壕', 'GR201707010018', '1498838400000', '10.00', '1.00', '10.00');
INSERT INTO `material_purchase_record` VALUES ('19', '2', '3', '詹育壕', 'GR201707010019', '1498838400000', '10.00', '1.00', '10.00');
INSERT INTO `material_purchase_record` VALUES ('20', '2', '3', '詹育壕', 'GR201707010020', '1498838400000', '10.00', '1.00', '10.00');
INSERT INTO `material_purchase_record` VALUES ('21', '3', '3', '詹育壕', 'GR201707010021', '1498838400000', '10.00', '1.00', '10.00');
INSERT INTO `material_purchase_record` VALUES ('22', '3', '3', '詹育壕', 'GR201707010022', '1498838400000', '10.00', '1.00', '10.00');
INSERT INTO `material_purchase_record` VALUES ('23', '3', '3', '詹育壕', 'GR201707010023', '1498838400000', '10.00', '1.00', '10.00');
INSERT INTO `material_purchase_record` VALUES ('24', '3', '3', '詹育壕', 'GR201707010024', '1498838400000', '10.00', '1.00', '10.00');
INSERT INTO `material_purchase_record` VALUES ('25', '3', '3', '詹育壕', 'GR201707010025', '1498838400000', '10.00', '1.00', '10.00');
INSERT INTO `material_purchase_record` VALUES ('26', '3', '3', '詹育壕', 'GR201707010026', '1498838400000', '10.00', '1.00', '10.00');
INSERT INTO `material_purchase_record` VALUES ('27', '3', '3', '詹育壕', 'GR201707010027', '1498838400000', '10.00', '1.00', '10.00');
INSERT INTO `material_purchase_record` VALUES ('28', '3', '3', '詹育壕', 'GR201707010028', '1498838400000', '10.00', '1.00', '10.00');
INSERT INTO `material_purchase_record` VALUES ('29', '3', '3', '詹育壕', 'GR201707010029', '1498838400000', '10.00', '1.00', '10.00');
INSERT INTO `material_purchase_record` VALUES ('30', '3', '3', '詹育壕', 'GR201707010030', '1498838400000', '10.00', '1.00', '10.00');
INSERT INTO `material_purchase_record` VALUES ('31', '4', '3', '詹育壕', 'GR201707010031', '1498838400000', '10.00', '1.00', '10.00');
INSERT INTO `material_purchase_record` VALUES ('32', '4', '3', '詹育壕', 'GR201707010032', '1498838400000', '10.00', '1.00', '10.00');
INSERT INTO `material_purchase_record` VALUES ('33', '4', '3', '詹育壕', 'GR201707010033', '1498838400000', '10.00', '1.00', '10.00');
INSERT INTO `material_purchase_record` VALUES ('34', '4', '3', '詹育壕', 'GR201707010034', '1498838400000', '10.00', '1.00', '10.00');
INSERT INTO `material_purchase_record` VALUES ('35', '4', '3', '詹育壕', 'GR201707010035', '1498838400000', '10.00', '1.00', '10.00');
INSERT INTO `material_purchase_record` VALUES ('36', '4', '3', '詹育壕', 'GR201707010036', '1498838400000', '10.00', '1.00', '10.00');
INSERT INTO `material_purchase_record` VALUES ('37', '4', '3', '詹育壕', 'GR201707010037', '1498838400000', '10.00', '1.00', '10.00');
INSERT INTO `material_purchase_record` VALUES ('38', '4', '3', '詹育壕', 'GR201707010038', '1498838400000', '10.00', '1.00', '10.00');
INSERT INTO `material_purchase_record` VALUES ('39', '4', '3', '詹育壕', 'GR201707010039', '1498838400000', '10.00', '1.00', '10.00');
INSERT INTO `material_purchase_record` VALUES ('40', '4', '3', '詹育壕', 'GR201707010040', '1498838400000', '10.00', '1.00', '10.00');
INSERT INTO `material_purchase_record` VALUES ('41', '5', '3', '詹育壕', 'GR201707010041', '1498838400000', '10.00', '1.00', '10.00');
INSERT INTO `material_purchase_record` VALUES ('42', '5', '3', '詹育壕', 'GR201707010042', '1498838400000', '10.00', '1.00', '10.00');
INSERT INTO `material_purchase_record` VALUES ('43', '5', '3', '詹育壕', 'GR201707010043', '1498838400000', '10.00', '1.00', '10.00');
INSERT INTO `material_purchase_record` VALUES ('44', '5', '3', '詹育壕', 'GR201707010044', '1498838400000', '10.00', '1.00', '10.00');
INSERT INTO `material_purchase_record` VALUES ('45', '5', '3', '詹育壕', 'GR201707010045', '1498838400000', '10.00', '1.00', '10.00');
INSERT INTO `material_purchase_record` VALUES ('46', '5', '3', '詹育壕', 'GR201707010046', '1498838400000', '10.00', '1.00', '10.00');
INSERT INTO `material_purchase_record` VALUES ('47', '5', '3', '詹育壕', 'GR201707010047', '1498838400000', '10.00', '1.00', '10.00');
INSERT INTO `material_purchase_record` VALUES ('48', '5', '3', '詹育壕', 'GR201707010048', '1498838400000', '10.00', '1.00', '10.00');
INSERT INTO `material_purchase_record` VALUES ('49', '5', '3', '詹育壕', 'GR201707010049', '1498838400000', '10.00', '1.00', '10.00');
INSERT INTO `material_purchase_record` VALUES ('50', '5', '3', '詹育壕', 'GR201707010050', '1498838400000', '10.00', '1.00', '10.00');

-- ----------------------------
-- Table structure for `permission`
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission` (
  `permission_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '权限id',
  `permission_name` varchar(100) NOT NULL COMMENT '权限名',
  `permission_description` varchar(100) NOT NULL COMMENT '权限描述',
  PRIMARY KEY (`permission_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='权限表';

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES ('1', 'staff:all', '员工管理权限');

-- ----------------------------
-- Table structure for `product`
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '产品id',
  `product_model_info_id` int(11) NOT NULL COMMENT '产品型号id',
  `product_size` varchar(100) NOT NULL COMMENT '产品规格 长*宽*厚',
  `product_shape` char(1) NOT NULL COMMENT '产品形态:直/弯',
  PRIMARY KEY (`product_id`),
  KEY `product_model_info_id` (`product_model_info_id`),
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`product_model_info_id`) REFERENCES `product_model_info` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='产品';

-- ----------------------------
-- Records of product
-- ----------------------------

-- ----------------------------
-- Table structure for `product_model_info`
-- ----------------------------
DROP TABLE IF EXISTS `product_model_info`;
CREATE TABLE `product_model_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '产品型号信息id',
  `staff_id` int(11) NOT NULL COMMENT '登记者id',
  `staff_name` varchar(20) NOT NULL COMMENT '员工名字不能修改，所以用冗余字段',
  `product_model` varchar(100) NOT NULL COMMENT '产品型号',
  `add_date` bigint(20) NOT NULL COMMENT '添加日期',
  `ratio_ag` float(4,2) NOT NULL DEFAULT '0.00' COMMENT '银占比',
  `ratio_cu` float(4,2) NOT NULL DEFAULT '0.00' COMMENT '铜占比',
  `ratio_zn` float(4,2) NOT NULL DEFAULT '0.00' COMMENT '锌占比',
  `ratio_cd` float(4,2) NOT NULL DEFAULT '0.00' COMMENT '镉占比',
  `ratio_sn` float(4,2) NOT NULL DEFAULT '0.00' COMMENT '锡占比',
  PRIMARY KEY (`id`),
  KEY `staff_id` (`staff_id`),
  CONSTRAINT `product_model_info_ibfk_1` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`staff_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='产品型号信息';

-- ----------------------------
-- Records of product_model_info
-- ----------------------------

-- ----------------------------
-- Table structure for `product_produce`
-- ----------------------------
DROP TABLE IF EXISTS `product_produce`;
CREATE TABLE `product_produce` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '产品产出id',
  `produce_num` char(14) NOT NULL COMMENT '产出编号',
  `staff_id` int(11) NOT NULL COMMENT '登记者id',
  `staff_name` varchar(20) NOT NULL COMMENT '登记者名字',
  `product_id` int(11) NOT NULL COMMENT '产品id',
  `produce_date` bigint(20) NOT NULL COMMENT '产出日期',
  `produce_quantity` float(9,2) DEFAULT NULL COMMENT '产出总量',
  PRIMARY KEY (`id`),
  KEY `staff_id` (`staff_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `product_produce_ibfk_1` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`staff_id`),
  CONSTRAINT `product_produce_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='产品产出';

-- ----------------------------
-- Records of product_produce
-- ----------------------------

-- ----------------------------
-- Table structure for `role`
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色id',
  `role_name` varchar(100) NOT NULL COMMENT '角色名',
  `role_description` varchar(100) NOT NULL COMMENT '角色描述',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', 'GM', '总经理');
INSERT INTO `role` VALUES ('2', 'manager', '经理');
INSERT INTO `role` VALUES ('3', 'FM', '工厂管理员');
INSERT INTO `role` VALUES ('4', 'WM', '仓库管理员');

-- ----------------------------
-- Table structure for `role_permission`
-- ----------------------------
DROP TABLE IF EXISTS `role_permission`;
CREATE TABLE `role_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '记录id',
  `role_id` int(11) NOT NULL COMMENT '角色id',
  `permission_id` int(11) NOT NULL COMMENT '权限id',
  PRIMARY KEY (`id`),
  KEY `role_id` (`role_id`),
  KEY `permission_id` (`permission_id`),
  CONSTRAINT `role_permission_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`),
  CONSTRAINT `role_permission_ibfk_2` FOREIGN KEY (`permission_id`) REFERENCES `permission` (`permission_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='角色-权限表';

-- ----------------------------
-- Records of role_permission
-- ----------------------------
INSERT INTO `role_permission` VALUES ('1', '1', '1');
INSERT INTO `role_permission` VALUES ('2', '2', '1');

-- ----------------------------
-- Table structure for `staff`
-- ----------------------------
DROP TABLE IF EXISTS `staff`;
CREATE TABLE `staff` (
  `staff_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '员工id',
  `staff_num` char(10) NOT NULL COMMENT '员工工号',
  `staff_name` varchar(20) NOT NULL COMMENT '姓名',
  `role_id` int(11) NOT NULL COMMENT '角色id,引用role表',
  `staff_state` char(2) NOT NULL COMMENT '就职状态:在职/离职',
  `staff_sex` char(1) NOT NULL COMMENT '性别:男/女',
  `staff_native` varchar(100) DEFAULT NULL COMMENT '籍贯',
  `staff_nation` varchar(10) DEFAULT NULL COMMENT '民族',
  `staff_marriage` char(2) DEFAULT NULL COMMENT '婚姻状况:未婚、已婚、离异',
  `staff_address` varchar(200) DEFAULT NULL COMMENT '家庭住址',
  `staff_entry_date` bigint(20) NOT NULL COMMENT '入职日期',
  `staff_id_num` char(18) NOT NULL COMMENT '身份证号',
  `staff_tel` char(11) DEFAULT NULL COMMENT '手机号码',
  `staff_password` varchar(256) NOT NULL COMMENT '密码(经过加密后的)',
  PRIMARY KEY (`staff_id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `staff_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COMMENT='员工表';

-- ----------------------------
-- Records of staff
-- ----------------------------
INSERT INTO `staff` VALUES ('1', '2017070001', '李昕', '1', '在职', '男', null, null, null, null, '1498838400000', '123456789987654321', '18826070000', '123456');
INSERT INTO `staff` VALUES ('2', '2017070002', '吴锡龙', '2', '在职', '男', null, null, null, null, '1498838400000', '123456789987654321', '18826070000', '123456');
INSERT INTO `staff` VALUES ('3', '2017070003', '詹育壕', '2', '在职', '男', null, null, null, null, '1498838400000', '123456789987654321', '18826070000', '123456');
INSERT INTO `staff` VALUES ('4', '2017070004', '李杭樹', '3', '在职', '男', null, null, null, null, '1498838400000', '123456789987654321', '18826070000', '123456');
INSERT INTO `staff` VALUES ('5', '2017070005', '高于钦', '3', '在职', '男', null, null, null, null, '1498838400000', '123456789987654321', '18826070000', '123456');
INSERT INTO `staff` VALUES ('6', '2017070006', '梁耀友', '4', '在职', '男', null, null, null, null, '1498838400000', '123456789987654321', '18826070000', '123456');
INSERT INTO `staff` VALUES ('7', '2017070007', '刘广源', '4', '在职', '男', null, null, null, null, '1498838400000', '123456789987654321', '18826070000', '123456');
INSERT INTO `staff` VALUES ('8', '2017070008', '工厂管理员1', '3', '在职', '男', null, null, null, null, '1498838400000', '123456789987654321', '18826070000', '123456');
INSERT INTO `staff` VALUES ('9', '2017070009', '工厂管理员2', '3', '在职', '男', null, null, null, null, '1498838400000', '123456789987654321', '18826070000', '123456');
INSERT INTO `staff` VALUES ('10', '2017070010', '工厂管理员3', '3', '在职', '男', null, null, null, null, '1498838400000', '123456789987654321', '18826070000', '123456');
INSERT INTO `staff` VALUES ('11', '2017070011', '工厂管理员4', '3', '在职', '男', null, null, null, null, '1498838400000', '123456789987654321', '18826070000', '123456');
INSERT INTO `staff` VALUES ('12', '2017070012', '工厂管理员5', '3', '在职', '男', null, null, null, null, '1498838400000', '123456789987654321', '18826070000', '123456');
INSERT INTO `staff` VALUES ('13', '2017070013', '工厂管理员6', '3', '在职', '男', null, null, null, null, '1498838400000', '123456789987654321', '18826070000', '123456');
INSERT INTO `staff` VALUES ('14', '2017070014', '仓库管理员1', '4', '在职', '男', null, null, null, null, '1498838400000', '123456789987654321', '18826070000', '123456');
INSERT INTO `staff` VALUES ('15', '2017070015', '仓库管理员2', '4', '在职', '男', null, null, null, null, '1498838400000', '123456789987654321', '18826070000', '123456');
INSERT INTO `staff` VALUES ('16', '2017070016', '仓库管理员3', '4', '在职', '男', null, null, null, null, '1498838400000', '123456789987654321', '18826070000', '123456');
INSERT INTO `staff` VALUES ('17', '2017070017', '仓库管理员4', '4', '在职', '男', null, null, null, null, '1498838400000', '123456789987654321', '18826070000', '123456');
INSERT INTO `staff` VALUES ('18', '2017070018', '仓库管理员5', '4', '在职', '男', null, null, null, null, '1498838400000', '123456789987654321', '18826070000', '123456');
INSERT INTO `staff` VALUES ('19', '2017070019', '仓库管理员7', '4', '在职', '男', null, null, null, null, '1498838400000', '123456789987654321', '18826070000', '123456');
INSERT INTO `staff` VALUES ('20', '2017070020', '经理1', '2', '在职', '男', null, null, null, null, '1498838400000', '123456789987654321', '18826070000', '123456');
INSERT INTO `staff` VALUES ('21', '2017070021', '经理2', '2', '在职', '男', null, null, null, null, '1498838400000', '123456789987654321', '18826070000', '123456');

-- ----------------------------
-- Table structure for `warehouse_delivery_record`
-- ----------------------------
DROP TABLE IF EXISTS `warehouse_delivery_record`;
CREATE TABLE `warehouse_delivery_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '仓库配送记录id',
  `delivery_num` char(14) NOT NULL COMMENT '配送编号',
  `staff_id` int(11) NOT NULL COMMENT '登记者id',
  `staff_name` varchar(20) NOT NULL COMMENT '登记者名字',
  `warehouse_order_id` int(11) NOT NULL COMMENT '订单id',
  `delivery_date` bigint(20) NOT NULL COMMENT '配送日期',
  `delivery_quantity` float(9,2) NOT NULL COMMENT '配送量',
  PRIMARY KEY (`id`),
  KEY `staff_id` (`staff_id`),
  KEY `warehouse_order_id` (`warehouse_order_id`),
  CONSTRAINT `warehouse_delivery_record_ibfk_1` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`staff_id`),
  CONSTRAINT `warehouse_delivery_record_ibfk_2` FOREIGN KEY (`warehouse_order_id`) REFERENCES `warehouse_order` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='仓库配送记录';

-- ----------------------------
-- Records of warehouse_delivery_record
-- ----------------------------

-- ----------------------------
-- Table structure for `warehouse_in_storage_record`
-- ----------------------------
DROP TABLE IF EXISTS `warehouse_in_storage_record`;
CREATE TABLE `warehouse_in_storage_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '仓库入仓记录id',
  `in_storage_num` char(14) NOT NULL COMMENT '入库编号',
  `staff_id` int(11) NOT NULL COMMENT '登记者id',
  `staff_name` varchar(20) NOT NULL COMMENT '登记者名字',
  `product_id` int(11) NOT NULL COMMENT '产品id',
  `in_storage_date` bigint(20) NOT NULL COMMENT '入库日期',
  `in_storage_quantity` float(9,2) NOT NULL COMMENT '入库总量',
  PRIMARY KEY (`id`),
  KEY `staff_id` (`staff_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `warehouse_in_storage_record_ibfk_1` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`staff_id`),
  CONSTRAINT `warehouse_in_storage_record_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='仓库入仓记录';

-- ----------------------------
-- Records of warehouse_in_storage_record
-- ----------------------------

-- ----------------------------
-- Table structure for `warehouse_order`
-- ----------------------------
DROP TABLE IF EXISTS `warehouse_order`;
CREATE TABLE `warehouse_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '仓库订单id',
  `order_num` char(14) NOT NULL COMMENT '订单编号',
  `staff_id` int(11) NOT NULL COMMENT '登记者id',
  `staff_name` varchar(20) NOT NULL COMMENT '登记者名字',
  `product_id` int(11) NOT NULL COMMENT '产品id',
  `customer_id` int(11) NOT NULL COMMENT '客户id',
  `order_date` bigint(20) NOT NULL COMMENT '订单日期',
  `delivery_quantity_total` float(9,2) NOT NULL COMMENT '总量',
  `delivery_quantity_need` float(9,2) NOT NULL COMMENT '需配送',
  `unit_price` float(9,2) NOT NULL COMMENT '单价',
  `total_price` float(20,2) NOT NULL COMMENT '总价',
  `order_status` varchar(4) NOT NULL COMMENT '订单状态',
  `delivery_date` bigint(20) NOT NULL COMMENT '送达日期',
  `warehouse_manager_id` int(11) NOT NULL COMMENT '经理id',
  `warehouse_manager_name` varchar(20) NOT NULL COMMENT '经理名字',
  PRIMARY KEY (`id`),
  KEY `staff_id` (`staff_id`),
  KEY `warehouse_manager_id` (`warehouse_manager_id`),
  KEY `product_id` (`product_id`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `warehouse_order_ibfk_1` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`staff_id`),
  CONSTRAINT `warehouse_order_ibfk_2` FOREIGN KEY (`warehouse_manager_id`) REFERENCES `staff` (`staff_id`),
  CONSTRAINT `warehouse_order_ibfk_3` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`),
  CONSTRAINT `warehouse_order_ibfk_4` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='仓库订单';

-- ----------------------------
-- Records of warehouse_order
-- ----------------------------

-- ----------------------------
-- Table structure for `warehouse_product_inventory`
-- ----------------------------
DROP TABLE IF EXISTS `warehouse_product_inventory`;
CREATE TABLE `warehouse_product_inventory` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '仓库库存id',
  `product_id` int(11) NOT NULL COMMENT '产品关联id',
  `product_inventory` float(9,2) NOT NULL DEFAULT '0.00' COMMENT '产品库存',
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `warehouse_product_inventory_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='仓库库存';

-- ----------------------------
-- Records of warehouse_product_inventory
-- ----------------------------
