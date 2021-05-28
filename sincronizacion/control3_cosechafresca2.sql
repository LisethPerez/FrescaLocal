-- MariaDB dump 10.17  Distrib 10.4.8-MariaDB, for Win64 (AMD64)
--
-- Host: controler.com.co    Database: control3_cosechafresca2
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria_producto_trans`
--

LOCK TABLES `categoria_producto_trans` WRITE;
/*!40000 ALTER TABLE `categoria_producto_trans` DISABLE KEYS */;
INSERT INTO `categoria_producto_trans` VALUES (1,'Malla','---','2020-11-17',1,1),(2,'Bandeja','--','2020-11-17',1,1),(6,'Sin transformar','--','2020-11-17',1,1),(7,'Bolsa 5','---','2021-03-04',21,9);
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
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (63,'Cliente normal','Ninguna','---','0000','normal@gmail.com','123','',0,1,1,'2021-02-14',1),(64,'Liseth Juliana Pérez ','-','carrera 9#1A-23 sur','3224511875','-','1057607465','',0,1,1,'2021-02-18',1),(65,'Cliente prueba','-','-','3124769857','-','12','-',0,1,1,'2021-03-04',9),(66,'Juan ','-','-','-','-','333','-',0,2,1,'2021-03-05',9),(67,'holman','-','-','-','-','444','-',0,3,1,'2021-03-05',9),(68,'carlos','-','-','-','-','555','-',0,4,1,'2021-03-05',9),(69,'Carlos Camargo','-','-','-','-','881122','-',0,1,1,'2021-03-10',9),(70,'Andres PÃ©rez','-','-','-','-','123456789','-',0,1,9,'2021-05-25',21),(71,'Andrea Aguirre','-','-','-','-','1054802929','-',0,1,9,'2021-05-25',21),(72,'yulianis','-','-','-','-','22609956','-',0,1,9,'2021-05-25',21),(73,'juan rafael','-','-','-','-','11786956','-',0,1,9,'2021-05-25',21),(74,'nancy','-','-','-','-','51834034','-',0,1,9,'2021-05-25',21),(75,'fernando gomez','-','-','-','-','80799980','-',0,1,9,'2021-05-25',21),(76,'juliana melendez','-','-','-','-','53178356','-',0,1,9,'2021-05-25',21),(77,'juliana melendez','-','-','-','-','53178356','-',0,1,9,'2021-05-25',21),(78,'maria eugenia paez','-','-','-','-','1127572596','-',0,1,9,'2021-05-25',21),(79,'juan felipa','-','-','-','-','80195866','-',0,1,9,'2021-05-25',21),(80,'cristina vazque','-','-','-','-','22609956','-',0,1,9,'2021-05-25',21);
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
) ENGINE=InnoDB AUTO_INCREMENT=601 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_factura`
--

LOCK TABLES `detalle_factura` WRITE;
/*!40000 ALTER TABLE `detalle_factura` DISABLE KEYS */;
INSERT INTO `detalle_factura` VALUES (399,1,19200,0,19,22848,268,37,7,1,'2021-02-15',9,'NULL'),(400,3,19200,0,19,68544,269,37,7,1,'2021-02-15',9,'NULL'),(401,2,3600,0,0,7200,270,50,7,5,'2021-03-05',9,'Producto anterior: ACEITE DE OLIVA TEMPRANO , cantidad: 1 , precio de venta: 0 , descuento: 0 , impuesto: 19 y un total de: 0'),(402,1,0,0,19,0,271,37,7,1,'2021-03-04',9,'NULL'),(403,1,0,0,19,0,272,37,7,1,'2021-03-04',9,'NULL'),(404,1,3600,0,0,3600,273,50,7,5,'2021-03-04',9,'NULL'),(405,1,3600,0,0,3600,274,50,7,2,'2021-03-06',9,'NULL'),(406,1,3600,0,19,4284,274,50,7,2,'2021-03-06',9,'NULL'),(407,1,3600,0,5,3780,274,50,7,2,'2021-03-06',9,'NULL'),(408,1,3600,0,0,3600,274,50,7,2,'2021-03-06',9,'NULL'),(409,1,3600,0,19,4284,274,50,7,2,'2021-03-06',9,'NULL'),(410,1,3600,0,5,3780,274,50,7,2,'2021-03-06',9,'NULL'),(411,1,3400,0,19,4046,276,37,7,1,'2021-03-06',9,'NULL'),(412,1,3600,0,5,3780,276,50,7,2,'2021-03-06',9,'NULL'),(413,1,3600,0,0,3600,277,50,7,5,'2021-03-06',9,'NULL'),(414,1,0,0,5,0,277,46,7,2,'2021-03-06',9,'NULL'),(415,1,3400,0,19,4046,277,37,7,1,'2021-03-06',9,'NULL'),(416,1,2500,0,5,2625,278,46,7,2,'2021-03-06',9,'NULL'),(417,1,3600,0,0,3600,278,50,7,5,'2021-03-06',9,'NULL'),(418,1,3400,0,19,4046,278,37,7,1,'2021-03-06',9,'NULL'),(419,1,3600,0,0,3600,275,50,7,5,'2021-03-06',9,'NULL'),(420,1,2500,0,5,2625,275,46,7,2,'2021-03-06',9,'NULL'),(421,1,4000,0,19,4760,275,37,7,1,'2021-03-06',9,'NULL'),(422,2,4700,10,19,10067,276,46,1,1,'2021-03-06',9,'NULL'),(423,8,0,0,19,0,276,37,7,1,'2021-03-06',9,'NULL'),(424,2,4700,10,19,10067,277,46,1,1,'2021-03-06',9,'NULL'),(425,8,0,0,19,0,277,46,7,1,'2021-03-06',9,'NULL'),(426,1,3600,0,0,3600,279,50,7,5,'2021-03-06',9,'Producto anterior: PAN SUPER PERRO , cantidad: 1 , precio de venta: 4700 , descuento: 10 , impuesto: 19 y un total de: 5034'),(427,1,3600,0,0,3600,279,50,7,5,'2021-03-06',9,'NULL'),(428,0.06,3120,0,0,187,283,53,7,5,'2021-03-10',9,'NULL'),(429,1,4700,10,19,5034,284,46,1,1,'2021-03-10',9,'Producto anterior: AGUACATE HASS KILO , cantidad: 0.06 , precio de venta: 3120 , descuento: 0 , impuesto: 0 y un total de: 187'),(430,1,3600,0,0,3600,284,50,7,5,'2021-03-10',9,'NULL'),(431,0.27,3120,0,0,842,285,53,7,5,'2021-03-10',9,'NULL'),(432,1,3600,0,0,3600,285,50,7,5,'2021-03-10',9,'NULL'),(433,1,4700,10,19,5034,285,46,1,1,'2021-03-10',9,'NULL'),(434,2,3600,0,0,7200,278,50,7,5,'2021-03-10',9,'NULL'),(435,0,3120,0,0,0,278,53,7,5,'2021-03-10',9,'NULL'),(436,0,3120,0,0,0,279,53,7,5,'2021-03-10',9,'NULL'),(437,2,3600,0,0,7200,279,50,7,5,'2021-03-10',9,'NULL'),(438,2,3600,0,0,7200,280,50,7,5,'2021-03-10',9,'NULL'),(439,0,3120,0,0,0,280,53,7,5,'2021-03-10',9,'NULL'),(440,1,0,0,19,0,280,53,7,1,'2021-03-10',9,'NULL'),(441,10,7200,0,19,85680,281,1,7,1,'2021-03-10',9,'Producto anterior: ENTREMUSLOS DE POLLO BUCANEROS  BJ            , cantidad: 2 , precio de venta: 9400 , descuento: 0 , impuesto: 0 y un total de: 18800'),(442,1,3600,0,0,3600,281,50,7,5,'2021-03-10',9,'NULL'),(443,1,4700,10,19,5034,281,46,1,1,'2021-03-10',9,'NULL'),(444,1,0,0,19,0,282,37,7,1,'2021-03-10',9,'NULL'),(445,1,4700,10,19,5034,282,46,1,1,'2021-03-10',9,'NULL'),(446,0,3120,0,0,0,282,53,7,5,'2021-03-10',9,'NULL'),(447,3,7200,0,19,25704,283,1,7,1,'2021-04-20',9,'NULL'),(448,2,24800,0,0,49600,283,4,7,5,'2021-04-20',9,'NULL'),(449,0.15,5300,0,0,795,284,484,7,5,'2021-04-20',9,'NULL'),(450,1,24800,0,0,24800,284,4,7,5,'2021-04-20',9,'NULL'),(451,0.15,3900,0,0,585,285,483,7,5,'2021-04-21',9,'NULL'),(452,2,17820,0,19,42412,285,21,7,1,'2021-04-21',9,'NULL'),(453,0.15,5300,0,0,795,285,484,7,5,'2021-04-21',9,'NULL'),(454,0.15,9600,0,0,1440,286,538,7,5,'2021-04-21',9,'NULL'),(455,1,14985,0,19,17832,286,13,7,1,'2021-04-21',9,'NULL'),(456,0.15,3900,0,0,585,286,480,7,5,'2021-04-21',9,'NULL'),(457,2,21900,0,0,43800,287,228,7,5,'2021-04-21',9,'NULL'),(458,1,1900,0,0,1900,287,280,7,5,'2021-04-21',9,'NULL'),(459,0.15,10400,0,0,1560,287,566,7,5,'2021-04-21',9,'NULL'),(460,2,9400,0,0,18800,288,94,7,5,'2021-04-21',9,'NULL'),(461,3,20500,0,0,61500,288,102,7,5,'2021-04-21',9,'NULL'),(462,2,7200,0,19,17136,289,1,7,1,'2021-04-21',9,'NULL'),(463,3,1900,0,0,5700,289,285,7,5,'2021-04-21',9,'NULL'),(464,0.15,12500,0,0,1875,289,642,7,5,'2021-04-21',9,'NULL'),(465,0.15,37150,0,0,5573,289,120,7,5,'2021-04-21',9,'NULL'),(466,2,802,0,19,1909,289,303,7,1,'2021-04-21',9,'NULL'),(467,0.15,2400,0,0,360,289,648,7,5,'2021-04-21',9,'NULL'),(468,3,800,0,0,2400,289,645,7,5,'2021-04-21',9,'NULL'),(469,2,2800,0,0,5600,289,647,7,5,'2021-04-21',9,'NULL'),(470,2,22900,0,0,45800,289,589,7,5,'2021-04-21',9,'NULL'),(471,0.15,3900,0,0,585,289,584,7,5,'2021-04-21',9,'NULL'),(472,1,4200,0,0,4200,289,253,7,5,'2021-04-21',9,'NULL'),(473,1,4200,0,0,4200,289,253,7,5,'2021-04-21',9,'NULL'),(474,0,9900,0,0,19800,290,12,7,5,'2021-04-21',9,'NULL'),(475,0,6150,0,0,6150,290,237,7,5,'2021-04-21',9,'NULL'),(476,0,4350,0,0,653,290,481,7,5,'2021-04-21',9,'NULL'),(477,0,4350,0,0,653,290,481,7,5,'2021-04-21',9,'NULL'),(478,0,12500,0,0,1875,290,642,7,5,'2021-04-21',9,'NULL'),(479,0,5990,0,0,29950,290,238,7,5,'2021-04-21',9,'NULL'),(480,0,6000,0,0,12000,290,299,7,5,'2021-04-21',9,'NULL'),(481,0,2100,0,0,315,290,617,7,5,'2021-04-21',9,'NULL'),(482,2,5990,0,0,11980,291,238,7,5,'2021-04-21',9,'NULL'),(483,5,8667,0,19,51569,292,5,7,1,'2021-04-21',9,'NULL'),(484,2,20250,0,0,40500,292,8,7,5,'2021-04-21',9,'NULL'),(485,1,12500,0,19,14875,292,298,7,1,'2021-04-21',9,'NULL'),(486,1,8667,0,19,10314,292,5,7,1,'2021-04-21',9,'NULL'),(487,2,8900,0,19,21182,292,123,7,1,'2021-04-21',9,'NULL'),(488,1,3200,0,19,3808,293,1,7,1,'2021-04-25',21,'NULL'),(489,1,3200,0,19,3808,293,3,7,1,'2021-04-25',21,'NULL'),(490,2,3200,0,19,7616,293,4,7,1,'2021-04-25',21,'NULL'),(491,11,8667,0,19,113451,294,3,7,1,'2021-05-15',21,'NULL'),(492,1,1800,0,0,1800,296,34,7,5,'2021-05-15',21,'NULL'),(493,5,1800,0,0,9000,297,34,7,5,'2021-05-15',21,'NULL'),(494,1,8667,0,19,10314,298,354,7,1,'2021-05-15',21,'NULL'),(495,5,8667,0,19,51569,40679,3,7,1,'2021-05-15',21,'NULL'),(496,0.6,3600,0,0,2160,302,171,7,5,'2021-05-25',21,'NULL'),(497,1,2500,0,19,2975,303,287,7,1,'2021-05-25',21,'NULL'),(498,0.56,6800,0,0,3808,304,224,7,5,'2021-05-25',21,'NULL'),(499,0.155,3600,0,0,558,305,171,7,5,'2021-05-25',21,'NULL'),(500,0.155,3900,0,0,605,306,390,7,5,'2021-05-25',21,'NULL'),(501,0.36,6500,0,0,2340,46084,232,7,5,'2021-05-25',21,'NULL'),(502,0.515,10000,0,0,5150,46084,168,7,5,'2021-05-25',21,'NULL'),(503,0.125,29900,0,0,3738,46084,212,7,5,'2021-05-25',21,'NULL'),(504,0.05,35000,0,0,1750,46085,222,7,5,'2021-05-25',21,'NULL'),(505,0.16,11800,0,0,1888,46086,167,7,5,'2021-05-25',21,'NULL'),(506,0.365,4200,0,0,1533,46087,176,7,5,'2021-05-25',21,'NULL'),(507,0.895,10000,0,0,8950,46087,168,7,5,'2021-05-25',21,'NULL'),(508,0.445,6200,0,0,2759,46087,175,7,5,'2021-05-25',21,'NULL'),(509,0.185,3800,0,0,703,46087,244,7,5,'2021-05-25',21,'NULL'),(510,0.275,3200,0,0,880,46087,208,7,5,'2021-05-25',21,'NULL'),(511,0.07,3900,0,0,273,46087,209,7,5,'2021-05-25',21,'NULL'),(512,1,7500,0,0,7500,46087,101,7,5,'2021-05-25',21,'NULL'),(513,2,1300,0,0,2600,46087,437,7,5,'2021-05-25',21,'NULL'),(514,0.365,4200,0,0,1533,46088,176,7,5,'2021-05-25',21,'NULL'),(515,0.895,10000,0,0,8950,46088,168,7,5,'2021-05-25',21,'NULL'),(516,0.445,6200,0,0,2759,46088,175,7,5,'2021-05-25',21,'NULL'),(517,0.185,3800,0,0,703,46088,244,7,5,'2021-05-25',21,'NULL'),(518,0.275,3200,0,0,880,46088,208,7,5,'2021-05-25',21,'NULL'),(519,0.07,3900,0,0,273,46088,209,7,5,'2021-05-25',21,'NULL'),(520,1,7500,0,0,7500,46088,101,7,5,'2021-05-25',21,'NULL'),(521,2,1300,0,0,2600,46088,437,7,5,'2021-05-25',21,'NULL'),(522,0.365,4200,0,0,1533,46089,176,7,5,'2021-05-25',21,'NULL'),(523,0.895,10000,0,0,8950,46089,168,7,5,'2021-05-25',21,'NULL'),(524,0.445,6200,0,0,2759,46089,175,7,5,'2021-05-25',21,'NULL'),(525,0.185,3800,0,0,703,46089,244,7,5,'2021-05-25',21,'NULL'),(526,0.275,3200,0,0,880,46089,208,7,5,'2021-05-25',21,'NULL'),(527,0.07,3900,0,0,273,46089,209,7,5,'2021-05-25',21,'NULL'),(528,1,7500,0,0,7500,46089,209,7,5,'2021-05-25',21,'NULL'),(529,2,1300,0,0,2600,46089,437,7,5,'2021-05-25',21,'NULL'),(530,0.365,4200,0,0,1533,46090,176,7,5,'2021-05-25',21,'NULL'),(531,0.895,10000,0,0,8950,46090,168,7,5,'2021-05-25',21,'NULL'),(532,0.445,6200,0,0,2759,46090,175,7,5,'2021-05-25',21,'NULL'),(533,0.185,3800,0,0,703,46090,244,7,5,'2021-05-25',21,'NULL'),(534,0.275,3200,0,0,880,46090,208,7,5,'2021-05-25',21,'NULL'),(535,0.07,3900,0,0,273,46090,209,7,5,'2021-05-25',21,'NULL'),(536,1,7500,0,0,7500,46090,209,7,5,'2021-05-25',21,'NULL'),(537,2,1300,0,0,2600,46090,437,7,5,'2021-05-25',21,'NULL'),(538,0.365,4200,0,0,1533,46091,176,7,5,'2021-05-25',21,'NULL'),(539,0.895,10000,0,0,8950,46091,168,7,5,'2021-05-25',21,'NULL'),(540,0.445,6200,0,0,2759,46091,175,7,5,'2021-05-25',21,'NULL'),(541,0.185,3800,0,0,703,46091,244,7,5,'2021-05-25',21,'NULL'),(542,0.275,3200,0,0,880,46091,208,7,5,'2021-05-25',21,'NULL'),(543,0.07,3900,0,0,273,46091,209,7,5,'2021-05-25',21,'NULL'),(544,1,7500,0,0,7500,46091,209,7,5,'2021-05-25',21,'NULL'),(545,2,1300,0,0,2600,46091,437,7,5,'2021-05-25',21,'NULL'),(546,1.14,3400,0,0,3876,46092,184,7,5,'2021-05-25',21,'NULL'),(547,0.885,6800,0,0,6018,46094,224,7,5,'2021-05-25',21,'NULL'),(548,1.48,3600,0,0,5328,46095,170,7,5,'2021-05-25',21,'NULL'),(549,1.55,10000,0,0,15500,46095,168,7,5,'2021-05-25',21,'NULL'),(550,1.69,3600,0,0,6084,46095,177,7,5,'2021-05-25',21,'NULL'),(551,0.98,4600,0,0,4508,46095,392,7,5,'2021-05-25',21,'NULL'),(552,0.82,3200,0,0,2624,46095,208,7,5,'2021-05-25',21,'NULL'),(553,2.135,3600,0,0,7686,46095,198,7,5,'2021-05-25',21,'NULL'),(554,0.815,3200,0,0,2608,46095,246,7,5,'2021-05-25',21,'NULL'),(555,1.115,3600,0,0,4014,46095,171,7,5,'2021-05-25',21,'NULL'),(556,0.185,5200,0,0,962,46095,399,7,5,'2021-05-25',21,'NULL'),(557,0.88,3800,0,0,3344,46095,243,7,5,'2021-05-25',21,'NULL'),(558,0.73,3600,0,0,2628,46095,241,7,5,'2021-05-25',21,'NULL'),(559,0.54,6200,0,0,3348,46095,172,7,5,'2021-05-25',21,'NULL'),(560,1.48,3600,0,0,5328,46096,170,7,5,'2021-05-25',21,'NULL'),(561,1.55,10000,0,0,15500,46096,168,7,5,'2021-05-25',21,'NULL'),(562,1.69,3600,0,0,6084,46096,177,7,5,'2021-05-25',21,'NULL'),(563,0.98,4600,0,0,4508,46096,392,7,5,'2021-05-25',21,'NULL'),(564,0.82,3200,0,0,2624,46096,208,7,5,'2021-05-25',21,'NULL'),(565,2.135,3600,0,0,7686,46096,198,7,5,'2021-05-25',21,'NULL'),(566,0.815,3200,0,0,2608,46096,246,7,5,'2021-05-25',21,'NULL'),(567,1.115,3600,0,0,4014,46096,171,7,5,'2021-05-25',21,'NULL'),(568,0.185,5200,0,0,962,46096,399,7,5,'2021-05-25',21,'NULL'),(569,0.88,3800,0,0,3344,46096,243,7,5,'2021-05-25',21,'NULL'),(570,0.73,3600,0,0,2628,46096,241,7,5,'2021-05-25',21,'NULL'),(571,0.54,6200,0,0,3348,46096,172,7,5,'2021-05-25',21,'NULL'),(572,0.825,3800,0,0,3135,46097,247,7,5,'2021-05-25',21,'NULL'),(573,0.665,6800,0,0,4522,46097,224,7,5,'2021-05-25',21,'NULL'),(574,1.305,3800,0,0,4959,46097,243,7,5,'2021-05-25',21,'NULL'),(575,1.135,3600,0,0,4086,46097,177,7,5,'2021-05-25',21,'NULL'),(576,0.82,4200,0,0,3444,46097,393,7,5,'2021-05-25',21,'NULL'),(577,0.375,4600,0,0,1725,46097,392,7,5,'2021-05-25',21,'NULL'),(578,1.355,3600,0,0,4878,46098,171,7,5,'2021-05-25',21,'NULL'),(579,1.02,3200,0,0,3264,46098,401,7,5,'2021-05-25',21,'NULL'),(580,0.56,10000,0,0,5600,46098,168,7,5,'2021-05-25',21,'NULL'),(581,1,4800,0,0,4800,46099,157,7,5,'2021-05-25',21,'NULL'),(582,1,2800,0,19,3332,46100,267,7,1,'2021-05-25',21,'NULL'),(583,0,4800,0,0,3960,46101,211,7,5,'2021-05-25',21,'NULL'),(584,0,3600,0,0,4392,46101,226,7,5,'2021-05-25',21,'NULL'),(585,0,3400,0,0,11322,46101,184,7,5,'2021-05-25',21,'NULL'),(586,0,3400,0,0,9639,46101,186,7,5,'2021-05-25',21,'NULL'),(587,0,3600,0,0,5526,46101,198,7,5,'2021-05-25',21,'NULL'),(588,0,3600,0,0,3744,46101,241,7,5,'2021-05-25',21,'NULL'),(589,0,2600,0,0,3666,46101,233,7,5,'2021-05-25',21,'NULL'),(590,0,4200,0,0,4116,46101,385,7,5,'2021-05-25',21,'NULL'),(591,0,11800,0,0,5546,46101,167,7,5,'2021-05-25',21,'NULL'),(592,0,3600,0,0,3528,46101,171,7,5,'2021-05-25',21,'NULL'),(593,0,4500,0,0,4500,46101,95,7,5,'2021-05-25',21,'NULL'),(594,0,3800,0,0,2356,46101,247,7,5,'2021-05-25',21,'NULL'),(595,0,3800,0,0,2033,46101,247,7,5,'2021-05-25',21,'NULL'),(596,0,6900,0,0,3036,46101,207,7,5,'2021-05-25',21,'NULL'),(597,0,2500,0,0,2500,46101,116,7,5,'2021-05-25',21,'NULL'),(598,0,3600,0,0,6876,46101,177,7,5,'2021-05-25',21,'NULL'),(599,0,12500,0,0,4375,46101,473,7,5,'2021-05-25',21,'NULL'),(600,0,12500,0,0,0,46101,372,7,5,'2021-05-25',21,'NULL');
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
) ENGINE=MyISAM AUTO_INCREMENT=46102 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factura`
--

LOCK TABLES `factura` WRITE;
/*!40000 ALTER TABLE `factura` DISABLE KEYS */;
INSERT INTO `factura` VALUES (269,0,68544,1,'2021-02-15 20:08:52',1,1,9,0,63,1,1,'NULL','NULL'),(268,0,22848,1,'2021-02-15 19:52:23',1,1,9,0,63,1,0,'NULL','NULL'),(270,0,7200,1,'2021-03-05 03:40:16',1,1,9,0,63,1,0,'NULL','NULL'),(271,2346,0,1,'2021-03-04 22:06:16',1,1,9,0,63,1,1,'NULL','AplicaciÃ³n'),(272,0,0,1,'2021-03-04 22:07:36',1,1,9,11,63,1,0,'1000','NULL'),(273,0,3600,1,'2021-03-04 22:16:56',1,2,9,1,63,1,0,'12345','NULL'),(274,0,11664,3,'2021-03-06 10:18:41',1,1,9,0,63,1,0,'NULL','NULL'),(276,0,10067,2,'2021-03-06 13:22:40',1,1,9,0,63,1,0,'NULL','NULL'),(277,0,10067,2,'2021-03-06 13:22:42',1,1,9,0,63,1,0,'NULL','NULL'),(278,0,7200,2,'2021-03-10 21:10:46',1,1,9,0,63,1,0,'NULL','NULL'),(275,0,10985,3,'2021-03-06 10:44:28',1,1,9,0,63,1,0,'NULL','NULL'),(279,0,7200,2,'2021-03-10 21:17:16',1,1,9,0,63,1,0,'9087','NULL'),(283,0,75304,2,'2021-04-20 23:42:39',1,1,9,0,63,1,0,'NULL','NULL'),(284,0,25595,2,'2021-04-20 23:50:03',1,5,9,0,63,1,1,'3456','NULL'),(285,0,43792,3,'2021-04-21 00:03:48',1,1,9,1,69,1,0,'$ 43,792','NULL'),(280,0,7200,3,'2021-03-10 22:20:56',0,1,9,0,65,1,0,'NULL','NULL'),(281,0,8634,3,'2021-03-10 22:24:05',1,2,9,0,65,1,0,'5678','NULL'),(282,0,3600,3,'2021-03-10 22:34:37',1,1,9,0,65,1,0,'NULL','NULL'),(286,0,19857,3,'2021-04-21 00:06:28',0,3,9,0,63,9,0,'NULL','NULL'),(287,236,47260,3,'2021-04-21 00:16:52',1,1,9,0,63,9,0,'$ 47,260','Pedido en casa'),(288,456,147180,2,'2021-04-21 00:18:08',1,1,9,0,63,9,1,'NULL','Pedido en casa'),(289,0,95338,12,'2021-04-21 01:01:40',1,3,9,1,63,9,0,'4567','NULL'),(290,0,0,0,'2021-04-21 01:11:53',0,1,9,0,63,9,0,'NULL','NULL'),(291,0,11980,1,'2021-04-21 01:14:33',0,3,9,1,63,9,0,'NULL','NULL'),(292,0,138440,5,'2021-04-21 01:16:39',1,3,9,0,63,9,1,'346','NULL'),(293,0,15232,3,'2021-04-25 15:25:01',1,2,21,0,63,9,0,'05141','NULL'),(294,0,113451,1,'2021-05-15 07:27:20',1,1,21,0,63,9,0,'NULL','NULL'),(295,0,0,0,'2021-05-15 07:27:20',0,1,21,0,63,9,0,'NULL','NULL'),(296,0,1800,1,'2021-05-15 07:33:41',1,2,21,0,63,9,0,'1212','NULL'),(297,0,9000,1,'2021-05-15 07:35:10',1,1,21,0,63,9,0,'NULL','NULL'),(298,0,10314,1,'2021-05-15 07:56:10',1,1,21,0,63,9,0,'NULL','NULL'),(40679,0,51569,1,'2021-05-15 07:59:45',1,1,21,0,63,9,0,'NULL','NULL'),(302,0,2160,1,'2021-05-25 07:56:44',1,1,21,0,63,9,0,'NULL','NULL'),(303,0,2975,1,'2021-05-25 08:04:37',1,1,21,0,63,9,0,'NULL','NULL'),(304,0,3808,1,'2021-05-25 08:05:56',1,1,21,0,63,9,0,'NULL','NULL'),(305,0,558,1,'2021-05-25 08:13:15',1,1,21,0,71,9,0,'NULL','NULL'),(306,0,605,1,'2021-05-25 08:16:49',0,0,21,24,63,9,0,'NULL','NULL'),(46084,0,11228,3,'2021-05-25 08:28:27',1,1,21,0,72,9,0,'NULL','NULL'),(46085,0,1750,1,'2021-05-25 08:30:32',1,1,21,0,73,9,0,'NULL','NULL'),(46086,0,0,0,'2021-05-25 08:33:54',0,1,21,0,74,9,0,'NULL','NULL'),(46087,0,25198,8,'2021-05-25 08:43:47',1,1,21,0,63,9,0,'NULL','NULL'),(46088,0,25198,8,'2021-05-25 08:43:54',1,1,21,0,63,9,1,'NULL','NULL'),(46089,0,25198,8,'2021-05-25 08:44:02',1,1,21,0,63,9,1,'NULL','NULL'),(46090,0,25198,8,'2021-05-25 08:44:09',1,1,21,0,63,9,1,'NULL','NULL'),(46091,0,25198,8,'2021-05-25 08:44:16',1,1,21,0,63,9,1,'NULL','NULL'),(46092,0,3876,1,'2021-05-25 09:01:54',1,1,21,0,63,9,0,'NULL','NULL'),(46093,0,0,0,'2021-05-25 09:04:45',1,1,21,0,63,9,0,'NULL','NULL'),(46094,0,6018,1,'2021-05-25 09:09:19',1,1,21,0,63,9,0,'NULL','NULL'),(46095,0,58634,12,'2021-05-25 09:26:03',1,2,21,0,76,9,0,'','NULL'),(46096,0,58634,12,'2021-05-25 09:26:22',1,2,21,0,76,9,1,'','NULL'),(46097,0,21871,6,'2021-05-25 09:32:01',1,1,21,0,78,9,0,'NULL','NULL'),(46098,0,13742,3,'2021-05-25 09:37:31',1,2,21,0,63,9,0,'1010','NULL'),(46099,0,4800,1,'2021-05-25 09:39:04',1,1,21,0,63,9,0,'NULL','NULL'),(46100,0,3332,1,'2021-05-25 09:49:03',1,1,21,0,63,9,0,'NULL','NULL'),(46101,0,0,0,'2021-05-25 10:18:39',0,1,21,0,72,9,0,'NULL','NULL');
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
) ENGINE=MyISAM AUTO_INCREMENT=478 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock`
--

LOCK TABLES `stock` WRITE;
/*!40000 ALTER TABLE `stock` DISABLE KEYS */;
INSERT INTO `stock` VALUES (1,'1',1,'2021-05-25 07:36:25',1,9,20,21,6,'0',6000,6000,1),(2,'1',1,'2021-05-25 07:36:25',4,9,18,21,6,'0',15500,15500,1),(3,'1',1,'2021-05-25 07:36:25',5,9,25,21,6,'0',7500,7500,1),(4,'1',1,'2021-05-25 07:36:25',6,9,38,21,6,'0',6426,6426,1),(5,'1',1,'2021-05-25 07:36:25',7,9,25,21,6,'0',5100,5100,1),(6,'1',5,'2021-05-25 07:36:25',8,9,18,21,6,'0',75000,15000,5),(7,'1',5,'2021-05-25 07:36:25',9,9,18,21,6,'0',42500,8500,5),(8,'1',5,'2021-05-25 07:36:25',10,9,18,21,6,'0',42500,8500,5),(9,'1',2,'2021-05-25 07:36:25',11,9,18,21,6,'0',15000,7500,2),(10,'1',3,'2021-05-25 07:36:25',13,9,22,21,6,'0',38643,12881,3),(11,'1',2,'2021-05-25 07:36:25',14,9,22,21,6,'0',75000,37500,2),(12,'1',1,'2021-05-25 07:36:25',15,9,22,21,6,'0',16700,16700,1),(13,'1',10,'2021-05-25 07:36:25',17,9,22,21,6,'0',17850,1785,10),(14,'1',1,'2021-05-25 07:36:25',18,9,19,21,6,'0',14000,14000,1),(15,'1',6,'2021-05-25 07:36:25',20,9,22,21,6,'0',60096,10016,6),(16,'1',4,'2021-05-25 07:36:25',21,9,22,21,6,'0',40064,10016,4),(17,'1',2,'2021-05-25 07:36:25',22,9,22,21,6,'0',17772,8886,2),(18,'1',33,'2021-05-25 07:36:25',23,9,36,21,6,'0',280500,8500,33),(19,'1',21,'2021-05-25 07:36:25',24,9,36,21,6,'0',178500,8500,21),(20,'1',7,'2021-05-25 07:36:25',29,9,36,21,6,'0',59500,8500,7),(21,'1',3,'2021-05-25 07:36:25',37,9,28,21,6,'0',4098,1366,3),(22,'1',1,'2021-05-25 07:36:25',47,9,28,21,6,'0',2083,2083,1),(23,'1',7,'2021-05-25 07:36:25',48,9,25,21,6,'0',175000,25000,7),(24,'1',1,'2021-05-25 07:36:25',49,9,25,21,6,'0',16000,16000,1),(25,'1',6,'2021-05-25 07:36:25',51,9,25,21,6,'0',96000,16000,6),(26,'1',2,'2021-05-25 07:36:25',53,9,25,21,6,'0',67200,33600,2),(27,'1',1,'2021-05-25 07:36:25',55,9,25,21,6,'0',35000,35000,1),(28,'1',8,'2021-05-25 07:36:25',56,9,25,21,6,'0',213200,26650,8),(29,'1',3,'2021-05-25 07:36:25',65,9,28,21,6,'0',2799,933,3),(30,'1',6,'2021-05-25 07:36:25',66,9,28,21,6,'0',5598,933,6),(31,'1',16,'2021-05-25 07:36:25',68,9,28,21,6,'0',13856,866,16),(32,'1',12,'2021-05-25 07:36:25',69,9,28,21,6,'0',10392,866,12),(33,'1',3,'2021-05-25 07:36:25',71,9,28,21,6,'0',2598,866,3),(34,'1',5,'2021-05-25 07:36:25',72,9,28,21,6,'0',4330,866,5),(35,'1',18,'2021-05-25 07:36:25',74,9,28,21,6,'0',24588,1366,18),(36,'1',4,'2021-05-25 07:36:25',75,9,28,21,6,'0',7100,1775,4),(37,'1',12,'2021-05-25 07:36:25',76,9,28,21,6,'0',21300,1775,12),(38,'1',4,'2021-05-25 07:36:25',82,9,28,21,6,'0',10564,2641,4),(39,'1',6,'2021-05-25 07:36:25',83,9,28,21,6,'0',15846,2641,6),(40,'1',18,'2021-05-25 07:36:25',85,9,28,21,6,'0',26244,1458,18),(41,'1',8,'2021-05-25 07:36:25',86,9,28,21,6,'0',35600,4450,8),(42,'1',1,'2021-05-25 07:36:25',87,9,25,21,6,'0',27000,27000,1),(43,'1',5,'2021-05-25 07:36:25',88,9,34,21,6,'0',37000,7400,5),(44,'1',2,'2021-05-25 07:36:25',94,9,34,21,6,'0',16000,8000,2),(45,'1',2,'2021-05-25 07:36:25',103,9,34,21,6,'0',9856,4928,2),(46,'1',4,'2021-05-25 07:36:25',108,9,29,21,6,'0',31000,7750,4),(47,'1',3,'2021-05-25 07:36:25',109,9,29,21,6,'0',12420,4140,3),(48,'1',3,'2021-05-25 07:36:25',111,9,29,21,6,'0',13890,4630,3),(49,'1',2.1,'2021-05-25 07:36:25',115,9,35,21,6,'0',72450,34500,2),(50,'1',5,'2021-05-25 07:36:25',116,9,35,21,6,'0',26180,5236,5),(51,'1',1.38,'2021-05-25 07:36:25',117,9,35,21,6,'0',41538,30100,1),(52,'1',5,'2021-05-25 07:36:25',119,9,35,21,6,'0',132500,26500,5),(53,'1',2.19,'2021-05-25 07:36:25',121,9,35,21,6,'0',30660,14000,2),(54,'1',3,'2021-05-25 07:36:25',122,9,35,21,6,'0',21063,7021,3),(55,'1',2.1,'2021-05-25 07:36:25',124,9,35,21,6,'0',37800,18000,2),(56,'1',0.7,'2021-05-25 07:36:25',125,9,35,21,6,'0',10500,15000,1),(57,'1',1.8,'2021-05-25 07:36:25',127,9,35,21,6,'0',52020,28900,2),(58,'1',8,'2021-05-25 07:36:25',128,9,35,21,6,'0',46648,5831,8),(59,'1',2,'2021-05-25 07:36:25',130,9,29,21,6,'0',9000,4500,2),(60,'1',41,'2021-05-25 07:36:25',132,9,31,21,6,'0',221400,5400,41),(61,'1',4,'2021-05-25 07:36:25',143,9,9,21,6,'0',3708,927,4),(62,'1',3,'2021-05-25 07:36:25',144,9,9,21,6,'0',12423,4141,3),(63,'1',6,'2021-05-25 07:36:25',145,9,21,21,6,'0',32508,5418,6),(64,'1',2,'2021-05-25 07:36:25',148,9,18,21,6,'0',14000,7000,2),(65,'1',1,'2021-05-25 07:36:25',151,9,15,21,6,'0',8925,8925,1),(66,'1',1,'2021-05-25 07:36:25',152,9,15,21,6,'0',8925,8925,1),(67,'1',1,'2021-05-25 07:36:25',170,9,21,21,6,'0',3547,3547,1),(68,'1',3,'2021-05-25 07:36:25',183,9,19,21,6,'0',24000,8000,3),(69,'1',2,'2021-05-25 07:36:25',185,9,19,21,6,'0',17000,8500,2),(70,'1',2,'2021-05-25 07:36:25',190,9,19,21,6,'0',29000,14500,2),(71,'1',1,'2021-05-25 07:36:25',195,9,19,21,6,'0',15600,15600,1),(72,'1',1,'2021-05-25 07:36:25',196,9,19,21,6,'0',15600,15600,1),(73,'1',6,'2021-05-25 07:36:25',204,9,21,21,6,'0',15702,2617,6),(74,'1',3,'2021-05-25 07:36:25',205,9,21,21,6,'0',10548,3516,3),(75,'1',13,'2021-05-25 07:36:25',226,9,23,21,6,'0',221000,17000,13),(76,'1',5,'2021-05-25 07:36:25',227,9,21,21,6,'0',51290,10258,5),(77,'1',4,'2021-05-25 07:36:25',228,9,21,21,6,'0',41032,10258,4),(78,'1',4,'2021-05-25 07:36:25',231,9,13,21,6,'0',25332,6333,4),(79,'1',5,'2021-05-25 07:36:25',232,9,37,21,6,'0',75000,15000,5),(80,'1',1,'2021-05-25 07:36:25',235,9,24,21,6,'0',4083,4083,1),(81,'1',3,'2021-05-25 07:36:25',242,9,24,21,6,'0',14496,4832,3),(82,'1',4,'2021-05-25 07:36:25',243,9,24,21,6,'0',13664,3416,4),(83,'1',1,'2021-05-25 07:36:25',248,9,24,21,6,'0',3223,3223,1),(84,'1',1,'2021-05-25 07:36:25',249,9,24,21,6,'0',2394,2394,1),(85,'1',5,'2021-05-25 07:36:25',253,9,25,21,6,'0',75000,15000,5),(86,'1',4,'2021-05-25 07:36:25',254,9,24,21,6,'0',13664,3416,4),(87,'1',1,'2021-05-25 07:36:25',258,9,24,21,6,'0',11150,11150,1),(88,'1',2,'2021-05-25 07:36:25',260,9,24,21,6,'0',7168,3584,2),(89,'1',3,'2021-05-25 07:36:25',261,9,24,21,6,'0',10248,3416,3),(90,'1',5,'2021-05-25 07:36:25',276,9,13,21,6,'0',20750,4150,5),(91,'1',4,'2021-05-25 07:36:25',277,9,13,21,6,'0',10080,2520,4),(92,'1',7,'2021-05-25 07:36:25',281,9,13,21,6,'0',7700,1100,7),(93,'1',6,'2021-05-25 07:36:25',282,9,13,21,6,'0',8400,1400,6),(94,'1',9,'2021-05-25 07:36:25',285,9,13,21,6,'0',12600,1400,9),(95,'1',10,'2021-05-25 07:36:25',286,9,13,21,6,'0',24700,2470,10),(96,'1',8,'2021-05-25 07:36:25',288,9,13,21,6,'0',11200,1400,8),(97,'1',9,'2021-05-25 07:36:25',290,9,9,21,6,'0',22644,2516,9),(98,'1',2,'2021-05-25 07:36:25',293,9,9,21,6,'0',10752,5376,2),(99,'1',3,'2021-05-25 07:36:25',294,9,9,21,6,'0',8535,2845,3),(100,'1',5,'2021-05-25 07:36:25',295,9,9,21,6,'0',53020,10604,5),(101,'1',2,'2021-05-25 07:36:25',297,9,9,21,6,'0',11726,5863,2),(102,'1',10,'2021-05-25 07:36:25',300,9,29,21,6,'0',7000,700,10),(103,'1',5,'2021-05-25 07:36:25',301,9,29,21,6,'0',15655,3131,5),(104,'1',4,'2021-05-25 07:36:25',307,9,9,21,6,'0',25864,6466,4),(105,'1',2,'2021-05-25 07:36:25',308,9,29,21,6,'0',9930,4965,2),(106,'1',2,'2021-05-25 07:36:25',310,9,22,21,6,'0',9658,4829,2),(107,'1',2,'2021-05-25 07:36:25',316,9,25,21,6,'0',13600,6800,2),(108,'1',5,'2021-05-25 07:36:25',317,9,14,21,6,'0',30000,6000,5),(109,'1',11,'2021-05-25 07:36:25',318,9,14,21,6,'0',55000,5000,11),(110,'1',1,'2021-05-25 07:36:25',320,9,17,21,6,'0',9163,9163,1),(111,'1',2,'2021-05-25 07:36:25',321,9,17,21,6,'0',18326,9163,2),(112,'1',2,'2021-05-25 07:36:25',322,9,17,21,6,'0',18326,9163,2),(113,'1',2,'2021-05-25 07:36:25',323,9,17,21,6,'0',18326,9163,2),(114,'1',2,'2021-05-25 07:36:25',324,9,17,21,6,'0',18326,9163,2),(115,'1',5,'2021-05-25 07:36:25',326,9,32,21,6,'0',72500,14500,5),(116,'1',44,'2021-05-25 07:36:25',332,9,12,21,6,'0',57200,1300,44),(117,'1',3,'2021-05-25 07:36:25',333,9,12,21,6,'0',3498,1166,3),(118,'1',4,'2021-05-25 07:36:25',335,9,12,21,6,'0',3000,750,4),(119,'1',7,'2021-05-25 07:36:25',336,9,12,21,6,'0',5250,750,7),(120,'1',6,'2021-05-25 07:36:25',338,9,12,21,6,'0',4500,750,6),(121,'1',31,'2021-05-25 07:36:25',339,9,12,21,6,'0',23250,750,31),(122,'1',7,'2021-05-25 07:36:25',340,9,12,21,6,'0',5250,750,7),(123,'1',15,'2021-05-25 07:36:25',341,9,12,21,6,'0',6000,400,15),(124,'1',13,'2021-05-25 07:36:25',342,9,12,21,6,'0',5200,400,13),(125,'1',8,'2021-05-25 07:36:25',343,9,12,21,6,'0',3200,400,8),(126,'1',8,'2021-05-25 07:36:25',344,9,12,21,6,'0',10400,1300,8),(127,'1',7,'2021-05-25 07:36:25',345,9,12,21,6,'0',9100,1300,7),(128,'1',8,'2021-05-25 07:36:25',346,9,12,21,6,'0',20000,2500,8),(129,'1',33,'2021-05-25 07:36:25',347,9,12,21,6,'0',82500,2500,33),(130,'1',7,'2021-05-25 07:36:25',348,9,12,21,6,'0',17500,2500,7),(131,'1',7,'2021-05-25 07:36:25',349,9,12,21,6,'0',31500,4500,7),(132,'1',20,'2021-05-25 07:36:25',350,9,12,21,6,'0',90000,4500,20),(133,'1',8,'2021-05-25 07:36:25',351,9,12,21,6,'0',36000,4500,8),(134,'1',2,'2021-05-25 07:36:25',362,9,41,21,6,'0',40000,20000,2),(135,'1',1,'2021-05-25 07:36:25',364,9,41,21,6,'0',20000,20000,1),(136,'1',9,'2021-05-25 07:36:25',366,9,14,21,6,'0',18000,2000,9),(137,'1',4,'2021-05-25 07:36:25',367,9,22,21,6,'0',11412,2853,4),(138,'1',4,'2021-05-25 07:36:25',368,9,22,21,6,'0',11412,2853,4),(139,'1',8,'2021-05-25 07:36:25',369,9,22,21,6,'0',23872,2984,8),(140,'1',3,'2021-05-25 07:36:25',370,9,22,21,6,'0',7869,2623,3),(141,'1',2,'2021-05-25 07:36:25',371,9,22,21,6,'0',5708,2854,2),(142,'1',2,'2021-05-25 07:36:25',793,9,22,21,6,'0',5706,2853,2),(143,'1',2,'2021-05-25 07:36:25',374,9,16,21,6,'0',16000,8000,2),(144,'1',3,'2021-05-25 07:36:25',378,9,16,21,6,'0',45000,15000,3),(145,'1',1,'2021-05-25 07:36:25',379,9,16,21,6,'0',15000,15000,1),(146,'1',2,'2021-05-25 07:36:25',381,9,16,21,6,'0',30000,15000,2),(147,'1',2,'2021-05-25 07:36:25',384,9,16,21,6,'0',36000,18000,2),(148,'1',2,'2021-05-25 07:36:25',387,9,16,21,6,'0',50000,25000,2),(149,'1',2,'2021-05-25 07:36:25',388,9,16,21,6,'0',50000,25000,2),(150,'1',1,'2021-05-25 07:36:25',389,9,16,21,6,'0',25000,25000,1),(151,'1',1,'2021-05-25 07:36:25',390,9,16,21,6,'0',25000,25000,1),(152,'1',1,'2021-05-25 07:36:25',391,9,16,21,6,'0',25000,25000,1),(153,'1',12,'2021-05-25 07:36:25',417,9,10,21,6,'0',23520,1960,12),(154,'1',8,'2021-05-25 07:36:25',418,9,10,21,6,'0',42000,5250,8),(155,'1',8,'2021-05-25 07:36:25',419,9,10,21,6,'0',45920,5740,8),(156,'1',1,'2021-05-25 07:36:25',429,9,21,21,6,'0',3000,3000,1),(157,'1',18,'2021-05-25 07:36:25',430,9,13,21,6,'0',48830,2570,19),(158,'1',3,'2021-05-25 07:36:25',434,9,13,21,6,'0',7860,2620,3),(159,'1',11,'2021-05-25 07:36:25',435,9,13,21,6,'0',33220,3020,11),(160,'1',4,'2021-05-25 07:36:25',436,9,13,21,6,'0',6000,1500,4),(161,'1',2,'2021-05-25 07:36:25',438,9,13,21,6,'0',5640,2820,2),(162,'1',2,'2021-05-25 07:36:25',440,9,13,21,6,'0',3600,1800,2),(163,'1',2,'2021-05-25 07:36:25',442,9,13,21,6,'0',7400,3700,2),(164,'1',2,'2021-05-25 07:36:25',444,9,13,21,6,'0',5160,2580,2),(165,'1',5,'2021-05-25 07:36:25',447,9,13,21,6,'0',6500,1300,5),(166,'1',6,'2021-05-25 07:36:25',448,9,13,21,6,'0',31920,5320,6),(167,'1',2.84,'2021-05-25 07:36:25',451,9,37,21,6,'0',19500,6500,3),(168,'1',18.375,'2021-05-25 07:36:25',452,9,37,21,6,'0',126000,6000,21),(169,'1',29,'2021-05-25 07:36:25',453,9,37,21,6,'0',110200,3800,29),(170,'1',8.52,'2021-05-25 07:36:25',456,9,37,21,6,'0',16920,1692,10),(171,'1',1.775,'2021-05-25 07:36:25',458,9,37,21,6,'0',9720,1944,5),(172,'1',9.46,'2021-05-25 07:36:25',465,9,37,21,6,'0',35000,3500,10),(173,'1',1,'2021-05-25 07:36:25',470,9,37,21,6,'0',6667,6667,1),(174,'1',7,'2021-05-25 07:36:25',471,9,37,21,6,'0',17500,2500,7),(175,'1',20.5,'2021-05-25 07:36:25',474,9,37,21,6,'0',71750,3500,21),(176,'1',25,'2021-05-25 07:36:25',478,9,37,21,6,'0',62500,2500,25),(177,'1',22.175,'2021-05-25 07:36:25',480,9,37,21,6,'0',55550,2222,25),(178,'1',1,'2021-05-25 07:36:25',481,9,37,21,6,'0',1750,1750,1),(179,'1',61,'2021-05-25 07:36:25',483,9,37,21,6,'0',67771,1111,61),(180,'1',42,'2021-05-25 07:36:25',487,9,37,21,6,'0',49980,1190,42),(181,'1',16.5,'2021-05-25 07:36:25',488,9,37,21,6,'0',29700,1800,17),(182,'1',4,'2021-05-25 07:36:25',491,9,37,21,6,'0',13332,3333,4),(183,'1',2,'2021-05-25 07:36:25',497,9,37,21,6,'0',6000,3000,2),(184,'1',20.86,'2021-05-25 07:36:25',498,9,37,21,6,'0',44000,2000,22),(185,'1',6,'2021-05-25 07:36:25',501,9,37,21,6,'0',9600,1600,6),(186,'1',35,'2021-05-25 07:36:25',504,9,37,21,6,'0',57260,1636,35),(187,'1',26,'2021-05-25 07:36:25',507,9,37,21,6,'0',48724,1874,26),(188,'1',32,'2021-05-25 07:36:25',508,9,37,21,6,'0',136000,4250,32),(189,'1',56,'2021-05-25 07:36:25',509,9,37,21,6,'0',68712,1227,56),(190,'1',6,'2021-05-25 07:36:25',512,9,37,21,6,'0',16200,2700,6),(191,'1',12,'2021-05-25 07:36:25',513,9,37,21,6,'0',21600,1800,12),(192,'1',44,'2021-05-25 07:36:25',515,9,37,21,6,'0',84304,1916,44),(193,'1',11,'2021-05-25 07:36:25',516,9,37,21,6,'0',18700,1700,11),(194,'1',51,'2021-05-25 07:36:25',518,9,37,21,6,'0',94860,1860,51),(195,'1',78,'2021-05-25 07:36:25',523,9,37,21,6,'0',124800,1600,78),(196,'1',5,'2021-05-25 07:36:25',524,9,37,21,6,'0',12500,2500,5),(197,'1',21,'2021-05-25 07:36:25',525,9,37,21,6,'0',52500,2500,21),(198,'1',21.865,'2021-05-25 07:36:25',527,9,37,21,6,'0',48000,2000,24),(199,'1',10,'2021-05-25 07:36:25',529,9,37,21,6,'0',20000,2000,10),(200,'1',8,'2021-05-25 07:36:25',530,9,37,21,6,'0',19352,2419,8),(201,'1',2,'2021-05-25 07:36:25',531,9,37,21,6,'0',2000,1000,2),(202,'1',1.5,'2021-05-25 07:36:25',547,9,37,21,6,'0',15000,10000,2),(203,'1',2.5,'2021-05-25 07:36:25',548,9,37,21,6,'0',27500,11000,3),(204,'1',4,'2021-05-25 07:36:25',555,9,37,21,6,'0',5332,1333,4),(205,'1',0.5,'2021-05-25 07:36:25',558,9,37,21,6,'0',6250,12500,1),(206,'1',19,'2021-05-25 07:36:25',562,9,37,21,6,'0',76000,4000,19),(207,'1',12.6,'2021-05-25 07:36:25',563,9,37,21,6,'0',37800,3000,13),(208,'1',23.18,'2021-05-25 07:36:25',566,9,37,21,6,'0',42672,1778,24),(209,'1',12,'2021-05-25 07:36:25',567,9,37,21,6,'0',19800,2200,9),(210,'1',18,'2021-05-25 07:36:25',569,9,37,21,6,'0',45000,2500,18),(211,'1',25.5,'2021-05-25 07:36:25',570,9,37,21,6,'0',69054,2708,26),(212,'1',1.175,'2021-05-25 07:36:25',573,9,37,21,6,'0',19500,15000,1),(213,'1',21,'2021-05-25 07:36:25',575,9,37,21,6,'0',17493,833,21),(214,'1',0.9,'2021-05-25 07:36:25',577,9,37,21,6,'0',1620,1800,1),(215,'1',2,'2021-05-25 07:36:25',580,9,37,21,6,'0',2000,1000,2),(216,'1',0.45,'2021-05-25 07:36:25',581,9,37,21,6,'0',5850,13000,0),(217,'1',1,'2021-05-25 07:36:25',583,9,37,21,6,'0',40000,40000,1),(218,'1',1.9,'2021-05-25 07:36:25',585,9,37,21,6,'0',15200,8000,2),(219,'1',7,'2021-05-25 07:36:25',588,9,37,21,6,'0',4998,714,7),(220,'1',1,'2021-05-25 07:36:25',589,9,37,21,6,'0',1600,1600,1),(221,'1',8,'2021-05-25 07:36:25',592,9,37,21,6,'0',28568,3571,8),(222,'1',1.45,'2021-05-25 07:36:25',595,9,37,21,6,'0',37500,25000,2),(223,'1',9.8,'2021-05-25 07:36:25',597,9,37,21,6,'0',17640,1800,10),(224,'1',4.19,'2021-05-25 07:36:25',598,9,37,21,6,'0',20594.7,3269,6),(225,'1',18,'2021-05-25 07:36:25',600,9,37,21,6,'0',18000,1000,18),(226,'1',4,'2021-05-25 07:36:25',603,9,37,21,6,'0',8000,2000,4),(227,'1',18,'2021-05-25 07:36:25',606,9,37,21,6,'0',43200,2400,18),(228,'1',8,'2021-05-25 07:36:25',608,9,37,21,6,'0',25600,3200,8),(229,'1',8,'2021-05-25 07:36:25',609,9,37,21,6,'0',19200,2400,8),(230,'1',21,'2021-05-25 07:36:25',612,9,37,21,6,'0',10500,500,21),(231,'1',16,'2021-05-25 07:36:25',614,9,37,21,6,'0',8000,500,16),(232,'1',2.64,'2021-05-25 07:36:25',616,9,37,21,6,'0',9750,3250,3),(233,'1',60,'2021-05-25 07:36:25',618,9,37,21,6,'0',85980,1433,60),(234,'1',2,'2021-05-25 07:36:25',620,9,37,21,6,'0',6000,3000,2),(235,'1',4,'2021-05-25 07:36:25',621,9,37,21,6,'0',4000,1000,4),(236,'1',14,'2021-05-25 07:36:25',622,9,37,21,6,'0',30002,2143,14),(237,'1',0.15,'2021-05-25 07:36:25',623,9,37,21,6,'0',1500,10000,0),(238,'1',3,'2021-05-25 07:36:25',624,9,37,21,6,'0',6000,2000,3),(239,'1',12,'2021-05-25 07:36:25',625,9,37,21,6,'0',28800,2400,12),(240,'1',42,'2021-05-25 07:36:25',626,9,37,21,6,'0',31500,750,42),(241,'1',41.27,'2021-05-25 07:36:25',628,9,37,21,6,'0',84000,2000,42),(242,'1',12,'2021-05-25 07:36:25',629,9,37,21,6,'0',42000,3500,12),(243,'1',26.715,'2021-05-25 07:36:25',633,9,37,21,6,'0',50575,1750,29),(244,'1',9.5,'2021-05-25 07:36:25',634,9,37,21,6,'0',21109,2222,10),(245,'1',1.3,'2021-05-25 07:36:25',635,9,37,21,6,'0',0,0,1),(246,'1',18.185,'2021-05-25 07:36:25',637,9,37,21,6,'0',34200,1800,19),(247,'1',16.175,'2021-05-25 07:36:25',638,9,37,21,6,'0',34000,2000,17),(248,'1',2,'2021-05-25 07:36:25',639,9,22,21,6,'0',32186,16093,2),(249,'1',4,'2021-05-25 07:36:25',640,9,35,21,6,'0',35600,8900,4),(250,'1',1,'2021-05-25 07:36:25',642,9,24,21,6,'0',3667,3667,1),(251,'1',9,'2021-05-25 07:36:25',643,9,9,21,6,'0',33327,3703,9),(252,'1',16,'2021-05-25 07:36:25',644,9,9,21,6,'0',54816,3426,16),(253,'1',2,'2021-05-25 07:36:25',664,9,29,21,6,'0',11914,5957,2),(254,'1',2,'2021-05-25 07:36:25',665,9,9,21,6,'0',14830,7415,2),(255,'1',2,'2021-05-25 07:36:25',666,9,9,21,6,'0',6816,3408,2),(256,'1',2,'2021-05-25 07:36:25',667,9,9,21,6,'0',12556,6278,2),(257,'1',3,'2021-05-25 07:36:25',668,9,9,21,6,'0',8298,2766,3),(258,'1',1,'2021-05-25 07:36:25',673,9,9,21,6,'0',2759,2759,1),(259,'1',3,'2021-05-25 07:36:25',677,9,9,21,6,'0',25605,8535,3),(260,'1',2,'2021-05-25 07:36:25',679,9,9,21,6,'0',19310,9655,2),(261,'1',2,'2021-05-25 07:36:25',680,9,9,21,6,'0',6550,3275,2),(262,'1',14,'2021-05-25 07:36:25',685,9,28,21,6,'0',14000,1000,14),(263,'1',2,'2021-05-25 07:36:25',687,9,24,21,6,'0',5002,2501,2),(264,'1',1,'2021-05-25 07:36:25',691,9,9,21,6,'0',11197,11197,1),(265,'1',2,'2021-05-25 07:36:25',695,9,29,21,6,'0',11940,5970,2),(266,'1',2,'2021-05-25 07:36:25',698,9,29,21,6,'0',3800,1900,2),(267,'1',0,'2021-05-25 07:36:25',699,9,29,21,6,'0',1900,1900,1),(268,'1',1,'2021-05-25 07:36:25',708,9,11,21,6,'0',3200,3200,1),(269,'1',5,'2021-05-25 07:36:25',709,9,11,21,6,'0',11750,2350,5),(270,'1',2,'2021-05-25 07:36:25',710,9,11,21,6,'0',7700,3850,2),(271,'1',3,'2021-05-25 07:36:25',711,9,11,21,6,'0',16386,5462,3),(272,'1',2,'2021-05-25 07:36:25',712,9,11,21,6,'0',7700,3850,2),(273,'1',1,'2021-05-25 07:36:25',713,9,11,21,6,'0',2400,2400,1),(274,'1',4,'2021-05-25 07:36:25',714,9,11,21,6,'0',9400,2350,4),(275,'1',3,'2021-05-25 07:36:25',715,9,11,21,6,'0',8388,2796,3),(276,'1',6,'2021-05-25 07:36:25',716,9,11,21,6,'0',16776,2796,6),(277,'1',2,'2021-05-25 07:36:25',718,9,11,21,6,'0',9520,4760,2),(278,'1',3,'2021-05-25 07:36:25',720,9,11,21,6,'0',7068,2356,3),(279,'1',2,'2021-05-25 07:36:25',721,9,11,21,6,'0',9996,4998,2),(280,'1',3,'2021-05-25 07:36:25',722,9,11,21,6,'0',6510,2170,3),(281,'1',1,'2021-05-25 07:36:25',723,9,11,21,6,'0',3470,3470,1),(282,'1',3,'2021-05-25 07:36:25',724,9,11,21,6,'0',7068,2356,3),(283,'1',6,'2021-05-25 07:36:25',725,9,11,21,6,'0',14136,2356,6),(284,'1',2,'2021-05-25 07:36:25',726,9,11,21,6,'0',3960,1980,2),(285,'1',2,'2021-05-25 07:36:25',727,9,24,21,6,'0',6934,3467,2),(286,'1',2,'2021-05-25 07:36:25',734,9,9,21,6,'0',4482,2241,2),(287,'1',1,'2021-05-25 07:36:25',735,9,9,21,6,'0',4138,2069,2),(288,'1',3,'2021-05-25 07:36:25',736,9,9,21,6,'0',6723,2241,3),(289,'1',3,'2021-05-25 07:36:25',738,9,16,21,6,'0',45000,15000,3),(290,'1',2,'2021-05-25 07:36:25',739,9,16,21,6,'0',20000,10000,2),(291,'1',1,'2021-05-25 07:36:25',740,9,16,21,6,'0',10000,10000,1),(292,'1',2,'2021-05-25 07:36:25',741,9,16,21,6,'0',30000,15000,2),(293,'1',6,'2021-05-25 07:36:25',742,9,43,21,6,'0',15900,2650,6),(294,'1',5,'2021-05-25 07:36:25',743,9,43,21,6,'0',14750,2950,5),(295,'1',10,'2021-05-25 07:36:25',744,9,43,21,6,'0',23000,2300,10),(296,'1',8,'2021-05-25 07:36:25',745,9,43,21,6,'0',15200,1900,8),(297,'1',10,'2021-05-25 07:36:25',746,9,43,21,6,'0',17000,1700,10),(298,'1',7,'2021-05-25 07:36:25',747,9,43,21,6,'0',20300,2900,7),(299,'1',6,'2021-05-25 07:36:25',748,9,29,21,6,'0',4896,816,6),(300,'1',1,'2021-05-25 07:36:25',749,9,29,21,6,'0',1638,1638,1),(301,'1',5,'2021-05-25 07:36:25',750,9,29,21,6,'0',8190,1638,5),(302,'1',1,'2021-05-25 07:36:25',751,9,29,21,6,'0',1638,1638,1),(304,'1',5,'2021-05-25 07:36:25',754,9,29,21,6,'0',13500,2700,5),(305,'1',12,'2021-05-25 07:36:25',758,9,28,21,6,'0',10296,858,12),(306,'1',20,'2021-05-25 07:36:25',759,9,28,21,6,'0',22320,1116,20),(307,'1',2,'2021-05-25 07:36:25',760,9,28,21,6,'0',1040,520,2),(308,'1',5,'2021-05-25 07:36:25',761,9,28,21,6,'0',6250,1250,5),(309,'1',5,'2021-05-25 07:36:25',539,9,37,21,6,'0',15000,3000,5),(310,'1',10,'2021-05-25 07:36:25',540,9,37,21,6,'0',22000,2200,10),(311,'1',3,'2021-05-25 07:36:25',766,9,21,21,6,'0',7800,2600,3),(312,'1',1,'2021-05-25 07:36:25',767,9,40,21,6,'0',9000,9000,1),(313,'1',9,'2021-05-25 07:36:25',768,9,12,21,6,'0',9000,1000,9),(314,'1',9,'2021-05-25 07:36:25',769,9,12,21,6,'0',14994,1666,9),(315,'1',5,'2021-05-25 07:36:25',42,9,9,21,6,'0',9105,1821,5),(316,'1',2,'2021-05-25 07:36:25',787,9,9,21,6,'0',3642,1821,2),(317,'1',4,'2021-05-25 07:36:25',728,9,11,21,6,'0',9424,2356,4),(318,'1',1,'2021-05-25 07:36:25',717,9,11,21,6,'0',5319,5319,1),(319,'1',1,'2021-05-25 07:36:25',730,9,11,21,6,'0',2796,2796,1),(320,'1',1,'2021-05-25 07:36:25',731,9,11,21,6,'0',3647,3647,1),(321,'1',1,'2021-05-25 07:36:25',789,9,11,21,6,'0',3200,3200,1),(322,'1',3,'2021-05-25 07:36:25',135,9,19,21,6,'0',25500,8500,3),(323,'1',2,'2021-05-25 07:36:25',791,9,19,21,6,'0',17000,8500,2),(324,'1',2,'2021-05-25 07:36:25',312,9,40,21,6,'0',23000,11500,2),(325,'1',5,'2021-05-25 07:36:25',794,9,44,21,6,'0',32000,6400,5),(326,'1',16,'2021-05-25 07:36:25',795,9,44,21,6,'0',240000,15000,16),(327,'1',1,'2021-05-25 07:36:25',796,9,9,21,6,'0',10500,10500,1),(328,'1',1,'2021-05-25 07:36:25',670,9,9,21,6,'0',2766,2766,1),(329,'1',2,'2021-05-25 07:36:25',672,9,9,21,6,'0',5532,2766,2),(330,'1',1,'2021-05-25 07:36:25',690,9,9,21,6,'0',3275,3275,1),(331,'1',2,'2021-05-25 07:36:25',707,9,9,21,6,'0',6400,3200,2),(332,'1',1,'2021-05-25 07:36:25',373,9,16,21,6,'0',10000,10000,1),(333,'1',2,'2021-05-25 07:36:25',372,9,16,21,6,'0',16000,8000,2),(334,'1',1,'2021-05-25 07:36:25',383,9,16,21,6,'0',22000,22000,1),(335,'1',2,'2021-05-25 07:36:25',382,9,16,21,6,'0',36000,18000,2),(336,'1',1,'2021-05-25 07:36:25',788,9,25,21,6,'0',7500,7500,1),(337,'1',1,'2021-05-25 07:36:25',327,9,17,21,6,'0',22372,22372,1),(338,'1',1,'2021-05-25 07:36:25',328,9,17,21,6,'0',22372,22372,1),(339,'1',4,'2021-05-25 07:36:25',12,9,17,21,6,'0',30000,7500,4),(340,'1',4,'2021-05-25 07:36:25',797,9,18,21,6,'0',42000,10500,4),(341,'1',2,'2021-05-25 07:36:25',798,9,18,21,6,'0',47000,23500,2),(342,'1',1,'2021-05-25 07:36:25',785,9,18,21,6,'0',12000,12000,1),(343,'1',1,'2021-05-25 07:36:25',786,9,18,21,6,'0',18500,18500,1),(344,'1',13,'2021-05-25 07:36:25',519,9,37,21,6,'0',28600,2200,13),(345,'1',1,'2021-05-25 07:36:25',799,9,37,21,6,'0',3800,3800,1),(346,'1',18,'2021-05-25 07:36:25',511,9,37,21,6,'0',56988,3166,18),(347,'1',22,'2021-05-25 07:36:25',517,9,37,21,6,'0',38192,1736,22),(348,'1',17,'2021-05-25 07:36:25',510,9,37,21,6,'0',37332,2196,17),(349,'1',15,'2021-05-25 07:36:25',800,9,37,21,6,'0',42000,2800,15),(350,'1',12,'2021-05-25 07:36:25',522,9,37,21,6,'0',20400,1700,12),(351,'1',4,'2021-05-25 07:36:25',521,9,37,21,6,'0',7800,1950,4),(352,'1',1,'2021-05-25 07:36:25',801,9,37,21,6,'0',2500,2500,1),(353,'1',2,'2021-05-25 07:36:25',802,9,37,21,6,'0',5000,2500,2),(354,'1',3,'2021-05-25 07:36:25',803,9,37,21,6,'0',11400,3800,3),(355,'1',4,'2021-05-25 07:36:25',804,9,37,21,6,'0',10000,2500,4),(356,'1',1,'2021-05-25 07:36:25',805,9,37,21,6,'0',2500,2500,1),(357,'1',1,'2021-05-25 07:36:25',806,9,37,21,6,'0',5500,5500,1),(358,'1',3,'2021-05-25 07:36:25',315,9,21,21,6,'0',17622,5874,3),(359,'1',3,'2021-05-25 07:36:25',775,9,22,21,6,'0',14559,4853,3),(360,'1',6,'2021-05-25 07:36:25',774,9,22,21,6,'0',29118,4853,6),(361,'1',9,'2021-05-25 07:36:25',776,9,22,21,6,'0',40410,4490,9),(362,'1',5,'2021-05-25 07:36:25',772,9,21,21,6,'0',8500,1700,5),(363,'1',1,'2021-05-25 07:36:25',273,9,21,21,6,'0',4120,4120,1),(364,'1',2,'2021-05-25 07:36:25',275,9,21,21,6,'0',12400,6200,2),(365,'1',5,'2021-05-25 07:36:25',771,9,21,21,6,'0',14000,2800,5),(366,'1',4,'2021-05-25 07:36:25',770,9,21,21,6,'0',3200,800,4),(367,'1',2,'2021-05-25 07:36:25',234,9,22,21,6,'0',3734,1867,2),(368,'1',13,'2021-05-25 07:36:25',756,9,29,21,6,'0',36530,2810,13),(369,'1',10,'2021-05-25 07:36:25',647,9,29,21,6,'0',27700,2770,10),(370,'1',25,'2021-05-25 07:36:25',646,9,9,21,6,'0',72925,2917,25),(371,'1',6,'2021-05-25 07:36:25',645,9,9,21,6,'0',19092,3182,6),(372,'1',0.29,'2021-05-25 07:36:25',627,9,37,21,6,'0',2030,7000,0),(373,'1',8,'2021-05-25 07:36:25',230,9,37,21,6,'0',29336,3667,8),(374,'1',5,'2021-05-25 07:36:25',632,9,37,21,6,'0',12500,2500,5),(375,'1',5,'2021-05-25 07:36:25',582,9,37,21,6,'0',80000,16000,5),(376,'1',1,'2021-05-25 07:36:25',684,9,37,21,6,'0',5000,5000,1),(377,'1',3,'2021-05-25 07:36:25',586,9,37,21,6,'0',7500,2500,3),(378,'1',1.6,'2021-05-25 07:36:25',591,9,37,21,6,'0',6400,4000,2),(379,'1',2,'2021-05-25 07:36:25',449,9,37,21,6,'0',2250,1125,2),(380,'1',2,'2021-05-25 07:36:25',764,9,37,21,6,'0',2666,1333,2),(381,'1',11,'2021-05-25 07:36:25',808,9,37,21,6,'0',11000,1000,11),(382,'1',0.3,'2021-05-25 07:36:25',594,9,37,21,6,'0',1200,4000,0),(383,'1',2,'2021-05-25 07:36:25',467,9,37,21,6,'0',10000,5000,2),(384,'1',2,'2021-05-25 07:36:25',472,9,37,21,6,'0',6248,3124,2),(385,'1',29,'2021-05-25 07:36:25',495,9,37,21,6,'0',59073,2037,29),(386,'1',10.5,'2021-05-25 07:36:25',461,9,37,21,6,'0',16800,1600,11),(387,'1',1.1,'2021-05-25 07:36:25',473,9,37,21,6,'0',4400,4000,1),(388,'1',12.2,'2021-05-25 07:36:25',475,9,37,21,6,'0',48800,4000,12),(389,'1',2,'2021-05-25 07:36:25',506,9,37,21,6,'0',14286,7143,2),(390,'1',6.845,'2021-05-25 07:36:25',457,9,37,21,6,'0',15078,2154,7),(391,'1',15,'2021-05-25 07:36:25',484,9,37,21,6,'0',16185,1079,15),(392,'1',6.645,'2021-05-25 07:36:25',476,9,37,21,6,'0',20000,2500,8),(393,'1',19.18,'2021-05-25 07:36:25',477,9,37,21,6,'0',45840,2292,20),(394,'1',7.2,'2021-05-25 07:36:25',536,9,37,21,6,'0',45597.6,6333,7),(395,'1',3,'2021-05-25 07:36:25',533,9,37,21,6,'0',4500,1500,3),(396,'1',7.8,'2021-05-25 07:36:25',534,9,37,21,6,'0',52002.6,6667,8),(397,'1',13.4,'2021-05-25 07:36:25',584,9,37,21,6,'0',52648.6,3929,13),(398,'1',2,'2021-05-25 07:36:25',611,9,37,21,6,'0',4000,2000,2),(399,'1',2.815,'2021-05-25 07:36:25',557,9,37,21,6,'0',9000,3000,3),(400,'1',7.8,'2021-05-25 07:36:25',578,9,37,21,6,'0',11700,1500,8),(401,'1',49.98,'2021-05-25 07:36:25',636,9,37,21,6,'0',81600,1600,51),(402,'1',1.5,'2021-05-25 07:36:25',123,9,35,21,6,'0',28560,19040,2),(403,'1',2.7,'2021-05-25 07:36:25',126,9,35,21,6,'0',35100,13000,3),(404,'1',6,'2021-05-25 07:36:25',692,9,29,21,6,'0',7200,1200,6),(405,'1',2,'2021-05-25 07:36:25',703,9,29,21,6,'0',4616,2308,2),(406,'1',3,'2021-05-25 07:36:25',309,9,29,21,6,'0',16773,5591,3),(407,'1',5,'2021-05-25 07:36:25',304,9,29,21,6,'0',20245,4049,5),(408,'1',2,'2021-05-25 07:36:25',398,9,41,21,6,'0',15882,7941,2),(409,'1',1,'2021-05-25 07:36:25',395,9,41,21,6,'0',7941,7941,1),(410,'1',2,'2021-05-25 07:36:25',397,9,41,21,6,'0',15882,7941,2),(411,'1',3,'2021-05-25 07:36:25',392,9,41,21,6,'0',23823,7941,3),(412,'1',3,'2021-05-25 07:36:25',399,9,41,21,6,'0',23823,7941,3),(413,'1',4,'2021-05-25 07:36:25',682,9,28,21,6,'0',4132,1033,4),(414,'1',2,'2021-05-25 07:36:25',30,9,28,21,6,'0',10900,5450,2),(415,'1',15,'2021-05-25 07:36:25',650,9,29,21,6,'0',49500,3300,15),(416,'1',1,'2021-05-25 07:36:25',648,9,29,21,6,'0',3300,3300,1),(417,'1',1,'2021-05-25 07:36:25',78,9,28,21,6,'0',1833,1833,1),(418,'1',1,'2021-05-25 07:36:25',77,9,28,21,6,'0',1666,1666,1),(419,'1',9,'2021-05-25 07:36:25',781,9,22,21,6,'0',88200,9800,9),(420,'1',8,'2021-05-25 07:36:25',782,9,22,21,6,'0',78400,9800,8),(421,'1',2,'2021-05-25 07:36:25',262,9,24,21,6,'0',6500,3250,2),(422,'1',3,'2021-05-25 07:36:25',263,9,24,21,6,'0',10245,3415,3),(423,'1',3,'2021-05-25 07:36:25',81,9,25,21,6,'0',77760,25920,3),(424,'1',2,'2021-05-25 07:36:25',810,9,25,21,6,'0',125564,62782,2),(425,'1',1,'2021-05-25 07:36:25',811,9,25,21,6,'0',62155,62155,1),(426,'1',1,'2021-05-25 07:36:25',812,9,25,21,6,'0',44036,44036,1),(427,'1',1,'2021-05-25 07:36:25',813,9,21,21,6,'0',5874,5874,1),(428,'1',1,'2021-05-25 07:36:25',814,9,21,21,6,'0',5874,5874,1),(429,'1',5,'2021-05-25 07:36:25',816,9,9,21,6,'0',9105,1821,5),(430,'1',5,'2021-05-25 07:36:25',817,9,9,21,6,'0',14500,2900,5),(431,'1',1,'2021-05-25 07:36:25',149,9,15,21,6,'0',3900,3900,1),(432,'1',2,'2021-05-25 07:36:25',157,9,15,21,6,'0',9758,4879,2),(433,'1',1,'2021-05-25 07:36:25',166,9,15,21,6,'0',7973,7973,1),(434,'1',1,'2021-05-25 07:36:25',689,9,15,21,6,'0',4641,4641,1),(435,'1',1,'2021-05-25 07:36:25',167,9,15,21,6,'0',4879,4879,1),(436,'1',18,'2021-05-25 07:36:25',494,9,37,21,6,'0',46800,2600,18),(437,'1',32,'2021-05-25 07:36:25',601,9,37,21,6,'0',22400,700,32),(438,'1',1,'2021-05-25 07:36:25',409,9,21,21,6,'0',3998,3998,1),(439,'1',2,'2021-05-25 07:36:25',818,9,21,21,6,'0',6502,3251,2),(440,'1',2,'2021-05-25 07:36:25',224,9,21,21,6,'0',7924,3962,2),(441,'1',1,'2021-05-25 07:36:25',156,9,15,21,6,'0',4760,4760,1),(442,'1',11,'2021-05-25 07:36:25',653,9,30,21,6,'0',100265,9115,11),(443,'1',8,'2021-05-25 07:36:25',654,9,30,21,6,'0',72920,9115,8),(444,'1',7,'2021-05-25 07:36:25',660,9,30,21,6,'0',63805,9115,7),(445,'1',1,'2021-05-25 07:36:25',655,9,30,21,6,'0',9115,9115,1),(446,'1',4,'2021-05-25 07:36:25',659,9,30,21,6,'0',36460,9115,4),(447,'1',1,'2021-05-25 07:36:25',658,9,30,21,6,'0',9115,9115,1),(448,'1',1,'2021-05-25 07:36:25',652,9,30,21,6,'0',9115,9115,1),(449,'1',1,'2021-05-25 07:36:25',656,9,30,21,6,'0',9115,9115,1),(450,'1',2,'2021-05-25 07:36:25',657,9,30,21,6,'0',18230,9115,2),(451,'1',4,'2021-05-25 07:36:25',775,9,22,21,6,'0',19412,4853,4),(452,'1',4,'2021-05-25 07:36:25',265,9,22,21,6,'0',19412,4853,4),(453,'1',4,'2021-05-25 07:36:25',820,9,22,21,6,'0',19200,4800,4),(454,'1',2,'2021-05-25 07:36:25',778,9,21,21,6,'0',8174,4087,2),(455,'1',18,'2021-05-25 07:36:25',651,9,9,21,6,'0',57276,3182,18),(456,'1',4,'2021-05-25 07:36:25',822,9,9,21,6,'0',12728,3182,4),(457,'1',4,'2021-05-25 07:36:25',305,9,9,21,6,'0',8968,2242,4),(458,'1',21,'2021-05-25 07:36:25',649,9,29,21,6,'0',69300,3300,21),(459,'1',4,'2021-05-25 07:36:25',823,9,9,21,6,'0',16800,4200,4),(460,'1',1,'2021-05-25 07:36:25',824,9,9,21,6,'0',700,700,1),(461,'1',1,'2021-05-25 07:36:25',825,9,9,21,6,'0',700,700,1),(462,'1',1,'2021-05-25 07:36:25',826,9,29,21,6,'0',2700,2700,1),(463,'1',2,'2021-05-25 07:36:25',827,9,29,21,6,'0',7000,3500,2),(464,'1',2,'2021-05-25 07:36:25',113,9,29,21,6,'0',6300,3150,2),(465,'1',2,'2021-05-25 07:36:25',173,9,29,21,6,'0',5800,2900,2),(466,'1',2,'2021-05-25 07:36:25',828,9,29,21,6,'0',9800,4900,2),(467,'1',2,'2021-05-25 07:36:25',829,9,29,21,6,'0',13000,6500,2),(468,'1',3,'2021-05-25 07:36:25',830,9,9,21,6,'0',4500,1500,3),(469,'1',1,'2021-05-25 07:36:25',831,9,9,21,6,'0',1500,1500,1),(470,'1',3,'2021-05-25 07:40:49',753,9,34,21,6,'0',24900,24900,3),(472,'1',9,'2021-05-25 09:48:14',833,9,37,11,6,'01',18000,18000,9),(473,'1',10,'2021-05-25 10:15:38',469,9,13,21,6,'1',56250,56250,10),(474,'1',3,'2021-05-25 10:16:55',627,9,13,21,6,'2',21000,21000,3),(475,'1',10,'2021-05-25 10:18:21',451,9,13,21,6,'2',65000,65000,10),(476,'1',16,'2021-05-25 10:18:55',458,9,13,21,6,'2',31104,31104,16),(477,'1',10,'2021-05-25 10:45:25',616,9,13,21,6,'2',32500,32500,10);
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
-- Dumping events for database 'control3_cosechafresca2'
--

--
-- Dumping routines for database 'control3_cosechafresca2'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-25 18:36:20
