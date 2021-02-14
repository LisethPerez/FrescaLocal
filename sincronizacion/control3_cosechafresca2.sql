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
-- Dumping routines for database 'control3_cosechafresca2'
--

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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cargo_modulo`
--

LOCK TABLES `cargo_modulo` WRITE;
/*!40000 ALTER TABLE `cargo_modulo` DISABLE KEYS */;
INSERT INTO `cargo_modulo` VALUES (1,25,1),(4,26,1),(8,1,1),(9,1,2),(10,1,3),(12,1,5),(14,1,7),(15,1,8),(17,1,4),(18,1,9),(20,29,5),(21,29,4),(22,33,7),(23,33,3);
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
INSERT INTO `categoria_cliente` VALUES (1,'Corriente','Precio 1','Cliente general.',14,'2021-02-11',1),(2,'Institucional','Precio 2','Varias instituciones',7,'2020-10-28',1),(3,'Otro 3','Precio 3','--',7,'2020-10-28',1),(4,'Otro 4','Precio 4','--',7,'2020-10-28',1);
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria_producto_trans`
--

LOCK TABLES `categoria_producto_trans` WRITE;
/*!40000 ALTER TABLE `categoria_producto_trans` DISABLE KEYS */;
INSERT INTO `categoria_producto_trans` VALUES (1,'Malla','---','2020-11-17',1,1),(2,'Bandeja','--','2020-11-17',1,1),(6,'Sin transformar','--','2020-11-17',1,1);
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
  `documento` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `nit` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (8,'eo','e','e','1','e@gmail.com','1223','0',0,1,3,'2020-10-17',2),(9,'carlos ramirez','CR','calle 56','312231','car@gmail.com','123456789','0',1,2,1,'2020-10-14',1),(10,'Andrea López','Empresa G','Carrera 27','31312132','and@gmail.com','1233444555','0',0,2,1,'2020-10-15',1),(12,'Ricardo Sánchez','Mercados H','Carrera 14 ','2147483647','ricar@gmail.com','555888988','0',7,2,1,'2020-10-17',1),(13,'Jhon Suárez','JSo','Carrera 19 ','317899872','js@gmail.com','126789992','0',2,2,1,'2020-10-18',1),(14,'Juan sanchéz','Empresa JP','Carrera 23','132312123','juannn@gmail.com','111111111','0',2,2,3,'2020-10-18',2),(18,'k','k','k','1','k@hotmail.com','1743','0',0,1,3,'2020-10-18',10),(21,'camilo perez','12','12','12','cap12@gmail.com','12222','1222',1,1,1,'2020-10-25',7),(22,'Juliana Pérez','Mercados A','Carrera 12-8','2147483647','julianaperez@gmail.com','2147483647','123456789',9,2,1,'2020-10-25',1),(23,'Camilo Rodríguez','Mercados C','Carrera 54','2147483647','camilo54@gmail.com','1234567123','0',0,2,1,'2020-10-29',7),(24,'r','ffffs','r','44353','rrrr@gmail.com','123132','1230000',4,1,1,'2020-10-30',7),(27,'Pedro Antonio','UPTC','Carrera 9 #1A-23 sur','3112733685','Pepito@uptc.edu.co','1057607465','1',1,1,1,'2020-11-12',1),(54,'Pedro Pinto','-','-','0','-','985673','0',0,1,1,'2021-01-31',9),(55,'Carlos Montañez','-','-','0','-','85796','0',0,1,1,'2021-01-31',9),(56,'Violeta Montañez','-','-','0','-','9589','0',0,1,1,'2021-02-02',9),(57,'Juana Valentina ','-','-','0','-','12578','0',0,1,1,'2021-02-02',9),(58,'carlos camargo','La canasta','-','3124569','-','9576834','0',0,1,1,'2021-02-02',11),(59,'Andres Fonseca Castro','-','-','0','-','2357','0',0,1,1,'2021-02-04',9),(60,'Juan Jose Pinto','-','-','0','-','682058','0',0,1,1,'2021-02-07',9),(61,'Federico Ramos','Lagos SA','carrera 78','67363','fede.ramos@gmail.com','14680','59492',5,1,1,'2021-02-07',9);
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleado`
--

LOCK TABLES `empleado` WRITE;
/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;
INSERT INTO `empleado` VALUES (1,'juan','juangomez3701@gmail.com','321','calle 12','31289362','3123',1,1,1,'2020-09-13'),(2,'holman ','holman@gmail.com','1','calle 12','1234','3123',1,1,10,'2020-12-12'),(3,'juliana','juliana@gmail.com','9876567','calle 12','312782681','1057612893',1,1,1237,'2020-10-18'),(4,'carlos','carlos@gmail.com','98012387','calle 12','98378124','12931239',1,1,1238,'2020-10-18'),(5,'Andres','andres@gmail.com','201562537','calle 12 no 12','2147483647','2147483647',1,1,1239,'2020-10-18'),(6,'Holman rincon','holman123@gmail.com','20188029','calle 12','12313213','23132',1,1,1240,'2020-10-24'),(7,'Holman2','holman.rincon@uptc.edu.co','123213121','calle 12','3120930','1238908123',1,1,1241,'2021-02-01'),(8,'prueba120','qweyqiwoe@gmail.com','2019231j1','calle 12 -12','2147483647','1389012093',1,1,1243,'2021-02-01'),(9,'Juliana Pérez','liseth.perez@uptc.edu.co','312890','---','23','-2',1,1,1244,'2020-11-06'),(10,'prueba','prueba123@gmail.com','201611889','---','2','2',1,1,1245,'2021-02-01'),(11,'carlos camargo','contacto@controler.com.co','0000000','----','0','0',1,1,1246,'2021-01-24'),(12,'USUARIO DE PRUEBA','holmanrincon7@gmail.com','123','Carrera 16','1111111111','11111',29,1,1247,'2021-02-01'),(13,'USUARIO PRUEBA 2','holmanrincon17@gmail.com','12333','999999','2147483647','9999999',29,1,1248,'2021-02-01'),(14,'Hugo','hugo@gmail.com','789','Carrera 5','888','8565566',1,1,1249,'0000-00-00'),(16,'juli','juli@gmail.com','00000001','calle 12','3126737823','1067895674',1,1,1251,'2021-02-11'),(17,'prueba 3','prueba3@gmail.com','000001','----','31231','1321100',1,1,1252,'2021-02-11'),(18,'Pedro López','p.lopez@cosechafresca.com','456','Calle 13','34435546','55645657665',33,1,1253,'0000-00-00');
/*!40000 ALTER TABLE `empleado` ENABLE KEYS */;
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
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_stock`
--

LOCK TABLES `m_stock` WRITE;
/*!40000 ALTER TABLE `m_stock` DISABLE KEYS */;
INSERT INTO `m_stock` VALUES (1,'2020-12-13 13:09:40',1,1,1,1,1,0,0),(4,'2020-12-13 21:00:11',12,1,9,1,1,0,0),(3,'2020-12-13 19:35:34',12,1,4,1,1,0,0),(5,'2020-12-19 20:03:46',3,1,1,2,1,4,0),(6,'2020-12-19 20:41:06',21,1,1,2,1,1.5,0),(7,'2020-12-20 20:10:23',3,1,9,1,1,20,0),(8,'2020-12-23 09:01:44',9,1,1,1,1,10.5,0),(9,'2020-12-23 09:03:07',9,1,2,1,1,10.5,0),(10,'2020-12-23 09:04:24',26,1,1,2,1,5,0),(11,'2020-12-27 18:01:05',28,2,9,1,1,2,20000),(12,'2020-12-27 16:59:47',28,2,4,1,1,3,30000),(13,'2020-12-26 15:14:00',26,2,4,1,1,3.6,0),(14,'2020-12-27 20:12:02',29,1,1,2,1,1.5,15000),(16,'2021-01-06 10:17:11',28,4,10,1,1,0.6,6000),(17,'2021-01-06 10:21:45',31,10,4,1,1,0.6,6000),(18,'2021-01-10 20:38:53',26,2,10,1,1,0.6,6000);
/*!40000 ALTER TABLE `m_stock` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sede`
--

LOCK TABLES `sede` WRITE;
/*!40000 ALTER TABLE `sede` DISABLE KEYS */;
INSERT INTO `sede` VALUES (1,'Calle 72','Sogamoso','sede principal','calle 12',0,'2020-09-13',1),(2,'Paraiso','Duitama','Central','calle 15',0,'2020-09-13',1),(3,'Centro ara','Duitama','ara','calle 12',0,'2020-09-13',1),(4,'Magdalena paraiso','Sogamoso','5','calle 12',0,'2020-09-13',1),(5,'Duitama Centro','Duitama','--','calle 12',2020,'2020-10-11',1),(9,'Calle 109','Bogotá','--','--',12,'2020-12-10',1),(10,'Calle 72','Bogotá','--','--',0,'2020-12-10',1);
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
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock`
--

LOCK TABLES `stock` WRITE;
/*!40000 ALTER TABLE `stock` DISABLE KEYS */;
INSERT INTO `stock` VALUES (1,'1',0,'2020-11-09 00:00:00',1,1,1,1,1,'0',20000),(2,'1',4.95,'2020-12-26 13:08:53',25,1,1,1,1,'0',10500),(3,'1',13,'2020-11-15 00:00:00',10,1,1,9,1,'0',0),(4,'1',3,'2020-11-15 00:00:00',9,1,3,1,2,'0',0),(6,'1',0,'2020-11-15 19:45:29',1,1,1,1,1,'0',0),(9,'1',0,'2020-11-24 00:00:00',12,1,1,9,1,'0',0),(8,'1',1,'2020-11-15 20:22:55',12,1,1,7,1,'0',0),(10,'1',6,'2020-12-06 21:29:06',17,1,1,1,1,'0',0),(11,'1',36,'2020-12-05 11:27:32',12,1,1,1,2,'0',0),(12,'1',77,'2020-12-06 21:29:50',12,1,1,1,2,'0',0),(13,'1',5,'2020-12-10 22:26:40',11,1,1,1,2,'0',12),(14,'1',77,'2020-12-10 22:27:13',12,1,1,1,1,'0',1000),(16,'1',12.07,'2021-01-06 00:00:00',1,1,1,9,6,'123',20000),(20,'1',1,'2020-12-13 19:48:06',12,4,1,1,6,'0',0),(21,'1',10,'2020-12-13 19:48:06',25,4,1,1,6,'0',0),(22,'1',1,'2020-12-13 21:07:28',12,9,1,1,6,'0',0),(23,'1',1,'2020-12-16 21:45:13',25,1,1,1,6,'123',7000),(24,'1',33.07,'2020-12-16 21:45:44',14,1,1,1,6,'123',17000),(25,'1',20,'2020-12-20 20:12:11',10,9,1,1,6,'0',0),(26,'1',6.3,'2020-12-26 14:04:59',13,2,1,1,6,'0',99000),(27,'1',0,'2020-12-23 09:52:40',1,1,1,1,6,'686',78789),(28,'1',1.6,'2020-12-26 15:16:16',13,4,1,1,6,'0',0),(32,'1',0.6,'2021-01-10 20:40:30',13,10,1,1,6,'0',6000),(29,'1',2,'2020-12-27 18:01:50',13,9,1,1,6,'0',20000),(30,'1',0.5,'2020-12-27 20:08:30',25,1,1,1,6,'112',3500),(31,'1',0,'2021-01-06 10:20:57',13,10,1,1,6,'0',0),(33,'1',193.49,'2021-01-25 00:00:00',199,1,1,9,0,'0',0),(34,'1',191.66,'2021-01-25 00:00:00',200,1,1,9,0,'0',0),(35,'1',190,'2021-01-25 00:00:00',201,1,1,9,0,'0',0),(36,'1',50,'2021-02-12 20:20:09',2599,1,7,11,6,'A-34567',53300);
/*!40000 ALTER TABLE `stock` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_cargo`
--

LOCK TABLES `tipo_cargo` WRITE;
/*!40000 ALTER TABLE `tipo_cargo` DISABLE KEYS */;
INSERT INTO `tipo_cargo` VALUES (1,'Gerente','gerencia','2020-03-23',1),(2,'cajero','caja','2020-03-23',9),(3,'Vendedor','vendedor','2019-10-24',1),(4,'patinador','patinador','2019-10-24',1),(20,'coordinador','ninguna','2019-10-24',1),(23,'Servicios Generales','Servicios','2020-03-23',1),(25,'Cordiandor de ventas','---','2020-10-18',1),(26,'Subgerente','-----','2020-10-18',1),(28,'prueba','prueba ---','2020-10-24',1),(29,'Cargo Prueba','Este cargo es una prueba','2021-02-10',1),(30,'r','r','2021-02-10',7),(31,'Cocinero','Cocinar','2021-02-10',7),(32,'prueba 10 feb','--','2021-02-10',14),(33,'Parametrización','Parametrización','2021-02-12',11);
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
-- Dumping events for database 'control3_cosechafresca2'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-02-12 23:51:38
