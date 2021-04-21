-- MariaDB dump 10.17  Distrib 10.4.8-MariaDB, for Win64 (AMD64)
--
-- Host: controler.com.co    Database: control3_cosechafresca2
-- ------------------------------------------------------
-- Server version	5.7.33-log

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
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caja`
--

LOCK TABLES `caja` WRITE;
/*!40000 ALTER TABLE `caja` DISABLE KEYS */;
INSERT INTO `caja` VALUES (1,1,0,0,0,0,12,'2020-11-28 23:40:38',0,0,1,1),(2,10000,0,0,0,0,12,'2020-11-29 20:17:11',0,0,1,1),(3,300000,21000,0,0,0,2,'2021-01-07 21:52:40',0,0,9,1),(4,150000,0,0,0,0,1,'2021-03-04 22:20:06',0,0,9,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cargo_modulo`
--

LOCK TABLES `cargo_modulo` WRITE;
/*!40000 ALTER TABLE `cargo_modulo` DISABLE KEYS */;
INSERT INTO `cargo_modulo` VALUES (1,25,1),(4,26,1),(8,1,1),(9,1,2),(10,1,3),(12,1,5),(14,1,7),(15,1,8),(17,1,4),(18,1,9),(22,33,7),(23,33,3),(24,34,7),(25,34,4);
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (63,'Cliente normal','Ninguna','---','0000','normal@gmail.com','123','',0,1,1,'2021-02-14',1),(64,'Liseth Juliana Pérez ','-','carrera 9#1A-23 sur','3224511875','-','1057607465','',0,1,1,'2021-02-18',1),(65,'Cliente prueba','-','-','3124769857','-','12','-',0,1,1,'2021-03-04',9),(66,'Juan ','-','-','-','-','333','-',0,2,1,'2021-03-05',9),(67,'holman','-','-','-','-','444','-',0,3,1,'2021-03-05',9),(68,'carlos','-','-','-','-','555','-',0,4,1,'2021-03-05',9),(69,'Carlos Camargo','-','-','-','-','88','-',0,1,1,'2021-03-10',9);
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
) ENGINE=InnoDB AUTO_INCREMENT=434 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_factura`
--

LOCK TABLES `detalle_factura` WRITE;
/*!40000 ALTER TABLE `detalle_factura` DISABLE KEYS */;
INSERT INTO `detalle_factura` VALUES (399,1,19200,0,19,22848,268,37,7,1,'2021-02-15',9,'NULL'),(400,3,19200,0,19,68544,269,37,7,1,'2021-02-15',9,'NULL'),(401,2,3600,0,0,7200,270,50,7,5,'2021-03-05',9,'Producto anterior: ACEITE DE OLIVA TEMPRANO , cantidad: 1 , precio de venta: 0 , descuento: 0 , impuesto: 19 y un total de: 0'),(402,1,0,0,19,0,271,37,7,1,'2021-03-04',9,'NULL'),(403,1,0,0,19,0,272,37,7,1,'2021-03-04',9,'NULL'),(404,1,3600,0,0,3600,273,50,7,5,'2021-03-04',9,'NULL'),(405,1,3600,0,0,3600,274,50,7,2,'2021-03-06',9,'NULL'),(406,1,3600,0,19,4284,274,50,7,2,'2021-03-06',9,'NULL'),(407,1,3600,0,5,3780,274,50,7,2,'2021-03-06',9,'NULL'),(408,1,3600,0,0,3600,274,50,7,2,'2021-03-06',9,'NULL'),(409,1,3600,0,19,4284,274,50,7,2,'2021-03-06',9,'NULL'),(410,1,3600,0,5,3780,274,50,7,2,'2021-03-06',9,'NULL'),(411,1,3400,0,19,4046,276,37,7,1,'2021-03-06',9,'NULL'),(412,1,3600,0,5,3780,276,50,7,2,'2021-03-06',9,'NULL'),(413,1,3600,0,0,3600,277,50,7,5,'2021-03-06',9,'NULL'),(414,1,0,0,5,0,277,46,7,2,'2021-03-06',9,'NULL'),(415,1,3400,0,19,4046,277,37,7,1,'2021-03-06',9,'NULL'),(416,1,2500,0,5,2625,278,46,7,2,'2021-03-06',9,'NULL'),(417,1,3600,0,0,3600,278,50,7,5,'2021-03-06',9,'NULL'),(418,1,3400,0,19,4046,278,37,7,1,'2021-03-06',9,'NULL'),(419,1,3600,0,0,3600,275,50,7,5,'2021-03-06',9,'NULL'),(420,1,2500,0,5,2625,275,46,7,2,'2021-03-06',9,'NULL'),(421,1,4000,0,19,4760,275,37,7,1,'2021-03-06',9,'NULL'),(422,2,4700,10,19,10067,276,46,1,1,'2021-03-06',9,'NULL'),(423,8,0,0,19,0,276,37,7,1,'2021-03-06',9,'NULL'),(424,2,4700,10,19,10067,277,46,1,1,'2021-03-06',9,'NULL'),(425,8,0,0,19,0,277,46,7,1,'2021-03-06',9,'NULL'),(426,2,4700,10,19,10067,279,46,1,1,'2021-03-06',9,'NULL'),(427,1,3600,0,0,3600,279,50,7,5,'2021-03-06',9,'NULL'),(428,0.06,3120,0,0,187,283,53,7,5,'2021-03-10',9,'NULL'),(429,0.06,3120,0,0,187,284,53,7,5,'2021-03-10',9,'NULL'),(430,1,3600,0,0,3600,284,50,7,5,'2021-03-10',9,'NULL'),(431,0.27,3120,0,0,842,285,53,7,5,'2021-03-10',9,'NULL'),(432,1,3600,0,0,3600,285,50,7,5,'2021-03-10',9,'NULL'),(433,1,4700,10,19,5034,285,46,1,1,'2021-03-10',9,'NULL');
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
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleado`
--

LOCK TABLES `empleado` WRITE;
/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;
INSERT INTO `empleado` VALUES (1,'juan','juangomez3701@gmail.com','321','calle 12','31289362','3123',1,1,1,'2020-09-13'),(7,'Holman2','holman.rincon@uptc.edu.co','123213121','calle 12','3120930','1238908123',1,1,1241,'2021-02-01'),(9,'Juliana Pérez','liseth.perez@uptc.edu.co','312890','---','23','0',1,1,1244,'0000-00-00'),(11,'carlos camargo','contacto@controler.com.co','0000000','----','0','0',1,1,1246,'2021-01-24'),(18,'Pedro López','p.lopez@cosechafresca.com','456','Calle 13','34435546','55645657665',33,1,1253,'0000-00-00'),(19,'NOHORA VILLA','nohora1843@gmail.com','123456','Cra 5 #71-45','3178931158','52472731',1,1,1255,'0000-00-00'),(20,'Dalila Villafañe','dalila298@yahoo.es','2','calle  5 N 71 45 local 103 ','3143323923','52192465',2,1,1256,'2021-02-16'),(21,'Andrea Aguirre','maye.280497@gmail.com','000','---','000','000',1,9,1257,'0000-00-00');
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
) ENGINE=MyISAM AUTO_INCREMENT=286 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factura`
--

LOCK TABLES `factura` WRITE;
/*!40000 ALTER TABLE `factura` DISABLE KEYS */;
INSERT INTO `factura` VALUES (269,0,68544,1,'2021-02-15 20:08:52',1,1,9,0,63,1,1,'NULL','NULL'),(268,0,22848,1,'2021-02-15 19:52:23',1,1,9,0,63,1,0,'NULL','NULL'),(270,0,7200,1,'2021-03-05 03:40:16',1,1,9,0,63,1,0,'NULL','NULL'),(271,2346,0,1,'2021-03-04 22:06:16',1,1,9,0,63,1,1,'NULL','AplicaciÃ³n'),(272,0,0,1,'2021-03-04 22:07:36',1,1,9,11,63,1,0,'1000','NULL'),(273,0,3600,1,'2021-03-04 22:16:56',0,1,9,1,63,1,0,'NULL','NULL'),(274,0,11664,3,'2021-03-06 10:18:41',1,1,9,0,63,1,0,'NULL','NULL'),(276,0,10067,2,'2021-03-06 13:22:40',1,1,9,0,63,1,0,'NULL','NULL'),(277,0,10067,2,'2021-03-06 13:22:42',1,1,9,0,63,1,0,'NULL','NULL'),(278,0,10271,3,'2021-03-06 10:39:49',1,1,9,0,63,1,0,'NULL','NULL'),(275,0,10985,3,'2021-03-06 10:44:28',1,1,9,0,63,1,0,'NULL','NULL'),(279,0,13667,2,'2021-03-06 16:56:35',1,2,9,0,63,1,0,'9087','NULL'),(283,0,187,1,'2021-03-10 18:55:41',1,1,9,0,63,1,0,'NULL','NULL'),(284,0,3787,2,'2021-03-10 18:59:47',1,1,9,0,63,1,0,'NULL','NULL'),(285,0,9476,3,'2021-03-10 19:39:30',0,5,9,0,69,1,0,'NULL','NULL');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nota_credito`
--

LOCK TABLES `nota_credito` WRITE;
/*!40000 ALTER TABLE `nota_credito` DISABLE KEYS */;
INSERT INTO `nota_credito` VALUES (1,'2021-02-18 00:39:56',269,9,1),(2,'2021-03-04 22:10:37',271,9,1);
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
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor`
--

LOCK TABLES `proveedor` WRITE;
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
INSERT INTO `proveedor` VALUES (1,'aaa','Empresa JP','Carrera 23','132312123','emp@gmail.com','1','0',0,'2020-10-30',7,1),(3,'Empresa Carlos','Carlos Diaz','Calle 23 #45','132312123','dan@gmail.com','123321','222',2,'2020-11-01',7,1),(7,'Alpina','Pilar Perez','Calle 67 ','342345534','p.p@alpina.com','12312321312','343243434',2,'2021-02-12',11,1),(8,'Proveedor 1','Proveedor 1','---','0000','proveedor1@gmail.com','0000','',0,'2021-03-03',1,1),(9,'DISAY DISTRIBUCIONES SA','DIEGO','CALLEMMM','3115868574','JJKHJJK@GMAIL.COM','000000','',0,'2021-03-04',21,9);
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
  PRIMARY KEY (`id_stock`),
  KEY `stock_producto_fk` (`producto_id_producto`),
  KEY `stock_proveedor_fk` (`proveedor_id_proveedor`),
  KEY `stock_sede_fk` (`sede_id_sede`)
) ENGINE=MyISAM AUTO_INCREMENT=58 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock`
--

LOCK TABLES `stock` WRITE;
/*!40000 ALTER TABLE `stock` DISABLE KEYS */;
INSERT INTO `stock` VALUES (37,'1',0,'2021-03-04 09:09:43',1003,1,3,7,6,'123',200),(49,'1',10,'2021-03-04 09:23:54',1011,9,3,21,6,'4545',30000),(50,'1',5829,'2021-03-04 09:28:01',2630,1,3,21,6,'123',54545),(51,'1',10,'2021-03-06 10:52:37',1563,9,7,21,6,'121312',25000),(47,'1',2,'2021-03-04 09:04:21',1001,9,7,7,6,'123',25440),(46,'1',3,'2021-03-09 23:41:12',2637,1,3,1,6,'123',4500),(45,'1',23,'2021-03-04 08:32:54',1002,9,3,21,6,'0000',0),(52,'1',10,'2021-03-06 10:54:32',1348,9,9,21,6,'NA',30000),(53,'1',9.61,'2021-03-06 12:26:45',1820,1,3,1,6,'NA',45000),(54,'1',25,'2021-03-06 20:42:48',2637,9,7,11,6,'4325435',87500),(55,'1',3,'2021-03-09 23:39:13',2637,9,3,1,6,'0',10500),(56,'0',13,'2021-03-10 18:34:44',1023,1,1,1,6,'123',23000),(57,'1',100,'2021-03-10 18:33:23',1024,1,1,1,2,'123',2000);
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
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_cargo`
--

LOCK TABLES `tipo_cargo` WRITE;
/*!40000 ALTER TABLE `tipo_cargo` DISABLE KEYS */;
INSERT INTO `tipo_cargo` VALUES (1,'Gerente','gerencia','2020-03-23',1),(2,'cajero','caja','2020-03-23',9),(3,'Vendedor','vendedor','2019-10-24',1),(26,'Subgerente','-----','2020-10-18',1),(33,'Parametrización','Parametrización','2021-02-12',11),(34,'Patinador','--','2021-03-05',11);
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

-- Dump completed on 2021-03-10 19:46:22
