-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: db_movilidad_escolar
-- ------------------------------------------------------
-- Server version	5.7.24

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tbl_alumno`
--

DROP TABLE IF EXISTS `tbl_alumno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_alumno` (
  `alumno_id` int(11) NOT NULL AUTO_INCREMENT,
  `alumno_nombre` varchar(255) COLLATE utf8_bin NOT NULL,
  `alumno_apellido` varchar(255) COLLATE utf8_bin NOT NULL,
  `alumno_fecha_nacimiento` date DEFAULT NULL,
  `alumno_foto` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`alumno_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_alumno`
--

LOCK TABLES `tbl_alumno` WRITE;
/*!40000 ALTER TABLE `tbl_alumno` DISABLE KEYS */;
INSERT INTO `tbl_alumno` VALUES (1,'SUSANA','CASTILLO','2009-11-13','imagen1.jpg'),(2,'MARLENE','GOMEZ','2008-11-03','imagen2.jpg'),(3,'MARIBEL','GOMEZ','2010-03-01','imagen3.jpg');
/*!40000 ALTER TABLE `tbl_alumno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_apoderado`
--

DROP TABLE IF EXISTS `tbl_apoderado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_apoderado` (
  `apoderado_id` int(11) NOT NULL AUTO_INCREMENT,
  `apoderado_nombre` varchar(255) COLLATE utf8_bin NOT NULL,
  `apoderado_apellido` varchar(45) COLLATE utf8_bin NOT NULL,
  `apoderado_telefono` varchar(255) COLLATE utf8_bin NOT NULL,
  `apoderado_documento_identidad` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `parentesco_id` int(11) NOT NULL,
  PRIMARY KEY (`apoderado_id`),
  KEY `fk_tbl_apoderado_tbl_parentesco` (`parentesco_id`),
  CONSTRAINT `fk_tbl_apoderado_tbl_parentesco` FOREIGN KEY (`parentesco_id`) REFERENCES `tbl_parentesco` (`parentesco_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_apoderado`
--

LOCK TABLES `tbl_apoderado` WRITE;
/*!40000 ALTER TABLE `tbl_apoderado` DISABLE KEYS */;
INSERT INTO `tbl_apoderado` VALUES (1,'JOEL','GOMEZ','99999','444444',1),(2,'ROCIO','ALBERCAR','88888','55555',2);
/*!40000 ALTER TABLE `tbl_apoderado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_colegio`
--

DROP TABLE IF EXISTS `tbl_colegio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_colegio` (
  `colegio_id` int(11) NOT NULL AUTO_INCREMENT,
  `colegio_nombre` varchar(225) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`colegio_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_colegio`
--

LOCK TABLES `tbl_colegio` WRITE;
/*!40000 ALTER TABLE `tbl_colegio` DISABLE KEYS */;
INSERT INTO `tbl_colegio` VALUES (1,'FE Y ALEGRIA');
/*!40000 ALTER TABLE `tbl_colegio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_grado`
--

DROP TABLE IF EXISTS `tbl_grado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_grado` (
  `grado_id` int(11) NOT NULL AUTO_INCREMENT,
  `grado_nombre` varchar(50) COLLATE utf8_bin NOT NULL,
  `grado_nivel` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`grado_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_grado`
--

LOCK TABLES `tbl_grado` WRITE;
/*!40000 ALTER TABLE `tbl_grado` DISABLE KEYS */;
INSERT INTO `tbl_grado` VALUES (1,'1ERO','PRIMARIA'),(2,'2DO','PRIMARIA'),(3,'1ERO','SECUNDARIA');
/*!40000 ALTER TABLE `tbl_grado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_movilidad`
--

DROP TABLE IF EXISTS `tbl_movilidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_movilidad` (
  `movilidad_id` int(11) NOT NULL AUTO_INCREMENT,
  `movilidad_tipo_servicio` varchar(45) COLLATE utf8_bin NOT NULL,
  `movilidad_turno` varchar(45) COLLATE utf8_bin NOT NULL,
  `movilidad_seccion` varchar(45) COLLATE utf8_bin NOT NULL,
  `movilidad_docente` varchar(255) COLLATE utf8_bin NOT NULL,
  `movilidad_pago` double NOT NULL,
  `colegio_id` int(11) NOT NULL,
  `alumno_id` int(11) NOT NULL,
  `vehiculo_id` int(11) NOT NULL,
  `grado_id` int(11) NOT NULL,
  `apoderado_id` int(11) NOT NULL,
  PRIMARY KEY (`movilidad_id`),
  KEY `fk_movilidad_tbl_colegio1` (`colegio_id`),
  KEY `fk_movilidad_tbl_alumno1` (`alumno_id`),
  KEY `fk_movilidad_tbl_vehiculo1` (`vehiculo_id`),
  KEY `fk_movilidad_tbl_grado1` (`grado_id`),
  KEY `fk_movilidad_tbl_apoderado1` (`apoderado_id`),
  CONSTRAINT `fk_movilidad_tbl_alumno1` FOREIGN KEY (`alumno_id`) REFERENCES `tbl_alumno` (`alumno_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_movilidad_tbl_apoderado1` FOREIGN KEY (`apoderado_id`) REFERENCES `tbl_apoderado` (`apoderado_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_movilidad_tbl_colegio1` FOREIGN KEY (`colegio_id`) REFERENCES `tbl_colegio` (`colegio_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_movilidad_tbl_grado1` FOREIGN KEY (`grado_id`) REFERENCES `tbl_grado` (`grado_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_movilidad_tbl_vehiculo1` FOREIGN KEY (`vehiculo_id`) REFERENCES `tbl_vehiculo` (`vehiculo_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_movilidad`
--

LOCK TABLES `tbl_movilidad` WRITE;
/*!40000 ALTER TABLE `tbl_movilidad` DISABLE KEYS */;
INSERT INTO `tbl_movilidad` VALUES (1,'COMPLETO','MAÑANA','A','ALICIA MARTINEZ',150,1,1,1,1,1),(2,'RECOJO','MAÑANA','B','FELIX PEREZ',120,1,2,1,1,2),(3,'RETORNO','MAÑANA','A','GLORIA RAMOS',120,1,3,2,3,1);
/*!40000 ALTER TABLE `tbl_movilidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_parentesco`
--

DROP TABLE IF EXISTS `tbl_parentesco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_parentesco` (
  `parentesco_id` int(11) NOT NULL AUTO_INCREMENT,
  `parentesco_nombre` varchar(45) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`parentesco_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_parentesco`
--

LOCK TABLES `tbl_parentesco` WRITE;
/*!40000 ALTER TABLE `tbl_parentesco` DISABLE KEYS */;
INSERT INTO `tbl_parentesco` VALUES (1,'PADRE'),(2,'MADRE');
/*!40000 ALTER TABLE `tbl_parentesco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_vehiculo`
--

DROP TABLE IF EXISTS `tbl_vehiculo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_vehiculo` (
  `vehiculo_id` int(11) NOT NULL AUTO_INCREMENT,
  `vehiculo_placa` varchar(20) COLLATE utf8_bin NOT NULL,
  `vehiculo_conductor` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`vehiculo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_vehiculo`
--

LOCK TABLES `tbl_vehiculo` WRITE;
/*!40000 ALTER TABLE `tbl_vehiculo` DISABLE KEYS */;
INSERT INTO `tbl_vehiculo` VALUES (1,'VHT-890','CESAR ALVAREZ'),(2,'VTU-100','MARIA LOPEZ');
/*!40000 ALTER TABLE `tbl_vehiculo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'db_movilidad_escolar'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-07 21:20:58
