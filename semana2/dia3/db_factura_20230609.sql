-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: db_factura
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
-- Table structure for table `tbl_cliente`
--

DROP TABLE IF EXISTS `tbl_cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_cliente` (
  `cliente_id` int(11) NOT NULL AUTO_INCREMENT,
  `cliente_rsocial` varchar(255) COLLATE utf8_bin NOT NULL,
  `cliente_ruc` varchar(20) COLLATE utf8_bin NOT NULL,
  `cliente_direccion` longtext COLLATE utf8_bin NOT NULL,
  `cliente_estado` char(1) COLLATE utf8_bin NOT NULL DEFAULT '1',
  `cliente_fecha_log` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `cliente_usuario_log` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`cliente_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_factura_cab`
--

DROP TABLE IF EXISTS `tbl_factura_cab`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_factura_cab` (
  `factura_cab_id` int(11) NOT NULL AUTO_INCREMENT,
  `factura_cab_serie` varchar(20) COLLATE utf8_bin NOT NULL,
  `factura_cab_nro` varchar(255) COLLATE utf8_bin NOT NULL,
  `factura_cab_fvencimiento` date NOT NULL,
  `factura_cab_femision` date NOT NULL,
  `factura_cab_tipo_moneda` varchar(45) COLLATE utf8_bin NOT NULL DEFAULT 'SOLES',
  `factura_cab_observacion` longtext COLLATE utf8_bin,
  `factura_cab_valorventa` double NOT NULL,
  `factura_cab_valorigv` double NOT NULL,
  `factura_cab_valortotal` double NOT NULL,
  `factura_cab_estado` char(1) COLLATE utf8_bin NOT NULL DEFAULT '1',
  `factura_cab_fecha_log` timestamp NOT NULL,
  `factura_cab_usuario_log` varchar(255) COLLATE utf8_bin NOT NULL,
  `cliente_id` int(11) NOT NULL,
  PRIMARY KEY (`factura_cab_id`),
  KEY `fk_tbl_factura_cab_tbl_cliente` (`cliente_id`),
  CONSTRAINT `fk_tbl_factura_cab_tbl_cliente` FOREIGN KEY (`cliente_id`) REFERENCES `tbl_cliente` (`cliente_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_factura_det`
--

DROP TABLE IF EXISTS `tbl_factura_det`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_factura_det` (
  `factura_det_id` int(11) NOT NULL AUTO_INCREMENT,
  `factura_det_precio` double NOT NULL,
  `factura_det_cantidad` double NOT NULL,
  `factura_det_subtotal` double NOT NULL,
  `factura_det_fecha_log` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `factura_det_usuario_log` varchar(255) COLLATE utf8_bin NOT NULL,
  `producto_id` int(11) NOT NULL,
  `factura_cab_id` int(11) NOT NULL,
  PRIMARY KEY (`factura_det_id`),
  KEY `fk_tbl_factura_det_tbl_producto1` (`producto_id`),
  KEY `fk_tbl_factura_det_tbl_factura_cab1` (`factura_cab_id`),
  CONSTRAINT `fk_tbl_factura_det_tbl_factura_cab1` FOREIGN KEY (`factura_cab_id`) REFERENCES `tbl_factura_cab` (`factura_cab_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_factura_det_tbl_producto1` FOREIGN KEY (`producto_id`) REFERENCES `tbl_producto` (`producto_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_producto`
--

DROP TABLE IF EXISTS `tbl_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_producto` (
  `producto_id` int(11) NOT NULL AUTO_INCREMENT,
  `producto_codigo` varchar(255) COLLATE utf8_bin NOT NULL,
  `producto_precio` double NOT NULL,
  `producto_estado` char(1) COLLATE utf8_bin NOT NULL DEFAULT '1',
  `producto_fecha_log` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `producto_usuario_log` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`producto_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping routines for database 'db_factura'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-09 20:38:45
