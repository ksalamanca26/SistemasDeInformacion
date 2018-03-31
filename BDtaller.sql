-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: taller
-- ------------------------------------------------------
-- Server version	5.7.21-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cita`
--

DROP TABLE IF EXISTS `cita`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cita` (
  `idCita` int(11) NOT NULL AUTO_INCREMENT,
  `Hora` varchar(11) DEFAULT NULL,
  `fechaAsignada` date DEFAULT NULL,
  `Estado` varchar(45) NOT NULL,
  `idVehiculo` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  PRIMARY KEY (`idCita`),
  KEY `idusuario_idx` (`idUsuario`),
  KEY `idvehiculo_idx` (`idVehiculo`),
  CONSTRAINT `idusuario` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `idvehiculo` FOREIGN KEY (`idVehiculo`) REFERENCES `vehiculo` (`idVehiculo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cita`
--

LOCK TABLES `cita` WRITE;
/*!40000 ALTER TABLE `cita` DISABLE KEYS */;
INSERT INTO `cita` VALUES (5,'12:00 pm','2018-03-24','Asignada',5,14),(6,'12:00 pm','2018-03-31','En progreso',10,23),(7,'6:00 pm','2018-04-01','Asignada',5,14),(8,'2:00 pm','2018-04-03','Asignada',7,14),(9,'2:00 pm','2018-04-03','En progreso',11,24);
/*!40000 ALTER TABLE `cita` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modelo`
--

DROP TABLE IF EXISTS `modelo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modelo` (
  `idModelo` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`idModelo`),
  UNIQUE KEY `nombre_UNIQUE` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modelo`
--

LOCK TABLES `modelo` WRITE;
/*!40000 ALTER TABLE `modelo` DISABLE KEYS */;
INSERT INTO `modelo` VALUES (1,'Tesla Model 3');
/*!40000 ALTER TABLE `modelo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orden`
--

DROP TABLE IF EXISTS `orden`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orden` (
  `idOrden` int(11) NOT NULL AUTO_INCREMENT,
  `Herramientas` varchar(45) NOT NULL,
  `Accesorios` varchar(45) NOT NULL,
  `Llaves` varchar(45) NOT NULL,
  `Desperfectos` varchar(45) NOT NULL,
  `Gato` varchar(45) NOT NULL,
  `Caucho` varchar(45) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `Vehiculo` int(11) NOT NULL,
  `Foto` mediumblob,
  PRIMARY KEY (`idOrden`),
  KEY `idusuario_idx` (`idUsuario`),
  KEY `vehiculo_idx` (`Vehiculo`),
  CONSTRAINT `usuario` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `vehiculoFK` FOREIGN KEY (`Vehiculo`) REFERENCES `vehiculo` (`idVehiculo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orden`
--

LOCK TABLES `orden` WRITE;
/*!40000 ALTER TABLE `orden` DISABLE KEYS */;
INSERT INTO `orden` VALUES (1,'Con desperfectos','Buenas condiciones','Buenas condiciones','No aplica','Buenas condiciones','Buenas condiciones',13,5,NULL),(2,'Con desperfectos','Buenas condiciones','Buenas condiciones','No aplica','Malas condiciones','Buenas condiciones',16,11,NULL);
/*!40000 ALTER TABLE `orden` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `privilegios`
--

DROP TABLE IF EXISTS `privilegios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `privilegios` (
  `idPrivilegios` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(45) NOT NULL,
  PRIMARY KEY (`idPrivilegios`),
  UNIQUE KEY `idPrivilegios_UNIQUE` (`idPrivilegios`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `privilegios`
--

LOCK TABLES `privilegios` WRITE;
/*!40000 ALTER TABLE `privilegios` DISABLE KEYS */;
/*!40000 ALTER TABLE `privilegios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repuesto`
--

DROP TABLE IF EXISTS `repuesto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `repuesto` (
  `idRepuesto` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(160) NOT NULL,
  `Serial` varchar(45) NOT NULL,
  `Cantidad` int(11) NOT NULL,
  `Tipo` varchar(45) NOT NULL,
  PRIMARY KEY (`idRepuesto`),
  UNIQUE KEY `idRepuesto_UNIQUE` (`idRepuesto`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repuesto`
--

LOCK TABLES `repuesto` WRITE;
/*!40000 ALTER TABLE `repuesto` DISABLE KEYS */;
INSERT INTO `repuesto` VALUES (1,'Bujía ','K12023NASLDASF923N',10,'Camioneta');
/*!40000 ALTER TABLE `repuesto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `idUsuario` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) NOT NULL,
  `Apellido` varchar(45) NOT NULL,
  `Email` varchar(45) NOT NULL,
  `Contraseña` varchar(100) NOT NULL,
  `Rol` int(11) NOT NULL,
  PRIMARY KEY (`idUsuario`),
  UNIQUE KEY `idUsuario_UNIQUE` (`idUsuario`),
  UNIQUE KEY `email_UNIQUE` (`Email`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (2,'Bob','El Constructor','bobconstruye@gmail.com','$2a$10$QJGuD10cPlhu1/BE69h69.WQ.Rt1fxpv/6XuR7IGNLczqwIkAIYr.',1),(3,'Ousmane','Dembelé','dembele11@gmail.com','$2a$10$Jvd6OzMezB4DM2aBxW.DUeT9K2BRW0EKSp.7gi9NuNkpMmhccw8LK',1),(4,'Rafael','Matienzo','mainframe@ibm.com','$2a$10$K5G.QchVlBLBsEE5s3cRceMxUAkbC5mYx8F69y.Dhep0Xpg2/t6IW',1),(7,'Lewis','Hamilton','lhamilton@yahoo.com','$2a$10$rdvLIgrhxnJKGZWCr5ll7ufS4HYNzumuqSvqvrsynXiEg56w056yK',1),(11,'Luis','Suárez','lsuarez9@gmail.com','$2a$10$ZAkDpycKptHBsBpJJstYp.vAvZVy01HeXqHPZnoBDEPv0DLa8atWO',1),(12,'Phillipe','Coutinho','pcoutinho@gmail.com','$2a$10$XOwkR9lZ9Nbtpn5rOb7L6eXN/hWjRM/QS96vSmFkc1gBCK8ZcpTEK',4),(13,'Toño','El Amable','tamable@gmail.com','$2a$10$dZANy3BVR96HLDw03vFFwuLIXGDuZTrOuTm8qwSUHiLZuSDWVPvDy',2),(14,'Soyun','Cliente','cliente@gmail.com','$2a$10$hylGYzPP2m73ygvWXmImYuLStLxPZS/RgKOvE3qfMZsVZ/KPtWVuW',1),(16,'YoSoy','Mecánico','mecanico@gmail.com','$2a$10$YwjcQh6S7B3FU/zgWMYaL.g64aax.GcKD6as4DMJqeajsbudafwhK',2),(22,'Señor','Gerente','gerente@gmail.com','$2a$10$nD0a66MmNjum0L1RBCqDyumVWH85Aa9/UR/Bpb7AgO1Q1eUYgNt1m',3),(23,'Kevin','Salamanca','kevinsalamanca26@gmail.com','$2a$10$ohlDU/2nKOMWUXH8LKtKL.BdxQ6tToyq.kXDPF4Eih/qSVmS2MjvC',1),(24,'Jorge','Salamanca','salamanca.jorgej@gmail.com','$2a$10$2pUUttFAHhLir6bEbS82cul2t.VRWJ7ZQDc.SW/iNAaBMoY8p9GmG',1);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehiculo`
--

DROP TABLE IF EXISTS `vehiculo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vehiculo` (
  `idVehiculo` int(11) NOT NULL AUTO_INCREMENT,
  `Serial` varchar(60) NOT NULL,
  `fechaRegistro` date NOT NULL,
  `Placa` varchar(45) NOT NULL,
  `Modelo` varchar(45) NOT NULL,
  `Year` int(11) NOT NULL,
  `Estado` varchar(45) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  PRIMARY KEY (`idVehiculo`),
  UNIQUE KEY `vehiculo_UNIQUE` (`idVehiculo`),
  UNIQUE KEY `Placa_UNIQUE` (`Placa`),
  KEY `usuario_tiene_vehiculo_idx` (`idUsuario`),
  CONSTRAINT `usuario_tiene_vehiculo` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehiculo`
--

LOCK TABLES `vehiculo` WRITE;
/*!40000 ALTER TABLE `vehiculo` DISABLE KEYS */;
INSERT INTO `vehiculo` VALUES (5,'EMNKR420R5U0273','2018-02-22','L4A-O32','Lamborghini Aventador LP700-4',2012,'Desactivado',14),(6,'EMN6300R5U0273','2018-03-09','J21-KL2','Tesla Model 3',2018,'Activo',12),(7,'ETK945WISM41WR','2018-03-10','NN4-IL1','Toyota Corolla',2006,'Activo',14),(9,'EMNKR420R5U0273','2018-03-11','MAP-90Q','Mazda 7',2009,'Activo',16),(10,'EMN6300R5U0IR21','2018-03-29','H25-MP4','Mazda 7',2010,'Activo',23),(11,'ET6736F2661FJSK3','2018-03-30','GBI-30V','Toyota 4Runner',2000,'Activo',24);
/*!40000 ALTER TABLE `vehiculo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehiculo_tiene_repuesto`
--

DROP TABLE IF EXISTS `vehiculo_tiene_repuesto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vehiculo_tiene_repuesto` (
  `idVehiculo` int(11) NOT NULL,
  `idRepuesto` int(11) NOT NULL,
  KEY `vehiculo_idx` (`idVehiculo`),
  KEY `repuesto_idx` (`idRepuesto`),
  CONSTRAINT `repuesto` FOREIGN KEY (`idRepuesto`) REFERENCES `repuesto` (`idRepuesto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `vehiculo` FOREIGN KEY (`idVehiculo`) REFERENCES `vehiculo` (`idVehiculo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehiculo_tiene_repuesto`
--

LOCK TABLES `vehiculo_tiene_repuesto` WRITE;
/*!40000 ALTER TABLE `vehiculo_tiene_repuesto` DISABLE KEYS */;
/*!40000 ALTER TABLE `vehiculo_tiene_repuesto` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-03-30 23:15:50
