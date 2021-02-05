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
-- Table structure for table `categoria_cliente`
--

DROP TABLE IF EXISTS `categoria_cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categoria_cliente` (
  `id_categoria` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `descripcion` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `empleado_id_empleado` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `sede_id_sede` int(11) NOT NULL,
  PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria_cliente`
--

LOCK TABLES `categoria_cliente` WRITE;
/*!40000 ALTER TABLE `categoria_cliente` DISABLE KEYS */;
INSERT INTO `categoria_cliente` VALUES (1,'Corriente','Cliente general',7,'2020-10-28',1),(2,'Institucional','Varias instituciones',7,'2020-10-28',1);
/*!40000 ALTER TABLE `categoria_cliente` ENABLE KEYS */;
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
  `telefono` bigint(20) NOT NULL,
  `correo` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `documento` bigint(20) NOT NULL,
  `nit` int(11) NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (8,'eo','e','e',1,'e@gmail.com',1223,0,0,1,3,'2020-10-17',2),(9,'carlos ramirez','CR','calle 56',312231,'car@gmail.com',123456789,0,1,2,1,'2020-10-14',1),(10,'Andrea López','Empresa G','Carrera 27',31312132,'and@gmail.com',1233444555,0,0,2,1,'2020-10-15',1),(12,'Ricardo Sánchez','Mercados H','Carrera 14 ',2147483647,'ricar@gmail.com',555888988,0,7,2,1,'2020-10-17',1),(13,'Jhon Suárez','JSo','Carrera 19 ',317899872,'js@gmail.com',126789992,0,2,2,1,'2020-10-18',1),(14,'Juan sanchéz','Empresa JP','Carrera 23',132312123,'juannn@gmail.com',111111111,0,2,2,3,'2020-10-18',2),(18,'k','k','k',1,'k@hotmail.com',1743,0,0,1,3,'2020-10-18',10),(21,'camilo perez','12','12',12,'cap12@gmail.com',12222,1222,1,1,1,'2020-10-25',7),(22,'Juliana Pérez','Mercados A','Carrera 12-8',2147483647,'julianaperez@gmail.com',2147483647,123456789,9,2,1,'2020-10-25',1),(23,'Camilo Rodríguez','Mercados C','Carrera 54',2147483647,'camilo54@gmail.com',1234567123,0,0,2,1,'2020-10-29',7),(24,'r','ffffs','r',44353,'rrrr@gmail.com',123132,1230000,4,1,1,'2020-10-30',7),(27,'Pedro Antonio','UPTC','Carrera 9 #1A-23 sur',3112733685,'Pepito@uptc.edu.co',1057607465,1,1,1,1,'2020-11-12',1),(54,'Pedro Pinto','-','-',0,'-',985673,0,0,1,1,'2021-01-31',9),(55,'Carlos Montañez','-','-',0,'-',85796,0,0,1,1,'2021-01-31',9),(56,'Violeta Montañez','-','-',0,'-',9589,0,0,1,1,'2021-02-02',9),(57,'Juana Valentina ','-','-',0,'-',12578,0,0,1,1,'2021-02-02',9),(58,'carlos camargo','La canasta','-',3124569,'-',9576834,0,0,1,1,'2021-02-02',11);
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
  `telefono` int(11) NOT NULL,
  `documento` int(11) NOT NULL,
  `tipo_cargo_id_cargo` int(11) NOT NULL,
  `sede_id_sede` int(11) NOT NULL,
  `user_id_user` int(11) NOT NULL,
  `fecha` date NOT NULL,
  PRIMARY KEY (`id_empleado`),
  KEY `empleado_sede_fk` (`sede_id_sede`),
  KEY `empleado_tipo_cargo_fk` (`tipo_cargo_id_cargo`),
  KEY `empleado_users_fk` (`user_id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleado`
--

LOCK TABLES `empleado` WRITE;
/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;
INSERT INTO `empleado` VALUES (1,'juan','juangomez3701@gmail.com','321','calle 12',31289362,3123,1,1,1,'2020-09-13'),(2,'holman ','holman@gmail.com','1','calle 12',1234,3123,1,1,10,'2020-12-12'),(3,'juliana','juliana@gmail.com','9876567','calle 12',312782681,1057612893,1,1,1237,'2020-10-18'),(4,'carlos','carlos@gmail.com','98012387','calle 12',98378124,12931239,1,1,1238,'2020-10-18'),(5,'Andres','andres@gmail.com','201562537','calle 12 no 12',2147483647,2147483647,1,1,1239,'2020-10-18'),(6,'Holman rincon','holman123@gmail.com','20188029','calle 12',12313213,23132,1,1,1240,'2020-10-24'),(7,'Holman2','holman.rincon@uptc.edu.co','123213121','calle 12',3120930,1238908123,1,1,1241,'0000-00-00'),(8,'prueba120','qweyqiwoe@gmail.com','2019231j1','calle 12 -12',2147483647,1389012093,1,1,1243,'0000-00-00'),(9,'Juliana Pérez','liseth.perez@uptc.edu.co','312890','---',23,-2,1,1,1244,'2020-11-06'),(10,'prueba','prueba123@gmail.com','201611889','---',2,2,1,1,1245,'0000-00-00'),(11,'carlos camargo','contacto@controler.com.co','0000000','----',0,0,1,1,1246,'2021-01-24');
/*!40000 ALTER TABLE `empleado` ENABLE KEYS */;
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
) ENGINE=MyISAM AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock`
--

LOCK TABLES `stock` WRITE;
/*!40000 ALTER TABLE `stock` DISABLE KEYS */;
INSERT INTO `stock` VALUES (1,'1',0,'2020-11-09 00:00:00',1,1,1,1,1,'0',20000),(2,'1',13.2,'2020-12-26 13:08:53',25,1,1,1,1,'0',10500),(3,'1',3,'2020-11-15 00:00:00',12,1,1,9,1,'0',0),(4,'0',5,'2020-11-15 00:00:00',9,9,3,1,2,'0',0),(6,'1',0,'2020-11-15 19:45:29',1,1,1,1,1,'0',0),(9,'1',15,'2020-11-24 00:00:00',12,1,1,9,1,'0',0),(8,'1',8,'2020-11-15 20:22:55',12,1,1,7,1,'0',0),(10,'1',6,'2020-12-06 21:29:06',17,1,1,1,1,'0',0),(11,'1',36,'2020-12-05 11:27:32',12,1,1,1,2,'0',0),(12,'1',77,'2020-12-06 21:29:50',12,1,1,1,2,'0',0),(13,'1',5,'2020-12-10 22:26:40',11,1,1,1,2,'0',12),(14,'1',77,'2020-12-10 22:27:13',12,1,1,1,1,'0',1000),(16,'1',12.07,'2021-01-06 00:00:00',1,1,1,9,6,'123',20000),(20,'1',1,'2020-12-13 19:48:06',12,4,1,1,6,'0',0),(21,'1',10,'2020-12-13 19:48:06',25,4,1,1,6,'0',0),(22,'1',1,'2020-12-13 21:07:28',12,9,1,1,6,'0',0),(23,'1',1,'2020-12-16 21:45:13',25,1,1,1,6,'123',7000),(24,'1',33.07,'2020-12-16 21:45:44',14,1,1,1,6,'123',17000),(25,'1',20,'2020-12-20 20:12:11',10,9,1,1,6,'0',0),(26,'1',6.3,'2020-12-26 14:04:59',13,2,1,1,6,'0',99000),(27,'1',0,'2020-12-23 09:52:40',1,1,1,1,6,'686',78789),(28,'1',1.6,'2020-12-26 15:16:16',13,4,1,1,6,'0',0),(32,'1',0.6,'2021-01-10 20:40:30',13,10,1,1,6,'0',6000),(29,'1',2,'2020-12-27 18:01:50',13,9,1,1,6,'0',20000),(30,'1',0.5,'2020-12-27 20:08:30',25,1,1,1,6,'112',3500),(31,'1',0,'2021-01-06 10:20:57',13,10,1,1,6,'0',0),(33,'1',194.42,'2021-01-25 00:00:00',199,1,1,9,0,'0',0),(34,'1',194.42,'2021-01-25 00:00:00',200,1,1,9,0,'0',0),(35,'1',190,'2021-01-25 00:00:00',201,1,1,9,0,'0',0);
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
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_cargo`
--

LOCK TABLES `tipo_cargo` WRITE;
/*!40000 ALTER TABLE `tipo_cargo` DISABLE KEYS */;
INSERT INTO `tipo_cargo` VALUES (1,'Gerente','gerencia','2020-03-23',1),(2,'cajero','caja','2020-03-23',1),(3,'Vendedor','vendedor','2019-10-24',1),(4,'patinador','patinador','2019-10-24',1),(20,'coordinador','ninguna','2019-10-24',1),(23,'Servicios Generales','Servicios','2020-03-23',1),(25,'Cordiandor de ventas','---','2020-10-18',1),(26,'Subgerente','-----','2020-10-18',1),(28,'prueba','prueba','2020-10-24',1);
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

-- Dump completed on 2021-02-04 23:43:42
