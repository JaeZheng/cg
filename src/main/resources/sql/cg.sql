/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 5.7.23-0ubuntu0.16.04.1 : Database - cg
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`cg` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `cg`;

/*Table structure for table `blank_record` */

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

/*Data for the table `blank_record` */

/*Table structure for table `blowon_record` */

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

/*Data for the table `blowon_record` */

/*Table structure for table `check_warehouse_others_record` */

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

/*Data for the table `check_warehouse_others_record` */

/*Table structure for table `check_warehouse_product_record` */

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

/*Data for the table `check_warehouse_product_record` */

/*Table structure for table `customer` */

DROP TABLE IF EXISTS `customer`;

CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '客户id',
  `customer_name` varchar(20) NOT NULL COMMENT '客户姓名',
  `customer_phone` char(11) NOT NULL COMMENT '联系方式',
  `customer_address` varchar(200) NOT NULL COMMENT '收货地址',
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='客户信息';

/*Data for the table `customer` */

insert  into `customer`(`customer_id`,`customer_name`,`customer_phone`,`customer_address`) values (1,'客户1','18826077180','C10');
insert  into `customer`(`customer_id`,`customer_name`,`customer_phone`,`customer_address`) values (2,'客户2','18826077180','C10');
insert  into `customer`(`customer_id`,`customer_name`,`customer_phone`,`customer_address`) values (3,'客户3','18826077180','C10');
insert  into `customer`(`customer_id`,`customer_name`,`customer_phone`,`customer_address`) values (4,'客户4','18826077180','C10');
insert  into `customer`(`customer_id`,`customer_name`,`customer_phone`,`customer_address`) values (5,'卢永豪','13802313885','广东番禺大学城');
insert  into `customer`(`customer_id`,`customer_name`,`customer_phone`,`customer_address`) values (6,'吴欣','18813209090','华南理工大学');
insert  into `customer`(`customer_id`,`customer_name`,`customer_phone`,`customer_address`) values (7,'张三','19088888888','体育西路');
insert  into `customer`(`customer_id`,`customer_name`,`customer_phone`,`customer_address`) values (8,'李四','13900002222','体育西路');
insert  into `customer`(`customer_id`,`customer_name`,`customer_phone`,`customer_address`) values (9,'七七','12346578900','七七');
insert  into `customer`(`customer_id`,`customer_name`,`customer_phone`,`customer_address`) values (10,'王五','18813298483','华南理工大学');

/*Table structure for table `factory_out_storage_record` */

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

/*Data for the table `factory_out_storage_record` */

/*Table structure for table `factory_product_inventory` */

DROP TABLE IF EXISTS `factory_product_inventory`;

CREATE TABLE `factory_product_inventory` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '工厂产品库存id',
  `product_id` int(11) NOT NULL COMMENT '产品id',
  `product_inventory` float(9,2) NOT NULL DEFAULT '0.00' COMMENT '库存总量',
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `factory_product_inventory_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='工厂产品库存';

/*Data for the table `factory_product_inventory` */

insert  into `factory_product_inventory`(`id`,`product_id`,`product_inventory`) values (1,1,0.00);
insert  into `factory_product_inventory`(`id`,`product_id`,`product_inventory`) values (2,2,0.00);
insert  into `factory_product_inventory`(`id`,`product_id`,`product_inventory`) values (3,3,0.00);

/*Table structure for table `material` */

DROP TABLE IF EXISTS `material`;

CREATE TABLE `material` (
  `material_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '原料id',
  `material_class` char(1) NOT NULL COMMENT '原料种类',
  `material_inventory` float(7,2) NOT NULL DEFAULT '0.00' COMMENT '原料库存,单位:千克',
  PRIMARY KEY (`material_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='原料表';

/*Data for the table `material` */

insert  into `material`(`material_id`,`material_class`,`material_inventory`) values (1,'银',120.00);
insert  into `material`(`material_id`,`material_class`,`material_inventory`) values (2,'铜',1102.35);
insert  into `material`(`material_id`,`material_class`,`material_inventory`) values (3,'锌',101.23);
insert  into `material`(`material_id`,`material_class`,`material_inventory`) values (4,'镉',121.56);
insert  into `material`(`material_id`,`material_class`,`material_inventory`) values (5,'锡',100.00);

/*Table structure for table `material_purchase_record` */

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
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8 COMMENT='原料采购记录';

/*Data for the table `material_purchase_record` */

insert  into `material_purchase_record`(`id`,`material_id`,`staff_id`,`staff_name`,`purchase_num`,`purchase_date`,`purchase_quantity`,`unit_price`,`total_price`) values (1,1,3,'詹育壕','GR201707010001',1498838400000,10.00,1.00,10.00);
insert  into `material_purchase_record`(`id`,`material_id`,`staff_id`,`staff_name`,`purchase_num`,`purchase_date`,`purchase_quantity`,`unit_price`,`total_price`) values (2,1,3,'詹育壕','GR201707010002',1498838400000,10.00,1.00,10.00);
insert  into `material_purchase_record`(`id`,`material_id`,`staff_id`,`staff_name`,`purchase_num`,`purchase_date`,`purchase_quantity`,`unit_price`,`total_price`) values (3,1,3,'詹育壕','GR201707010003',1498838400000,10.00,1.00,10.00);
insert  into `material_purchase_record`(`id`,`material_id`,`staff_id`,`staff_name`,`purchase_num`,`purchase_date`,`purchase_quantity`,`unit_price`,`total_price`) values (4,1,3,'詹育壕','GR201707010004',1498838400000,10.00,1.00,10.00);
insert  into `material_purchase_record`(`id`,`material_id`,`staff_id`,`staff_name`,`purchase_num`,`purchase_date`,`purchase_quantity`,`unit_price`,`total_price`) values (5,1,3,'詹育壕','GR201707010005',1498838400000,10.00,1.00,10.00);
insert  into `material_purchase_record`(`id`,`material_id`,`staff_id`,`staff_name`,`purchase_num`,`purchase_date`,`purchase_quantity`,`unit_price`,`total_price`) values (6,1,3,'詹育壕','GR201707010006',1498838400000,10.00,1.00,10.00);
insert  into `material_purchase_record`(`id`,`material_id`,`staff_id`,`staff_name`,`purchase_num`,`purchase_date`,`purchase_quantity`,`unit_price`,`total_price`) values (7,1,3,'詹育壕','GR201707010007',1498838400000,10.00,1.00,10.00);
insert  into `material_purchase_record`(`id`,`material_id`,`staff_id`,`staff_name`,`purchase_num`,`purchase_date`,`purchase_quantity`,`unit_price`,`total_price`) values (8,1,3,'詹育壕','GR201707010008',1498838400000,10.00,1.00,10.00);
insert  into `material_purchase_record`(`id`,`material_id`,`staff_id`,`staff_name`,`purchase_num`,`purchase_date`,`purchase_quantity`,`unit_price`,`total_price`) values (9,1,3,'詹育壕','GR201707010009',1498838400000,10.00,1.00,10.00);
insert  into `material_purchase_record`(`id`,`material_id`,`staff_id`,`staff_name`,`purchase_num`,`purchase_date`,`purchase_quantity`,`unit_price`,`total_price`) values (10,1,3,'詹育壕','GR201707010010',1498838400000,10.00,1.00,10.00);
insert  into `material_purchase_record`(`id`,`material_id`,`staff_id`,`staff_name`,`purchase_num`,`purchase_date`,`purchase_quantity`,`unit_price`,`total_price`) values (11,2,3,'詹育壕','GR201707010011',1498838400000,10.00,1.00,10.00);
insert  into `material_purchase_record`(`id`,`material_id`,`staff_id`,`staff_name`,`purchase_num`,`purchase_date`,`purchase_quantity`,`unit_price`,`total_price`) values (12,2,3,'詹育壕','GR201707010012',1498838400000,10.00,1.00,10.00);
insert  into `material_purchase_record`(`id`,`material_id`,`staff_id`,`staff_name`,`purchase_num`,`purchase_date`,`purchase_quantity`,`unit_price`,`total_price`) values (13,2,3,'詹育壕','GR201707010013',1498838400000,10.00,1.00,10.00);
insert  into `material_purchase_record`(`id`,`material_id`,`staff_id`,`staff_name`,`purchase_num`,`purchase_date`,`purchase_quantity`,`unit_price`,`total_price`) values (14,2,3,'詹育壕','GR201707010014',1498838400000,10.00,1.00,10.00);
insert  into `material_purchase_record`(`id`,`material_id`,`staff_id`,`staff_name`,`purchase_num`,`purchase_date`,`purchase_quantity`,`unit_price`,`total_price`) values (15,2,3,'詹育壕','GR201707010015',1498838400000,10.00,1.00,10.00);
insert  into `material_purchase_record`(`id`,`material_id`,`staff_id`,`staff_name`,`purchase_num`,`purchase_date`,`purchase_quantity`,`unit_price`,`total_price`) values (16,2,3,'詹育壕','GR201707010016',1498838400000,10.00,1.00,10.00);
insert  into `material_purchase_record`(`id`,`material_id`,`staff_id`,`staff_name`,`purchase_num`,`purchase_date`,`purchase_quantity`,`unit_price`,`total_price`) values (17,2,3,'詹育壕','GR201707010017',1498838400000,10.00,1.00,10.00);
insert  into `material_purchase_record`(`id`,`material_id`,`staff_id`,`staff_name`,`purchase_num`,`purchase_date`,`purchase_quantity`,`unit_price`,`total_price`) values (18,2,3,'詹育壕','GR201707010018',1498838400000,10.00,1.00,10.00);
insert  into `material_purchase_record`(`id`,`material_id`,`staff_id`,`staff_name`,`purchase_num`,`purchase_date`,`purchase_quantity`,`unit_price`,`total_price`) values (19,2,3,'詹育壕','GR201707010019',1498838400000,10.00,1.00,10.00);
insert  into `material_purchase_record`(`id`,`material_id`,`staff_id`,`staff_name`,`purchase_num`,`purchase_date`,`purchase_quantity`,`unit_price`,`total_price`) values (20,2,3,'詹育壕','GR201707010020',1498838400000,10.00,1.00,10.00);
insert  into `material_purchase_record`(`id`,`material_id`,`staff_id`,`staff_name`,`purchase_num`,`purchase_date`,`purchase_quantity`,`unit_price`,`total_price`) values (21,3,3,'詹育壕','GR201707010021',1498838400000,10.00,1.00,10.00);
insert  into `material_purchase_record`(`id`,`material_id`,`staff_id`,`staff_name`,`purchase_num`,`purchase_date`,`purchase_quantity`,`unit_price`,`total_price`) values (22,3,3,'詹育壕','GR201707010022',1498838400000,10.00,1.00,10.00);
insert  into `material_purchase_record`(`id`,`material_id`,`staff_id`,`staff_name`,`purchase_num`,`purchase_date`,`purchase_quantity`,`unit_price`,`total_price`) values (23,3,3,'詹育壕','GR201707010023',1498838400000,10.00,1.00,10.00);
insert  into `material_purchase_record`(`id`,`material_id`,`staff_id`,`staff_name`,`purchase_num`,`purchase_date`,`purchase_quantity`,`unit_price`,`total_price`) values (24,3,3,'詹育壕','GR201707010024',1498838400000,10.00,1.00,10.00);
insert  into `material_purchase_record`(`id`,`material_id`,`staff_id`,`staff_name`,`purchase_num`,`purchase_date`,`purchase_quantity`,`unit_price`,`total_price`) values (25,3,3,'詹育壕','GR201707010025',1498838400000,10.00,1.00,10.00);
insert  into `material_purchase_record`(`id`,`material_id`,`staff_id`,`staff_name`,`purchase_num`,`purchase_date`,`purchase_quantity`,`unit_price`,`total_price`) values (26,3,3,'詹育壕','GR201707010026',1498838400000,10.00,1.00,10.00);
insert  into `material_purchase_record`(`id`,`material_id`,`staff_id`,`staff_name`,`purchase_num`,`purchase_date`,`purchase_quantity`,`unit_price`,`total_price`) values (27,3,3,'詹育壕','GR201707010027',1498838400000,10.00,1.00,10.00);
insert  into `material_purchase_record`(`id`,`material_id`,`staff_id`,`staff_name`,`purchase_num`,`purchase_date`,`purchase_quantity`,`unit_price`,`total_price`) values (28,3,3,'詹育壕','GR201707010028',1498838400000,10.00,1.00,10.00);
insert  into `material_purchase_record`(`id`,`material_id`,`staff_id`,`staff_name`,`purchase_num`,`purchase_date`,`purchase_quantity`,`unit_price`,`total_price`) values (29,3,3,'詹育壕','GR201707010029',1498838400000,10.00,1.00,10.00);
insert  into `material_purchase_record`(`id`,`material_id`,`staff_id`,`staff_name`,`purchase_num`,`purchase_date`,`purchase_quantity`,`unit_price`,`total_price`) values (30,3,3,'詹育壕','GR201707010030',1498838400000,10.00,1.00,10.00);
insert  into `material_purchase_record`(`id`,`material_id`,`staff_id`,`staff_name`,`purchase_num`,`purchase_date`,`purchase_quantity`,`unit_price`,`total_price`) values (31,4,3,'詹育壕','GR201707010031',1498838400000,10.00,1.00,10.00);
insert  into `material_purchase_record`(`id`,`material_id`,`staff_id`,`staff_name`,`purchase_num`,`purchase_date`,`purchase_quantity`,`unit_price`,`total_price`) values (32,4,3,'詹育壕','GR201707010032',1498838400000,10.00,1.00,10.00);
insert  into `material_purchase_record`(`id`,`material_id`,`staff_id`,`staff_name`,`purchase_num`,`purchase_date`,`purchase_quantity`,`unit_price`,`total_price`) values (33,4,3,'詹育壕','GR201707010033',1498838400000,10.00,1.00,10.00);
insert  into `material_purchase_record`(`id`,`material_id`,`staff_id`,`staff_name`,`purchase_num`,`purchase_date`,`purchase_quantity`,`unit_price`,`total_price`) values (34,4,3,'詹育壕','GR201707010034',1498838400000,10.00,1.00,10.00);
insert  into `material_purchase_record`(`id`,`material_id`,`staff_id`,`staff_name`,`purchase_num`,`purchase_date`,`purchase_quantity`,`unit_price`,`total_price`) values (35,4,3,'詹育壕','GR201707010035',1498838400000,10.00,1.00,10.00);
insert  into `material_purchase_record`(`id`,`material_id`,`staff_id`,`staff_name`,`purchase_num`,`purchase_date`,`purchase_quantity`,`unit_price`,`total_price`) values (36,4,3,'詹育壕','GR201707010036',1498838400000,10.00,1.00,10.00);
insert  into `material_purchase_record`(`id`,`material_id`,`staff_id`,`staff_name`,`purchase_num`,`purchase_date`,`purchase_quantity`,`unit_price`,`total_price`) values (37,4,3,'詹育壕','GR201707010037',1498838400000,10.00,1.00,10.00);
insert  into `material_purchase_record`(`id`,`material_id`,`staff_id`,`staff_name`,`purchase_num`,`purchase_date`,`purchase_quantity`,`unit_price`,`total_price`) values (38,4,3,'詹育壕','GR201707010038',1498838400000,10.00,1.00,10.00);
insert  into `material_purchase_record`(`id`,`material_id`,`staff_id`,`staff_name`,`purchase_num`,`purchase_date`,`purchase_quantity`,`unit_price`,`total_price`) values (39,4,3,'詹育壕','GR201707010039',1498838400000,10.00,1.00,10.00);
insert  into `material_purchase_record`(`id`,`material_id`,`staff_id`,`staff_name`,`purchase_num`,`purchase_date`,`purchase_quantity`,`unit_price`,`total_price`) values (40,4,3,'詹育壕','GR201707010040',1498838400000,10.00,1.00,10.00);
insert  into `material_purchase_record`(`id`,`material_id`,`staff_id`,`staff_name`,`purchase_num`,`purchase_date`,`purchase_quantity`,`unit_price`,`total_price`) values (41,5,3,'詹育壕','GR201707010041',1498838400000,10.00,1.00,10.00);
insert  into `material_purchase_record`(`id`,`material_id`,`staff_id`,`staff_name`,`purchase_num`,`purchase_date`,`purchase_quantity`,`unit_price`,`total_price`) values (42,5,3,'詹育壕','GR201707010042',1498838400000,10.00,1.00,10.00);
insert  into `material_purchase_record`(`id`,`material_id`,`staff_id`,`staff_name`,`purchase_num`,`purchase_date`,`purchase_quantity`,`unit_price`,`total_price`) values (43,5,3,'詹育壕','GR201707010043',1498838400000,10.00,1.00,10.00);
insert  into `material_purchase_record`(`id`,`material_id`,`staff_id`,`staff_name`,`purchase_num`,`purchase_date`,`purchase_quantity`,`unit_price`,`total_price`) values (44,5,3,'詹育壕','GR201707010044',1498838400000,10.00,1.00,10.00);
insert  into `material_purchase_record`(`id`,`material_id`,`staff_id`,`staff_name`,`purchase_num`,`purchase_date`,`purchase_quantity`,`unit_price`,`total_price`) values (45,5,3,'詹育壕','GR201707010045',1498838400000,10.00,1.00,10.00);
insert  into `material_purchase_record`(`id`,`material_id`,`staff_id`,`staff_name`,`purchase_num`,`purchase_date`,`purchase_quantity`,`unit_price`,`total_price`) values (46,5,3,'詹育壕','GR201707010046',1498838400000,10.00,1.00,10.00);
insert  into `material_purchase_record`(`id`,`material_id`,`staff_id`,`staff_name`,`purchase_num`,`purchase_date`,`purchase_quantity`,`unit_price`,`total_price`) values (47,5,3,'詹育壕','GR201707010047',1498838400000,10.00,1.00,10.00);
insert  into `material_purchase_record`(`id`,`material_id`,`staff_id`,`staff_name`,`purchase_num`,`purchase_date`,`purchase_quantity`,`unit_price`,`total_price`) values (48,5,3,'詹育壕','GR201707010048',1498838400000,10.00,1.00,10.00);
insert  into `material_purchase_record`(`id`,`material_id`,`staff_id`,`staff_name`,`purchase_num`,`purchase_date`,`purchase_quantity`,`unit_price`,`total_price`) values (49,5,3,'詹育壕','GR201707010049',1498838400000,10.00,1.00,10.00);
insert  into `material_purchase_record`(`id`,`material_id`,`staff_id`,`staff_name`,`purchase_num`,`purchase_date`,`purchase_quantity`,`unit_price`,`total_price`) values (50,5,3,'詹育壕','GR201707010050',1498838400000,10.00,1.00,10.00);
insert  into `material_purchase_record`(`id`,`material_id`,`staff_id`,`staff_name`,`purchase_num`,`purchase_date`,`purchase_quantity`,`unit_price`,`total_price`) values (51,1,1,'郑昌萌','GR201811010001',1541030400000,20.00,101.00,2020.00);
insert  into `material_purchase_record`(`id`,`material_id`,`staff_id`,`staff_name`,`purchase_num`,`purchase_date`,`purchase_quantity`,`unit_price`,`total_price`) values (52,4,1,'郑昌萌','GR201811050001',1541376000000,20.00,15.00,300.00);
insert  into `material_purchase_record`(`id`,`material_id`,`staff_id`,`staff_name`,`purchase_num`,`purchase_date`,`purchase_quantity`,`unit_price`,`total_price`) values (53,2,1,'郑昌萌','GR201811020001',1541116800000,1.12,1.12,1.26);
insert  into `material_purchase_record`(`id`,`material_id`,`staff_id`,`staff_name`,`purchase_num`,`purchase_date`,`purchase_quantity`,`unit_price`,`total_price`) values (54,2,1,'郑昌萌','GR201811070001',1541548800000,1000.00,100.00,100000.00);
insert  into `material_purchase_record`(`id`,`material_id`,`staff_id`,`staff_name`,`purchase_num`,`purchase_date`,`purchase_quantity`,`unit_price`,`total_price`) values (55,4,1,'郑昌萌','GR201811060002',1541462400000,1.56,2.37,3.71);
insert  into `material_purchase_record`(`id`,`material_id`,`staff_id`,`staff_name`,`purchase_num`,`purchase_date`,`purchase_quantity`,`unit_price`,`total_price`) values (56,3,1,'郑昌萌','GR201811080001',1541635200000,1.23,123.11,151.43);
insert  into `material_purchase_record`(`id`,`material_id`,`staff_id`,`staff_name`,`purchase_num`,`purchase_date`,`purchase_quantity`,`unit_price`,`total_price`) values (57,2,1,'郑昌萌','GR201811070003',1541548800000,1.23,123.10,151.41);

/*Table structure for table `permission` */

DROP TABLE IF EXISTS `permission`;

CREATE TABLE `permission` (
  `permission_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '权限id',
  `permission_name` varchar(100) NOT NULL COMMENT '权限名',
  `permission_description` varchar(100) NOT NULL COMMENT '权限描述',
  PRIMARY KEY (`permission_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='权限表';

/*Data for the table `permission` */

insert  into `permission`(`permission_id`,`permission_name`,`permission_description`) values (1,'staff:all','员工管理权限');
insert  into `permission`(`permission_id`,`permission_name`,`permission_description`) values (2,'warehouseOrder:read','仓库管理员读权限');
insert  into `permission`(`permission_id`,`permission_name`,`permission_description`) values (3,'warehouseOrder','仓库管理员全部权限');
insert  into `permission`(`permission_id`,`permission_name`,`permission_description`) values (4,'materialPurchaseRecord:read','原料采购读权限');
insert  into `permission`(`permission_id`,`permission_name`,`permission_description`) values (5,'materialPurchaseRecord:all','原料采购所有权限');
insert  into `permission`(`permission_id`,`permission_name`,`permission_description`) values (6,'productModelInfo:create','添加产品型号权限');
insert  into `permission`(`permission_id`,`permission_name`,`permission_description`) values (7,'productModelInfo:read','查询产品型号权限');

/*Table structure for table `product` */

DROP TABLE IF EXISTS `product`;

CREATE TABLE `product` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '产品id',
  `product_model_info_id` int(11) NOT NULL COMMENT '产品型号id',
  `product_size` varchar(100) NOT NULL COMMENT '产品规格 长*宽*厚',
  `product_shape` char(1) NOT NULL COMMENT '产品形态:直/弯',
  PRIMARY KEY (`product_id`),
  KEY `product_model_info_id` (`product_model_info_id`),
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`product_model_info_id`) REFERENCES `product_model_info` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='产品';

/*Data for the table `product` */

insert  into `product`(`product_id`,`product_model_info_id`,`product_size`,`product_shape`) values (1,1,'1.0*1.0*1.0','直');
insert  into `product`(`product_id`,`product_model_info_id`,`product_size`,`product_shape`) values (2,1,'0.1*0.1*0.1','弯');
insert  into `product`(`product_id`,`product_model_info_id`,`product_size`,`product_shape`) values (3,1,'0.1*0.2*0.1','弯');

/*Table structure for table `product_model_info` */

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='产品型号信息';

/*Data for the table `product_model_info` */

insert  into `product_model_info`(`id`,`staff_id`,`staff_name`,`product_model`,`add_date`,`ratio_ag`,`ratio_cu`,`ratio_zn`,`ratio_cd`,`ratio_sn`) values (1,1,'郑昌萌','G05',1541376000000,80.00,0.00,0.00,20.00,0.00);

/*Table structure for table `product_produce` */

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

/*Data for the table `product_produce` */

/*Table structure for table `role` */

DROP TABLE IF EXISTS `role`;

CREATE TABLE `role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色id',
  `role_name` varchar(100) NOT NULL COMMENT '角色名',
  `role_description` varchar(100) NOT NULL COMMENT '角色描述',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='角色表';

/*Data for the table `role` */

insert  into `role`(`role_id`,`role_name`,`role_description`) values (1,'GM','总经理');
insert  into `role`(`role_id`,`role_name`,`role_description`) values (2,'manager','经理');
insert  into `role`(`role_id`,`role_name`,`role_description`) values (3,'FM','工厂管理员');
insert  into `role`(`role_id`,`role_name`,`role_description`) values (4,'WM','仓库管理员');

/*Table structure for table `role_permission` */

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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='角色-权限表';

/*Data for the table `role_permission` */

insert  into `role_permission`(`id`,`role_id`,`permission_id`) values (0,1,2);
insert  into `role_permission`(`id`,`role_id`,`permission_id`) values (1,1,1);
insert  into `role_permission`(`id`,`role_id`,`permission_id`) values (2,2,1);
insert  into `role_permission`(`id`,`role_id`,`permission_id`) values (3,1,3);
insert  into `role_permission`(`id`,`role_id`,`permission_id`) values (4,1,4);
insert  into `role_permission`(`id`,`role_id`,`permission_id`) values (5,1,5);
insert  into `role_permission`(`id`,`role_id`,`permission_id`) values (6,1,6);
insert  into `role_permission`(`id`,`role_id`,`permission_id`) values (7,1,7);

/*Table structure for table `staff` */

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
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COMMENT='员工表';

/*Data for the table `staff` */

insert  into `staff`(`staff_id`,`staff_num`,`staff_name`,`role_id`,`staff_state`,`staff_sex`,`staff_native`,`staff_nation`,`staff_marriage`,`staff_address`,`staff_entry_date`,`staff_id_num`,`staff_tel`,`staff_password`) values (1,'2017070001','郑昌萌',1,'在职','男','福建泉州','汉族','未婚','广东番禺达隆湾',1498838400000,'123456789987654321','18826070001','123456');
insert  into `staff`(`staff_id`,`staff_num`,`staff_name`,`role_id`,`staff_state`,`staff_sex`,`staff_native`,`staff_nation`,`staff_marriage`,`staff_address`,`staff_entry_date`,`staff_id_num`,`staff_tel`,`staff_password`) values (2,'2017070002','卢永豪',2,'在职','男','未填','未填',NULL,'未填',1498838400000,'123456789987654321','18826070001','123456');
insert  into `staff`(`staff_id`,`staff_num`,`staff_name`,`role_id`,`staff_state`,`staff_sex`,`staff_native`,`staff_nation`,`staff_marriage`,`staff_address`,`staff_entry_date`,`staff_id_num`,`staff_tel`,`staff_password`) values (3,'2017070003','吴昕',2,'在职','男','未填','未填',NULL,'C10-312',1498838400000,'123456789987654321','18826070000','123456');
insert  into `staff`(`staff_id`,`staff_num`,`staff_name`,`role_id`,`staff_state`,`staff_sex`,`staff_native`,`staff_nation`,`staff_marriage`,`staff_address`,`staff_entry_date`,`staff_id_num`,`staff_tel`,`staff_password`) values (4,'2017070004','何文栋',3,'在职','男',NULL,NULL,NULL,NULL,1498838400000,'123456789987654321','18826070000','123456');
insert  into `staff`(`staff_id`,`staff_num`,`staff_name`,`role_id`,`staff_state`,`staff_sex`,`staff_native`,`staff_nation`,`staff_marriage`,`staff_address`,`staff_entry_date`,`staff_id_num`,`staff_tel`,`staff_password`) values (5,'2017070005','李纯如',3,'在职','男','未填','未填',NULL,'未填',1498838400000,'123456789987654321','18826071111','123456');
insert  into `staff`(`staff_id`,`staff_num`,`staff_name`,`role_id`,`staff_state`,`staff_sex`,`staff_native`,`staff_nation`,`staff_marriage`,`staff_address`,`staff_entry_date`,`staff_id_num`,`staff_tel`,`staff_password`) values (6,'2017070006','詹茁',4,'在职','男',NULL,NULL,NULL,NULL,1498838400000,'123456789987654321','18826070000','123456');
insert  into `staff`(`staff_id`,`staff_num`,`staff_name`,`role_id`,`staff_state`,`staff_sex`,`staff_native`,`staff_nation`,`staff_marriage`,`staff_address`,`staff_entry_date`,`staff_id_num`,`staff_tel`,`staff_password`) values (7,'2017070007','刘广源',4,'在职','男','广东广州','汉族','未婚','华南理工大学c14-312',1498838400000,'123456789987654321','18826078888','123456');
insert  into `staff`(`staff_id`,`staff_num`,`staff_name`,`role_id`,`staff_state`,`staff_sex`,`staff_native`,`staff_nation`,`staff_marriage`,`staff_address`,`staff_entry_date`,`staff_id_num`,`staff_tel`,`staff_password`) values (8,'2017070008','工厂管理员1',3,'在职','男','未填','未填',NULL,'C12',1498838400000,'123456789987654321','18826070000','123456');
insert  into `staff`(`staff_id`,`staff_num`,`staff_name`,`role_id`,`staff_state`,`staff_sex`,`staff_native`,`staff_nation`,`staff_marriage`,`staff_address`,`staff_entry_date`,`staff_id_num`,`staff_tel`,`staff_password`) values (9,'2017070009','工厂管理员2',3,'在职','男',NULL,NULL,NULL,NULL,1498838400000,'123456789987654321','18826070000','123456');
insert  into `staff`(`staff_id`,`staff_num`,`staff_name`,`role_id`,`staff_state`,`staff_sex`,`staff_native`,`staff_nation`,`staff_marriage`,`staff_address`,`staff_entry_date`,`staff_id_num`,`staff_tel`,`staff_password`) values (10,'2017070010','工厂管理员3',3,'在职','男',NULL,NULL,NULL,NULL,1498838400000,'123456789987654321','18826070000','123456');
insert  into `staff`(`staff_id`,`staff_num`,`staff_name`,`role_id`,`staff_state`,`staff_sex`,`staff_native`,`staff_nation`,`staff_marriage`,`staff_address`,`staff_entry_date`,`staff_id_num`,`staff_tel`,`staff_password`) values (11,'2017070011','工厂管理员4',3,'在职','男',NULL,NULL,NULL,NULL,1498838400000,'123456789987654321','18826070000','123456');
insert  into `staff`(`staff_id`,`staff_num`,`staff_name`,`role_id`,`staff_state`,`staff_sex`,`staff_native`,`staff_nation`,`staff_marriage`,`staff_address`,`staff_entry_date`,`staff_id_num`,`staff_tel`,`staff_password`) values (12,'2017070012','工厂管理员5',3,'在职','男',NULL,NULL,NULL,NULL,1498838400000,'123456789987654321','18826070000','123456');
insert  into `staff`(`staff_id`,`staff_num`,`staff_name`,`role_id`,`staff_state`,`staff_sex`,`staff_native`,`staff_nation`,`staff_marriage`,`staff_address`,`staff_entry_date`,`staff_id_num`,`staff_tel`,`staff_password`) values (13,'2017070013','工厂管理员6',3,'在职','男',NULL,NULL,NULL,NULL,1498838400000,'123456789987654321','18826070000','123456');
insert  into `staff`(`staff_id`,`staff_num`,`staff_name`,`role_id`,`staff_state`,`staff_sex`,`staff_native`,`staff_nation`,`staff_marriage`,`staff_address`,`staff_entry_date`,`staff_id_num`,`staff_tel`,`staff_password`) values (14,'2017070014','仓库管理员1',4,'在职','男',NULL,NULL,NULL,NULL,1498838400000,'123456789987654321','18826070000','123456');
insert  into `staff`(`staff_id`,`staff_num`,`staff_name`,`role_id`,`staff_state`,`staff_sex`,`staff_native`,`staff_nation`,`staff_marriage`,`staff_address`,`staff_entry_date`,`staff_id_num`,`staff_tel`,`staff_password`) values (15,'2017070015','仓库管理员2',4,'在职','男',NULL,NULL,NULL,NULL,1498838400000,'123456789987654321','18826070000','123456');
insert  into `staff`(`staff_id`,`staff_num`,`staff_name`,`role_id`,`staff_state`,`staff_sex`,`staff_native`,`staff_nation`,`staff_marriage`,`staff_address`,`staff_entry_date`,`staff_id_num`,`staff_tel`,`staff_password`) values (16,'2017070016','仓库管理员3',4,'在职','男',NULL,NULL,NULL,NULL,1498838400000,'123456789987654321','18826070000','123456');
insert  into `staff`(`staff_id`,`staff_num`,`staff_name`,`role_id`,`staff_state`,`staff_sex`,`staff_native`,`staff_nation`,`staff_marriage`,`staff_address`,`staff_entry_date`,`staff_id_num`,`staff_tel`,`staff_password`) values (17,'2017070017','仓库管理员4',4,'在职','男','未填','未填',NULL,'未填',1498838400000,'123456789987654321','18826070000','123456');
insert  into `staff`(`staff_id`,`staff_num`,`staff_name`,`role_id`,`staff_state`,`staff_sex`,`staff_native`,`staff_nation`,`staff_marriage`,`staff_address`,`staff_entry_date`,`staff_id_num`,`staff_tel`,`staff_password`) values (18,'2017070018','仓库管理员5',4,'在职','男',NULL,NULL,NULL,NULL,1498838400000,'123456789987654321','18826070000','123456');
insert  into `staff`(`staff_id`,`staff_num`,`staff_name`,`role_id`,`staff_state`,`staff_sex`,`staff_native`,`staff_nation`,`staff_marriage`,`staff_address`,`staff_entry_date`,`staff_id_num`,`staff_tel`,`staff_password`) values (19,'2017070019','仓库管理员7',4,'在职','男',NULL,NULL,NULL,NULL,1498838400000,'123456789987654321','18826070000','123456');
insert  into `staff`(`staff_id`,`staff_num`,`staff_name`,`role_id`,`staff_state`,`staff_sex`,`staff_native`,`staff_nation`,`staff_marriage`,`staff_address`,`staff_entry_date`,`staff_id_num`,`staff_tel`,`staff_password`) values (20,'2017070020','杜育明',2,'在职','男',NULL,NULL,NULL,NULL,1498838400000,'123456789987654321','18826070000','123456');
insert  into `staff`(`staff_id`,`staff_num`,`staff_name`,`role_id`,`staff_state`,`staff_sex`,`staff_native`,`staff_nation`,`staff_marriage`,`staff_address`,`staff_entry_date`,`staff_id_num`,`staff_tel`,`staff_password`) values (21,'2017070021','曹奕飞',2,'在职','男',NULL,NULL,NULL,NULL,1498838400000,'123456789987654321','18826070000','123456');
insert  into `staff`(`staff_id`,`staff_num`,`staff_name`,`role_id`,`staff_state`,`staff_sex`,`staff_native`,`staff_nation`,`staff_marriage`,`staff_address`,`staff_entry_date`,`staff_id_num`,`staff_tel`,`staff_password`) values (22,'2018090001','郑家伟',2,'在职','男','广东广州','汉族','未婚','华南理工大学c14-312',1536192000000,'445202199901013051','18826077396','013051');
insert  into `staff`(`staff_id`,`staff_num`,`staff_name`,`role_id`,`staff_state`,`staff_sex`,`staff_native`,`staff_nation`,`staff_marriage`,`staff_address`,`staff_entry_date`,`staff_id_num`,`staff_tel`,`staff_password`) values (23,'2018110001','Nick',3,'在职','男','','','未婚','',1541548800000,'440044004400440011','12345678900','440011');
insert  into `staff`(`staff_id`,`staff_num`,`staff_name`,`role_id`,`staff_state`,`staff_sex`,`staff_native`,`staff_nation`,`staff_marriage`,`staff_address`,`staff_entry_date`,`staff_id_num`,`staff_tel`,`staff_password`) values (24,'2018110002','nicka',4,'离职','女','广州','汉族','已婚','广州',1541030400000,'123465489651321654','12345678900','321654');
insert  into `staff`(`staff_id`,`staff_num`,`staff_name`,`role_id`,`staff_state`,`staff_sex`,`staff_native`,`staff_nation`,`staff_marriage`,`staff_address`,`staff_entry_date`,`staff_id_num`,`staff_tel`,`staff_password`) values (25,'2018110003','六六',3,'离职','女','','','离异','',1541462400000,'123456789000001232','12345678900','001232');
insert  into `staff`(`staff_id`,`staff_num`,`staff_name`,`role_id`,`staff_state`,`staff_sex`,`staff_native`,`staff_nation`,`staff_marriage`,`staff_address`,`staff_entry_date`,`staff_id_num`,`staff_tel`,`staff_password`) values (26,'2018110004','七七',4,'离职','男','奥术大师1','代我去二','已婚','撒旦 ',1541462400000,'123465132465113214','12468945154','113214');
insert  into `staff`(`staff_id`,`staff_num`,`staff_name`,`role_id`,`staff_state`,`staff_sex`,`staff_native`,`staff_nation`,`staff_marriage`,`staff_address`,`staff_entry_date`,`staff_id_num`,`staff_tel`,`staff_password`) values (27,'2018110005','卢永豪啊',3,'在职','男','广州市','汉族','已婚','天河区',1541548800000,'361818987654327687','18813298484','327687');
insert  into `staff`(`staff_id`,`staff_num`,`staff_name`,`role_id`,`staff_state`,`staff_sex`,`staff_native`,`staff_nation`,`staff_marriage`,`staff_address`,`staff_entry_date`,`staff_id_num`,`staff_tel`,`staff_password`) values (28,'2018110006','吴欣',3,'在职','男','广州市','汉族','已婚','广州市',1541548800000,'362429199606064318','18813298487','064318');
insert  into `staff`(`staff_id`,`staff_num`,`staff_name`,`role_id`,`staff_state`,`staff_sex`,`staff_native`,`staff_nation`,`staff_marriage`,`staff_address`,`staff_entry_date`,`staff_id_num`,`staff_tel`,`staff_password`) values (29,'2018110007','张三',2,'在职','男','广东广州','汉','未婚','C11',1541721600000,'888888888888888888','13920009999','888888');

/*Table structure for table `warehouse_delivery_record` */

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

/*Data for the table `warehouse_delivery_record` */

/*Table structure for table `warehouse_in_storage_record` */

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

/*Data for the table `warehouse_in_storage_record` */

/*Table structure for table `warehouse_order` */

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='仓库订单';

/*Data for the table `warehouse_order` */

insert  into `warehouse_order`(`id`,`order_num`,`staff_id`,`staff_name`,`product_id`,`customer_id`,`order_date`,`delivery_quantity_total`,`delivery_quantity_need`,`unit_price`,`total_price`,`order_status`,`delivery_date`,`warehouse_manager_id`,`warehouse_manager_name`) values (1,'XS201811050001',1,'郑昌萌',1,5,1541376000000,200.00,200.00,10.00,2000.00,'未配送',1541894400000,7,'刘广源');
insert  into `warehouse_order`(`id`,`order_num`,`staff_id`,`staff_name`,`product_id`,`customer_id`,`order_date`,`delivery_quantity_total`,`delivery_quantity_need`,`unit_price`,`total_price`,`order_status`,`delivery_date`,`warehouse_manager_id`,`warehouse_manager_name`) values (2,'XS201811060001',1,'郑昌萌',2,6,1541462400000,11.21,11.21,11.21,125.65,'未配送',1542326400000,6,'詹茁');
insert  into `warehouse_order`(`id`,`order_num`,`staff_id`,`staff_name`,`product_id`,`customer_id`,`order_date`,`delivery_quantity_total`,`delivery_quantity_need`,`unit_price`,`total_price`,`order_status`,`delivery_date`,`warehouse_manager_id`,`warehouse_manager_name`) values (3,'XS201811070001',1,'郑昌萌',1,7,1541548800000,1099.00,1099.00,123.00,135177.00,'未配送',1543536000000,7,'刘广源');
insert  into `warehouse_order`(`id`,`order_num`,`staff_id`,`staff_name`,`product_id`,`customer_id`,`order_date`,`delivery_quantity_total`,`delivery_quantity_need`,`unit_price`,`total_price`,`order_status`,`delivery_date`,`warehouse_manager_id`,`warehouse_manager_name`) values (4,'XS201811070002',1,'郑昌萌',1,8,1541548800000,10.00,10.00,1000.00,10000.00,'未配送',1542844800000,14,'仓库管理员1');
insert  into `warehouse_order`(`id`,`order_num`,`staff_id`,`staff_name`,`product_id`,`customer_id`,`order_date`,`delivery_quantity_total`,`delivery_quantity_need`,`unit_price`,`total_price`,`order_status`,`delivery_date`,`warehouse_manager_id`,`warehouse_manager_name`) values (5,'XS201811010001',1,'郑昌萌',2,9,1541030400000,1.24,1.24,12.33,15.23,'未配送',1542240000000,24,'nicka');
insert  into `warehouse_order`(`id`,`order_num`,`staff_id`,`staff_name`,`product_id`,`customer_id`,`order_date`,`delivery_quantity_total`,`delivery_quantity_need`,`unit_price`,`total_price`,`order_status`,`delivery_date`,`warehouse_manager_id`,`warehouse_manager_name`) values (6,'XS201811070003',1,'郑昌萌',3,10,1541548800000,1.12,1.12,1.23,1.38,'未配送',1541721600000,7,'刘广源');

/*Table structure for table `warehouse_product_inventory` */

DROP TABLE IF EXISTS `warehouse_product_inventory`;

CREATE TABLE `warehouse_product_inventory` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '仓库库存id',
  `product_id` int(11) NOT NULL COMMENT '产品关联id',
  `product_inventory` float(9,2) NOT NULL DEFAULT '0.00' COMMENT '产品库存',
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `warehouse_product_inventory_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='仓库库存';

/*Data for the table `warehouse_product_inventory` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
