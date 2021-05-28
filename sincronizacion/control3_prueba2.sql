-- MariaDB dump 10.17  Distrib 10.4.8-MariaDB, for Win64 (AMD64)
--
-- Host: controler.com.co    Database: control3_prueba2
-- ------------------------------------------------------
-- Server version	5.7.34-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `bancos`
--

DROP TABLE IF EXISTS `bancos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bancos` (
  `id_banco` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_banco` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `intereses` double NOT NULL,
  `NoCuenta` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `tipo_cuenta_id_tcuenta` int(11) NOT NULL,
  PRIMARY KEY (`id_banco`),
  KEY `bancos_tipo_cuenta_fk` (`tipo_cuenta_id_tcuenta`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bancos`
--

LOCK TABLES `bancos` WRITE;
/*!40000 ALTER TABLE `bancos` DISABLE KEYS */;
INSERT INTO `bancos` VALUES (0,'Caja - Efectivo',1,'4412115',6),(1,'Bancolombia',2,'12351110',1),(3,'Caja Social',5,'321',2),(6,'BBVA',0,'79494083',1),(11,'Caja ',45,'4401105',6);
/*!40000 ALTER TABLE `bancos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `caja`
--

DROP TABLE IF EXISTS `caja`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `caja` (
  `id_caja` int(11) NOT NULL AUTO_INCREMENT,
  `base_monetaria` double DEFAULT NULL,
  `ingresos_efectivo` double NOT NULL,
  `ingresos_electronicos` double NOT NULL,
  `egresos_efectivo` double NOT NULL,
  `egresos_electronicos` double NOT NULL,
  `ventas` double NOT NULL,
  `fecha` datetime NOT NULL,
  `pagos` double NOT NULL,
  `cierre` int(11) NOT NULL,
  `empleado_id_empleado` int(11) NOT NULL,
  `sede_id_sede` int(11) NOT NULL,
  PRIMARY KEY (`id_caja`),
  KEY `caja_empleado_fk` (`empleado_id_empleado`),
  KEY `caja_sede_fk` (`sede_id_sede`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caja`
--

LOCK TABLES `caja` WRITE;
/*!40000 ALTER TABLE `caja` DISABLE KEYS */;
INSERT INTO `caja` VALUES (1,1,0,0,0,0,12,'2020-11-28 23:40:38',0,0,1,1),(2,10000,0,0,0,0,12,'2020-11-29 20:17:11',0,0,1,1),(3,300000,21000,0,0,0,2,'2021-01-07 21:52:40',0,0,9,1),(4,150000,0,0,0,0,1,'2021-03-04 22:20:06',0,0,9,1),(5,100000,43792,0,0,0,1,'2021-04-21 00:52:05',0,0,9,9),(6,100000,43792,0,0,0,2,'2021-04-21 01:22:43',0,0,9,1);
/*!40000 ALTER TABLE `caja` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cargo_modulo`
--

DROP TABLE IF EXISTS `cargo_modulo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cargo_modulo` (
  `id_cargoModulo` int(11) NOT NULL AUTO_INCREMENT,
  `id_cargo` int(11) NOT NULL,
  `id_modulo` int(11) NOT NULL,
  PRIMARY KEY (`id_cargoModulo`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cargo_modulo`
--

LOCK TABLES `cargo_modulo` WRITE;
/*!40000 ALTER TABLE `cargo_modulo` DISABLE KEYS */;
INSERT INTO `cargo_modulo` VALUES (1,25,1),(4,26,1),(8,1,1),(9,1,2),(10,1,3),(12,1,5),(14,1,7),(15,1,8),(17,1,4),(18,1,9),(22,33,7),(23,33,3),(24,34,7),(25,34,4),(26,2,8),(27,35,2),(28,2,1);
/*!40000 ALTER TABLE `cargo_modulo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria_cliente`
--

DROP TABLE IF EXISTS `categoria_cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categoria_cliente` (
  `id_categoria` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `no_precio` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `descripcion` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `empleado_id_empleado` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `sede_id_sede` int(11) NOT NULL,
  PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria_cliente`
--

LOCK TABLES `categoria_cliente` WRITE;
/*!40000 ALTER TABLE `categoria_cliente` DISABLE KEYS */;
INSERT INTO `categoria_cliente` VALUES (1,'Corriente','Precio 1','Cliente general.',7,'2021-02-11',1),(2,'Institucional','Precio 2','Varias instituciones',7,'2020-10-28',1),(3,'1','Precio 3','--',11,'2021-02-16',1),(4,'Otro 4','Precio 4','--',7,'2020-10-28',1);
/*!40000 ALTER TABLE `categoria_cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria_producto_trans`
--

DROP TABLE IF EXISTS `categoria_producto_trans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categoria_producto_trans` (
  `id_categoria` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `descripcion` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `fecha` date NOT NULL,
  `empleado_id_empleado` int(11) NOT NULL,
  `sede_id_sede` int(11) NOT NULL,
  PRIMARY KEY (`id_categoria`),
  KEY `empleado_id_empleado` (`empleado_id_empleado`),
  KEY `sede_id_sede` (`sede_id_sede`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria_producto_trans`
--

LOCK TABLES `categoria_producto_trans` WRITE;
/*!40000 ALTER TABLE `categoria_producto_trans` DISABLE KEYS */;
INSERT INTO `categoria_producto_trans` VALUES (1,'Malla','---','2020-11-17',1,1),(2,'Bandeja','--','2020-11-17',1,1),(6,'Sin transformar','--','2020-11-17',1,1),(7,'Bolsa 5','---','2021-03-04',21,9),(8,'PULPA','PULPA','2021-05-25',21,9),(9,'VASO FRUTA','VASO FRUTA','2021-05-25',21,9);
/*!40000 ALTER TABLE `categoria_producto_trans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente` (
  `id_cliente` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `nombre_empresa` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `direccion` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `telefono` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `correo` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `documento` varchar(45) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `nit` varchar(45) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `verificacion_nit` int(11) DEFAULT NULL,
  `categoria_cliente_id_categoria` int(11) NOT NULL,
  `sede_id_sede` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `empleado_id_empleado` int(11) NOT NULL,
  PRIMARY KEY (`id_cliente`),
  KEY `empleado_id_empleado` (`empleado_id_empleado`),
  KEY `sede_id_sede` (`sede_id_sede`) USING BTREE,
  KEY `categoria_cliente_id_categoria` (`categoria_cliente_id_categoria`),
  CONSTRAINT `categoria_cliente_id_categoria` FOREIGN KEY (`categoria_cliente_id_categoria`) REFERENCES `categoria_cliente` (`id_categoria`),
  CONSTRAINT `sede_id_sede` FOREIGN KEY (`sede_id_sede`) REFERENCES `sede` (`id_sede`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (63,'Cliente normal','Ninguna','---','0000','normal@gmail.com','123','',0,1,1,'2021-02-14',1),(64,'Liseth Juliana Pérez ','-','carrera 9#1A-23 sur','3224511875','-','1057607465','',0,1,1,'2021-02-18',1),(65,'Cliente prueba','-','-','3124769857','-','12','-',0,1,1,'2021-03-04',9),(66,'Juan ','-','-','-','-','333','-',0,2,1,'2021-03-05',9),(67,'holman','-','-','-','-','444','-',0,3,1,'2021-03-05',9),(68,'carlos','-','-','-','-','555','-',0,4,1,'2021-03-05',9),(69,'Carlos Camargo','-','-','-','-','881122','-',0,1,1,'2021-03-10',9),(70,'Andres PÃ©rez','-','-','-','-','123456789','-',0,1,9,'2021-05-25',21),(71,'Andrea Aguirre','-','-','-','-','1054802929','-',0,1,9,'2021-05-25',21),(72,'yulianis','-','-','-','-','22609956','-',0,1,9,'2021-05-25',21),(73,'juan rafael','-','-','-','-','11786956','-',0,1,9,'2021-05-25',21),(74,'nancy','-','-','-','-','51834034','-',0,1,9,'2021-05-25',21),(75,'fernando gomez','-','-','-','-','80799980','-',0,1,9,'2021-05-25',21),(76,'juliana melendez','-','-','-','-','53178356','-',0,1,9,'2021-05-25',21),(77,'juliana melendez','-','-','-','-','53178356','-',0,1,9,'2021-05-25',21),(78,'maria eugenia paez','-','-','-','-','1127572596','-',0,1,9,'2021-05-25',21),(79,'juan felipa','-','-','-','-','80195866','-',0,1,9,'2021-05-25',21),(80,'cristina vazque','-','-','-','-','22609956','-',0,1,9,'2021-05-25',21),(81,'Ana milena','-','-','-','-','1072648496','-',0,1,9,'2021-05-26',24);
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_banco`
--

DROP TABLE IF EXISTS `detalle_banco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detalle_banco` (
  `id_Dbanco` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` datetime DEFAULT NULL,
  `ingreso_efectivo` double NOT NULL,
  `egreso_efectivo` double NOT NULL,
  `banco_idBanco` int(11) NOT NULL,
  `ingreso_electronico` double NOT NULL,
  `egreso_electronico` double NOT NULL,
  `sede_id_sede` int(11) NOT NULL,
  PRIMARY KEY (`id_Dbanco`),
  KEY `detalle_banco_fk` (`banco_idBanco`),
  KEY `detalle_sede_fk` (`sede_id_sede`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_banco`
--

LOCK TABLES `detalle_banco` WRITE;
/*!40000 ALTER TABLE `detalle_banco` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalle_banco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_factura`
--

DROP TABLE IF EXISTS `detalle_factura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detalle_factura` (
  `id_detallef` int(11) NOT NULL AUTO_INCREMENT,
  `cantidad` double NOT NULL,
  `precio_venta` double NOT NULL,
  `total_descuento` double NOT NULL,
  `total_impuesto` double NOT NULL,
  `total` double NOT NULL,
  `factura_id_factura` int(11) NOT NULL,
  `stock_id_stock` int(11) NOT NULL,
  `descuento_id_descuento` int(11) NOT NULL,
  `impuesto_id_impuestos` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `empleado_id_empleado` int(11) NOT NULL,
  `producto_anterior` varchar(2000) COLLATE utf8_spanish2_ci NOT NULL,
  PRIMARY KEY (`id_detallef`),
  KEY `detalle_factura_descuento_fk` (`descuento_id_descuento`),
  KEY `detalle_factura_factura_fk` (`factura_id_factura`),
  KEY `detalle_factura_impuesto_fk` (`impuesto_id_impuestos`),
  KEY `detalle_factura_producto_fk` (`stock_id_stock`)
) ENGINE=InnoDB AUTO_INCREMENT=616 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_factura`
--

LOCK TABLES `detalle_factura` WRITE;
/*!40000 ALTER TABLE `detalle_factura` DISABLE KEYS */;
INSERT INTO `detalle_factura` VALUES (399,1,19200,0,19,22848,268,37,7,1,'2021-02-15',9,'NULL'),(400,3,19200,0,19,68544,269,37,7,1,'2021-02-15',9,'NULL'),(401,2,3600,0,0,7200,270,50,7,5,'2021-03-05',9,'Producto anterior: ACEITE DE OLIVA TEMPRANO , cantidad: 1 , precio de venta: 0 , descuento: 0 , impuesto: 19 y un total de: 0'),(402,1,0,0,19,0,271,37,7,1,'2021-03-04',9,'NULL'),(403,1,0,0,19,0,272,37,7,1,'2021-03-04',9,'NULL'),(404,1,3600,0,0,3600,273,50,7,5,'2021-03-04',9,'NULL'),(405,1,3600,0,0,3600,274,50,7,2,'2021-03-06',9,'NULL'),(406,1,3600,0,19,4284,274,50,7,2,'2021-03-06',9,'NULL'),(407,1,3600,0,5,3780,274,50,7,2,'2021-03-06',9,'NULL'),(408,1,3600,0,0,3600,275,50,7,5,'2021-03-06',9,'NULL'),(409,1,2500,0,5,2625,275,46,7,2,'2021-03-06',9,'NULL'),(410,1,4000,0,19,4760,275,37,7,1,'2021-03-06',9,'NULL'),(411,2,4700,10,19,10067,276,46,1,1,'2021-03-06',9,'NULL'),(412,8,0,0,19,0,276,37,7,1,'2021-03-06',9,'NULL'),(413,2,4700,10,19,10067,277,46,1,1,'2021-03-06',9,'NULL'),(414,8,0,0,19,0,277,46,7,1,'2021-03-06',9,'NULL'),(415,2,3600,0,0,7200,278,50,7,5,'2021-03-10',9,'NULL'),(416,0,3120,0,0,0,278,53,7,5,'2021-03-10',9,'NULL'),(417,0,3120,0,0,0,279,53,7,5,'2021-03-10',9,'NULL'),(418,2,3600,0,0,7200,279,50,7,5,'2021-03-10',9,'NULL'),(422,0,3120,0,0,0,281,53,7,5,'2021-03-10',9,'NULL'),(423,1,3600,0,0,3600,281,50,7,5,'2021-03-10',9,'NULL'),(424,1,4700,10,19,5034,281,46,1,1,'2021-03-10',9,'NULL'),(425,1,0,0,19,0,282,37,7,1,'2021-03-10',9,'NULL'),(426,1,3600,0,0,3600,282,50,7,5,'2021-03-10',9,'Producto anterior: PAN SUPER PERRO , cantidad: 1 , precio de venta: 4700 , descuento: 10 , impuesto: 19 y un total de: 5034'),(427,0,3120,0,0,0,282,53,7,5,'2021-03-10',9,'NULL'),(428,3,7200,0,19,25704,283,1,7,1,'2021-04-20',9,'NULL'),(429,2,24800,0,0,49600,283,4,7,5,'2021-04-20',9,'NULL'),(430,0.15,5300,0,0,795,284,484,7,5,'2021-04-20',9,'NULL'),(431,1,24800,0,0,24800,284,4,7,5,'2021-04-20',9,'NULL'),(432,0.15,3900,0,0,585,285,483,7,5,'2021-04-21',9,'NULL'),(433,2,17820,0,19,42412,285,21,7,1,'2021-04-21',9,'NULL'),(434,0.15,5300,0,0,795,285,484,7,5,'2021-04-21',9,'NULL'),(435,0.15,9600,0,0,1440,286,538,7,5,'2021-04-21',9,'NULL'),(436,1,14985,0,19,17832,286,13,7,1,'2021-04-21',9,'NULL'),(437,0.15,3900,0,0,585,286,480,7,5,'2021-04-21',9,'NULL'),(438,2,21900,0,0,43800,287,228,7,5,'2021-04-21',9,'NULL'),(439,1,1900,0,0,1900,287,280,7,5,'2021-04-21',9,'NULL'),(440,0.15,10400,0,0,1560,287,566,7,5,'2021-04-21',9,'NULL'),(441,10,7200,0,19,85680,288,1,7,1,'2021-04-21',9,'Producto anterior: ENTREMUSLOS DE POLLO BUCANEROS  BJ            , cantidad: 2 , precio de venta: 9400 , descuento: 0 , impuesto: 0 y un total de: 18800'),(442,3,20500,0,0,61500,288,102,7,5,'2021-04-21',9,'NULL'),(443,2,7200,0,19,17136,289,1,7,1,'2021-04-21',9,'NULL'),(444,3,1900,0,0,5700,289,285,7,5,'2021-04-21',9,'NULL'),(445,0.15,12500,0,0,1875,289,642,7,5,'2021-04-21',9,'NULL'),(446,0.15,37150,0,0,5573,289,120,7,5,'2021-04-21',9,'NULL'),(447,2,802,0,19,1909,289,303,7,1,'2021-04-21',9,'NULL'),(448,0.15,2400,0,0,360,289,648,7,5,'2021-04-21',9,'NULL'),(449,3,800,0,0,2400,289,645,7,5,'2021-04-21',9,'NULL'),(450,2,2800,0,0,5600,289,647,7,5,'2021-04-21',9,'NULL'),(451,2,22900,0,0,45800,289,589,7,5,'2021-04-21',9,'NULL'),(452,0.15,3900,0,0,585,289,584,7,5,'2021-04-21',9,'NULL'),(453,1,4200,0,0,4200,289,253,7,5,'2021-04-21',9,'NULL'),(454,1,4200,0,0,4200,289,253,7,5,'2021-04-21',9,'NULL'),(455,0,9900,0,0,19800,290,12,7,5,'2021-04-21',9,'NULL'),(456,0,6150,0,0,6150,290,237,7,5,'2021-04-21',9,'NULL'),(457,0,4350,0,0,653,290,481,7,5,'2021-04-21',9,'NULL'),(458,0,4350,0,0,653,290,481,7,5,'2021-04-21',9,'NULL'),(459,0,12500,0,0,1875,290,642,7,5,'2021-04-21',9,'NULL'),(460,0,5990,0,0,29950,290,238,7,5,'2021-04-21',9,'NULL'),(461,0,6000,0,0,12000,290,299,7,5,'2021-04-21',9,'NULL'),(462,0,2100,0,0,315,290,617,7,5,'2021-04-21',9,'NULL'),(463,2,5990,0,0,11980,291,238,7,5,'2021-04-21',9,'NULL'),(464,5,8667,0,19,51569,292,5,7,1,'2021-04-21',9,'NULL'),(465,2,20250,0,0,40500,292,8,7,5,'2021-04-21',9,'NULL'),(466,1,12500,0,19,14875,292,298,7,1,'2021-04-21',9,'NULL'),(467,1,8667,0,19,10314,292,5,7,1,'2021-04-21',9,'NULL'),(468,2,8900,0,19,21182,292,123,7,1,'2021-04-21',9,'NULL'),(469,1,3200,0,19,3808,293,1,7,1,'2021-04-25',21,'NULL'),(470,1,3200,0,19,3808,293,3,7,1,'2021-04-25',21,'NULL'),(471,2,3200,0,19,7616,293,4,7,1,'2021-04-25',21,'NULL'),(472,11,8667,0,19,113451,294,3,7,1,'2021-05-15',21,'NULL'),(473,1,1800,0,0,1800,296,34,7,5,'2021-05-15',21,'NULL'),(474,5,1800,0,0,9000,297,34,7,5,'2021-05-15',21,'NULL'),(475,1,8667,0,19,10314,298,354,7,1,'2021-05-15',21,'NULL'),(476,5,8667,0,19,51569,299,3,7,1,'2021-05-15',21,'NULL'),(479,0.6,3600,0,0,2160,40680,171,7,5,'2021-05-25',21,'NULL'),(480,1,2500,0,19,2975,40681,287,7,1,'2021-05-25',21,'NULL'),(481,0.56,6800,0,0,3808,46082,224,7,5,'2021-05-25',21,'NULL'),(482,0.155,3600,0,0,558,305,171,7,5,'2021-05-25',21,'NULL'),(483,0.155,3900,0,0,605,40683,390,7,5,'2021-05-25',21,'NULL'),(484,0.36,6500,0,0,2340,40684,232,7,5,'2021-05-25',21,'NULL'),(485,0.515,10000,0,0,5150,40684,168,7,5,'2021-05-25',21,'NULL'),(486,0.125,29900,0,0,3738,40684,212,7,5,'2021-05-25',21,'NULL'),(487,0.05,35000,0,0,1750,40685,222,7,5,'2021-05-25',21,'NULL'),(488,0.16,11800,0,0,1888,40686,167,7,5,'2021-05-25',21,'NULL'),(489,0.365,4200,0,0,1533,40687,176,7,5,'2021-05-25',21,'NULL'),(490,0.895,10000,0,0,8950,40687,168,7,5,'2021-05-25',21,'NULL'),(491,0.445,6200,0,0,2759,40687,175,7,5,'2021-05-25',21,'NULL'),(492,0.185,3800,0,0,703,40687,244,7,5,'2021-05-25',21,'NULL'),(493,0.275,3200,0,0,880,40687,208,7,5,'2021-05-25',21,'NULL'),(494,0.07,3900,0,0,273,40687,209,7,5,'2021-05-25',21,'NULL'),(495,1,7500,0,0,7500,40687,101,7,5,'2021-05-25',21,'NULL'),(496,2,1300,0,0,2600,40687,437,7,5,'2021-05-25',21,'NULL'),(497,0.365,4200,0,0,1533,40688,176,7,5,'2021-05-25',21,'NULL'),(498,0.895,10000,0,0,8950,40688,168,7,5,'2021-05-25',21,'NULL'),(499,0.445,6200,0,0,2759,40688,175,7,5,'2021-05-25',21,'NULL'),(500,0.185,3800,0,0,703,40688,244,7,5,'2021-05-25',21,'NULL'),(501,0.275,3200,0,0,880,40688,208,7,5,'2021-05-25',21,'NULL'),(502,0.07,3900,0,0,273,40688,209,7,5,'2021-05-25',21,'NULL'),(503,1,7500,0,0,7500,40688,101,7,5,'2021-05-25',21,'NULL'),(504,2,1300,0,0,2600,40688,437,7,5,'2021-05-25',21,'NULL'),(505,0.365,4200,0,0,1533,40689,176,7,5,'2021-05-25',21,'NULL'),(506,0.895,10000,0,0,8950,40689,168,7,5,'2021-05-25',21,'NULL'),(507,0.445,6200,0,0,2759,40689,175,7,5,'2021-05-25',21,'NULL'),(508,0.185,3800,0,0,703,40689,244,7,5,'2021-05-25',21,'NULL'),(509,0.275,3200,0,0,880,40689,208,7,5,'2021-05-25',21,'NULL'),(510,0.07,3900,0,0,273,40689,209,7,5,'2021-05-25',21,'NULL'),(511,1,7500,0,0,7500,40689,209,7,5,'2021-05-25',21,'NULL'),(512,2,1300,0,0,2600,40689,437,7,5,'2021-05-25',21,'NULL'),(513,0.365,4200,0,0,1533,40690,176,7,5,'2021-05-25',21,'NULL'),(514,0.895,10000,0,0,8950,40690,168,7,5,'2021-05-25',21,'NULL'),(515,0.445,6200,0,0,2759,40690,175,7,5,'2021-05-25',21,'NULL'),(516,0.185,3800,0,0,703,40690,244,7,5,'2021-05-25',21,'NULL'),(517,0.275,3200,0,0,880,40690,208,7,5,'2021-05-25',21,'NULL'),(518,0.07,3900,0,0,273,40690,209,7,5,'2021-05-25',21,'NULL'),(519,1,7500,0,0,7500,40690,209,7,5,'2021-05-25',21,'NULL'),(520,2,1300,0,0,2600,40690,437,7,5,'2021-05-25',21,'NULL'),(521,0.365,4200,0,0,1533,40691,176,7,5,'2021-05-25',21,'NULL'),(522,0.895,10000,0,0,8950,40691,168,7,5,'2021-05-25',21,'NULL'),(523,0.445,6200,0,0,2759,40691,175,7,5,'2021-05-25',21,'NULL'),(524,0.185,3800,0,0,703,40691,244,7,5,'2021-05-25',21,'NULL'),(525,0.275,3200,0,0,880,40691,208,7,5,'2021-05-25',21,'NULL'),(526,0.07,3900,0,0,273,40691,209,7,5,'2021-05-25',21,'NULL'),(527,1,7500,0,0,7500,40691,209,7,5,'2021-05-25',21,'NULL'),(528,2,1300,0,0,2600,40691,437,7,5,'2021-05-25',21,'NULL'),(529,1.14,3400,0,0,3876,40692,184,7,5,'2021-05-25',21,'NULL'),(530,0.885,6800,0,0,6018,40694,224,7,5,'2021-05-25',21,'NULL'),(531,1.48,3600,0,0,5328,40695,170,7,5,'2021-05-25',21,'NULL'),(532,1.55,10000,0,0,15500,40695,168,7,5,'2021-05-25',21,'NULL'),(533,1.69,3600,0,0,6084,40695,177,7,5,'2021-05-25',21,'NULL'),(534,0.98,4600,0,0,4508,40695,392,7,5,'2021-05-25',21,'NULL'),(535,0.82,3200,0,0,2624,40695,208,7,5,'2021-05-25',21,'NULL'),(536,2.135,3600,0,0,7686,40695,198,7,5,'2021-05-25',21,'NULL'),(537,0.815,3200,0,0,2608,40695,246,7,5,'2021-05-25',21,'NULL'),(538,1.115,3600,0,0,4014,40695,171,7,5,'2021-05-25',21,'NULL'),(539,0.185,5200,0,0,962,40695,399,7,5,'2021-05-25',21,'NULL'),(540,0.88,3800,0,0,3344,40695,243,7,5,'2021-05-25',21,'NULL'),(541,0.73,3600,0,0,2628,40695,241,7,5,'2021-05-25',21,'NULL'),(542,0.54,6200,0,0,3348,40695,172,7,5,'2021-05-25',21,'NULL'),(543,1.48,3600,0,0,5328,40696,170,7,5,'2021-05-25',21,'NULL'),(544,1.55,10000,0,0,15500,40696,168,7,5,'2021-05-25',21,'NULL'),(545,1.69,3600,0,0,6084,40696,177,7,5,'2021-05-25',21,'NULL'),(546,0.98,4600,0,0,4508,40696,392,7,5,'2021-05-25',21,'NULL'),(547,0.82,3200,0,0,2624,40696,208,7,5,'2021-05-25',21,'NULL'),(548,2.135,3600,0,0,7686,40696,198,7,5,'2021-05-25',21,'NULL'),(549,0.815,3200,0,0,2608,40696,246,7,5,'2021-05-25',21,'NULL'),(550,1.115,3600,0,0,4014,40696,171,7,5,'2021-05-25',21,'NULL'),(551,0.185,5200,0,0,962,40696,399,7,5,'2021-05-25',21,'NULL'),(552,0.88,3800,0,0,3344,40696,243,7,5,'2021-05-25',21,'NULL'),(553,0.73,3600,0,0,2628,40696,241,7,5,'2021-05-25',21,'NULL'),(554,0.54,6200,0,0,3348,40696,172,7,5,'2021-05-25',21,'NULL'),(555,0.825,3800,0,0,3135,40697,247,7,5,'2021-05-25',21,'NULL'),(556,0.665,6800,0,0,4522,40697,224,7,5,'2021-05-25',21,'NULL'),(557,1.305,3800,0,0,4959,40697,243,7,5,'2021-05-25',21,'NULL'),(558,1.135,3600,0,0,4086,40697,177,7,5,'2021-05-25',21,'NULL'),(559,0.82,4200,0,0,3444,40697,393,7,5,'2021-05-25',21,'NULL'),(560,0.375,4600,0,0,1725,40697,392,7,5,'2021-05-25',21,'NULL'),(561,1.355,3600,0,0,4878,40698,171,7,5,'2021-05-25',21,'NULL'),(562,1.02,3200,0,0,3264,40698,401,7,5,'2021-05-25',21,'NULL'),(563,0.56,10000,0,0,5600,40698,168,7,5,'2021-05-25',21,'NULL'),(564,1,4800,0,0,4800,40699,157,7,5,'2021-05-25',21,'NULL'),(565,1,2800,0,19,3332,40700,267,7,1,'2021-05-25',21,'NULL'),(566,0,4800,0,0,3960,40701,211,7,5,'2021-05-25',21,'NULL'),(567,0,3600,0,0,4392,40701,226,7,5,'2021-05-25',21,'NULL'),(568,0,3400,0,0,11322,40701,184,7,5,'2021-05-25',21,'NULL'),(569,0,3400,0,0,9639,40701,186,7,5,'2021-05-25',21,'NULL'),(570,0,3600,0,0,5526,40701,198,7,5,'2021-05-25',21,'NULL'),(571,0,3600,0,0,3744,40701,241,7,5,'2021-05-25',21,'NULL'),(572,0,2600,0,0,3666,40701,233,7,5,'2021-05-25',21,'NULL'),(573,0,4200,0,0,4116,40701,385,7,5,'2021-05-25',21,'NULL'),(574,0,11800,0,0,5546,40701,167,7,5,'2021-05-25',21,'NULL'),(575,0,3600,0,0,3528,40701,171,7,5,'2021-05-25',21,'NULL'),(576,0,4500,0,0,4500,40701,95,7,5,'2021-05-25',21,'NULL'),(577,0,3800,0,0,2356,40701,247,7,5,'2021-05-25',21,'NULL'),(578,0,3800,0,0,2033,40701,247,7,5,'2021-05-25',21,'NULL'),(579,0,6900,0,0,3036,40701,207,7,5,'2021-05-25',21,'NULL'),(580,0,2500,0,0,2500,40701,116,7,5,'2021-05-25',21,'NULL'),(581,0,3600,0,0,6876,40701,177,7,5,'2021-05-25',21,'NULL'),(582,0,12500,0,0,4375,40701,473,7,5,'2021-05-25',21,'NULL'),(583,0,12500,0,0,0,40701,372,7,5,'2021-05-25',21,'NULL'),(584,0,8400,0,0,0,40754,383,7,5,'2021-05-25',9,'NULL'),(585,1,4250,0,0,4250,40754,416,7,5,'2021-05-25',9,'NULL'),(603,0,1300,0,0,1300,46103,437,7,5,'2021-05-26',24,'NULL'),(604,0.39,3800,0,0,1482,46104,236,7,5,'2021-05-26',24,'NULL'),(605,0.94,3600,0,0,3384,46105,241,7,5,'2021-05-26',24,'NULL'),(606,0.905,4200,0,0,3801,46105,393,7,5,'2021-05-26',24,'NULL'),(607,1.07,3600,0,0,3852,46105,171,7,5,'2021-05-26',24,'NULL'),(608,0.25,3800,0,0,950,46105,244,7,5,'2021-05-26',24,'NULL'),(609,0.25,3800,0,0,950,46105,244,7,5,'2021-05-26',24,'NULL'),(610,1.155,3600,0,0,4158,46105,177,7,5,'2021-05-26',24,'NULL'),(611,0.45,12500,0,0,5625,46105,173,7,5,'2021-05-26',24,'NULL'),(612,0.79,11800,0,0,9322,46105,167,7,5,'2021-05-26',24,'NULL'),(613,1,4900,0,0,4900,46105,436,7,5,'2021-05-26',24,'NULL'),(614,1,4900,0,0,4900,46106,436,7,5,'2021-05-26',24,'NULL'),(615,1,1200,0,19,1428,40759,460,7,1,'2021-05-26',24,'NULL');
/*!40000 ALTER TABLE `detalle_factura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleado`
--

DROP TABLE IF EXISTS `empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `empleado` (
  `id_empleado` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `correo` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `codigo` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `direccion` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `telefono` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `documento` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `tipo_cargo_id_cargo` int(11) NOT NULL,
  `sede_id_sede` int(11) NOT NULL,
  `user_id_user` int(11) NOT NULL,
  `fecha` date NOT NULL,
  PRIMARY KEY (`id_empleado`),
  KEY `empleado_sede_fk` (`sede_id_sede`),
  KEY `empleado_tipo_cargo_fk` (`tipo_cargo_id_cargo`),
  KEY `empleado_users_fk` (`user_id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleado`
--

LOCK TABLES `empleado` WRITE;
/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;
INSERT INTO `empleado` VALUES (1,'juan','juangomez3701@gmail.com','321','calle 12','31289362','3123',1,1,1,'2020-09-13'),(7,'Holman2','holman.rincon@uptc.edu.co','123213121','calle 12','3120930','1238908123',1,1,1241,'2021-02-01'),(9,'Juliana Pérez','liseth.perez@uptc.edu.co','312890','---','23','0',1,9,1244,'0000-00-00'),(11,'carlos camargo','contacto@controler.com.co','0000000','----','0','0',1,1,1246,'2021-01-24'),(18,'Pedro López','p.lopez@cosechafresca.com','456','Calle 13','34435546','55645657665',33,1,1253,'0000-00-00'),(19,'NOHORA VILLA','nohora1843@gmail.com','123456','Cra 5 #71-45','3178931158','52472731',1,1,1255,'0000-00-00'),(20,'Dalila Villafañe','dalila298@yahoo.es','2','calle  5 N 71 45 local 103 ','3143323923','52192465',2,1,1256,'2021-02-16'),(21,'Andrea Aguirre','maye.280497@gmail.com','000','---','000','000',1,9,1257,'0000-00-00'),(23,'Gonzalo Ernesto Sánchez','gonzalo@gmail.com','123','Cra. 30','32445678876','167267277',1,9,1260,'2021-03-10'),(24,'Andrea Garcia','luga_147@hotmail.com','-','Calle 109#18b-52','3227940994','1104069701',2,9,1261,'2021-04-25');
/*!40000 ALTER TABLE `empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `factura`
--

DROP TABLE IF EXISTS `factura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `factura` (
  `id_factura` int(11) NOT NULL AUTO_INCREMENT,
  `id_factura_web` bigint(20) NOT NULL,
  `pago_total` double NOT NULL,
  `noproductos` int(11) NOT NULL,
  `fecha` datetime NOT NULL,
  `facturapaga` decimal(38,0) NOT NULL,
  `tipo_pago_id_tpago` int(11) NOT NULL,
  `empleado_id_empleado` int(11) NOT NULL,
  `empleado_id_domiciliario` int(11) NOT NULL,
  `cliente_id_cliente` int(11) NOT NULL,
  `sede_id_sede` int(11) NOT NULL,
  `anulacion` int(11) NOT NULL,
  `referencia_pago` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `tipo_web` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  PRIMARY KEY (`id_factura`),
  KEY `factura_cliente_fk` (`cliente_id_cliente`),
  KEY `factura_empleado_fk` (`empleado_id_empleado`),
  KEY `factura_tipo_pago_fk` (`tipo_pago_id_tpago`)
) ENGINE=MyISAM AUTO_INCREMENT=46107 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factura`
--

LOCK TABLES `factura` WRITE;
/*!40000 ALTER TABLE `factura` DISABLE KEYS */;
INSERT INTO `factura` VALUES (269,0,68544,1,'2021-02-15 20:08:52',1,1,9,0,63,1,1,'NULL','NULL'),(268,0,22848,1,'2021-02-15 19:52:23',1,1,9,0,63,1,0,'NULL','NULL'),(270,0,7200,1,'2021-03-05 03:40:16',1,1,9,0,63,1,0,'NULL','NULL'),(271,2346,0,1,'2021-03-04 22:06:16',1,1,9,0,63,1,1,'NULL','AplicaciÃ³n'),(272,0,0,1,'2021-03-04 22:07:36',1,1,9,11,63,1,0,'1000','NULL'),(273,0,3600,1,'2021-03-04 22:16:56',0,1,9,1,63,1,0,'NULL','NULL'),(274,0,11664,3,'2021-03-06 10:09:47',1,1,9,0,63,1,0,'NULL','NULL'),(275,0,10985,3,'2021-03-06 10:44:28',1,1,9,0,63,1,0,'NULL','NULL'),(276,0,10067,2,'2021-03-06 13:22:40',1,1,9,0,63,1,0,'NULL','NULL'),(277,0,10067,2,'2021-03-06 13:22:42',1,1,9,0,63,1,0,'NULL','NULL'),(278,0,7200,2,'2021-03-10 21:10:46',1,1,9,0,65,1,0,'NULL','NULL'),(279,0,7200,2,'2021-03-10 21:17:16',1,1,9,0,65,1,0,'NULL','NULL'),(282,0,3600,3,'2021-03-10 22:34:37',1,1,9,0,65,1,0,'NULL','NULL'),(281,0,8634,3,'2021-03-10 22:24:05',1,2,9,0,65,1,0,'5678','NULL'),(283,0,75304,2,'2021-04-20 23:42:39',1,1,9,0,63,9,0,'NULL','NULL'),(284,0,25595,2,'2021-04-20 23:50:03',1,5,9,0,63,9,0,'3456','NULL'),(285,0,43792,3,'2021-04-21 00:03:48',1,1,9,1,63,9,0,'$ 43,792','NULL'),(286,0,19857,3,'2021-04-21 00:06:28',0,3,9,0,63,9,0,'NULL','NULL'),(287,236,47260,3,'2021-04-21 00:16:52',1,1,9,0,63,9,0,'$ 47,260','Pedido en casa'),(288,456,147180,2,'2021-04-21 00:18:08',1,1,9,0,63,9,1,'NULL','Pedido en casa'),(289,0,95338,12,'2021-04-21 01:01:40',1,3,9,1,63,9,0,'4567','NULL'),(290,0,0,0,'2021-04-21 01:11:53',0,1,9,0,63,9,0,'NULL','NULL'),(291,0,11980,1,'2021-04-21 01:14:33',0,3,9,1,63,9,0,'NULL','NULL'),(292,0,138440,5,'2021-04-21 01:16:39',1,3,9,0,63,9,1,'346','NULL'),(293,0,15232,3,'2021-04-25 15:25:01',1,2,21,0,63,9,0,'05141','NULL'),(294,0,113451,1,'2021-05-15 07:27:20',1,1,21,0,63,9,0,'NULL','NULL'),(295,0,0,0,'2021-05-15 07:27:20',0,1,21,0,63,9,0,'NULL','NULL'),(296,0,1800,1,'2021-05-15 07:33:41',1,2,21,0,63,9,0,'1212','NULL'),(297,0,9000,1,'2021-05-15 07:35:10',1,1,21,0,63,9,0,'NULL','NULL'),(298,0,10314,1,'2021-05-15 07:56:10',1,1,21,0,63,9,0,'NULL','NULL'),(299,0,51569,1,'2021-05-15 07:59:45',1,1,21,0,63,9,0,'NULL','NULL'),(40681,0,2975,1,'2021-05-25 08:04:37',1,1,21,0,63,9,0,'NULL','NULL'),(40680,0,2160,1,'2021-05-25 07:56:44',1,1,21,0,63,9,0,'NULL','NULL'),(40682,0,3808,1,'2021-05-25 08:05:56',1,1,21,0,63,9,0,'NULL','NULL'),(305,0,558,1,'2021-05-25 08:13:15',1,1,21,0,71,9,0,'NULL','NULL'),(46105,0,36942,9,'2021-05-26 08:31:10',1,3,21,24,63,9,0,'3060','NULL'),(40684,0,11228,3,'2021-05-25 08:28:27',1,1,21,0,72,9,0,'NULL','NULL'),(40685,0,1750,1,'2021-05-25 08:30:32',1,1,21,0,73,9,0,'NULL','NULL'),(40686,0,0,0,'2021-05-25 08:33:54',0,1,21,0,74,9,0,'NULL','NULL'),(40687,0,25198,8,'2021-05-25 08:43:47',1,1,21,0,63,9,0,'NULL','NULL'),(40688,0,25198,8,'2021-05-25 08:43:54',1,1,21,0,63,9,1,'NULL','NULL'),(40689,0,25198,8,'2021-05-25 08:44:02',1,1,21,0,63,9,1,'NULL','NULL'),(40690,0,25198,8,'2021-05-25 08:44:09',1,1,21,0,63,9,1,'NULL','NULL'),(40691,0,25198,8,'2021-05-25 08:44:16',1,1,21,0,63,9,1,'NULL','NULL'),(40692,0,3876,1,'2021-05-25 09:01:54',1,1,21,0,63,9,0,'NULL','NULL'),(40693,0,0,0,'2021-05-25 09:04:45',1,1,21,0,63,9,0,'NULL','NULL'),(40694,0,6018,1,'2021-05-25 09:09:19',1,1,21,0,63,9,0,'NULL','NULL'),(40695,0,58634,12,'2021-05-25 09:26:03',1,2,21,0,76,9,0,'','NULL'),(40696,0,58634,12,'2021-05-25 09:26:22',1,2,21,0,76,9,1,'','NULL'),(40697,0,21871,6,'2021-05-25 09:32:01',1,1,21,0,78,9,0,'NULL','NULL'),(40698,0,13742,3,'2021-05-25 09:37:31',1,2,21,0,63,9,0,'1010','NULL'),(40699,0,4800,1,'2021-05-25 09:39:04',1,1,21,0,63,9,0,'NULL','NULL'),(40700,0,3332,1,'2021-05-25 09:49:03',1,1,21,0,63,9,0,'NULL','NULL'),(40701,0,94700,18,'2021-05-25 10:18:39',1,1,21,0,72,9,0,'NULL','NULL'),(40754,0,4250,2,'2021-05-25 19:31:29',1,1,9,0,63,9,0,'NULL','NULL'),(40755,0,0,0,'2021-05-26 07:51:48',0,1,24,0,63,9,0,'NULL','NULL'),(40756,0,1482,1,'2021-05-26 07:59:40',1,1,24,0,63,9,0,'NULL','NULL'),(46106,0,4900,1,'2021-05-26 08:39:51',1,1,24,0,63,9,0,'NULL','NULL'),(40759,0,1428,1,'2021-05-26 09:02:28',1,1,24,0,63,9,0,'NULL','NULL');
/*!40000 ALTER TABLE `factura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_stock`
--

DROP TABLE IF EXISTS `m_stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_stock` (
  `id_mstock` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` datetime NOT NULL,
  `stock_id_stock` int(11) NOT NULL,
  `sede_id_sede` int(11) NOT NULL,
  `sede_id_sede2` int(11) NOT NULL,
  `t_movimiento_id_tmovimiento` int(11) NOT NULL,
  `id_empleado` int(11) NOT NULL,
  `cantidad` double NOT NULL,
  `total` double NOT NULL,
  PRIMARY KEY (`id_mstock`),
  KEY `m_stock_sede_fk` (`sede_id_sede`),
  KEY `m_stock_sede_fkv2` (`sede_id_sede2`),
  KEY `m_stock_stock_fk` (`stock_id_stock`),
  KEY `m_stock_t_movimiento_fk` (`t_movimiento_id_tmovimiento`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_stock`
--

LOCK TABLES `m_stock` WRITE;
/*!40000 ALTER TABLE `m_stock` DISABLE KEYS */;
INSERT INTO `m_stock` VALUES (19,'2021-03-09 23:37:47',46,1,9,1,1,3,10500);
/*!40000 ALTER TABLE `m_stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modulos`
--

DROP TABLE IF EXISTS `modulos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modulos` (
  `id_modulo` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  PRIMARY KEY (`id_modulo`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modulos`
--

LOCK TABLES `modulos` WRITE;
/*!40000 ALTER TABLE `modulos` DISABLE KEYS */;
INSERT INTO `modulos` VALUES (1,'Permisos'),(2,'Empleados'),(3,'Proveedores'),(4,'Clientes'),(5,'Sedes'),(7,'Inventario'),(8,'Facturacion'),(9,'Reportes');
/*!40000 ALTER TABLE `modulos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nota_credito`
--

DROP TABLE IF EXISTS `nota_credito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nota_credito` (
  `id_nota` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` datetime NOT NULL,
  `factura_id_factura` int(11) NOT NULL,
  `empleado_id_empleado` int(11) NOT NULL,
  `sede_id_sede` int(11) NOT NULL,
  PRIMARY KEY (`id_nota`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nota_credito`
--

LOCK TABLES `nota_credito` WRITE;
/*!40000 ALTER TABLE `nota_credito` DISABLE KEYS */;
INSERT INTO `nota_credito` VALUES (1,'2021-02-18 00:39:56',269,9,1),(2,'2021-03-04 22:10:37',271,9,1),(3,'2021-03-10 19:50:40',284,9,1),(4,'2021-04-21 00:49:01',288,9,9),(5,'2021-04-21 01:20:04',292,9,9),(6,'2021-05-25 08:47:35',46088,21,9),(7,'2021-05-25 08:47:39',46088,21,9),(8,'2021-05-25 08:47:52',46089,21,9),(9,'2021-05-25 08:48:06',46090,21,9),(10,'2021-05-25 08:48:19',46091,21,9),(11,'2021-05-25 09:26:41',46096,21,9);
/*!40000 ALTER TABLE `nota_credito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `p_tiempo`
--

DROP TABLE IF EXISTS `p_tiempo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `p_tiempo` (
  `id_periodo` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  PRIMARY KEY (`id_periodo`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `p_tiempo`
--

LOCK TABLES `p_tiempo` WRITE;
/*!40000 ALTER TABLE `p_tiempo` DISABLE KEYS */;
/*!40000 ALTER TABLE `p_tiempo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY `password_resets_email_index` (`email`),
  KEY `password_resets_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
INSERT INTO `password_resets` VALUES ('juan@gmail.com','dc64e5ed796631e3c49a4487c925d7d690032029785a2b99d0a0c982a3f2a306','2021-02-03 02:31:18');
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proveedor` (
  `id_proveedor` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_empresa` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `nombre_proveedor` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `direccion` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `telefono` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `correo` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `documento` varchar(45) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `nit` varchar(45) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `verificacion_nit` int(11) DEFAULT NULL,
  `fecha` date NOT NULL,
  `empleado_id_empleado` int(11) NOT NULL,
  `sede_id_sede` int(11) NOT NULL,
  PRIMARY KEY (`id_proveedor`),
  KEY `empleado_id_empleado` (`empleado_id_empleado`),
  KEY `sede_id_sede` (`sede_id_sede`)
) ENGINE=MyISAM AUTO_INCREMENT=45 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor`
--

LOCK TABLES `proveedor` WRITE;
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
INSERT INTO `proveedor` VALUES (13,'CAMPOS SALUDABLES SAS','SANDRO','CALLE 70 BIS 68F 39','3133962471','CAMSALLTDA@GMAIL.COM','6','900399141',8,'2021-05-09',21,9),(12,'SAN ADOBO','SAN ADOBO','0000','000','SANADOBO@GMAIL.COM','0002','0000',2,'2021-05-09',21,9),(10,'CROCKING SAS','MARINELLA','00','3134002373','CROKING@GMAIL.COM','1','000',0,'2021-05-09',21,9),(11,'MORENOS SAS','MORENO','000','3185215611','MORENO@GMAIL.COM','00000','0001',1,'2021-05-09',21,9),(9,'DISAY DISTRIBUCIONES SA','DIEGO','CARRERA 18 # 166 -29','3156264162','NOREGISTR@NOREGISTRA','0','800215548',1,'2021-05-09',21,9),(14,'FOSFORITO','FOSFORITO','0000','3227000166','FOSFORITO@GMAIL.COM','7','0',3,'2021-05-09',21,9),(15,'GRUPO SUAGU SAS','CLAUDIA','CRA 20 C BIS # 76-38','3108816228','INFO@SUAGU.COM','3','901016692',5,'2021-05-09',21,9),(16,'COLOR COCINA','COLOR COCINA','0000','3102683540','COLORCOCINA@GMAIL.COM','0009','00000',9,'2021-05-09',21,9),(17,'MR MORRON','FABIAN CLARO','CRA 7 #180 -45','3108095204','MRMORRON@GMAIL.COM','000010','0000010',1,'2021-05-09',21,9),(18,'DONA LOLA','CRISTIAN','0000000','3156707093','DONALOLA@GMAIL.COM','0000011','0000011',1,'2021-05-15',21,9),(19,'XIRUS','GABRIEL','VILLA DE LEIVA','3153636366','XIRUS@GMAIL.COM','0000012','00000012',1,'2021-05-09',21,9),(20,'ELIBE','MARTA','FUSAGASUGA','3164113243','ELIBE@GMAIL.COM','0000013','0000013',1,'2021-05-09',21,9),(21,'DISTRIBUCIONES CVAS','NUTRESA','CALLE 100 # 68 B -67','00000001','NUTRESA@GMAIL.COM','00000014','000000014',1,'2021-05-09',21,9),(22,'HARINERA VALLE','HARINERA DEL VALLE','00000000000','000000000113','HARINERADELVALLE@GMAIL.COM','0000000015','000000015',1,'2021-05-09',21,9),(23,'PASSIONE CAFFE','PASSIONE CAFFE','0000000000000','1111111','CAFE@GMAIL.COM','000000016','000000016',1,'2021-05-09',21,9),(24,'BIMBO SAS','BIMBO','TENJO','018007521006','BIMBO@GMAIL.COM','830002366','830002366',0,'2021-05-09',21,9),(25,'GLADIS URBINA','GLADIS','CRA 51 A#127-49','3168135702','GURBINA2011@GMAIL.COM','901157997','901157997',0,'2021-05-09',21,9),(26,'RUBEN DARIO YUNTA ESPEJO','CARLOS YUNTA','FUSA','3102931595','CARLOSYUNTA@GMAIL.COM','80425039','80425039',0,'2021-05-09',21,9),(27,'LA SABANA','LA SABANA','FUNZA','000000000000','LASABANA@GMAIL.COM','00000000000016','0000000000016',0,'2021-05-09',21,9),(28,'COCA COLA SA','COCA COLA','BOGOTA DC','00000000001111','COCACOLA@GMAIL.COM','101010101','',0,'2021-05-09',21,9),(29,'COOPERATIVA COLANTA SAS','ANGELA','MEDELLIN','00000000000011112','WWW.COLANTA@GOV.CO','900665411','900665411',0,'2021-05-09',21,9),(30,'ROSMI SAS','ANDRES','00000000','000000000013','ROSMI@GMAIL.COM','830133722','830133722',1,'2021-05-09',21,9),(31,'METODOS AGROINDUSTRIALES','DANIELA','MEDELLIN','2793448','COMERCIAL@LARESEVADELAHACIENDA.COM','9000453486','9000453486',4,'2021-05-09',21,9),(32,'FARM OF GOD','NELSON','CALLE 67 # 69 K-36','3102784289','VENTAS@FARMOFGOD.COM','900841166','900841166',7,'2021-05-12',21,9),(33,'CARNES LA PIAMONTESA SAS','PIAMONTESA','CALLE 130 # 46-70','3115923573','CARNESLAPIAMONTESA@GMAIL.COM','900677254','900677254',4,'2021-05-09',21,9),(34,'POLLOS BUCANERO SAS','ERICSON','CALI','000003333','BUCANEROS@GMAIL.COM','11231455','',0,'2021-05-09',21,9),(35,'DISPEZ RIO MAR SAS','DISPEZ','0001111','000000099','DISPEZ@GMAIL.COM','00000000001344','',0,'2021-05-09',21,9),(36,'FRESCO SAS','FRESCO','CALLE 64 # 26-30','00001666','FRESCO@GMAIL.COM','901163071','900677254',0,'2021-05-09',21,9),(37,'FRUTAS Y VERDURAS','FRUTAS Y VERDURAS','CORABASTOS','000001145423','FRUTAS@GMAIL.COM','0000111247899','',0,'2021-05-09',21,9),(38,'AMALIA','AMALIA','BOYACA','3111111111','AMALIA@GMAIL.COM','1211122222','',0,'2021-05-09',21,9),(39,'FLORES','FLORES','33333','3','FLORES@GMAIL.COM','000019','',0,'2021-05-12',21,9),(40,'NIBS CACAO','NIPS','0000033','333333','NIPS@GMAIL.COM','0000023','',0,'2021-05-12',21,9),(41,'MEZZE GOURMET','ALEJANDRO','BARRANQUILLA','3126810212','MEZZE@GMAIL.COM','901244744','901244744',7,'2021-05-12',21,9),(42,'NON MON','NON MON','4444444','0000077777','NON@GMAIL.COM','00000025','',0,'2021-05-12',21,9),(43,'EL TREBOL','EL TREBOL','DIAGONAL 74 B 88 29','333333333','ELTREBOL@GMAIL.COM','000027','',0,'2021-05-14',21,9),(44,'GENTIL','GENTIL','NO REGISTRA','3255655','GENTIL@GENTIL.COM','356566','',0,'2021-05-24',21,9);
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reporte_inventario`
--

DROP TABLE IF EXISTS `reporte_inventario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reporte_inventario` (
  `id_rInventario` int(11) NOT NULL AUTO_INCREMENT,
  `fechaInicial` date NOT NULL,
  `fechaFinal` date NOT NULL,
  `fechaActual` date NOT NULL,
  `empleado_id_empleado` int(11) NOT NULL,
  `sede_id_sede` int(11) NOT NULL,
  PRIMARY KEY (`id_rInventario`),
  KEY `empleado_id_empleado` (`empleado_id_empleado`),
  KEY `sede_id_sede` (`sede_id_sede`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reporte_inventario`
--

LOCK TABLES `reporte_inventario` WRITE;
/*!40000 ALTER TABLE `reporte_inventario` DISABLE KEYS */;
/*!40000 ALTER TABLE `reporte_inventario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reporte_ventas`
--

DROP TABLE IF EXISTS `reporte_ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reporte_ventas` (
  `id_rVentas` int(11) NOT NULL AUTO_INCREMENT,
  `fechaInicial` date NOT NULL,
  `fechaFinal` date NOT NULL,
  `fechaActual` date NOT NULL,
  `sede_id_sede` int(11) NOT NULL,
  `empleado_id_empleado` int(11) NOT NULL,
  PRIMARY KEY (`id_rVentas`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reporte_ventas`
--

LOCK TABLES `reporte_ventas` WRITE;
/*!40000 ALTER TABLE `reporte_ventas` DISABLE KEYS */;
/*!40000 ALTER TABLE `reporte_ventas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sede`
--

DROP TABLE IF EXISTS `sede`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sede` (
  `id_sede` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_sede` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `ciudad` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `descripcion` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `direccion` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `telefono` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `empleado_id_empleado` int(11) NOT NULL,
  PRIMARY KEY (`id_sede`),
  KEY `empleado_id_empleado` (`empleado_id_empleado`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sede`
--

LOCK TABLES `sede` WRITE;
/*!40000 ALTER TABLE `sede` DISABLE KEYS */;
INSERT INTO `sede` VALUES (1,'Calle 72','Bogotá','--','--',0,'2020-12-10',1),(9,'Calle 109','Bogotá','--','--',12,'2020-12-10',1);
/*!40000 ALTER TABLE `sede` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock`
--

DROP TABLE IF EXISTS `stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stock` (
  `id_stock` int(11) NOT NULL AUTO_INCREMENT,
  `disponibilidad` char(1) COLLATE utf8_spanish2_ci NOT NULL,
  `cantidad` double NOT NULL,
  `fecha_registro` datetime NOT NULL,
  `producto_id_producto` int(11) NOT NULL,
  `sede_id_sede` int(11) NOT NULL,
  `proveedor_id_proveedor` int(11) NOT NULL,
  `empleado_id_empleado` int(11) NOT NULL,
  `transformacion_stock_id` int(11) NOT NULL,
  `noFactura` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `total` double NOT NULL,
  `costo_compra` int(11) DEFAULT NULL,
  `cantidad_rep` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_stock`),
  KEY `stock_producto_fk` (`producto_id_producto`),
  KEY `stock_proveedor_fk` (`proveedor_id_proveedor`),
  KEY `stock_sede_fk` (`sede_id_sede`)
) ENGINE=MyISAM AUTO_INCREMENT=1312 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock`
--

LOCK TABLES `stock` WRITE;
/*!40000 ALTER TABLE `stock` DISABLE KEYS */;
INSERT INTO `stock` VALUES (1,'1',10,'2021-05-25 07:36:25',1,9,20,21,6,'0',6000,6000,1),(2,'1',10,'2021-05-25 07:36:25',4,9,18,21,6,'0',15500,15500,1),(3,'1',10,'2021-05-25 07:36:25',5,9,25,21,6,'0',7500,7500,1),(4,'1',1,'2021-05-25 07:36:25',6,9,38,21,6,'0',6426,6426,1),(5,'1',1,'2021-05-25 07:36:25',7,9,25,21,6,'0',5100,5100,1),(6,'1',5,'2021-05-25 07:36:25',8,9,18,21,6,'0',75000,15000,5),(7,'1',5,'2021-05-25 07:36:25',9,9,18,21,6,'0',42500,8500,5),(8,'1',5,'2021-05-25 07:36:25',10,9,18,21,6,'0',42500,8500,5),(9,'1',2,'2021-05-25 07:36:25',11,9,18,21,6,'0',15000,7500,2),(10,'1',3,'2021-05-25 07:36:25',13,9,22,21,6,'0',38643,12881,3),(11,'1',2,'2021-05-25 07:36:25',14,9,22,21,6,'0',75000,37500,2),(12,'1',1,'2021-05-25 07:36:25',15,9,22,21,6,'0',16700,16700,1),(13,'1',10,'2021-05-25 07:36:25',17,9,22,21,6,'0',17850,1785,10),(14,'1',1,'2021-05-25 07:36:25',18,9,19,21,6,'0',14000,14000,1),(15,'1',6,'2021-05-25 07:36:25',20,9,22,21,6,'0',60096,10016,6),(16,'1',4,'2021-05-25 07:36:25',21,9,22,21,6,'0',40064,10016,4),(17,'1',2,'2021-05-25 07:36:25',22,9,22,21,6,'0',17772,8886,2),(18,'1',33,'2021-05-25 07:36:25',23,9,36,21,6,'0',280500,8500,33),(19,'1',21,'2021-05-25 07:36:25',24,9,36,21,6,'0',178500,8500,21),(20,'1',7,'2021-05-25 07:36:25',29,9,36,21,6,'0',59500,8500,7),(21,'1',3,'2021-05-25 07:36:25',37,9,28,21,6,'0',4098,1366,3),(22,'1',1,'2021-05-25 07:36:25',47,9,28,21,6,'0',2083,2083,1),(23,'1',7,'2021-05-25 07:36:25',48,9,25,21,6,'0',175000,25000,7),(24,'1',1,'2021-05-25 07:36:25',49,9,25,21,6,'0',16000,16000,1),(25,'1',6,'2021-05-25 07:36:25',51,9,25,21,6,'0',96000,16000,6),(26,'1',2,'2021-05-25 07:36:25',53,9,25,21,6,'0',67200,33600,2),(27,'1',1,'2021-05-25 07:36:25',55,9,25,21,6,'0',35000,35000,1),(28,'1',8,'2021-05-25 07:36:25',56,9,25,21,6,'0',213200,26650,8),(29,'1',3,'2021-05-25 07:36:25',65,9,28,21,6,'0',2799,933,3),(30,'1',6,'2021-05-25 07:36:25',66,9,28,21,6,'0',5598,933,6),(31,'1',16,'2021-05-25 07:36:25',68,9,28,21,6,'0',13856,866,16),(32,'1',12,'2021-05-25 07:36:25',69,9,28,21,6,'0',10392,866,12),(33,'1',3,'2021-05-25 07:36:25',71,9,28,21,6,'0',2598,866,3),(34,'1',5,'2021-05-25 07:36:25',72,9,28,21,6,'0',4330,866,5),(35,'1',18,'2021-05-25 07:36:25',74,9,28,21,6,'0',24588,1366,18),(36,'1',4,'2021-05-25 07:36:25',75,9,28,21,6,'0',7100,1775,4),(37,'1',12,'2021-05-25 07:36:25',76,9,28,21,6,'0',21300,1775,12),(38,'1',4,'2021-05-25 07:36:25',82,9,28,21,6,'0',10564,2641,4),(39,'1',6,'2021-05-25 07:36:25',83,9,28,21,6,'0',15846,2641,6),(40,'1',18,'2021-05-25 07:36:25',85,9,28,21,6,'0',26244,1458,18),(41,'1',8,'2021-05-25 07:36:25',86,9,28,21,6,'0',35600,4450,8),(42,'1',1,'2021-05-25 07:36:25',87,9,25,21,6,'0',27000,27000,1),(43,'1',5,'2021-05-25 07:36:25',88,9,34,21,6,'0',37000,7400,5),(44,'1',2,'2021-05-25 07:36:25',94,9,34,21,6,'0',16000,8000,2),(45,'1',2,'2021-05-25 07:36:25',103,9,34,21,6,'0',9856,4928,2),(46,'1',4,'2021-05-25 07:36:25',108,9,29,21,6,'0',31000,7750,4),(47,'1',3,'2021-05-25 07:36:25',109,9,29,21,6,'0',12420,4140,3),(48,'1',3,'2021-05-25 07:36:25',111,9,29,21,6,'0',13890,4630,3),(49,'1',2.1,'2021-05-25 07:36:25',115,9,35,21,6,'0',72450,34500,2),(50,'1',5,'2021-05-25 07:36:25',116,9,35,21,6,'0',26180,5236,5),(51,'1',1.38,'2021-05-25 07:36:25',117,9,35,21,6,'0',41538,30100,1),(52,'1',5,'2021-05-25 07:36:25',119,9,35,21,6,'0',132500,26500,5),(53,'1',2.19,'2021-05-25 07:36:25',121,9,35,21,6,'0',30660,14000,2),(54,'1',3,'2021-05-25 07:36:25',122,9,35,21,6,'0',21063,7021,3),(55,'1',2.1,'2021-05-25 07:36:25',124,9,35,21,6,'0',37800,18000,2),(56,'1',0.7,'2021-05-25 07:36:25',125,9,35,21,6,'0',10500,15000,1),(57,'1',1.8,'2021-05-25 07:36:25',127,9,35,21,6,'0',52020,28900,2),(58,'1',8,'2021-05-25 07:36:25',128,9,35,21,6,'0',46648,5831,8),(59,'1',2,'2021-05-25 07:36:25',130,9,29,21,6,'0',9000,4500,2),(60,'1',41,'2021-05-25 07:36:25',132,9,31,21,6,'0',221400,5400,41),(61,'1',4,'2021-05-25 07:36:25',143,9,9,21,6,'0',3708,927,4),(62,'1',3,'2021-05-25 07:36:25',144,9,9,21,6,'0',12423,4141,3),(63,'1',6,'2021-05-25 07:36:25',145,9,21,21,6,'0',32508,5418,6),(64,'1',2,'2021-05-25 07:36:25',148,9,18,21,6,'0',14000,7000,2),(65,'1',1,'2021-05-25 07:36:25',151,9,15,21,6,'0',8925,8925,1),(66,'1',1,'2021-05-25 07:36:25',152,9,15,21,6,'0',8925,8925,1),(67,'1',1,'2021-05-25 07:36:25',170,9,21,21,6,'0',3547,3547,1),(68,'1',3,'2021-05-25 07:36:25',183,9,19,21,6,'0',24000,8000,3),(69,'1',2,'2021-05-25 07:36:25',185,9,19,21,6,'0',17000,8500,2),(70,'1',2,'2021-05-25 07:36:25',190,9,19,21,6,'0',29000,14500,2),(71,'1',1,'2021-05-25 07:36:25',195,9,19,21,6,'0',15600,15600,1),(72,'1',1,'2021-05-25 07:36:25',196,9,19,21,6,'0',15600,15600,1),(73,'1',6,'2021-05-25 07:36:25',204,9,21,21,6,'0',15702,2617,6),(74,'1',3,'2021-05-25 07:36:25',205,9,21,21,6,'0',10548,3516,3),(75,'1',13,'2021-05-25 07:36:25',226,9,23,21,6,'0',221000,17000,13),(76,'1',5,'2021-05-25 07:36:25',227,9,21,21,6,'0',51290,10258,5),(77,'1',4,'2021-05-25 07:36:25',228,9,21,21,6,'0',41032,10258,4),(78,'1',4,'2021-05-25 07:36:25',231,9,13,21,6,'0',25332,6333,4),(79,'1',5,'2021-05-25 07:36:25',232,9,37,21,6,'0',75000,15000,5),(80,'1',1,'2021-05-25 07:36:25',235,9,24,21,6,'0',4083,4083,1),(81,'1',3,'2021-05-25 07:36:25',242,9,24,21,6,'0',14496,4832,3),(82,'1',4,'2021-05-25 07:36:25',243,9,24,21,6,'0',13664,3416,4),(83,'1',1,'2021-05-25 07:36:25',248,9,24,21,6,'0',3223,3223,1),(84,'1',1,'2021-05-25 07:36:25',249,9,24,21,6,'0',2394,2394,1),(85,'1',5,'2021-05-25 07:36:25',253,9,25,21,6,'0',75000,15000,5),(86,'1',4,'2021-05-25 07:36:25',254,9,24,21,6,'0',13664,3416,4),(87,'1',1,'2021-05-25 07:36:25',258,9,24,21,6,'0',11150,11150,1),(88,'1',2,'2021-05-25 07:36:25',260,9,24,21,6,'0',7168,3584,2),(89,'1',3,'2021-05-25 07:36:25',261,9,24,21,6,'0',10248,3416,3),(90,'1',5,'2021-05-25 07:36:25',276,9,13,21,6,'0',20750,4150,5),(91,'1',4,'2021-05-25 07:36:25',277,9,13,21,6,'0',10080,2520,4),(92,'1',7,'2021-05-25 07:36:25',281,9,13,21,6,'0',7700,1100,7),(93,'1',6,'2021-05-25 07:36:25',282,9,13,21,6,'0',8400,1400,6),(94,'1',9,'2021-05-25 07:36:25',285,9,13,21,6,'0',12600,1400,9),(95,'1',10,'2021-05-25 07:36:25',286,9,13,21,6,'0',24700,2470,10),(96,'1',8,'2021-05-25 07:36:25',288,9,13,21,6,'0',11200,1400,8),(97,'1',9,'2021-05-25 07:36:25',290,9,9,21,6,'0',22644,2516,9),(98,'1',2,'2021-05-25 07:36:25',293,9,9,21,6,'0',10752,5376,2),(99,'1',3,'2021-05-25 07:36:25',294,9,9,21,6,'0',8535,2845,3),(100,'1',5,'2021-05-25 07:36:25',295,9,9,21,6,'0',53020,10604,5),(101,'1',2,'2021-05-25 07:36:25',297,9,9,21,6,'0',11726,5863,2),(102,'1',10,'2021-05-25 07:36:25',300,9,29,21,6,'0',7000,700,10),(103,'1',5,'2021-05-25 07:36:25',301,9,29,21,6,'0',15655,3131,5),(104,'1',4,'2021-05-25 07:36:25',307,9,9,21,6,'0',25864,6466,4),(105,'1',2,'2021-05-25 07:36:25',308,9,29,21,6,'0',9930,4965,2),(106,'1',2,'2021-05-25 07:36:25',310,9,22,21,6,'0',9658,4829,2),(107,'1',2,'2021-05-25 07:36:25',316,9,25,21,6,'0',13600,6800,2),(108,'1',5,'2021-05-25 07:36:25',317,9,14,21,6,'0',30000,6000,5),(109,'1',11,'2021-05-25 07:36:25',318,9,14,21,6,'0',55000,5000,11),(110,'1',1,'2021-05-25 07:36:25',320,9,17,21,6,'0',9163,9163,1),(111,'1',2,'2021-05-25 07:36:25',321,9,17,21,6,'0',18326,9163,2),(112,'1',2,'2021-05-25 07:36:25',322,9,17,21,6,'0',18326,9163,2),(113,'1',2,'2021-05-25 07:36:25',323,9,17,21,6,'0',18326,9163,2),(114,'1',2,'2021-05-25 07:36:25',324,9,17,21,6,'0',18326,9163,2),(115,'1',5,'2021-05-25 07:36:25',326,9,32,21,6,'0',72500,14500,5),(116,'1',44,'2021-05-25 07:36:25',332,9,12,21,6,'0',57200,1300,44),(117,'1',3,'2021-05-25 07:36:25',333,9,12,21,6,'0',3498,1166,3),(118,'1',4,'2021-05-25 07:36:25',335,9,12,21,6,'0',3000,750,4),(119,'1',7,'2021-05-25 07:36:25',336,9,12,21,6,'0',5250,750,7),(120,'1',6,'2021-05-25 07:36:25',338,9,12,21,6,'0',4500,750,6),(121,'1',31,'2021-05-25 07:36:25',339,9,12,21,6,'0',23250,750,31),(122,'1',7,'2021-05-25 07:36:25',340,9,12,21,6,'0',5250,750,7),(123,'1',15,'2021-05-25 07:36:25',341,9,12,21,6,'0',6000,400,15),(124,'1',13,'2021-05-25 07:36:25',342,9,12,21,6,'0',5200,400,13),(125,'1',8,'2021-05-25 07:36:25',343,9,12,21,6,'0',3200,400,8),(126,'1',8,'2021-05-25 07:36:25',344,9,12,21,6,'0',10400,1300,8),(127,'1',7,'2021-05-25 07:36:25',345,9,12,21,6,'0',9100,1300,7),(128,'1',8,'2021-05-25 07:36:25',346,9,12,21,6,'0',20000,2500,8),(129,'1',33,'2021-05-25 07:36:25',347,9,12,21,6,'0',82500,2500,33),(130,'1',7,'2021-05-25 07:36:25',348,9,12,21,6,'0',17500,2500,7),(131,'1',7,'2021-05-25 07:36:25',349,9,12,21,6,'0',31500,4500,7),(132,'1',20,'2021-05-25 07:36:25',350,9,12,21,6,'0',90000,4500,20),(133,'1',8,'2021-05-25 07:36:25',351,9,12,21,6,'0',36000,4500,8),(134,'1',2,'2021-05-25 07:36:25',362,9,41,21,6,'0',40000,20000,2),(135,'1',1,'2021-05-25 07:36:25',364,9,41,21,6,'0',20000,20000,1),(136,'1',9,'2021-05-25 07:36:25',366,9,14,21,6,'0',18000,2000,9),(137,'1',4,'2021-05-25 07:36:25',367,9,22,21,6,'0',11412,2853,4),(138,'1',4,'2021-05-25 07:36:25',368,9,22,21,6,'0',11412,2853,4),(139,'1',8,'2021-05-25 07:36:25',369,9,22,21,6,'0',23872,2984,8),(140,'1',3,'2021-05-25 07:36:25',370,9,22,21,6,'0',7869,2623,3),(141,'1',2,'2021-05-25 07:36:25',371,9,22,21,6,'0',5708,2854,2),(142,'1',2,'2021-05-25 07:36:25',793,9,22,21,6,'0',5706,2853,2),(143,'1',2,'2021-05-25 07:36:25',374,9,16,21,6,'0',16000,8000,2),(144,'1',3,'2021-05-25 07:36:25',378,9,16,21,6,'0',45000,15000,3),(145,'1',1,'2021-05-25 07:36:25',379,9,16,21,6,'0',15000,15000,1),(146,'1',2,'2021-05-25 07:36:25',381,9,16,21,6,'0',30000,15000,2),(147,'1',2,'2021-05-25 07:36:25',384,9,16,21,6,'0',36000,18000,2),(148,'1',2,'2021-05-25 07:36:25',387,9,16,21,6,'0',50000,25000,2),(149,'1',2,'2021-05-25 07:36:25',388,9,16,21,6,'0',50000,25000,2),(150,'1',1,'2021-05-25 07:36:25',389,9,16,21,6,'0',25000,25000,1),(151,'1',1,'2021-05-25 07:36:25',390,9,16,21,6,'0',25000,25000,1),(152,'1',1,'2021-05-25 07:36:25',391,9,16,21,6,'0',25000,25000,1),(153,'1',12,'2021-05-25 07:36:25',417,9,10,21,6,'0',23520,1960,12),(154,'1',8,'2021-05-25 07:36:25',418,9,10,21,6,'0',42000,5250,8),(155,'1',8,'2021-05-25 07:36:25',419,9,10,21,6,'0',45920,5740,8),(156,'1',1,'2021-05-25 07:36:25',429,9,21,21,6,'0',3000,3000,1),(157,'1',18,'2021-05-25 07:36:25',430,9,13,21,6,'0',48830,2570,19),(158,'1',3,'2021-05-25 07:36:25',434,9,13,21,6,'0',7860,2620,3),(159,'1',11,'2021-05-25 07:36:25',435,9,13,21,6,'0',33220,3020,11),(160,'1',4,'2021-05-25 07:36:25',436,9,13,21,6,'0',6000,1500,4),(161,'1',2,'2021-05-25 07:36:25',438,9,13,21,6,'0',5640,2820,2),(162,'1',2,'2021-05-25 07:36:25',440,9,13,21,6,'0',3600,1800,2),(163,'1',2,'2021-05-25 07:36:25',442,9,13,21,6,'0',7400,3700,2),(164,'1',2,'2021-05-25 07:36:25',444,9,13,21,6,'0',5160,2580,2),(165,'1',5,'2021-05-25 07:36:25',447,9,13,21,6,'0',6500,1300,5),(166,'1',6,'2021-05-25 07:36:25',448,9,13,21,6,'0',31920,5320,6),(167,'1',2.05,'2021-05-25 07:36:25',451,9,37,21,6,'0',19500,6500,3),(168,'1',18.375,'2021-05-25 07:36:25',452,9,37,21,6,'0',126000,6000,21),(169,'1',29,'2021-05-25 07:36:25',453,9,37,21,6,'0',110200,3800,29),(170,'1',8.52,'2021-05-25 07:36:25',456,9,37,21,6,'0',16920,1692,10),(171,'1',0.705,'2021-05-25 07:36:25',458,9,37,21,6,'0',9720,1944,5),(172,'1',9.46,'2021-05-25 07:36:25',465,9,37,21,6,'0',35000,3500,10),(173,'1',0.55,'2021-05-25 07:36:25',470,9,37,21,6,'0',6667,6667,1),(174,'1',7,'2021-05-25 07:36:25',471,9,37,21,6,'0',17500,2500,7),(175,'1',20.5,'2021-05-25 07:36:25',474,9,37,21,6,'0',71750,3500,21),(176,'1',25,'2021-05-25 07:36:25',478,9,37,21,6,'0',62500,2500,25),(177,'1',21.02,'2021-05-25 07:36:25',480,9,37,21,6,'0',55550,2222,25),(178,'1',1,'2021-05-25 07:36:25',481,9,37,21,6,'0',1750,1750,1),(179,'1',61,'2021-05-25 07:36:25',483,9,37,21,6,'0',67771,1111,61),(180,'1',42,'2021-05-25 07:36:25',487,9,37,21,6,'0',49980,1190,42),(181,'1',16.5,'2021-05-25 07:36:25',488,9,37,21,6,'0',29700,1800,17),(182,'1',4,'2021-05-25 07:36:25',491,9,37,21,6,'0',13332,3333,4),(183,'1',2,'2021-05-25 07:36:25',497,9,37,21,6,'0',6000,3000,2),(184,'1',20.86,'2021-05-25 07:36:25',498,9,37,21,6,'0',44000,2000,22),(185,'1',6,'2021-05-25 07:36:25',501,9,37,21,6,'0',9600,1600,6),(186,'1',35,'2021-05-25 07:36:25',504,9,37,21,6,'0',57260,1636,35),(187,'1',26,'2021-05-25 07:36:25',507,9,37,21,6,'0',48724,1874,26),(188,'1',32,'2021-05-25 07:36:25',508,9,37,21,6,'0',136000,4250,32),(189,'1',56,'2021-05-25 07:36:25',509,9,37,21,6,'0',68712,1227,56),(190,'1',6,'2021-05-25 07:36:25',512,9,37,21,6,'0',16200,2700,6),(191,'1',12,'2021-05-25 07:36:25',513,9,37,21,6,'0',21600,1800,12),(192,'1',44,'2021-05-25 07:36:25',515,9,37,21,6,'0',84304,1916,44),(193,'1',11,'2021-05-25 07:36:25',516,9,37,21,6,'0',18700,1700,11),(194,'1',51,'2021-05-25 07:36:25',518,9,37,21,6,'0',94860,1860,51),(195,'1',78,'2021-05-25 07:36:25',523,9,37,21,6,'0',124800,1600,78),(196,'1',5,'2021-05-25 07:36:25',524,9,37,21,6,'0',12500,2500,5),(197,'1',21,'2021-05-25 07:36:25',525,9,37,21,6,'0',52500,2500,21),(198,'1',21.865,'2021-05-25 07:36:25',527,9,37,21,6,'0',48000,2000,24),(199,'1',10,'2021-05-25 07:36:25',529,9,37,21,6,'0',20000,2000,10),(200,'1',8,'2021-05-25 07:36:25',530,9,37,21,6,'0',19352,2419,8),(201,'1',2,'2021-05-25 07:36:25',531,9,37,21,6,'0',2000,1000,2),(202,'1',1.5,'2021-05-25 07:36:25',547,9,37,21,6,'0',15000,10000,2),(203,'1',2.5,'2021-05-25 07:36:25',548,9,37,21,6,'0',27500,11000,3),(204,'1',4,'2021-05-25 07:36:25',555,9,37,21,6,'0',5332,1333,4),(205,'1',0.5,'2021-05-25 07:36:25',558,9,37,21,6,'0',6250,12500,1),(206,'1',19,'2021-05-25 07:36:25',562,9,37,21,6,'0',76000,4000,19),(207,'1',12.6,'2021-05-25 07:36:25',563,9,37,21,6,'0',37800,3000,13),(208,'1',23.18,'2021-05-25 07:36:25',566,9,37,21,6,'0',42672,1778,24),(209,'1',12,'2021-05-25 07:36:25',567,9,37,21,6,'0',19800,2200,9),(210,'1',18,'2021-05-25 07:36:25',569,9,37,21,6,'0',45000,2500,18),(211,'1',25.5,'2021-05-25 07:36:25',570,9,37,21,6,'0',69054,2708,26),(212,'1',1.175,'2021-05-25 07:36:25',573,9,37,21,6,'0',19500,15000,1),(213,'1',21,'2021-05-25 07:36:25',575,9,37,21,6,'0',17493,833,21),(214,'1',0.9,'2021-05-25 07:36:25',577,9,37,21,6,'0',1620,1800,1),(215,'1',2,'2021-05-25 07:36:25',580,9,37,21,6,'0',2000,1000,2),(216,'1',0.45,'2021-05-25 07:36:25',581,9,37,21,6,'0',5850,13000,0),(217,'1',1,'2021-05-25 07:36:25',583,9,37,21,6,'0',40000,40000,1),(218,'1',1.9,'2021-05-25 07:36:25',585,9,37,21,6,'0',15200,8000,2),(219,'1',7,'2021-05-25 07:36:25',588,9,37,21,6,'0',4998,714,7),(220,'1',1,'2021-05-25 07:36:25',589,9,37,21,6,'0',1600,1600,1),(221,'1',8,'2021-05-25 07:36:25',592,9,37,21,6,'0',28568,3571,8),(222,'1',1.45,'2021-05-25 07:36:25',595,9,37,21,6,'0',37500,25000,2),(223,'1',9.8,'2021-05-25 07:36:25',597,9,37,21,6,'0',17640,1800,10),(224,'1',4.19,'2021-05-25 07:36:25',598,9,37,21,6,'0',20594.7,3269,6),(225,'1',18,'2021-05-25 07:36:25',600,9,37,21,6,'0',18000,1000,18),(226,'1',4,'2021-05-25 07:36:25',603,9,37,21,6,'0',8000,2000,4),(227,'1',18,'2021-05-25 07:36:25',606,9,37,21,6,'0',43200,2400,18),(228,'1',8,'2021-05-25 07:36:25',608,9,37,21,6,'0',25600,3200,8),(229,'1',8,'2021-05-25 07:36:25',609,9,37,21,6,'0',19200,2400,8),(230,'1',21,'2021-05-25 07:36:25',612,9,37,21,6,'0',10500,500,21),(231,'1',16,'2021-05-25 07:36:25',614,9,37,21,6,'0',8000,500,16),(232,'1',2.64,'2021-05-25 07:36:25',616,9,37,21,6,'0',9750,3250,3),(233,'1',60,'2021-05-25 07:36:25',618,9,37,21,6,'0',85980,1433,60),(234,'1',2,'2021-05-25 07:36:25',620,9,37,21,6,'0',6000,3000,2),(235,'1',4,'2021-05-25 07:36:25',621,9,37,21,6,'0',4000,1000,4),(236,'1',13.61,'2021-05-25 07:36:25',622,9,37,21,6,'0',30002,2143,14),(237,'1',0.15,'2021-05-25 07:36:25',623,9,37,21,6,'0',1500,10000,0),(238,'1',3,'2021-05-25 07:36:25',624,9,37,21,6,'0',6000,2000,3),(239,'1',12,'2021-05-25 07:36:25',625,9,37,21,6,'0',28800,2400,12),(240,'1',42,'2021-05-25 07:36:25',626,9,37,21,6,'0',31500,750,42),(241,'1',40.33,'2021-05-25 07:36:25',628,9,37,21,6,'0',84000,2000,42),(242,'1',12,'2021-05-25 07:36:25',629,9,37,21,6,'0',42000,3500,12),(243,'1',26.715,'2021-05-25 07:36:25',633,9,37,21,6,'0',50575,1750,29),(244,'1',9,'2021-05-25 07:36:25',634,9,37,21,6,'0',21109,2222,10),(245,'1',1.3,'2021-05-25 07:36:25',635,9,37,21,6,'0',0,0,1),(246,'1',18.185,'2021-05-25 07:36:25',637,9,37,21,6,'0',34200,1800,19),(247,'1',16.175,'2021-05-25 07:36:25',638,9,37,21,6,'0',34000,2000,17),(248,'1',2,'2021-05-25 07:36:25',639,9,22,21,6,'0',32186,16093,2),(249,'1',4,'2021-05-25 07:36:25',640,9,35,21,6,'0',35600,8900,4),(250,'1',1,'2021-05-25 07:36:25',642,9,24,21,6,'0',3667,3667,1),(251,'1',9,'2021-05-25 07:36:25',643,9,9,21,6,'0',33327,3703,9),(252,'1',16,'2021-05-25 07:36:25',644,9,9,21,6,'0',54816,3426,16),(253,'1',2,'2021-05-25 07:36:25',664,9,29,21,6,'0',11914,5957,2),(254,'1',2,'2021-05-25 07:36:25',665,9,9,21,6,'0',14830,7415,2),(255,'1',2,'2021-05-25 07:36:25',666,9,9,21,6,'0',6816,3408,2),(256,'1',2,'2021-05-25 07:36:25',667,9,9,21,6,'0',12556,6278,2),(257,'1',3,'2021-05-25 07:36:25',668,9,9,21,6,'0',8298,2766,3),(258,'1',1,'2021-05-25 07:36:25',673,9,9,21,6,'0',2759,2759,1),(259,'1',3,'2021-05-25 07:36:25',677,9,9,21,6,'0',25605,8535,3),(260,'1',2,'2021-05-25 07:36:25',679,9,9,21,6,'0',19310,9655,2),(261,'1',2,'2021-05-25 07:36:25',680,9,9,21,6,'0',6550,3275,2),(262,'1',14,'2021-05-25 07:36:25',685,9,28,21,6,'0',14000,1000,14),(263,'1',2,'2021-05-25 07:36:25',687,9,24,21,6,'0',5002,2501,2),(264,'1',1,'2021-05-25 07:36:25',691,9,9,21,6,'0',11197,11197,1),(265,'1',2,'2021-05-25 07:36:25',695,9,29,21,6,'0',11940,5970,2),(266,'1',2,'2021-05-25 07:36:25',698,9,29,21,6,'0',3800,1900,2),(267,'1',0,'2021-05-25 07:36:25',699,9,29,21,6,'0',1900,1900,1),(268,'1',1,'2021-05-25 07:36:25',708,9,11,21,6,'0',3200,3200,1),(269,'1',5,'2021-05-25 07:36:25',709,9,11,21,6,'0',11750,2350,5),(270,'1',2,'2021-05-25 07:36:25',710,9,11,21,6,'0',7700,3850,2),(271,'1',3,'2021-05-25 07:36:25',711,9,11,21,6,'0',16386,5462,3),(272,'1',2,'2021-05-25 07:36:25',712,9,11,21,6,'0',7700,3850,2),(273,'1',1,'2021-05-25 07:36:25',713,9,11,21,6,'0',2400,2400,1),(274,'1',4,'2021-05-25 07:36:25',714,9,11,21,6,'0',9400,2350,4),(275,'1',3,'2021-05-25 07:36:25',715,9,11,21,6,'0',8388,2796,3),(276,'1',6,'2021-05-25 07:36:25',716,9,11,21,6,'0',16776,2796,6),(277,'1',2,'2021-05-25 07:36:25',718,9,11,21,6,'0',9520,4760,2),(278,'1',3,'2021-05-25 07:36:25',720,9,11,21,6,'0',7068,2356,3),(279,'1',2,'2021-05-25 07:36:25',721,9,11,21,6,'0',9996,4998,2),(280,'1',3,'2021-05-25 07:36:25',722,9,11,21,6,'0',6510,2170,3),(281,'1',1,'2021-05-25 07:36:25',723,9,11,21,6,'0',3470,3470,1),(282,'1',3,'2021-05-25 07:36:25',724,9,11,21,6,'0',7068,2356,3),(283,'1',6,'2021-05-25 07:36:25',725,9,11,21,6,'0',14136,2356,6),(284,'1',2,'2021-05-25 07:36:25',726,9,11,21,6,'0',3960,1980,2),(285,'1',2,'2021-05-25 07:36:25',727,9,24,21,6,'0',6934,3467,2),(286,'1',2,'2021-05-25 07:36:25',734,9,9,21,6,'0',4482,2241,2),(287,'1',1,'2021-05-25 07:36:25',735,9,9,21,6,'0',4138,2069,2),(288,'1',3,'2021-05-25 07:36:25',736,9,9,21,6,'0',6723,2241,3),(289,'1',3,'2021-05-25 07:36:25',738,9,16,21,6,'0',45000,15000,3),(290,'1',2,'2021-05-25 07:36:25',739,9,16,21,6,'0',20000,10000,2),(291,'1',1,'2021-05-25 07:36:25',740,9,16,21,6,'0',10000,10000,1),(292,'1',2,'2021-05-25 07:36:25',741,9,16,21,6,'0',30000,15000,2),(293,'1',6,'2021-05-25 07:36:25',742,9,43,21,6,'0',15900,2650,6),(294,'1',5,'2021-05-25 07:36:25',743,9,43,21,6,'0',14750,2950,5),(295,'1',10,'2021-05-25 07:36:25',744,9,43,21,6,'0',23000,2300,10),(296,'1',8,'2021-05-25 07:36:25',745,9,43,21,6,'0',15200,1900,8),(297,'1',10,'2021-05-25 07:36:25',746,9,43,21,6,'0',17000,1700,10),(298,'1',7,'2021-05-25 07:36:25',747,9,43,21,6,'0',20300,2900,7),(299,'1',6,'2021-05-25 07:36:25',748,9,29,21,6,'0',4896,816,6),(300,'1',1,'2021-05-25 07:36:25',749,9,29,21,6,'0',1638,1638,1),(301,'1',5,'2021-05-25 07:36:25',750,9,29,21,6,'0',8190,1638,5),(302,'1',1,'2021-05-25 07:36:25',751,9,29,21,6,'0',1638,1638,1),(304,'1',5,'2021-05-25 07:36:25',754,9,29,21,6,'0',13500,2700,5),(305,'1',12,'2021-05-25 07:36:25',758,9,28,21,6,'0',10296,858,12),(306,'1',20,'2021-05-25 07:36:25',759,9,28,21,6,'0',22320,1116,20),(307,'1',2,'2021-05-25 07:36:25',760,9,28,21,6,'0',1040,520,2),(308,'1',5,'2021-05-25 07:36:25',761,9,28,21,6,'0',6250,1250,5),(309,'1',5,'2021-05-25 07:36:25',539,9,37,21,6,'0',15000,3000,5),(310,'1',10,'2021-05-25 07:36:25',540,9,37,21,6,'0',22000,2200,10),(311,'1',3,'2021-05-25 07:36:25',766,9,21,21,6,'0',7800,2600,3),(312,'1',1,'2021-05-25 07:36:25',767,9,40,21,6,'0',9000,9000,1),(313,'1',9,'2021-05-25 07:36:25',768,9,12,21,6,'0',9000,1000,9),(314,'1',9,'2021-05-25 07:36:25',769,9,12,21,6,'0',14994,1666,9),(315,'1',5,'2021-05-25 07:36:25',42,9,9,21,6,'0',9105,1821,5),(316,'1',2,'2021-05-25 07:36:25',787,9,9,21,6,'0',3642,1821,2),(317,'1',4,'2021-05-25 07:36:25',728,9,11,21,6,'0',9424,2356,4),(318,'1',1,'2021-05-25 07:36:25',717,9,11,21,6,'0',5319,5319,1),(319,'1',1,'2021-05-25 07:36:25',730,9,11,21,6,'0',2796,2796,1),(320,'1',1,'2021-05-25 07:36:25',731,9,11,21,6,'0',3647,3647,1),(321,'1',1,'2021-05-25 07:36:25',789,9,11,21,6,'0',3200,3200,1),(322,'1',3,'2021-05-25 07:36:25',135,9,19,21,6,'0',25500,8500,3),(323,'1',2,'2021-05-25 07:36:25',791,9,19,21,6,'0',17000,8500,2),(324,'1',2,'2021-05-25 07:36:25',312,9,40,21,6,'0',23000,11500,2),(325,'1',5,'2021-05-25 07:36:25',794,9,44,21,6,'0',32000,6400,5),(326,'1',16,'2021-05-25 07:36:25',795,9,44,21,6,'0',240000,15000,16),(327,'1',1,'2021-05-25 07:36:25',796,9,9,21,6,'0',10500,10500,1),(328,'1',1,'2021-05-25 07:36:25',670,9,9,21,6,'0',2766,2766,1),(329,'1',2,'2021-05-25 07:36:25',672,9,9,21,6,'0',5532,2766,2),(330,'1',1,'2021-05-25 07:36:25',690,9,9,21,6,'0',3275,3275,1),(331,'1',2,'2021-05-25 07:36:25',707,9,9,21,6,'0',6400,3200,2),(332,'1',1,'2021-05-25 07:36:25',373,9,16,21,6,'0',10000,10000,1),(333,'1',2,'2021-05-25 07:36:25',372,9,16,21,6,'0',16000,8000,2),(334,'1',1,'2021-05-25 07:36:25',383,9,16,21,6,'0',22000,22000,1),(335,'1',2,'2021-05-25 07:36:25',382,9,16,21,6,'0',36000,18000,2),(336,'1',1,'2021-05-25 07:36:25',788,9,25,21,6,'0',7500,7500,1),(337,'1',1,'2021-05-25 07:36:25',327,9,17,21,6,'0',22372,22372,1),(338,'1',1,'2021-05-25 07:36:25',328,9,17,21,6,'0',22372,22372,1),(339,'1',4,'2021-05-25 07:36:25',12,9,17,21,6,'0',30000,7500,4),(340,'1',4,'2021-05-25 07:36:25',797,9,18,21,6,'0',42000,10500,4),(341,'1',2,'2021-05-25 07:36:25',798,9,18,21,6,'0',47000,23500,2),(342,'1',1,'2021-05-25 07:36:25',785,9,18,21,6,'0',12000,12000,1),(343,'1',1,'2021-05-25 07:36:25',786,9,18,21,6,'0',18500,18500,1),(344,'1',13,'2021-05-25 07:36:25',519,9,37,21,6,'0',28600,2200,13),(345,'1',1,'2021-05-25 07:36:25',799,9,37,21,6,'0',3800,3800,1),(346,'1',18,'2021-05-25 07:36:25',511,9,37,21,6,'0',56988,3166,18),(347,'1',22,'2021-05-25 07:36:25',517,9,37,21,6,'0',38192,1736,22),(348,'1',17,'2021-05-25 07:36:25',510,9,37,21,6,'0',37332,2196,17),(349,'1',15,'2021-05-25 07:36:25',800,9,37,21,6,'0',42000,2800,15),(350,'1',12,'2021-05-25 07:36:25',522,9,37,21,6,'0',20400,1700,12),(351,'1',4,'2021-05-25 07:36:25',521,9,37,21,6,'0',7800,1950,4),(352,'1',1,'2021-05-25 07:36:25',801,9,37,21,6,'0',2500,2500,1),(353,'1',2,'2021-05-25 07:36:25',802,9,37,21,6,'0',5000,2500,2),(354,'1',3,'2021-05-25 07:36:25',803,9,37,21,6,'0',11400,3800,3),(355,'1',4,'2021-05-25 07:36:25',804,9,37,21,6,'0',10000,2500,4),(356,'1',1,'2021-05-25 07:36:25',805,9,37,21,6,'0',2500,2500,1),(357,'1',1,'2021-05-25 07:36:25',806,9,37,21,6,'0',5500,5500,1),(358,'1',3,'2021-05-25 07:36:25',315,9,21,21,6,'0',17622,5874,3),(359,'1',3,'2021-05-25 07:36:25',775,9,22,21,6,'0',14559,4853,3),(360,'1',6,'2021-05-25 07:36:25',774,9,22,21,6,'0',29118,4853,6),(361,'1',9,'2021-05-25 07:36:25',776,9,22,21,6,'0',40410,4490,9),(362,'1',5,'2021-05-25 07:36:25',772,9,21,21,6,'0',8500,1700,5),(363,'1',1,'2021-05-25 07:36:25',273,9,21,21,6,'0',4120,4120,1),(364,'1',2,'2021-05-25 07:36:25',275,9,21,21,6,'0',12400,6200,2),(365,'1',5,'2021-05-25 07:36:25',771,9,21,21,6,'0',14000,2800,5),(366,'1',4,'2021-05-25 07:36:25',770,9,21,21,6,'0',3200,800,4),(367,'1',2,'2021-05-25 07:36:25',234,9,22,21,6,'0',3734,1867,2),(368,'1',13,'2021-05-25 07:36:25',756,9,29,21,6,'0',36530,2810,13),(369,'1',10,'2021-05-25 07:36:25',647,9,29,21,6,'0',27700,2770,10),(370,'1',25,'2021-05-25 07:36:25',646,9,9,21,6,'0',72925,2917,25),(371,'1',6,'2021-05-25 07:36:25',645,9,9,21,6,'0',19092,3182,6),(372,'1',0.29,'2021-05-25 07:36:25',627,9,37,21,6,'0',2030,7000,0),(373,'1',8,'2021-05-25 07:36:25',230,9,37,21,6,'0',29336,3667,8),(374,'1',5,'2021-05-25 07:36:25',632,9,37,21,6,'0',12500,2500,5),(375,'1',5,'2021-05-25 07:36:25',582,9,37,21,6,'0',80000,16000,5),(376,'1',1,'2021-05-25 07:36:25',684,9,37,21,6,'0',5000,5000,1),(377,'1',3,'2021-05-25 07:36:25',586,9,37,21,6,'0',7500,2500,3),(378,'1',1.6,'2021-05-25 07:36:25',591,9,37,21,6,'0',6400,4000,2),(379,'1',2,'2021-05-25 07:36:25',449,9,37,21,6,'0',2250,1125,2),(380,'1',2,'2021-05-25 07:36:25',764,9,37,21,6,'0',2666,1333,2),(381,'1',11,'2021-05-25 07:36:25',808,9,37,21,6,'0',11000,1000,11),(382,'1',0.3,'2021-05-25 07:36:25',594,9,37,21,6,'0',1200,4000,0),(383,'1',2,'2021-05-25 07:36:25',467,9,37,21,6,'0',10000,5000,2),(384,'1',2,'2021-05-25 07:36:25',472,9,37,21,6,'0',6248,3124,2),(385,'1',29,'2021-05-25 07:36:25',495,9,37,21,6,'0',59073,2037,29),(386,'1',10.5,'2021-05-25 07:36:25',461,9,37,21,6,'0',16800,1600,11),(387,'1',1.1,'2021-05-25 07:36:25',473,9,37,21,6,'0',4400,4000,1),(388,'1',12.2,'2021-05-25 07:36:25',475,9,37,21,6,'0',48800,4000,12),(389,'1',2,'2021-05-25 07:36:25',506,9,37,21,6,'0',14286,7143,2),(390,'1',6.845,'2021-05-25 07:36:25',457,9,37,21,6,'0',15078,2154,7),(391,'1',15,'2021-05-25 07:36:25',484,9,37,21,6,'0',16185,1079,15),(392,'1',6.645,'2021-05-25 07:36:25',476,9,37,21,6,'0',20000,2500,8),(393,'1',18.275,'2021-05-25 07:36:25',477,9,37,21,6,'0',45840,2292,20),(394,'1',7.2,'2021-05-25 07:36:25',536,9,37,21,6,'0',45597.6,6333,7),(395,'1',3,'2021-05-25 07:36:25',533,9,37,21,6,'0',4500,1500,3),(396,'1',7.8,'2021-05-25 07:36:25',534,9,37,21,6,'0',52002.6,6667,8),(397,'1',13.4,'2021-05-25 07:36:25',584,9,37,21,6,'0',52648.6,3929,13),(398,'1',2,'2021-05-25 07:36:25',611,9,37,21,6,'0',4000,2000,2),(399,'1',2.815,'2021-05-25 07:36:25',557,9,37,21,6,'0',9000,3000,3),(400,'1',7.8,'2021-05-25 07:36:25',578,9,37,21,6,'0',11700,1500,8),(401,'1',49.98,'2021-05-25 07:36:25',636,9,37,21,6,'0',81600,1600,51),(402,'1',1.5,'2021-05-25 07:36:25',123,9,35,21,6,'0',28560,19040,2),(403,'1',2.7,'2021-05-25 07:36:25',126,9,35,21,6,'0',35100,13000,3),(404,'1',6,'2021-05-25 07:36:25',692,9,29,21,6,'0',7200,1200,6),(405,'1',2,'2021-05-25 07:36:25',703,9,29,21,6,'0',4616,2308,2),(406,'1',3,'2021-05-25 07:36:25',309,9,29,21,6,'0',16773,5591,3),(407,'1',5,'2021-05-25 07:36:25',304,9,29,21,6,'0',20245,4049,5),(408,'1',2,'2021-05-25 07:36:25',398,9,41,21,6,'0',15882,7941,2),(409,'1',1,'2021-05-25 07:36:25',395,9,41,21,6,'0',7941,7941,1),(410,'1',2,'2021-05-25 07:36:25',397,9,41,21,6,'0',15882,7941,2),(411,'1',3,'2021-05-25 07:36:25',392,9,41,21,6,'0',23823,7941,3),(412,'1',3,'2021-05-25 07:36:25',399,9,41,21,6,'0',23823,7941,3),(413,'1',4,'2021-05-25 07:36:25',682,9,28,21,6,'0',4132,1033,4),(414,'1',2,'2021-05-25 07:36:25',30,9,28,21,6,'0',10900,5450,2),(415,'1',15,'2021-05-25 07:36:25',650,9,29,21,6,'0',49500,3300,15),(416,'1',0,'2021-05-25 07:36:25',648,9,29,21,6,'0',3300,3300,1),(417,'1',1,'2021-05-25 07:36:25',78,9,28,21,6,'0',1833,1833,1),(418,'1',1,'2021-05-25 07:36:25',77,9,28,21,6,'0',1666,1666,1),(419,'1',9,'2021-05-25 07:36:25',781,9,22,21,6,'0',88200,9800,9),(420,'1',8,'2021-05-25 07:36:25',782,9,22,21,6,'0',78400,9800,8),(421,'1',2,'2021-05-25 07:36:25',262,9,24,21,6,'0',6500,3250,2),(422,'1',3,'2021-05-25 07:36:25',263,9,24,21,6,'0',10245,3415,3),(423,'1',3,'2021-05-25 07:36:25',81,9,25,21,6,'0',77760,25920,3),(424,'1',2,'2021-05-25 07:36:25',810,9,25,21,6,'0',125564,62782,2),(425,'1',1,'2021-05-25 07:36:25',811,9,25,21,6,'0',62155,62155,1),(426,'1',1,'2021-05-25 07:36:25',812,9,25,21,6,'0',44036,44036,1),(427,'1',1,'2021-05-25 07:36:25',813,9,21,21,6,'0',5874,5874,1),(428,'1',1,'2021-05-25 07:36:25',814,9,21,21,6,'0',5874,5874,1),(429,'1',5,'2021-05-25 07:36:25',816,9,9,21,6,'0',9105,1821,5),(430,'1',5,'2021-05-25 07:36:25',817,9,9,21,6,'0',14500,2900,5),(431,'1',1,'2021-05-25 07:36:25',149,9,15,21,6,'0',3900,3900,1),(432,'1',2,'2021-05-25 07:36:25',157,9,15,21,6,'0',9758,4879,2),(433,'1',1,'2021-05-25 07:36:25',166,9,15,21,6,'0',7973,7973,1),(434,'1',1,'2021-05-25 07:36:25',689,9,15,21,6,'0',4641,4641,1),(435,'1',1,'2021-05-25 07:36:25',167,9,15,21,6,'0',4879,4879,1),(436,'1',16,'2021-05-25 07:36:25',494,9,37,21,6,'0',46800,2600,18),(437,'1',32,'2021-05-25 07:36:25',601,9,37,21,6,'0',22400,700,32),(438,'1',1,'2021-05-25 07:36:25',409,9,21,21,6,'0',3998,3998,1),(439,'1',2,'2021-05-25 07:36:25',818,9,21,21,6,'0',6502,3251,2),(440,'1',2,'2021-05-25 07:36:25',224,9,21,21,6,'0',7924,3962,2),(441,'1',1,'2021-05-25 07:36:25',156,9,15,21,6,'0',4760,4760,1),(442,'1',11,'2021-05-25 07:36:25',653,9,30,21,6,'0',100265,9115,11),(443,'1',8,'2021-05-25 07:36:25',654,9,30,21,6,'0',72920,9115,8),(444,'1',7,'2021-05-25 07:36:25',660,9,30,21,6,'0',63805,9115,7),(445,'1',1,'2021-05-25 07:36:25',655,9,30,21,6,'0',9115,9115,1),(446,'1',4,'2021-05-25 07:36:25',659,9,30,21,6,'0',36460,9115,4),(447,'1',1,'2021-05-25 07:36:25',658,9,30,21,6,'0',9115,9115,1),(448,'1',1,'2021-05-25 07:36:25',652,9,30,21,6,'0',9115,9115,1),(449,'1',1,'2021-05-25 07:36:25',656,9,30,21,6,'0',9115,9115,1),(450,'1',2,'2021-05-25 07:36:25',657,9,30,21,6,'0',18230,9115,2),(451,'1',4,'2021-05-25 07:36:25',775,9,22,21,6,'0',19412,4853,4),(452,'1',4,'2021-05-25 07:36:25',265,9,22,21,6,'0',19412,4853,4),(453,'1',4,'2021-05-25 07:36:25',820,9,22,21,6,'0',19200,4800,4),(454,'1',2,'2021-05-25 07:36:25',778,9,21,21,6,'0',8174,4087,2),(455,'1',18,'2021-05-25 07:36:25',651,9,9,21,6,'0',57276,3182,18),(456,'1',4,'2021-05-25 07:36:25',822,9,9,21,6,'0',12728,3182,4),(457,'1',4,'2021-05-25 07:36:25',305,9,9,21,6,'0',8968,2242,4),(458,'1',21,'2021-05-25 07:36:25',649,9,29,21,6,'0',69300,3300,21),(459,'1',4,'2021-05-25 07:36:25',823,9,9,21,6,'0',16800,4200,4),(460,'1',0,'2021-05-25 07:36:25',824,9,9,21,6,'0',700,700,1),(461,'1',1,'2021-05-25 07:36:25',825,9,9,21,6,'0',700,700,1),(462,'1',1,'2021-05-25 07:36:25',826,9,29,21,6,'0',2700,2700,1),(463,'1',2,'2021-05-25 07:36:25',827,9,29,21,6,'0',7000,3500,2),(464,'1',2,'2021-05-25 07:36:25',113,9,29,21,6,'0',6300,3150,2),(465,'1',2,'2021-05-25 07:36:25',173,9,29,21,6,'0',5800,2900,2),(466,'1',2,'2021-05-25 07:36:25',828,9,29,21,6,'0',9800,4900,2),(467,'1',2,'2021-05-25 07:36:25',829,9,29,21,6,'0',13000,6500,2),(468,'1',3,'2021-05-25 07:36:25',830,9,9,21,6,'0',4500,1500,3),(469,'1',1,'2021-05-25 07:36:25',831,9,9,21,6,'0',1500,1500,1),(470,'1',3,'2021-05-25 07:40:49',753,9,34,21,6,'0',24900,24900,3),(472,'1',9,'2021-05-25 09:48:14',833,9,37,11,6,'01',18000,18000,9),(473,'1',5,'2021-05-25 10:15:38',469,9,13,21,6,'1',56250,56250,10),(474,'1',3,'2021-05-25 10:16:55',627,9,13,21,6,'2',21000,21000,3),(475,'1',10,'2021-05-25 10:18:21',451,9,13,21,6,'2',65000,65000,10),(476,'1',16,'2021-05-25 10:18:55',458,9,13,21,6,'2',31104,31104,16),(477,'1',10,'2021-05-25 10:45:25',616,9,13,21,6,'2',32500,32500,10),(478,'1',2,'2021-05-25 19:42:35',266,9,26,11,6,'1',4794,4794,2),(479,'1',2,'2021-05-25 21:01:59',469,9,37,21,6,'0',11250,11250,2),(480,'1',2,'2021-05-25 21:06:16',277,9,13,21,6,'FE2345',5040,5040,2),(481,'1',2,'2021-05-25 21:10:12',511,9,13,21,6,'0',6332,6332,2),(482,'1',10,'2021-05-25 21:15:57',508,9,13,21,8,'1',20000,20000,10),(483,'1',20,'2021-05-25 21:54:59',1,9,20,11,6,'0',120000,6000,20),(484,'1',20,'2021-05-25 21:54:59',2,9,18,11,6,'0',210000,10500,20),(485,'1',20,'2021-05-25 21:54:59',3,9,25,11,6,'0',370000,18500,20),(486,'1',20,'2021-05-25 21:54:59',4,9,38,11,6,'0',310000,15500,20),(487,'1',20,'2021-05-25 21:54:59',5,9,25,11,6,'0',150000,7500,20),(488,'1',20,'2021-05-25 21:54:59',6,9,18,11,6,'0',128520,6426,20),(489,'1',20,'2021-05-25 21:54:59',7,9,18,11,6,'0',102000,5100,20),(490,'1',20,'2021-05-25 21:54:59',8,9,18,11,6,'0',300000,15000,20),(491,'1',20,'2021-05-25 21:54:59',9,9,18,11,6,'0',170000,8500,20),(492,'1',20,'2021-05-25 21:54:59',10,9,22,11,6,'0',170000,8500,20),(493,'1',20,'2021-05-25 21:54:59',11,9,22,11,6,'0',150000,7500,20),(494,'1',20,'2021-05-25 21:54:59',12,9,22,11,6,'0',150000,7500,20),(495,'1',20,'2021-05-25 21:54:59',13,9,22,11,6,'0',257620,12881,20),(496,'1',20,'2021-05-25 21:54:59',14,9,19,11,6,'0',750000,37500,20),(497,'1',20,'2021-05-25 21:54:59',15,9,22,11,6,'0',334000,16700,20),(498,'1',20,'2021-05-25 21:54:59',16,9,22,11,6,'0',280000,14000,20),(499,'1',20,'2021-05-25 21:54:59',17,9,22,11,6,'0',35700,1785,20),(500,'1',20,'2021-05-25 21:54:59',18,9,36,11,6,'0',280000,14000,20),(501,'1',20,'2021-05-25 21:54:59',19,9,36,11,6,'0',280000,14000,20),(502,'1',20,'2021-05-25 21:54:59',20,9,36,11,6,'0',200320,10016,20),(503,'1',20,'2021-05-25 21:54:59',21,9,28,11,6,'0',200320,10016,20),(504,'1',20,'2021-05-25 21:54:59',22,9,28,11,6,'0',177720,8886,20),(505,'1',20,'2021-05-25 21:54:59',23,9,25,11,6,'0',170000,8500,20),(506,'1',20,'2021-05-25 21:54:59',24,9,25,11,6,'0',170000,8500,20),(507,'1',20,'2021-05-25 21:54:59',25,9,25,11,6,'0',85000,4250,20),(508,'1',20,'2021-05-25 21:54:59',26,9,25,11,6,'0',170000,8500,20),(509,'1',20,'2021-05-25 21:54:59',27,9,25,11,6,'0',170000,8500,20),(510,'1',20,'2021-05-25 21:54:59',28,9,25,11,6,'0',85000,4250,20),(511,'1',20,'2021-05-25 21:54:59',29,9,28,11,6,'0',170000,8500,20),(512,'1',20,'2021-05-25 21:54:59',30,9,28,11,6,'0',109000,5450,20),(513,'1',20,'2021-05-25 21:54:59',31,9,28,11,6,'0',25000,1250,20),(514,'1',20,'2021-05-25 21:54:59',32,9,28,11,6,'0',36000,1800,20),(515,'1',20,'2021-05-25 21:54:59',33,9,28,11,6,'0',41660,2083,20),(516,'1',20,'2021-05-25 21:54:59',34,9,28,11,6,'0',25080,1254,20),(517,'1',20,'2021-05-25 21:54:59',35,9,28,11,6,'0',17000,850,20),(518,'1',20,'2021-05-25 21:54:59',36,9,28,11,6,'0',25080,1254,20),(519,'1',20,'2021-05-25 21:54:59',37,9,28,11,6,'0',27320,1366,20),(520,'1',20,'2021-05-25 21:54:59',38,9,28,11,6,'0',32000,1600,20),(521,'1',20,'2021-05-25 21:54:59',39,9,28,11,6,'0',32000,1600,20),(522,'1',20,'2021-05-25 21:54:59',40,9,28,11,6,'0',34620,1731,20),(523,'1',20,'2021-05-25 21:54:59',41,9,28,11,6,'0',34620,1731,20),(524,'1',20,'2021-05-25 21:54:59',42,9,25,11,6,'0',36420,1821,20),(525,'1',20,'2021-05-25 21:54:59',43,9,34,11,6,'0',30000,1500,20),(526,'1',20,'2021-05-25 21:54:59',44,9,34,11,6,'0',41660,2083,20),(527,'1',20,'2021-05-25 21:54:59',45,9,34,11,6,'0',41660,2083,20),(528,'1',20,'2021-05-25 21:54:59',46,9,29,11,6,'0',41660,2083,20),(529,'1',20,'2021-05-25 21:54:59',47,9,29,11,6,'0',41660,2083,20),(530,'1',20,'2021-05-25 21:54:59',48,9,29,11,6,'0',500000,25000,20),(531,'1',20,'2021-05-25 21:54:59',49,9,35,11,6,'0',320000,16000,20),(532,'1',20,'2021-05-25 21:54:59',50,9,35,11,6,'0',320000,16000,20),(533,'1',20,'2021-05-25 21:54:59',51,9,35,11,6,'0',320000,16000,20),(534,'1',20,'2021-05-25 21:54:59',52,9,35,11,6,'0',540000,27000,20),(535,'1',20,'2021-05-25 21:54:59',53,9,35,11,6,'0',672000,33600,20),(536,'1',20,'2021-05-25 21:54:59',54,9,35,11,6,'0',672000,33600,20),(537,'1',20,'2021-05-25 21:54:59',55,9,35,11,6,'0',700000,35000,20),(538,'1',20,'2021-05-25 21:54:59',56,9,35,11,6,'0',533000,26650,20),(539,'1',20,'2021-05-25 21:54:59',57,9,35,11,6,'0',102000,5100,20),(540,'1',20,'2021-05-25 21:54:59',58,9,35,11,6,'0',380000,19000,20),(541,'1',20,'2021-05-25 21:54:59',59,9,29,11,6,'0',87580,4379,20),(542,'1',20,'2021-05-25 21:54:59',60,9,31,11,6,'0',222380,11119,20),(543,'1',20,'2021-05-25 21:54:59',61,9,9,11,6,'0',82000,4100,20),(544,'1',20,'2021-05-25 21:54:59',62,9,9,11,6,'0',27320,1366,20),(545,'1',20,'2021-05-25 21:54:59',63,9,21,11,6,'0',27320,1366,20),(546,'1',20,'2021-05-25 21:54:59',64,9,18,11,6,'0',56000,2800,20),(547,'1',20,'2021-05-25 21:54:59',65,9,15,11,6,'0',18660,933,20),(548,'1',20,'2021-05-25 21:54:59',66,9,15,11,6,'0',18660,933,20),(549,'1',20,'2021-05-25 21:54:59',67,9,21,11,6,'0',18660,933,20),(550,'1',20,'2021-05-25 21:54:59',68,9,19,11,6,'0',17320,866,20),(551,'1',20,'2021-05-25 21:54:59',69,9,19,11,6,'0',17320,866,20),(552,'1',20,'2021-05-25 21:54:59',70,9,19,11,6,'0',17320,866,20),(553,'1',20,'2021-05-25 21:54:59',71,9,19,11,6,'0',17320,866,20),(554,'1',20,'2021-05-25 21:54:59',72,9,19,11,6,'0',17320,866,20),(555,'1',20,'2021-05-25 21:54:59',73,9,21,11,6,'0',16660,833,20),(556,'1',20,'2021-05-25 21:54:59',74,9,21,11,6,'0',27320,1366,20),(557,'1',20,'2021-05-25 21:54:59',75,9,23,11,6,'0',35500,1775,20),(558,'1',20,'2021-05-25 21:54:59',76,9,21,11,6,'0',35500,1775,20),(559,'1',20,'2021-05-25 21:54:59',77,9,21,11,6,'0',33320,1666,20),(560,'1',20,'2021-05-25 21:54:59',78,9,13,11,6,'0',36660,1833,20),(561,'1',20,'2021-05-25 21:54:59',79,9,37,11,6,'0',16660,833,20),(562,'1',20,'2021-05-25 21:54:59',80,9,24,11,6,'0',16660,833,20),(563,'1',20,'2021-05-25 21:54:59',81,9,24,11,6,'0',518400,25920,20),(564,'1',20,'2021-05-25 21:54:59',82,9,24,11,6,'0',52820,2641,20),(565,'1',20,'2021-05-25 21:54:59',83,9,24,11,6,'0',52820,2641,20),(566,'1',20,'2021-05-25 21:54:59',84,9,24,11,6,'0',29160,1458,20),(567,'1',20,'2021-05-25 21:54:59',85,9,25,11,6,'0',29160,1458,20),(568,'1',20,'2021-05-25 21:54:59',86,9,24,11,6,'0',89000,4450,20),(569,'1',20,'2021-05-25 21:54:59',87,9,24,11,6,'0',540000,27000,20),(570,'1',20,'2021-05-25 21:54:59',88,9,24,11,6,'0',148000,7400,20),(571,'1',20,'2021-05-25 21:54:59',89,9,24,11,6,'0',920000,46000,20),(572,'1',20,'2021-05-25 21:54:59',90,9,13,11,6,'0',40000,2000,20),(573,'1',20,'2021-05-25 21:54:59',91,9,13,11,6,'0',464000,23200,20),(574,'1',20,'2021-05-25 21:54:59',92,9,13,11,6,'0',500000,25000,20),(575,'1',20,'2021-05-25 21:54:59',93,9,13,11,6,'0',384000,19200,20),(576,'1',20,'2021-05-25 21:54:59',94,9,13,11,6,'0',160000,8000,20),(577,'1',20,'2021-05-25 21:54:59',95,9,13,11,6,'0',920000,46000,20),(578,'1',20,'2021-05-25 21:54:59',96,9,13,11,6,'0',188000,9400,20),(579,'1',20,'2021-05-25 21:54:59',97,9,9,11,6,'0',120960,6048,20),(580,'1',20,'2021-05-25 21:54:59',98,9,9,11,6,'0',224000,11200,20),(581,'1',20,'2021-05-25 21:54:59',99,9,9,11,6,'0',500000,25000,20),(582,'1',20,'2021-05-25 21:54:59',100,9,9,11,6,'0',820000,41000,20),(583,'1',20,'2021-05-25 21:54:59',101,9,9,11,6,'0',308000,15400,20),(584,'1',20,'2021-05-25 21:54:59',102,9,29,11,6,'0',422000,21100,20),(585,'1',20,'2021-05-25 21:54:59',103,9,29,11,6,'0',98560,4928,20),(586,'1',20,'2021-05-25 21:54:59',104,9,9,11,6,'0',340000,17000,20),(587,'1',20,'2021-05-25 21:54:59',105,9,29,11,6,'0',420000,21000,20),(588,'1',20,'2021-05-25 21:54:59',106,9,22,11,6,'0',85200,4260,20),(589,'1',20,'2021-05-25 21:54:59',107,9,25,11,6,'0',48260,2413,20),(590,'1',20,'2021-05-25 21:54:59',108,9,14,11,6,'0',155000,7750,20),(591,'1',20,'2021-05-25 21:54:59',109,9,14,11,6,'0',82800,4140,20),(592,'1',20,'2021-05-25 21:54:59',110,9,17,11,6,'0',117600,5880,20),(593,'1',20,'2021-05-25 21:54:59',111,9,17,11,6,'0',92600,4630,20),(594,'1',20,'2021-05-25 21:54:59',112,9,17,11,6,'0',92600,4630,20),(595,'1',20,'2021-05-25 21:54:59',113,9,17,11,6,'0',63000,3150,20),(596,'1',20,'2021-05-25 21:54:59',114,9,17,11,6,'0',185600,9280,20),(597,'1',20,'2021-05-25 21:54:59',115,9,32,11,6,'0',690000,34500,20),(598,'1',20,'2021-05-25 21:54:59',116,9,12,11,6,'0',104720,5236,20),(599,'1',20,'2021-05-25 21:54:59',117,9,12,11,6,'0',602000,30100,20),(600,'1',20,'2021-05-25 21:54:59',118,9,12,11,6,'0',211820,10591,20),(601,'1',20,'2021-05-25 21:54:59',119,9,12,11,6,'0',530000,26500,20),(602,'1',20,'2021-05-25 21:54:59',120,9,12,11,6,'0',316000,15800,20),(603,'1',20,'2021-05-25 21:54:59',121,9,12,11,6,'0',280000,14000,20),(604,'1',20,'2021-05-25 21:54:59',122,9,12,11,6,'0',140420,7021,20),(605,'1',20,'2021-05-25 21:54:59',123,9,12,11,6,'0',380800,19040,20),(606,'1',20,'2021-05-25 21:54:59',124,9,12,11,6,'0',360000,18000,20),(607,'1',20,'2021-05-25 21:54:59',125,9,12,11,6,'0',300000,15000,20),(608,'1',20,'2021-05-25 21:54:59',126,9,12,11,6,'0',260000,13000,20),(609,'1',20,'2021-05-25 21:54:59',127,9,12,11,6,'0',578000,28900,20),(610,'1',20,'2021-05-25 21:54:59',128,9,12,11,6,'0',116620,5831,20),(611,'1',20,'2021-05-25 21:54:59',129,9,12,11,6,'0',211820,10591,20),(612,'1',20,'2021-05-25 21:54:59',130,9,12,11,6,'0',90000,4500,20),(613,'1',20,'2021-05-25 21:54:59',131,9,12,11,6,'0',150000,7500,20),(614,'1',20,'2021-05-25 21:54:59',132,9,12,11,6,'0',108000,5400,20),(615,'1',20,'2021-05-25 21:54:59',133,9,12,11,6,'0',213400,10670,20),(616,'1',20,'2021-05-25 21:54:59',134,9,41,11,6,'0',338000,16900,20),(617,'1',20,'2021-05-25 21:54:59',135,9,41,11,6,'0',170000,8500,20),(618,'1',20,'2021-05-25 21:54:59',136,9,14,11,6,'0',170000,8500,20),(619,'1',20,'2021-05-25 21:54:59',137,9,22,11,6,'0',170000,8500,20),(620,'1',20,'2021-05-25 21:54:59',138,9,22,11,6,'0',108000,5400,20),(621,'1',20,'2021-05-25 21:54:59',139,9,22,11,6,'0',108000,5400,20),(622,'1',20,'2021-05-25 21:54:59',140,9,22,11,6,'0',144000,7200,20),(623,'1',20,'2021-05-25 21:54:59',141,9,22,11,6,'0',101480,5074,20),(624,'1',20,'2021-05-25 21:54:59',142,9,22,11,6,'0',110000,5500,20),(625,'1',20,'2021-05-25 21:54:59',143,9,16,11,6,'0',18540,927,20),(626,'1',20,'2021-05-25 21:54:59',144,9,16,11,6,'0',82820,4141,20),(627,'1',20,'2021-05-25 21:54:59',145,9,16,11,6,'0',108360,5418,20),(628,'1',20,'2021-05-25 21:54:59',146,9,16,11,6,'0',420000,21000,20),(629,'1',20,'2021-05-25 21:54:59',147,9,16,11,6,'0',113520,5676,20),(630,'1',20,'2021-05-25 21:54:59',148,9,16,11,6,'0',140000,7000,20),(631,'1',20,'2021-05-25 21:54:59',149,9,16,11,6,'0',78000,3900,20),(632,'1',20,'2021-05-25 21:54:59',150,9,16,11,6,'0',95200,4760,20),(633,'1',20,'2021-05-25 21:54:59',151,9,16,11,6,'0',178500,8925,20),(634,'1',20,'2021-05-25 21:54:59',152,9,16,11,6,'0',178500,8925,20),(635,'1',20,'2021-05-25 21:54:59',153,9,10,11,6,'0',166600,8330,20),(636,'1',20,'2021-05-25 21:54:59',154,9,10,11,6,'0',95200,4760,20),(637,'1',20,'2021-05-25 21:54:59',155,9,10,11,6,'0',95200,4760,20),(638,'1',20,'2021-05-25 21:54:59',156,9,21,11,6,'0',95200,4760,20),(639,'1',20,'2021-05-25 21:54:59',157,9,13,11,6,'0',97580,4879,20),(640,'1',20,'2021-05-25 21:54:59',158,9,13,11,6,'0',92820,4641,20),(641,'1',20,'2021-05-25 21:54:59',159,9,13,11,6,'0',97580,4879,20),(642,'1',20,'2021-05-25 21:54:59',160,9,13,11,6,'0',92820,4641,20),(643,'1',20,'2021-05-25 21:54:59',161,9,13,11,6,'0',92820,4641,20),(644,'1',20,'2021-05-25 21:54:59',162,9,13,11,6,'0',92820,4641,20),(645,'1',20,'2021-05-25 21:54:59',163,9,13,11,6,'0',166600,8330,20),(646,'1',20,'2021-05-25 21:54:59',164,9,13,11,6,'0',159460,7973,20),(647,'1',20,'2021-05-25 21:54:59',165,9,13,11,6,'0',95200,4760,20),(648,'1',20,'2021-05-25 21:54:59',166,9,13,11,6,'0',159460,7973,20),(649,'1',20,'2021-05-25 21:54:59',167,9,37,11,6,'0',97580,4879,20),(650,'1',20,'2021-05-25 21:54:59',168,9,37,11,6,'0',360000,18000,20),(651,'1',20,'2021-05-25 21:54:59',169,9,37,11,6,'0',180000,9000,20),(652,'1',20,'2021-05-25 21:54:59',170,9,37,11,6,'0',70940,3547,20),(653,'1',20,'2021-05-25 21:54:59',171,9,37,11,6,'0',92200,4610,20),(654,'1',20,'2021-05-25 21:54:59',172,9,37,11,6,'0',72000,3600,20),(655,'1',20,'2021-05-25 21:54:59',173,9,37,11,6,'0',58000,2900,20),(656,'1',20,'2021-05-25 21:54:59',174,9,37,11,6,'0',88000,4400,20),(657,'1',20,'2021-05-25 21:54:59',175,9,37,11,6,'0',120000,6000,20),(658,'1',20,'2021-05-25 21:54:59',176,9,37,11,6,'0',160000,8000,20),(659,'1',20,'2021-05-25 21:54:59',177,9,37,11,6,'0',110000,5500,20),(660,'1',20,'2021-05-25 21:54:59',178,9,37,11,6,'0',110000,5500,20),(661,'1',20,'2021-05-25 21:54:59',179,9,37,11,6,'0',110000,5500,20),(662,'1',20,'2021-05-25 21:54:59',180,9,37,11,6,'0',170000,8500,20),(663,'1',20,'2021-05-25 21:54:59',181,9,37,11,6,'0',160000,8000,20),(664,'1',20,'2021-05-25 21:54:59',182,9,37,11,6,'0',160000,8000,20),(665,'1',20,'2021-05-25 21:54:59',183,9,37,11,6,'0',160000,8000,20),(666,'1',20,'2021-05-25 21:54:59',184,9,37,11,6,'0',160000,8000,20),(667,'1',20,'2021-05-25 21:54:59',185,9,37,11,6,'0',170000,8500,20),(668,'1',20,'2021-05-25 21:54:59',186,9,37,11,6,'0',290000,14500,20),(669,'1',20,'2021-05-25 21:54:59',187,9,37,11,6,'0',290000,14500,20),(670,'1',20,'2021-05-25 21:54:59',188,9,37,11,6,'0',290000,14500,20),(671,'1',20,'2021-05-25 21:54:59',189,9,37,11,6,'0',290000,14500,20),(672,'1',20,'2021-05-25 21:54:59',190,9,37,11,6,'0',290000,14500,20),(673,'1',20,'2021-05-25 21:54:59',191,9,37,11,6,'0',290000,14500,20),(674,'1',20,'2021-05-25 21:54:59',192,9,37,11,6,'0',290000,14500,20),(675,'1',20,'2021-05-25 21:54:59',193,9,37,11,6,'0',290000,14500,20),(676,'1',20,'2021-05-25 21:54:59',194,9,37,11,6,'0',312000,15600,20),(677,'1',20,'2021-05-25 21:54:59',195,9,37,11,6,'0',312000,15600,20),(678,'1',20,'2021-05-25 21:54:59',196,9,37,11,6,'0',312000,15600,20),(679,'1',20,'2021-05-25 21:54:59',197,9,37,11,6,'0',312000,15600,20),(680,'1',20,'2021-05-25 21:54:59',198,9,37,11,6,'0',312000,15600,20),(681,'1',20,'2021-05-25 21:54:59',199,9,37,11,6,'0',170000,8500,20),(682,'1',20,'2021-05-25 21:54:59',200,9,37,11,6,'0',170000,8500,20),(683,'1',20,'2021-05-25 21:54:59',201,9,37,11,6,'0',120000,6000,20),(684,'1',20,'2021-05-25 21:54:59',202,9,37,11,6,'0',40820,2041,20),(685,'1',20,'2021-05-25 21:54:59',203,9,37,11,6,'0',54480,2724,20),(686,'1',20,'2021-05-25 21:54:59',204,9,37,11,6,'0',52340,2617,20),(687,'1',20,'2021-05-25 21:54:59',205,9,37,11,6,'0',70320,3516,20),(688,'1',20,'2021-05-25 21:54:59',206,9,37,11,6,'0',50000,2500,20),(689,'1',20,'2021-05-25 21:54:59',207,9,37,11,6,'0',200000,10000,20),(690,'1',20,'2021-05-25 21:54:59',208,9,37,11,6,'0',160000,8000,20),(691,'1',20,'2021-05-25 21:54:59',209,9,37,11,6,'0',100000,5000,20),(692,'1',20,'2021-05-25 21:54:59',210,9,37,11,6,'0',260000,13000,20),(693,'1',20,'2021-05-25 21:54:59',211,9,37,11,6,'0',100000,5000,20),(694,'1',20,'2021-05-25 21:54:59',212,9,37,11,6,'0',160000,8000,20),(695,'1',20,'2021-05-25 21:54:59',213,9,37,11,6,'0',100000,5000,20),(696,'1',20,'2021-05-25 21:54:59',214,9,37,11,6,'0',100000,5000,20),(697,'1',20,'2021-05-25 21:54:59',215,9,37,11,6,'0',100000,5000,20),(698,'1',20,'2021-05-25 21:54:59',216,9,37,11,6,'0',150000,7500,20),(699,'1',20,'2021-05-25 21:54:59',217,9,37,11,6,'0',140000,7000,20),(700,'1',20,'2021-05-25 21:54:59',218,9,37,11,6,'0',120000,6000,20),(701,'1',20,'2021-05-25 21:54:59',219,9,37,11,6,'0',100000,5000,20),(702,'1',20,'2021-05-25 21:54:59',220,9,37,11,6,'0',100000,5000,20),(703,'1',20,'2021-05-25 21:54:59',221,9,37,11,6,'0',600000,30000,20),(704,'1',20,'2021-05-25 21:54:59',222,9,37,11,6,'0',500000,25000,20),(705,'1',20,'2021-05-25 21:54:59',223,9,37,11,6,'0',100000,5000,20),(706,'1',20,'2021-05-25 21:54:59',224,9,37,11,6,'0',79240,3962,20),(707,'1',20,'2021-05-25 21:54:59',225,9,37,11,6,'0',83300,4165,20),(708,'1',20,'2021-05-25 21:54:59',226,9,37,11,6,'0',340000,17000,20),(709,'1',20,'2021-05-25 21:54:59',227,9,37,11,6,'0',205160,10258,20),(710,'1',20,'2021-05-25 21:54:59',228,9,37,11,6,'0',205160,10258,20),(711,'1',20,'2021-05-25 21:54:59',229,9,37,11,6,'0',205160,10258,20),(712,'1',20,'2021-05-25 21:54:59',230,9,37,11,6,'0',73340,3667,20),(713,'1',20,'2021-05-25 21:54:59',231,9,37,11,6,'0',126660,6333,20),(714,'1',20,'2021-05-25 21:54:59',232,9,37,11,6,'0',300000,15000,20),(715,'1',20,'2021-05-25 21:54:59',233,9,37,11,6,'0',150000,7500,20),(716,'1',20,'2021-05-25 21:54:59',234,9,37,11,6,'0',37340,1867,20),(717,'1',20,'2021-05-25 21:54:59',235,9,37,11,6,'0',81660,4083,20),(718,'1',20,'2021-05-25 21:54:59',236,9,37,11,6,'0',84160,4208,20),(719,'1',20,'2021-05-25 21:54:59',237,9,37,11,6,'0',84160,4208,20),(720,'1',20,'2021-05-25 21:54:59',238,9,37,11,6,'0',84160,4208,20),(721,'1',20,'2021-05-25 21:54:59',239,9,37,11,6,'0',94160,4708,20),(722,'1',20,'2021-05-25 21:54:59',240,9,37,11,6,'0',108340,5417,20),(723,'1',20,'2021-05-25 21:54:59',241,9,37,11,6,'0',108340,5417,20),(724,'1',20,'2021-05-25 21:54:59',242,9,37,11,6,'0',96640,4832,20),(725,'1',20,'2021-05-25 21:54:59',243,9,37,11,6,'0',68320,3416,20),(726,'1',20,'2021-05-25 21:54:59',244,9,37,11,6,'0',68320,3416,20),(727,'1',20,'2021-05-25 21:54:59',245,9,37,11,6,'0',43320,2166,20),(728,'1',20,'2021-05-25 21:54:59',246,9,37,11,6,'0',39940,1997,20),(729,'1',20,'2021-05-25 21:54:59',247,9,37,11,6,'0',56660,2833,20),(730,'1',20,'2021-05-25 21:54:59',248,9,22,11,6,'0',64460,3223,20),(731,'1',20,'2021-05-25 21:54:59',249,9,35,11,6,'0',47880,2394,20),(732,'1',20,'2021-05-25 21:54:59',250,9,24,11,6,'0',66040,3302,20),(733,'1',20,'2021-05-25 21:54:59',251,9,9,11,6,'0',61660,3083,20),(734,'1',20,'2021-05-25 21:54:59',252,9,9,11,6,'0',318000,15900,20),(735,'1',20,'2021-05-25 21:54:59',253,9,29,11,6,'0',300000,15000,20),(736,'1',20,'2021-05-25 21:54:59',254,9,9,11,6,'0',68320,3416,20),(737,'1',20,'2021-05-25 21:54:59',255,9,9,11,6,'0',56000,2800,20),(738,'1',20,'2021-05-25 21:54:59',256,9,9,11,6,'0',102000,5100,20),(739,'1',20,'2021-05-25 21:54:59',257,9,9,11,6,'0',114980,5749,20),(740,'1',20,'2021-05-25 21:54:59',258,9,9,11,6,'0',223000,11150,20),(741,'1',20,'2021-05-25 21:54:59',259,9,9,11,6,'0',223000,11150,20),(742,'1',20,'2021-05-25 21:54:59',260,9,9,11,6,'0',71680,3584,20),(743,'1',20,'2021-05-25 21:54:59',261,9,9,11,6,'0',68320,3416,20),(744,'1',20,'2021-05-25 21:54:59',262,9,28,11,6,'0',65000,3250,20),(745,'1',20,'2021-05-25 21:54:59',263,9,24,11,6,'0',68300,3415,20),(746,'1',20,'2021-05-25 21:54:59',264,9,9,11,6,'0',27760,1388,20),(747,'1',20,'2021-05-25 21:54:59',265,9,29,11,6,'0',97060,4853,20),(748,'1',20,'2021-05-25 21:54:59',266,9,29,11,6,'0',47940,2397,20),(749,'1',20,'2021-05-25 21:54:59',267,9,29,11,6,'0',47940,2397,20),(750,'1',20,'2021-05-25 21:54:59',268,9,11,11,6,'0',47940,2397,20),(751,'1',20,'2021-05-25 21:54:59',269,9,11,11,6,'0',60600,3030,20),(752,'1',20,'2021-05-25 21:54:59',270,9,11,11,6,'0',47000,2350,20),(753,'1',20,'2021-05-25 21:54:59',271,9,11,11,6,'0',65560,3278,20),(754,'1',20,'2021-05-25 21:54:59',272,9,11,11,6,'0',47120,2356,20),(755,'1',20,'2021-05-25 21:54:59',273,9,11,11,6,'0',82400,4120,20),(756,'1',20,'2021-05-25 21:54:59',274,9,11,11,6,'0',130000,6500,20),(757,'1',20,'2021-05-25 21:54:59',275,9,11,11,6,'0',124000,6200,20),(758,'1',20,'2021-05-25 21:54:59',276,9,11,11,6,'0',83000,4150,20),(759,'1',20,'2021-05-25 21:54:59',277,9,11,11,6,'0',50400,2520,20),(760,'1',20,'2021-05-25 21:54:59',278,9,11,11,6,'0',16000,800,20),(761,'1',20,'2021-05-25 21:54:59',279,9,11,11,6,'0',22000,1100,20),(762,'1',20,'2021-05-25 21:54:59',280,9,11,11,6,'0',26000,1300,20),(763,'1',20,'2021-05-25 21:54:59',281,9,11,11,6,'0',22000,1100,20),(764,'1',20,'2021-05-25 21:54:59',282,9,11,11,6,'0',28000,1400,20),(765,'1',20,'2021-05-25 21:54:59',283,9,11,11,6,'0',22000,1100,20),(766,'1',20,'2021-05-25 21:54:59',284,9,11,11,6,'0',16000,800,20),(767,'1',20,'2021-05-25 21:54:59',285,9,24,11,6,'0',28000,1400,20),(768,'1',20,'2021-05-25 21:54:59',286,9,9,11,6,'0',49400,2470,20),(769,'1',20,'2021-05-25 21:54:59',287,9,9,11,6,'0',32000,1600,20),(770,'1',20,'2021-05-25 21:54:59',288,9,9,11,6,'0',28000,1400,20),(771,'1',20,'2021-05-25 21:54:59',289,9,16,11,6,'0',39980,1999,20),(772,'1',20,'2021-05-25 21:54:59',290,9,16,11,6,'0',50320,2516,20),(773,'1',20,'2021-05-25 21:54:59',291,9,16,11,6,'0',52340,2617,20),(774,'1',20,'2021-05-25 21:54:59',292,9,16,11,6,'0',21520,1076,20),(775,'1',20,'2021-05-25 21:54:59',293,9,43,11,6,'0',107520,5376,20),(776,'1',20,'2021-05-25 21:54:59',294,9,43,11,6,'0',56900,2845,20),(777,'1',20,'2021-05-25 21:54:59',295,9,43,11,6,'0',212080,10604,20),(778,'1',20,'2021-05-25 21:54:59',296,9,43,11,6,'0',87640,4382,20),(779,'1',20,'2021-05-25 21:54:59',297,9,43,11,6,'0',117260,5863,20),(780,'1',20,'2021-05-25 21:54:59',298,9,43,11,6,'0',84660,4233,20),(781,'1',20,'2021-05-25 21:54:59',299,9,29,11,6,'0',43260,2163,20),(782,'1',20,'2021-05-25 21:54:59',300,9,29,11,6,'0',14000,700,20),(783,'1',20,'2021-05-25 21:54:59',301,9,29,11,6,'0',62620,3131,20),(784,'1',20,'2021-05-25 21:54:59',302,9,29,11,6,'0',82800,4140,20),(786,'1',20,'2021-05-25 21:54:59',304,9,29,11,6,'0',80980,4049,20),(787,'1',20,'2021-05-25 21:54:59',305,9,28,11,6,'0',44840,2242,20),(788,'1',20,'2021-05-25 21:54:59',306,9,28,11,6,'0',248000,12400,20),(789,'1',20,'2021-05-25 21:54:59',307,9,28,11,6,'0',129320,6466,20),(790,'1',20,'2021-05-25 21:54:59',308,9,28,11,6,'0',99300,4965,20),(791,'1',20,'2021-05-25 21:54:59',309,9,37,11,6,'0',111820,5591,20),(792,'1',20,'2021-05-25 21:54:59',310,9,37,11,6,'0',96580,4829,20),(793,'1',20,'2021-05-25 21:54:59',311,9,21,11,6,'0',196000,9800,20),(794,'1',20,'2021-05-25 21:54:59',312,9,40,11,6,'0',230000,11500,20),(795,'1',20,'2021-05-25 21:54:59',313,9,12,11,6,'0',310000,15500,20),(796,'1',20,'2021-05-25 21:54:59',314,9,12,11,6,'0',117480,5874,20),(797,'1',20,'2021-05-25 21:54:59',315,9,9,11,6,'0',117480,5874,20),(798,'1',20,'2021-05-25 21:54:59',316,9,9,11,6,'0',136000,6800,20),(799,'1',20,'2021-05-25 21:54:59',317,9,11,11,6,'0',120000,6000,20),(800,'1',20,'2021-05-25 21:54:59',318,9,11,11,6,'0',100000,5000,20),(801,'1',20,'2021-05-25 21:54:59',319,9,11,11,6,'0',60000,3000,20),(802,'1',20,'2021-05-25 21:54:59',320,9,11,11,6,'0',183260,9163,20),(803,'1',20,'2021-05-25 21:54:59',321,9,11,11,6,'0',183260,9163,20),(804,'1',20,'2021-05-25 21:54:59',322,9,19,11,6,'0',183260,9163,20),(805,'1',20,'2021-05-25 21:54:59',323,9,19,11,6,'0',183260,9163,20),(806,'1',20,'2021-05-25 21:54:59',324,9,40,11,6,'0',183260,9163,20),(807,'1',20,'2021-05-25 21:54:59',325,9,44,11,6,'0',8340,417,20),(808,'1',20,'2021-05-25 21:54:59',326,9,44,11,6,'0',290000,14500,20),(809,'1',20,'2021-05-25 21:54:59',327,9,9,11,6,'0',447440,22372,20),(810,'1',20,'2021-05-25 21:54:59',328,9,9,11,6,'0',447440,22372,20),(811,'1',20,'2021-05-25 21:54:59',329,9,9,11,6,'0',164980,8249,20),(812,'1',20,'2021-05-25 21:54:59',330,9,9,11,6,'0',164980,8249,20),(813,'1',20,'2021-05-25 21:54:59',331,9,9,11,6,'0',25360,1268,20),(814,'1',20,'2021-05-25 21:54:59',332,9,16,11,6,'0',26000,1300,20),(815,'1',20,'2021-05-25 21:54:59',333,9,16,11,6,'0',23320,1166,20),(816,'1',20,'2021-05-25 21:54:59',334,9,16,11,6,'0',15000,750,20),(817,'1',20,'2021-05-25 21:54:59',335,9,16,11,6,'0',15000,750,20),(818,'1',20,'2021-05-25 21:54:59',336,9,25,11,6,'0',15000,750,20),(819,'1',20,'2021-05-25 21:54:59',337,9,17,11,6,'0',15000,750,20),(820,'1',20,'2021-05-25 21:54:59',338,9,17,11,6,'0',15000,750,20),(821,'1',20,'2021-05-25 21:54:59',339,9,17,11,6,'0',15000,750,20),(822,'1',20,'2021-05-25 21:54:59',340,9,18,11,6,'0',15000,750,20),(823,'1',20,'2021-05-25 21:54:59',341,9,18,11,6,'0',8000,400,20),(824,'1',20,'2021-05-25 21:54:59',342,9,18,11,6,'0',8000,400,20),(825,'1',20,'2021-05-25 21:54:59',343,9,18,11,6,'0',8000,400,20),(826,'1',20,'2021-05-25 21:54:59',344,9,37,11,6,'0',26000,1300,20),(827,'1',20,'2021-05-25 21:54:59',345,9,37,11,6,'0',26000,1300,20),(828,'1',20,'2021-05-25 21:54:59',346,9,37,11,6,'0',50000,2500,20),(829,'1',20,'2021-05-25 21:54:59',347,9,37,11,6,'0',50000,2500,20),(830,'1',20,'2021-05-25 21:54:59',348,9,37,11,6,'0',50000,2500,20),(831,'1',20,'2021-05-25 21:54:59',349,9,37,11,6,'0',90000,4500,20),(832,'1',20,'2021-05-25 21:54:59',350,9,37,11,6,'0',90000,4500,20),(833,'1',20,'2021-05-25 21:54:59',351,9,37,11,6,'0',90000,4500,20),(834,'1',20,'2021-05-25 21:54:59',352,9,37,11,6,'0',423000,21150,20),(835,'1',20,'2021-05-25 21:54:59',353,9,37,11,6,'0',273000,13650,20),(836,'1',20,'2021-05-25 21:54:59',354,9,37,11,6,'0',273000,13650,20),(837,'1',20,'2021-05-25 21:54:59',355,9,37,11,6,'0',273000,13650,20),(838,'1',20,'2021-05-25 21:54:59',356,9,37,11,6,'0',273000,13650,20),(839,'1',20,'2021-05-25 21:54:59',357,9,37,11,6,'0',348000,17400,20),(840,'1',20,'2021-05-25 21:54:59',358,9,21,11,6,'0',348000,17400,20),(841,'1',20,'2021-05-25 21:54:59',359,9,22,11,6,'0',423000,21150,20),(842,'1',20,'2021-05-25 21:54:59',360,9,22,11,6,'0',423000,21150,20),(843,'1',20,'2021-05-25 21:54:59',361,9,22,11,6,'0',360000,18000,20),(844,'1',20,'2021-05-25 21:54:59',362,9,21,11,6,'0',400000,20000,20),(845,'1',20,'2021-05-25 21:54:59',363,9,21,11,6,'0',240000,12000,20),(846,'1',20,'2021-05-25 21:54:59',364,9,21,11,6,'0',400000,20000,20),(847,'1',20,'2021-05-25 21:54:59',365,9,21,11,6,'0',560000,28000,20),(848,'1',20,'2021-05-25 21:54:59',366,9,21,11,6,'0',40000,2000,20),(849,'1',20,'2021-05-25 21:54:59',367,9,22,11,6,'0',57060,2853,20),(850,'1',20,'2021-05-25 21:54:59',368,9,29,11,6,'0',57060,2853,20),(851,'1',20,'2021-05-25 21:54:59',369,9,29,11,6,'0',59680,2984,20),(852,'1',20,'2021-05-25 21:54:59',370,9,9,11,6,'0',52460,2623,20),(853,'1',20,'2021-05-25 21:54:59',371,9,9,11,6,'0',57080,2854,20),(854,'1',20,'2021-05-25 21:54:59',372,9,37,11,6,'0',160000,8000,20),(855,'1',20,'2021-05-25 21:54:59',373,9,37,11,6,'0',200000,10000,20),(856,'1',20,'2021-05-25 21:54:59',374,9,37,11,6,'0',160000,8000,20),(857,'1',20,'2021-05-25 21:54:59',375,9,37,11,6,'0',200000,10000,20),(858,'1',20,'2021-05-25 21:54:59',376,9,37,11,6,'0',200000,10000,20),(859,'1',20,'2021-05-25 21:54:59',377,9,37,11,6,'0',300000,15000,20),(860,'1',20,'2021-05-25 21:54:59',378,9,37,11,6,'0',300000,15000,20),(861,'1',20,'2021-05-25 21:54:59',379,9,37,11,6,'0',300000,15000,20),(862,'1',20,'2021-05-25 21:54:59',380,9,37,11,6,'0',300000,15000,20),(863,'1',20,'2021-05-25 21:54:59',381,9,37,11,6,'0',300000,15000,20),(864,'1',20,'2021-05-25 21:54:59',382,9,37,11,6,'0',360000,18000,20),(865,'1',20,'2021-05-25 21:54:59',383,9,37,11,6,'0',440000,22000,20),(866,'1',20,'2021-05-25 21:54:59',384,9,37,11,6,'0',360000,18000,20),(867,'1',20,'2021-05-25 21:54:59',385,9,37,11,6,'0',360000,18000,20),(868,'1',20,'2021-05-25 21:54:59',386,9,37,11,6,'0',360000,18000,20),(869,'1',20,'2021-05-25 21:54:59',387,9,37,11,6,'0',500000,25000,20),(870,'1',20,'2021-05-25 21:54:59',388,9,37,11,6,'0',500000,25000,20),(871,'1',20,'2021-05-25 21:54:59',389,9,37,11,6,'0',500000,25000,20),(872,'1',20,'2021-05-25 21:54:59',390,9,37,11,6,'0',500000,25000,20),(873,'1',20,'2021-05-25 21:54:59',391,9,37,11,6,'0',500000,25000,20),(874,'1',20,'2021-05-25 21:54:59',392,9,37,11,6,'0',158820,7941,20),(875,'1',20,'2021-05-25 21:54:59',393,9,37,11,6,'0',158820,7941,20),(876,'1',20,'2021-05-25 21:54:59',394,9,37,11,6,'0',158820,7941,20),(877,'1',20,'2021-05-25 21:54:59',395,9,37,11,6,'0',158820,7941,20),(878,'1',20,'2021-05-25 21:54:59',396,9,37,11,6,'0',158820,7941,20),(879,'1',20,'2021-05-25 21:54:59',397,9,37,11,6,'0',158820,7941,20),(880,'1',20,'2021-05-25 21:54:59',398,9,37,11,6,'0',158820,7941,20),(881,'1',20,'2021-05-25 21:54:59',399,9,37,11,6,'0',158820,7941,20),(882,'1',20,'2021-05-25 21:54:59',400,9,37,11,6,'0',11140,557,20),(883,'1',20,'2021-05-25 21:54:59',401,9,37,11,6,'0',79960,3998,20),(884,'1',20,'2021-05-25 21:54:59',402,9,35,11,6,'0',11140,557,20),(885,'1',20,'2021-05-25 21:54:59',403,9,35,11,6,'0',83300,4165,20),(886,'1',20,'2021-05-25 21:54:59',404,9,29,11,6,'0',12980,649,20),(887,'1',20,'2021-05-25 21:54:59',405,9,29,11,6,'0',83300,4165,20),(888,'1',20,'2021-05-25 21:54:59',406,9,29,11,6,'0',82340,4117,20),(889,'1',20,'2021-05-25 21:54:59',407,9,29,11,6,'0',69020,3451,20),(890,'1',20,'2021-05-25 21:54:59',408,9,41,11,6,'0',79960,3998,20),(891,'1',20,'2021-05-25 21:54:59',409,9,41,11,6,'0',79960,3998,20),(892,'1',20,'2021-05-25 21:54:59',410,9,41,11,6,'0',100420,5021,20),(893,'1',20,'2021-05-25 21:54:59',411,9,41,11,6,'0',100420,5021,20),(894,'1',20,'2021-05-25 21:54:59',412,9,41,11,6,'0',100440,5022,20),(895,'1',20,'2021-05-25 21:54:59',413,9,28,11,6,'0',78540,3927,20),(896,'1',20,'2021-05-25 21:54:59',414,9,28,11,6,'0',63600,3180,20),(897,'1',20,'2021-05-25 21:54:59',415,9,29,11,6,'0',86400,4320,20),(898,'1',20,'2021-05-25 21:54:59',416,9,29,11,6,'0',82340,4117,20),(899,'1',20,'2021-05-25 21:54:59',417,9,28,11,6,'0',39200,1960,20),(900,'1',20,'2021-05-25 21:54:59',418,9,28,11,6,'0',105000,5250,20),(901,'1',20,'2021-05-25 21:54:59',419,9,22,11,6,'0',114800,5740,20),(902,'1',20,'2021-05-25 21:54:59',420,9,22,11,6,'0',83300,4165,20),(903,'1',20,'2021-05-25 21:54:59',421,9,24,11,6,'0',74980,3749,20),(904,'1',20,'2021-05-25 21:54:59',422,9,24,11,6,'0',160000,8000,20),(905,'1',20,'2021-05-25 21:54:59',423,9,25,11,6,'0',260000,13000,20),(906,'1',20,'2021-05-25 21:54:59',424,9,25,11,6,'0',80000,4000,20),(907,'1',20,'2021-05-25 21:54:59',425,9,25,11,6,'0',320000,16000,20),(908,'1',20,'2021-05-25 21:54:59',426,9,25,11,6,'0',320000,16000,20),(909,'1',20,'2021-05-25 21:54:59',427,9,21,11,6,'0',320000,16000,20),(910,'1',20,'2021-05-25 21:54:59',428,9,21,11,6,'0',380000,19000,20),(911,'1',20,'2021-05-25 21:54:59',429,9,9,11,6,'0',60000,3000,20),(912,'1',20,'2021-05-25 21:54:59',430,9,9,11,6,'0',51400,2570,20),(913,'1',20,'2021-05-25 21:54:59',431,9,15,11,6,'0',30000,1500,20),(914,'1',20,'2021-05-25 21:54:59',432,9,15,11,6,'0',150400,7520,20),(915,'1',20,'2021-05-25 21:54:59',433,9,15,11,6,'0',70400,3520,20),(916,'1',20,'2021-05-25 21:54:59',434,9,15,11,6,'0',52400,2620,20),(917,'1',20,'2021-05-25 21:54:59',435,9,15,11,6,'0',60400,3020,20),(918,'1',20,'2021-05-25 21:54:59',436,9,37,11,6,'0',30000,1500,20),(919,'1',20,'2021-05-25 21:54:59',437,9,37,11,6,'0',29000,1450,20),(920,'1',20,'2021-05-25 21:54:59',438,9,21,11,6,'0',56400,2820,20),(921,'1',20,'2021-05-25 21:54:59',439,9,21,11,6,'0',114400,5720,20),(922,'1',20,'2021-05-25 21:54:59',440,9,21,11,6,'0',36000,1800,20),(923,'1',20,'2021-05-25 21:54:59',441,9,15,11,6,'0',72000,3600,20),(924,'1',20,'2021-05-25 21:54:59',442,9,30,11,6,'0',74000,3700,20),(925,'1',20,'2021-05-25 21:54:59',443,9,30,11,6,'0',51600,2580,20),(926,'1',20,'2021-05-25 21:54:59',444,9,30,11,6,'0',51600,2580,20),(927,'1',20,'2021-05-25 21:54:59',445,9,30,11,6,'0',87600,4380,20),(928,'1',20,'2021-05-25 21:54:59',446,9,30,11,6,'0',74000,3700,20),(929,'1',20,'2021-05-25 21:54:59',447,9,30,11,6,'0',26000,1300,20),(930,'1',20,'2021-05-25 21:54:59',448,9,30,11,6,'0',106400,5320,20),(931,'1',20,'2021-05-25 21:54:59',449,9,30,11,6,'0',22500,1125,20),(932,'1',20,'2021-05-25 21:54:59',450,9,30,11,6,'0',100000,5000,20),(933,'1',20,'2021-05-25 21:54:59',451,9,22,11,6,'0',130000,6500,20),(934,'1',20,'2021-05-25 21:54:59',452,9,22,11,6,'0',120000,6000,20),(935,'1',20,'2021-05-25 21:54:59',453,9,22,11,6,'0',76000,3800,20),(936,'1',20,'2021-05-25 21:54:59',454,9,21,11,6,'0',440000,22000,20),(937,'1',20,'2021-05-25 21:54:59',455,9,9,11,6,'0',160000,8000,20),(938,'1',20,'2021-05-25 21:54:59',456,9,9,11,6,'0',33840,1692,20),(939,'1',20,'2021-05-25 21:54:59',457,9,9,11,6,'0',43080,2154,20),(940,'1',20,'2021-05-25 21:54:59',458,9,29,11,6,'0',38880,1944,20),(941,'1',20,'2021-05-25 21:54:59',459,9,9,11,6,'0',120000,6000,20),(942,'1',20,'2021-05-25 21:54:59',460,9,9,11,6,'0',155560,7778,20),(943,'1',20,'2021-05-25 21:54:59',461,9,9,11,6,'0',32000,1600,20),(944,'1',20,'2021-05-25 21:54:59',462,9,29,11,6,'0',26000,1300,20),(945,'1',20,'2021-05-25 21:54:59',463,9,29,11,6,'0',200000,10000,20),(946,'1',20,'2021-05-25 21:54:59',464,9,29,11,6,'0',32000,1600,20),(947,'1',20,'2021-05-25 21:54:59',465,9,29,11,6,'0',70000,3500,20),(948,'1',20,'2021-05-25 21:54:59',466,9,29,11,6,'0',140000,7000,20),(949,'1',20,'2021-05-25 21:54:59',467,9,29,11,6,'0',100000,5000,20),(950,'1',20,'2021-05-25 21:54:59',468,9,9,11,6,'0',80000,4000,20),(951,'1',20,'2021-05-25 21:54:59',469,9,9,11,6,'0',112500,5625,20),(952,'1',20,'2021-05-25 21:54:59',470,9,9,11,6,'0',133340,6667,20),(953,'1',20,'2021-05-25 21:54:59',471,9,9,11,6,'0',50000,2500,20),(954,'1',20,'2021-05-25 21:54:59',472,9,9,11,6,'0',62480,3124,20),(955,'1',20,'2021-05-25 21:54:59',473,9,9,11,6,'0',80000,4000,20),(956,'1',20,'2021-05-25 21:54:59',474,9,9,11,6,'0',70000,3500,20),(957,'1',20,'2021-05-25 21:54:59',475,9,9,11,6,'0',80000,4000,20),(958,'1',20,'2021-05-25 21:54:59',476,9,9,11,6,'0',50000,2500,20),(959,'1',20,'2021-05-25 21:54:59',477,9,9,11,6,'0',45840,2292,20),(960,'1',20,'2021-05-25 21:54:59',478,9,9,11,6,'0',50000,2500,20),(961,'1',20,'2021-05-25 21:54:59',479,9,9,11,6,'0',44440,2222,20),(962,'1',20,'2021-05-25 21:54:59',480,9,9,11,6,'0',44440,2222,20),(963,'1',20,'2021-05-25 21:54:59',481,9,9,11,6,'0',35000,1750,20),(964,'1',20,'2021-05-25 21:54:59',482,9,9,11,6,'0',160000,8000,20),(965,'1',20,'2021-05-25 21:54:59',483,9,9,11,6,'0',22220,1111,20),(966,'1',20,'2021-05-25 21:54:59',484,9,9,11,6,'0',21580,1079,20),(967,'1',20,'2021-05-25 21:54:59',485,9,9,11,6,'0',61540,3077,20),(968,'1',20,'2021-05-25 21:54:59',486,9,9,11,6,'0',214280,10714,20),(969,'1',20,'2021-05-25 21:54:59',487,9,9,11,6,'0',23800,1190,20),(970,'1',20,'2021-05-25 21:54:59',488,9,9,11,6,'0',36000,1800,20),(971,'1',20,'2021-05-25 21:54:59',489,9,9,11,6,'0',35000,1750,20),(972,'1',20,'2021-05-25 21:54:59',490,9,9,11,6,'0',50000,2500,20),(973,'1',20,'2021-05-25 21:54:59',491,9,9,11,6,'0',66660,3333,20),(974,'1',20,'2021-05-25 21:54:59',492,9,9,11,6,'0',1600000,80000,20),(975,'1',20,'2021-05-25 21:54:59',493,9,9,11,6,'0',60000,3000,20),(976,'1',20,'2021-05-25 21:54:59',494,9,9,11,6,'0',52000,2600,20),(977,'1',20,'2021-05-25 21:54:59',495,9,9,11,6,'0',40740,2037,20),(978,'1',20,'2021-05-25 21:54:59',496,9,9,11,6,'0',23000,1150,20),(979,'1',20,'2021-05-25 21:54:59',497,9,9,11,6,'0',60000,3000,20),(980,'1',20,'2021-05-25 21:54:59',498,9,9,11,6,'0',40000,2000,20),(981,'1',20,'2021-05-25 21:54:59',499,9,9,11,6,'0',37340,1867,20),(982,'1',20,'2021-05-25 21:54:59',500,9,9,11,6,'0',40000,2000,20),(983,'1',20,'2021-05-25 21:54:59',501,9,9,11,6,'0',32000,1600,20),(984,'1',20,'2021-05-25 21:54:59',502,9,9,11,6,'0',39480,1974,20),(985,'1',20,'2021-05-25 21:54:59',503,9,9,11,6,'0',32720,1636,20),(986,'1',20,'2021-05-25 21:54:59',504,9,9,11,6,'0',32720,1636,20),(987,'1',20,'2021-05-25 21:54:59',505,9,9,11,6,'0',38000,1900,20),(988,'1',20,'2021-05-25 21:54:59',506,9,9,11,6,'0',142860,7143,20),(989,'1',20,'2021-05-25 21:54:59',507,9,9,11,6,'0',37480,1874,20),(990,'1',20,'2021-05-25 21:54:59',508,9,9,11,6,'0',85000,4250,20),(991,'1',20,'2021-05-25 21:54:59',509,9,9,11,6,'0',24540,1227,20),(992,'1',20,'2021-05-25 21:54:59',510,9,9,11,6,'0',43920,2196,20),(993,'1',20,'2021-05-25 21:54:59',511,9,9,11,6,'0',63320,3166,20),(994,'1',20,'2021-05-25 21:54:59',512,9,9,11,6,'0',54000,2700,20),(995,'1',20,'2021-05-25 21:54:59',513,9,9,11,6,'0',36000,1800,20),(996,'1',20,'2021-05-25 21:54:59',514,9,9,11,6,'0',50000,2500,20),(997,'1',20,'2021-05-25 21:54:59',515,9,9,11,6,'0',38320,1916,20),(998,'1',20,'2021-05-25 21:54:59',516,9,9,11,6,'0',34000,1700,20),(999,'1',20,'2021-05-25 21:54:59',517,9,9,11,6,'0',34720,1736,20),(1000,'1',20,'2021-05-25 21:54:59',518,9,9,11,6,'0',37200,1860,20),(1001,'1',20,'2021-05-25 21:54:59',519,9,9,11,6,'0',44000,2200,20),(1002,'1',20,'2021-05-25 21:54:59',520,9,9,11,6,'0',50000,2500,20),(1003,'1',20,'2021-05-25 21:54:59',521,9,9,11,6,'0',39000,1950,20),(1004,'1',20,'2021-05-25 21:54:59',522,9,9,11,6,'0',34000,1700,20),(1005,'1',20,'2021-05-25 21:54:59',523,9,9,11,6,'0',32000,1600,20),(1006,'1',20,'2021-05-25 21:54:59',524,9,9,11,6,'0',50000,2500,20),(1007,'1',20,'2021-05-25 21:54:59',525,9,9,11,6,'0',50000,2500,20),(1008,'1',20,'2021-05-25 21:54:59',526,9,9,11,6,'0',50000,2500,20),(1009,'1',20,'2021-05-25 21:54:59',527,9,9,11,6,'0',40000,2000,20),(1010,'1',20,'2021-05-25 21:54:59',528,9,9,11,6,'0',40000,2000,20),(1011,'1',20,'2021-05-25 21:54:59',529,9,9,11,6,'0',40000,2000,20),(1012,'1',20,'2021-05-25 21:54:59',530,9,9,11,6,'0',48380,2419,20),(1013,'1',20,'2021-05-25 21:54:59',531,9,9,11,6,'0',20000,1000,20),(1014,'1',20,'2021-05-25 21:54:59',532,9,9,11,6,'0',200000,10000,20),(1015,'1',20,'2021-05-25 21:54:59',533,9,9,11,6,'0',30000,1500,20),(1016,'1',20,'2021-05-25 21:54:59',534,9,9,11,6,'0',133340,6667,20),(1017,'1',20,'2021-05-25 21:54:59',535,9,9,11,6,'0',400000,20000,20),(1018,'1',20,'2021-05-25 21:54:59',536,9,9,11,6,'0',126660,6333,20),(1019,'1',20,'2021-05-25 21:54:59',537,9,9,11,6,'0',60000,3000,20),(1020,'1',20,'2021-05-25 21:54:59',538,9,9,11,6,'0',114280,5714,20),(1021,'1',20,'2021-05-25 21:54:59',539,9,9,11,6,'0',60000,3000,20),(1022,'1',20,'2021-05-25 21:54:59',540,9,9,11,6,'0',44000,2200,20),(1023,'1',20,'2021-05-25 21:54:59',541,9,9,11,6,'0',100000,5000,20),(1024,'1',20,'2021-05-25 21:54:59',542,9,9,11,6,'0',200000,10000,20),(1025,'1',20,'2021-05-25 21:54:59',543,9,9,11,6,'0',100000,5000,20),(1026,'1',20,'2021-05-25 21:54:59',544,9,9,11,6,'0',100000,5000,20),(1027,'1',20,'2021-05-25 21:54:59',545,9,9,11,6,'0',200000,10000,20),(1028,'1',20,'2021-05-25 21:54:59',546,9,9,11,6,'0',22000,1100,20),(1029,'1',20,'2021-05-25 21:54:59',547,9,9,11,6,'0',200000,10000,20),(1030,'1',20,'2021-05-25 21:54:59',548,9,9,11,6,'0',220000,11000,20),(1031,'1',20,'2021-05-25 21:54:59',549,9,9,11,6,'0',23000,1150,20),(1032,'1',20,'2021-05-25 21:54:59',550,9,9,11,6,'0',200000,10000,20),(1033,'1',20,'2021-05-25 21:54:59',551,9,9,11,6,'0',40000,2000,20),(1034,'1',20,'2021-05-25 21:54:59',552,9,9,11,6,'0',14000,700,20),(1035,'1',20,'2021-05-25 21:54:59',553,9,9,11,6,'0',200000,10000,20),(1036,'1',20,'2021-05-25 21:54:59',554,9,9,11,6,'0',250000,12500,20),(1037,'1',20,'2021-05-25 21:54:59',555,9,9,11,6,'0',26660,1333,20),(1038,'1',20,'2021-05-25 21:54:59',556,9,9,11,6,'0',60000,3000,20),(1039,'1',20,'2021-05-25 21:54:59',557,9,9,11,6,'0',60000,3000,20),(1040,'1',20,'2021-05-25 21:54:59',558,9,9,11,6,'0',250000,12500,20),(1041,'1',20,'2021-05-25 21:54:59',559,9,9,11,6,'0',83340,4167,20),(1042,'1',20,'2021-05-25 21:54:59',560,9,9,11,6,'0',105260,5263,20),(1043,'1',20,'2021-05-25 21:54:59',561,9,9,11,6,'0',140000,7000,20),(1044,'1',20,'2021-05-25 21:54:59',562,9,9,11,6,'0',80000,4000,20),(1045,'1',20,'2021-05-25 21:54:59',563,9,9,11,6,'0',60000,3000,20),(1046,'1',20,'2021-05-25 21:54:59',564,9,9,11,6,'0',32000,1600,20),(1047,'1',20,'2021-05-25 21:54:59',565,9,9,11,6,'0',1800000,90000,20),(1048,'1',20,'2021-05-25 21:54:59',566,9,9,11,6,'0',35560,1778,20),(1049,'1',20,'2021-05-25 21:54:59',567,9,9,11,6,'0',44000,2200,20),(1050,'1',20,'2021-05-25 21:54:59',568,9,9,11,6,'0',200000,10000,20),(1051,'1',20,'2021-05-25 21:54:59',569,9,9,11,6,'0',50000,2500,20),(1052,'1',20,'2021-05-25 21:54:59',570,9,9,11,6,'0',54160,2708,20),(1053,'1',20,'2021-05-25 21:54:59',571,9,9,11,6,'0',20000,1000,20),(1054,'1',20,'2021-05-25 21:54:59',572,9,9,11,6,'0',200000,10000,20),(1055,'1',20,'2021-05-25 21:54:59',573,9,9,11,6,'0',300000,15000,20),(1056,'1',20,'2021-05-25 21:54:59',574,9,9,11,6,'0',100000,5000,20),(1057,'1',20,'2021-05-25 21:54:59',575,9,9,11,6,'0',16660,833,20),(1058,'1',20,'2021-05-25 21:54:59',576,9,9,11,6,'0',33340,1667,20),(1059,'1',20,'2021-05-25 21:54:59',577,9,9,11,6,'0',36000,1800,20),(1060,'1',20,'2021-05-25 21:54:59',578,9,9,11,6,'0',30000,1500,20),(1061,'1',20,'2021-05-25 21:54:59',579,9,9,11,6,'0',20000,1000,20),(1062,'1',20,'2021-05-25 21:54:59',580,9,9,11,6,'0',20000,1000,20),(1063,'1',20,'2021-05-25 21:54:59',581,9,9,11,6,'0',260000,13000,20),(1064,'1',20,'2021-05-25 21:54:59',582,9,9,11,6,'0',320000,16000,20),(1065,'1',20,'2021-05-25 21:54:59',583,9,9,11,6,'0',800000,40000,20),(1066,'1',20,'2021-05-25 21:54:59',584,9,9,11,6,'0',78580,3929,20),(1067,'1',20,'2021-05-25 21:54:59',585,9,9,11,6,'0',160000,8000,20),(1068,'1',20,'2021-05-25 21:54:59',586,9,9,11,6,'0',50000,2500,20),(1069,'1',20,'2021-05-25 21:54:59',587,9,9,11,6,'0',100000,5000,20),(1070,'1',20,'2021-05-25 21:54:59',588,9,9,11,6,'0',14280,714,20),(1071,'1',20,'2021-05-25 21:54:59',589,9,9,11,6,'0',32000,1600,20),(1072,'1',20,'2021-05-25 21:54:59',590,9,9,11,6,'0',42860,2143,20),(1073,'1',20,'2021-05-25 21:54:59',591,9,9,11,6,'0',80000,4000,20),(1074,'1',20,'2021-05-25 21:54:59',592,9,9,11,6,'0',71420,3571,20),(1075,'1',20,'2021-05-25 21:54:59',593,9,9,11,6,'0',200000,10000,20),(1076,'1',20,'2021-05-25 21:54:59',594,9,9,11,6,'0',80000,4000,20),(1077,'1',20,'2021-05-25 21:54:59',595,9,9,11,6,'0',500000,25000,20),(1078,'1',20,'2021-05-25 21:54:59',596,9,9,11,6,'0',400000,20000,20),(1079,'1',20,'2021-05-25 21:54:59',597,9,9,11,6,'0',36000,1800,20),(1080,'1',20,'2021-05-25 21:54:59',598,9,9,11,6,'0',65380,3269,20),(1081,'1',20,'2021-05-25 21:54:59',599,9,9,11,6,'0',100000,5000,20),(1082,'1',20,'2021-05-25 21:54:59',600,9,9,11,6,'0',20000,1000,20),(1083,'1',20,'2021-05-25 21:54:59',601,9,9,11,6,'0',14000,700,20),(1084,'1',20,'2021-05-25 21:54:59',602,9,9,11,6,'0',100000,5000,20),(1085,'1',20,'2021-05-25 21:54:59',603,9,9,11,6,'0',40000,2000,20),(1086,'1',20,'2021-05-25 21:54:59',604,9,9,11,6,'0',84000,4200,20),(1087,'1',20,'2021-05-25 21:54:59',605,9,9,11,6,'0',46000,2300,20),(1088,'1',20,'2021-05-25 21:54:59',606,9,9,11,6,'0',48000,2400,20),(1089,'1',20,'2021-05-25 21:54:59',607,9,9,11,6,'0',54000,2700,20),(1090,'1',20,'2021-05-25 21:54:59',608,9,9,11,6,'0',64000,3200,20),(1091,'1',20,'2021-05-25 21:54:59',609,9,9,11,6,'0',48000,2400,20),(1092,'1',20,'2021-05-25 21:54:59',610,9,9,11,6,'0',600000,30000,20),(1093,'1',20,'2021-05-25 21:54:59',611,9,9,11,6,'0',40000,2000,20),(1094,'1',20,'2021-05-25 21:54:59',612,9,9,11,6,'0',10000,500,20),(1095,'1',20,'2021-05-25 21:54:59',613,9,9,11,6,'0',150000,7500,20),(1096,'1',20,'2021-05-25 21:54:59',614,9,9,11,6,'0',10000,500,20),(1097,'1',20,'2021-05-25 21:54:59',615,9,9,11,6,'0',180000,9000,20),(1098,'1',20,'2021-05-25 21:54:59',616,9,9,11,6,'0',65000,3250,20),(1099,'1',20,'2021-05-25 21:54:59',617,9,9,11,6,'0',65000,3250,20),(1100,'1',20,'2021-05-25 21:54:59',618,9,9,11,6,'0',28660,1433,20),(1101,'1',20,'2021-05-25 21:54:59',619,9,9,11,6,'0',196000,9800,20),(1102,'1',20,'2021-05-25 21:54:59',620,9,9,11,6,'0',60000,3000,20),(1103,'1',20,'2021-05-25 21:54:59',621,9,9,11,6,'0',20000,1000,20),(1104,'1',20,'2021-05-25 21:54:59',622,9,9,11,6,'0',42860,2143,20),(1105,'1',20,'2021-05-25 21:54:59',623,9,9,11,6,'0',200000,10000,20),(1106,'1',20,'2021-05-25 21:54:59',624,9,9,11,6,'0',40000,2000,20),(1107,'1',20,'2021-05-25 21:54:59',625,9,9,11,6,'0',48000,2400,20),(1108,'1',20,'2021-05-25 21:54:59',626,9,9,11,6,'0',15000,750,20),(1109,'1',20,'2021-05-25 21:54:59',627,9,9,11,6,'0',140000,7000,20),(1110,'1',20,'2021-05-25 21:54:59',628,9,9,11,6,'0',40000,2000,20),(1111,'1',20,'2021-05-25 21:54:59',629,9,9,11,6,'0',70000,3500,20),(1112,'1',20,'2021-05-25 21:54:59',630,9,9,11,6,'0',4000,200,20),(1113,'1',20,'2021-05-25 21:54:59',631,9,9,11,6,'0',10000,500,20),(1114,'1',20,'2021-05-25 21:54:59',632,9,9,11,6,'0',50000,2500,20),(1115,'1',20,'2021-05-25 21:54:59',633,9,9,11,6,'0',35000,1750,20),(1116,'1',20,'2021-05-25 21:54:59',634,9,9,11,6,'0',44440,2222,20),(1117,'1',20,'2021-05-25 21:54:59',635,9,9,11,6,'0',0,0,20),(1118,'1',20,'2021-05-25 21:54:59',636,9,9,11,6,'0',32000,1600,20),(1119,'1',20,'2021-05-25 21:54:59',637,9,9,11,6,'0',36000,1800,20),(1120,'1',20,'2021-05-25 21:54:59',638,9,9,11,6,'0',40000,2000,20),(1121,'1',20,'2021-05-25 21:54:59',639,9,9,11,6,'0',321860,16093,20),(1122,'1',20,'2021-05-25 21:54:59',640,9,9,11,6,'0',178000,8900,20),(1123,'1',20,'2021-05-25 21:54:59',641,9,9,11,6,'0',124960,6248,20),(1124,'1',20,'2021-05-25 21:54:59',642,9,9,11,6,'0',73340,3667,20),(1125,'1',20,'2021-05-25 21:54:59',643,9,9,11,6,'0',74060,3703,20),(1126,'1',20,'2021-05-25 21:54:59',644,9,9,11,6,'0',68520,3426,20),(1127,'1',20,'2021-05-25 21:54:59',645,9,9,11,6,'0',63640,3182,20),(1128,'1',20,'2021-05-25 21:54:59',646,9,9,11,6,'0',58340,2917,20),(1129,'1',20,'2021-05-25 21:54:59',647,9,9,11,6,'0',55400,2770,20),(1130,'1',20,'2021-05-25 21:54:59',648,9,9,11,6,'0',66000,3300,20),(1131,'1',20,'2021-05-25 21:54:59',649,9,9,11,6,'0',66000,3300,20),(1132,'1',20,'2021-05-25 21:54:59',650,9,9,11,6,'0',66000,3300,20),(1133,'1',20,'2021-05-25 21:54:59',651,9,9,11,6,'0',63640,3182,20),(1134,'1',20,'2021-05-25 21:54:59',652,9,9,11,6,'0',182300,9115,20),(1135,'1',20,'2021-05-25 21:54:59',653,9,9,11,6,'0',182300,9115,20),(1136,'1',20,'2021-05-25 21:54:59',654,9,9,11,6,'0',182300,9115,20),(1137,'1',20,'2021-05-25 21:54:59',655,9,9,11,6,'0',182300,9115,20),(1138,'1',20,'2021-05-25 21:54:59',656,9,9,11,6,'0',182300,9115,20),(1139,'1',20,'2021-05-25 21:54:59',657,9,9,11,6,'0',182300,9115,20),(1140,'1',20,'2021-05-25 21:54:59',658,9,9,11,6,'0',182300,9115,20),(1141,'1',20,'2021-05-25 21:54:59',659,9,9,11,6,'0',182300,9115,20),(1142,'1',20,'2021-05-25 21:54:59',660,9,9,11,6,'0',182300,9115,20),(1143,'1',20,'2021-05-25 21:54:59',661,9,9,11,6,'0',388900,19445,20),(1144,'1',20,'2021-05-25 21:54:59',662,9,9,11,6,'0',350100,17505,20),(1145,'1',20,'2021-05-25 21:54:59',663,9,9,11,6,'0',381900,19095,20),(1146,'1',20,'2021-05-25 21:54:59',664,9,9,11,6,'0',119140,5957,20),(1147,'1',20,'2021-05-25 21:54:59',665,9,9,11,6,'0',148300,7415,20),(1148,'1',20,'2021-05-25 21:54:59',666,9,9,11,6,'0',68160,3408,20),(1149,'1',20,'2021-05-25 21:54:59',667,9,9,11,6,'0',125560,6278,20),(1150,'1',20,'2021-05-25 21:54:59',668,9,9,11,6,'0',55320,2766,20),(1151,'1',20,'2021-05-25 21:54:59',669,9,9,11,6,'0',55320,2766,20),(1152,'1',20,'2021-05-25 21:54:59',670,9,9,11,6,'0',55320,2766,20),(1153,'1',20,'2021-05-25 21:54:59',671,9,9,11,6,'0',55320,2766,20),(1154,'1',20,'2021-05-25 21:54:59',672,9,9,11,6,'0',55320,2766,20),(1155,'1',20,'2021-05-25 21:54:59',673,9,9,11,6,'0',55180,2759,20),(1156,'1',20,'2021-05-25 21:54:59',674,9,9,11,6,'0',48260,2413,20),(1157,'1',20,'2021-05-25 21:54:59',675,9,9,11,6,'0',48260,2413,20),(1158,'1',20,'2021-05-25 21:54:59',676,9,9,11,6,'0',48260,2413,20),(1159,'1',20,'2021-05-25 21:54:59',677,9,9,11,6,'0',170700,8535,20),(1160,'1',20,'2021-05-25 21:54:59',678,9,9,11,6,'0',310000,15500,20),(1161,'1',20,'2021-05-25 21:54:59',679,9,9,11,6,'0',193100,9655,20),(1162,'1',20,'2021-05-25 21:54:59',680,9,9,11,6,'0',65500,3275,20),(1163,'1',20,'2021-05-25 21:54:59',681,9,9,11,6,'0',84000,4200,20),(1164,'1',20,'2021-05-25 21:54:59',682,9,9,11,6,'0',20660,1033,20),(1165,'1',20,'2021-05-25 21:54:59',683,9,9,11,6,'0',20000,1000,20),(1166,'1',20,'2021-05-25 21:54:59',684,9,9,11,6,'0',100000,5000,20),(1167,'1',20,'2021-05-25 21:54:59',685,9,9,11,6,'0',20000,1000,20),(1168,'1',20,'2021-05-25 21:54:59',686,9,9,11,6,'0',69980,3499,20),(1169,'1',20,'2021-05-25 21:54:59',687,9,9,11,6,'0',50020,2501,20),(1170,'1',20,'2021-05-25 21:54:59',688,9,9,11,6,'0',92820,4641,20),(1171,'1',20,'2021-05-25 21:54:59',689,9,9,11,6,'0',92820,4641,20),(1172,'1',20,'2021-05-25 21:54:59',690,9,9,11,6,'0',65500,3275,20),(1173,'1',20,'2021-05-25 21:54:59',691,9,9,11,6,'0',223940,11197,20),(1174,'1',20,'2021-05-25 21:54:59',692,9,9,11,6,'0',24000,1200,20),(1175,'1',20,'2021-05-25 21:54:59',693,9,9,11,6,'0',50620,2531,20),(1176,'1',20,'2021-05-25 21:54:59',694,9,9,11,6,'0',61600,3080,20),(1177,'1',20,'2021-05-25 21:54:59',695,9,9,11,6,'0',119400,5970,20),(1178,'1',20,'2021-05-25 21:54:59',696,9,9,11,6,'0',62200,3110,20),(1179,'1',20,'2021-05-25 21:54:59',697,9,9,11,6,'0',38000,1900,20),(1180,'1',20,'2021-05-25 21:54:59',698,9,9,11,6,'0',38000,1900,20),(1181,'1',20,'2021-05-25 21:54:59',699,9,9,11,6,'0',38000,1900,20),(1182,'1',20,'2021-05-25 21:54:59',700,9,9,11,6,'0',62400,3120,20),(1183,'1',20,'2021-05-25 21:54:59',701,9,9,11,6,'0',62400,3120,20),(1184,'1',20,'2021-05-25 21:54:59',702,9,9,11,6,'0',62400,3120,20),(1185,'1',20,'2021-05-25 21:54:59',703,9,9,11,6,'0',46160,2308,20),(1186,'1',20,'2021-05-25 21:54:59',704,9,9,11,6,'0',150000,7500,20),(1187,'1',20,'2021-05-25 21:54:59',705,9,9,11,6,'0',118000,5900,20),(1188,'1',20,'2021-05-25 21:54:59',706,9,9,11,6,'0',36000,1800,20),(1189,'1',20,'2021-05-25 21:54:59',707,9,9,11,6,'0',64000,3200,20),(1190,'1',20,'2021-05-25 21:54:59',708,9,9,11,6,'0',64000,3200,20),(1191,'1',20,'2021-05-25 21:54:59',709,9,9,11,6,'0',47000,2350,20),(1192,'1',20,'2021-05-25 21:54:59',710,9,9,11,6,'0',77000,3850,20),(1193,'1',20,'2021-05-25 21:54:59',711,9,9,11,6,'0',109240,5462,20),(1194,'1',20,'2021-05-25 21:54:59',712,9,9,11,6,'0',77000,3850,20),(1195,'1',20,'2021-05-25 21:54:59',713,9,9,11,6,'0',48000,2400,20),(1196,'1',20,'2021-05-25 21:54:59',714,9,9,11,6,'0',47000,2350,20),(1197,'1',20,'2021-05-25 21:54:59',715,9,9,11,6,'0',55920,2796,20),(1198,'1',20,'2021-05-25 21:54:59',716,9,9,11,6,'0',55920,2796,20),(1199,'1',20,'2021-05-25 21:54:59',717,9,9,11,6,'0',106380,5319,20),(1200,'1',20,'2021-05-25 21:54:59',718,9,9,11,6,'0',95200,4760,20),(1201,'1',20,'2021-05-25 21:54:59',719,9,9,11,6,'0',55940,2797,20),(1202,'1',20,'2021-05-25 21:54:59',720,9,9,11,6,'0',47120,2356,20),(1203,'1',20,'2021-05-25 21:54:59',721,9,9,11,6,'0',99960,4998,20),(1204,'1',20,'2021-05-25 21:54:59',722,9,9,11,6,'0',43400,2170,20),(1205,'1',20,'2021-05-25 21:54:59',723,9,9,11,6,'0',69400,3470,20),(1206,'1',20,'2021-05-25 21:54:59',724,9,9,11,6,'0',47120,2356,20),(1207,'1',20,'2021-05-25 21:54:59',725,9,9,11,6,'0',47120,2356,20),(1208,'1',20,'2021-05-25 21:54:59',726,9,9,11,6,'0',39600,1980,20),(1209,'1',20,'2021-05-25 21:54:59',727,9,9,11,6,'0',69340,3467,20),(1210,'1',20,'2021-05-25 21:54:59',728,9,9,11,6,'0',47120,2356,20),(1211,'1',20,'2021-05-25 21:54:59',729,9,9,11,6,'0',64000,3200,20),(1212,'1',20,'2021-05-25 21:54:59',730,9,9,11,6,'0',55920,2796,20),(1213,'1',20,'2021-05-25 21:54:59',731,9,9,11,6,'0',72940,3647,20),(1214,'1',20,'2021-05-25 21:54:59',732,9,9,11,6,'0',74000,3700,20),(1215,'1',20,'2021-05-25 21:54:59',734,9,9,11,6,'0',44820,2241,20),(1216,'1',20,'2021-05-25 21:54:59',735,9,9,11,6,'0',41380,2069,20),(1217,'1',20,'2021-05-25 21:54:59',736,9,9,11,6,'0',44820,2241,20),(1218,'1',20,'2021-05-25 21:54:59',737,9,9,11,6,'0',41380,2069,20),(1219,'1',20,'2021-05-25 21:54:59',738,9,9,11,6,'0',300000,15000,20),(1220,'1',20,'2021-05-25 21:54:59',739,9,9,11,6,'0',200000,10000,20),(1221,'1',20,'2021-05-25 21:54:59',740,9,9,11,6,'0',200000,10000,20),(1222,'1',20,'2021-05-25 21:54:59',741,9,9,11,6,'0',300000,15000,20),(1223,'1',20,'2021-05-25 21:54:59',742,9,9,11,6,'0',53000,2650,20),(1224,'1',20,'2021-05-25 21:54:59',743,9,9,11,6,'0',59000,2950,20),(1225,'1',20,'2021-05-25 21:54:59',744,9,9,11,6,'0',46000,2300,20),(1226,'1',20,'2021-05-25 21:54:59',745,9,9,11,6,'0',38000,1900,20),(1227,'1',20,'2021-05-25 21:54:59',746,9,9,11,6,'0',34000,1700,20),(1228,'1',20,'2021-05-25 21:54:59',747,9,9,11,6,'0',58000,2900,20),(1229,'1',20,'2021-05-25 21:54:59',748,9,9,11,6,'0',16320,816,20),(1230,'1',20,'2021-05-25 21:54:59',749,9,9,11,6,'0',32760,1638,20),(1231,'1',20,'2021-05-25 21:54:59',750,9,9,11,6,'0',32760,1638,20),(1232,'1',20,'2021-05-25 21:54:59',751,9,9,11,6,'0',32760,1638,20),(1233,'1',20,'2021-05-25 21:54:59',752,9,9,11,6,'0',119400,5970,20),(1234,'1',20,'2021-05-25 21:54:59',753,9,9,11,6,'0',166000,8300,20),(1235,'1',20,'2021-05-25 21:54:59',754,9,9,11,6,'0',54000,2700,20),(1236,'1',20,'2021-05-25 21:54:59',755,9,9,11,6,'0',200000,10000,20),(1237,'1',20,'2021-05-25 21:54:59',756,9,9,11,6,'0',56200,2810,20),(1238,'1',20,'2021-05-25 21:54:59',758,9,9,11,6,'0',17160,858,20),(1239,'1',20,'2021-05-25 21:54:59',759,9,9,11,6,'0',22320,1116,20),(1240,'1',20,'2021-05-25 21:54:59',760,9,9,11,6,'0',10400,520,20),(1241,'1',20,'2021-05-25 21:54:59',761,9,9,11,6,'0',25000,1250,20),(1242,'1',20,'2021-05-25 21:54:59',762,9,9,11,6,'0',17320,866,20),(1243,'1',20,'2021-05-25 21:54:59',763,9,9,11,6,'0',70000,3500,20),(1244,'1',20,'2021-05-25 21:54:59',764,9,9,11,6,'0',26660,1333,20),(1245,'1',20,'2021-05-25 21:54:59',765,9,9,11,6,'0',83340,4167,20),(1246,'1',20,'2021-05-25 21:54:59',766,9,9,11,6,'0',52000,2600,20),(1247,'1',20,'2021-05-25 21:54:59',767,9,9,11,6,'0',180000,9000,20),(1248,'1',20,'2021-05-25 21:54:59',768,9,9,11,6,'0',20000,1000,20),(1249,'1',20,'2021-05-25 21:54:59',769,9,9,11,6,'0',33320,1666,20),(1250,'1',20,'2021-05-25 21:54:59',770,9,9,11,6,'0',16000,800,20),(1251,'1',20,'2021-05-25 21:54:59',771,9,9,11,6,'0',56000,2800,20),(1252,'1',20,'2021-05-25 21:54:59',772,9,9,11,6,'0',34000,1700,20),(1253,'1',20,'2021-05-25 21:54:59',773,9,9,11,6,'0',89580,4479,20),(1254,'1',20,'2021-05-25 21:54:59',774,9,9,11,6,'0',97060,4853,20),(1255,'1',20,'2021-05-25 21:54:59',775,9,9,11,6,'0',97060,4853,20),(1256,'1',20,'2021-05-25 21:54:59',776,9,9,11,6,'0',89800,4490,20),(1257,'1',20,'2021-05-25 21:54:59',777,9,9,11,6,'0',81740,4087,20),(1258,'1',20,'2021-05-25 21:54:59',778,9,9,11,6,'0',81740,4087,20),(1259,'1',20,'2021-05-25 21:54:59',781,9,9,11,6,'0',196000,9800,20),(1260,'1',20,'2021-05-25 21:54:59',782,9,9,11,6,'0',196000,9800,20),(1261,'1',20,'2021-05-25 21:54:59',783,9,9,11,6,'0',72000,3600,20),(1262,'1',20,'2021-05-25 21:54:59',784,9,9,11,6,'0',240000,12000,20),(1263,'1',20,'2021-05-25 21:54:59',785,9,9,11,6,'0',240000,12000,20),(1264,'1',20,'2021-05-25 21:54:59',786,9,9,11,6,'0',370000,18500,20),(1265,'1',20,'2021-05-25 21:54:59',787,9,9,11,6,'0',36420,1821,20),(1266,'1',20,'2021-05-25 21:54:59',788,9,9,11,6,'0',150000,7500,20),(1267,'1',20,'2021-05-25 21:54:59',789,9,9,11,6,'0',64000,3200,20),(1268,'1',20,'2021-05-25 21:54:59',790,9,9,11,6,'0',140000,7000,20),(1269,'1',20,'2021-05-25 21:54:59',791,9,9,11,6,'0',170000,8500,20),(1270,'1',20,'2021-05-25 21:54:59',792,9,9,11,6,'0',290000,14500,20),(1271,'1',20,'2021-05-25 21:54:59',793,9,9,11,6,'0',57060,2853,20),(1272,'1',20,'2021-05-25 21:54:59',794,9,9,11,6,'0',128000,6400,20),(1273,'1',20,'2021-05-25 21:54:59',795,9,9,11,6,'0',300000,15000,20),(1274,'1',20,'2021-05-25 21:54:59',796,9,9,11,6,'0',210000,10500,20),(1275,'1',20,'2021-05-25 21:54:59',797,9,9,11,6,'0',210000,10500,20),(1276,'1',20,'2021-05-25 21:54:59',798,9,9,11,6,'0',470000,23500,20),(1277,'1',20,'2021-05-25 21:54:59',799,9,9,11,6,'0',76000,3800,20),(1278,'1',20,'2021-05-25 21:54:59',800,9,9,11,6,'0',56000,2800,20),(1279,'1',20,'2021-05-25 21:54:59',801,9,9,11,6,'0',50000,2500,20),(1280,'1',20,'2021-05-25 21:54:59',802,9,9,11,6,'0',50000,2500,20),(1281,'1',20,'2021-05-25 21:54:59',803,9,9,11,6,'0',76000,3800,20),(1282,'1',20,'2021-05-25 21:54:59',804,9,9,11,6,'0',50000,2500,20),(1283,'1',20,'2021-05-25 21:54:59',805,9,9,11,6,'0',50000,2500,20),(1284,'1',20,'2021-05-25 21:54:59',806,9,9,11,6,'0',110000,5500,20),(1285,'1',20,'2021-05-25 21:54:59',807,9,9,11,6,'0',40000,2000,20),(1286,'1',20,'2021-05-25 21:54:59',808,9,9,11,6,'0',20000,1000,20),(1287,'1',20,'2021-05-25 21:54:59',809,9,9,11,6,'0',62820,3141,20),(1288,'1',20,'2021-05-25 21:54:59',810,9,9,11,6,'0',1255640,62782,20),(1289,'1',20,'2021-05-25 21:54:59',811,9,9,11,6,'0',1243100,62155,20),(1290,'1',20,'2021-05-25 21:54:59',812,9,9,11,6,'0',880720,44036,20),(1291,'1',20,'2021-05-25 21:54:59',813,9,9,11,6,'0',117480,5874,20),(1292,'1',20,'2021-05-25 21:54:59',814,9,9,11,6,'0',117480,5874,20),(1293,'1',20,'2021-05-25 21:54:59',815,9,9,11,6,'0',70000,3500,20),(1294,'1',20,'2021-05-25 21:54:59',816,9,9,11,6,'0',36420,1821,20),(1295,'1',20,'2021-05-25 21:54:59',817,9,9,11,6,'0',58000,2900,20),(1296,'1',20,'2021-05-25 21:54:59',818,9,9,11,6,'0',65020,3251,20),(1297,'1',20,'2021-05-25 21:54:59',819,9,9,11,6,'0',160000,8000,20),(1298,'1',20,'2021-05-25 21:54:59',820,9,9,11,6,'0',96000,4800,20),(1299,'1',20,'2021-05-25 21:54:59',821,9,9,11,6,'0',96000,4800,20),(1300,'1',20,'2021-05-25 21:54:59',822,9,9,11,6,'0',63640,3182,20),(1301,'1',20,'2021-05-25 21:54:59',823,9,9,11,6,'0',84000,4200,20),(1302,'1',20,'2021-05-25 21:54:59',824,9,9,11,6,'0',14000,700,20),(1303,'1',20,'2021-05-25 21:54:59',825,9,9,11,6,'0',14000,700,20),(1304,'1',20,'2021-05-25 21:54:59',826,9,9,11,6,'0',54000,2700,20),(1305,'1',20,'2021-05-25 21:54:59',827,9,9,11,6,'0',70000,3500,20),(1306,'1',20,'2021-05-25 21:54:59',828,9,9,11,6,'0',98000,4900,20),(1307,'1',20,'2021-05-25 21:54:59',829,9,9,11,6,'0',130000,6500,20),(1308,'1',20,'2021-05-25 21:54:59',830,9,9,11,6,'0',30000,1500,20),(1309,'1',20,'2021-05-25 21:54:59',831,9,9,11,6,'0',30000,1500,20),(1310,'1',20,'2021-05-26 10:33:34',833,9,9,1,6,'0',40000,2000,20);
/*!40000 ALTER TABLE `stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_movimiento`
--

DROP TABLE IF EXISTS `t_movimiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_movimiento` (
  `id_tmovimiento` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  PRIMARY KEY (`id_tmovimiento`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_movimiento`
--

LOCK TABLES `t_movimiento` WRITE;
/*!40000 ALTER TABLE `t_movimiento` DISABLE KEYS */;
INSERT INTO `t_movimiento` VALUES (1,'Realizado'),(2,'Pendiente');
/*!40000 ALTER TABLE `t_movimiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_cargo`
--

DROP TABLE IF EXISTS `tipo_cargo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_cargo` (
  `id_cargo` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `descripcion` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `fecha` date NOT NULL,
  `empleado_id_empleado` int(11) NOT NULL,
  PRIMARY KEY (`id_cargo`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_cargo`
--

LOCK TABLES `tipo_cargo` WRITE;
/*!40000 ALTER TABLE `tipo_cargo` DISABLE KEYS */;
INSERT INTO `tipo_cargo` VALUES (1,'Gerente','gerencia','2020-03-23',1),(2,'cajero','caja','2020-03-23',9),(3,'Vendedor','vendedor','2019-10-24',1),(26,'Subgerente','-----','2020-10-18',1),(33,'Parametrización','Parametrización','2021-02-12',11),(34,'Patinador','--','2021-03-05',11),(35,'Domiciliario','Domiciliario','2021-04-25',21);
/*!40000 ALTER TABLE `tipo_cargo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_cuenta`
--

DROP TABLE IF EXISTS `tipo_cuenta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_cuenta` (
  `id_tcuenta` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id_tcuenta`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_cuenta`
--

LOCK TABLES `tipo_cuenta` WRITE;
/*!40000 ALTER TABLE `tipo_cuenta` DISABLE KEYS */;
INSERT INTO `tipo_cuenta` VALUES (1,'Ahorros'),(2,'Corriente'),(3,'Tarjeta de credito'),(4,'Chequera'),(5,'CDT'),(6,'Ninguna');
/*!40000 ALTER TABLE `tipo_cuenta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_pago`
--

DROP TABLE IF EXISTS `tipo_pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_pago` (
  `id_tpago` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `descripción` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  PRIMARY KEY (`id_tpago`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_pago`
--

LOCK TABLES `tipo_pago` WRITE;
/*!40000 ALTER TABLE `tipo_pago` DISABLE KEYS */;
INSERT INTO `tipo_pago` VALUES (1,'Efectivo','Efectivo'),(2,'Tarjeta crédito','Tarjeta credito'),(3,'Tarjeta débito','Tarjeta debido'),(5,'Link de pago','Enlace de pago');
/*!40000 ALTER TABLE `tipo_pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transformacion_stock`
--

DROP TABLE IF EXISTS `transformacion_stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transformacion_stock` (
  `id_transformacion` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `descripcion` varchar(500) COLLATE utf8_spanish2_ci NOT NULL,
  `empleado_id_empleado` int(11) NOT NULL,
  `fecha` date NOT NULL,
  PRIMARY KEY (`id_transformacion`),
  KEY `empleado_id_empleado` (`empleado_id_empleado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transformacion_stock`
--

LOCK TABLES `transformacion_stock` WRITE;
/*!40000 ALTER TABLE `transformacion_stock` DISABLE KEYS */;
/*!40000 ALTER TABLE `transformacion_stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'control3_prueba2'
--

--
-- Dumping routines for database 'control3_prueba2'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-27 12:16:03
