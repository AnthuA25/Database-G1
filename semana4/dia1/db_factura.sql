-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: localhost    Database: db_factura
-- ------------------------------------------------------
-- Server version	5.7.24

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_cliente`
--

LOCK TABLES `tbl_cliente` WRITE;
/*!40000 ALTER TABLE `tbl_cliente` DISABLE KEYS */;
INSERT INTO `tbl_cliente` VALUES (1,'PANADERIA LAS AMERICAS','2020202020','CALLE NUEVA 500','1','2023-06-16 22:38:21','ADMIN'),(2,'LIBRERIA LAURITA S.A.C','1010101010','CALLE ANTIGUA 100','1','2023-06-16 22:38:21','ADMIN'),(3,'INVERSIONES ARENA','20102030405','CALLE AREQUIPA 101','1','2023-06-16 22:38:21','ADMIN'),(5,'INVERSIONES ARENA','20102030405','CALLE AREQUIPA 500','1','2023-06-16 22:38:21','ADMIN');
/*!40000 ALTER TABLE `tbl_cliente` ENABLE KEYS */;
UNLOCK TABLES;

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
  CONSTRAINT `fk_tbl_factura_cab_tbl_cliente` FOREIGN KEY (`cliente_id`) REFERENCES `tbl_cliente` (`cliente_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_factura_cab`
--

LOCK TABLES `tbl_factura_cab` WRITE;
/*!40000 ALTER TABLE `tbl_factura_cab` DISABLE KEYS */;
INSERT INTO `tbl_factura_cab` VALUES (1,'F01','001','2023-06-30','2023-06-09','SOLES','',1000,180,1180,'1','2023-06-16 23:08:23','ADMIN',1),(2,'F01','002','2023-06-30','2023-06-09','SOLES','',2500,450,2950,'1','2023-06-16 23:08:23','ADMIN',1),(22,'F001','003','2023-06-30','2023-06-16','SOLES',NULL,2000,360,2360,'1','2023-06-17 01:55:47','ADMIN',2);
/*!40000 ALTER TABLE `tbl_factura_cab` ENABLE KEYS */;
UNLOCK TABLES;

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
  CONSTRAINT `fk_tbl_factura_det_tbl_factura_cab1` FOREIGN KEY (`factura_cab_id`) REFERENCES `tbl_factura_cab` (`factura_cab_id`),
  CONSTRAINT `fk_tbl_factura_det_tbl_producto1` FOREIGN KEY (`producto_id`) REFERENCES `tbl_producto` (`producto_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_factura_det`
--

LOCK TABLES `tbl_factura_det` WRITE;
/*!40000 ALTER TABLE `tbl_factura_det` DISABLE KEYS */;
INSERT INTO `tbl_factura_det` VALUES (10,1000,1,1000,'2023-06-16 23:21:50','ADMIN',3,1),(11,1500,1,1500,'2023-06-16 23:21:50','ADMIN',2,2),(12,1000,1,1000,'2023-06-16 23:21:50','ADMIN',3,2);
/*!40000 ALTER TABLE `tbl_factura_det` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_producto`
--

DROP TABLE IF EXISTS `tbl_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_producto` (
  `producto_id` int(11) NOT NULL AUTO_INCREMENT,
  `producto_descripcion` varchar(255) COLLATE utf8_bin NOT NULL,
  `producto_precio` double NOT NULL,
  `producto_estado` char(1) COLLATE utf8_bin NOT NULL DEFAULT '1',
  `producto_stock` int(11) NOT NULL,
  `producto_fecha_log` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `producto_usuario_log` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`producto_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_producto`
--

LOCK TABLES `tbl_producto` WRITE;
/*!40000 ALTER TABLE `tbl_producto` DISABLE KEYS */;
INSERT INTO `tbl_producto` VALUES (2,'XIOMI REDMI 12',1500,'1',10,'2023-06-16 22:51:41','ADMIN'),(3,'MOTOROLA MOTO G10',1000,'1',15,'2023-06-16 22:51:41','ADMIN'),(4,'HUAWEI P40 LITE',1000,'1',10,'2023-06-17 02:57:53','ADMIN');
/*!40000 ALTER TABLE `tbl_producto` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger tg_producto_stock
before insert
on tbl_producto for each row 
begin 
	set new.producto_stock = 10;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `v_factura`
--

DROP TABLE IF EXISTS `v_factura`;
/*!50001 DROP VIEW IF EXISTS `v_factura`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_factura` AS SELECT 
 1 AS `factura_cab_serie`,
 1 AS `factura_cab_nro`,
 1 AS `factura_cab_femision`,
 1 AS `factura_cab_tipo_moneda`,
 1 AS `factura_cab_valortotal`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_rfactura`
--

DROP TABLE IF EXISTS `v_rfactura`;
/*!50001 DROP VIEW IF EXISTS `v_rfactura`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_rfactura` AS SELECT 
 1 AS `numero_serie`,
 1 AS `fecha`,
 1 AS `cliente`,
 1 AS `tipo_moneda`,
 1 AS `producto`,
 1 AS `stock`,
 1 AS `total`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'db_factura'
--

--
-- Dumping routines for database 'db_factura'
--
/*!50003 DROP FUNCTION IF EXISTS `fn_contar_productos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_contar_productos`(productoid int ) RETURNS int(10) unsigned
begin 
	declare total int unsigned;

	select count(*) into total
	from tbl_factura_det
	where producto_id = productoid;
	
	return total;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_registrar_fact_cab` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_registrar_fact_cab`(
in serie varchar(20),in nro varchar(255),in fvencimiento date,
in femision date,in tipo_moneda varchar(45),in valorventa double,
in estado char(1),in fecha_log timestamp,in usuario_log varchar(255),
in idcliente int
)
begin
	declare vIgv double;
	declare vTotal double;

	set vIgv = valorventa * 0.18;
	set vTotal = valorventa + vIgv;

	insert into tbl_factura_cab (factura_cab_serie,factura_cab_nro,
	factura_cab_fvencimiento,factura_cab_femision,factura_cab_tipo_moneda,
	factura_cab_valorventa,factura_cab_valorigv,
	factura_cab_valortotal,factura_cab_estado,factura_cab_fecha_log,factura_cab_usuario_log,
	cliente_id)
	values(serie,nro,fvencimiento,femision,tipo_moneda,valorventa,
	vIgv,vTotal,estado,fecha_log,usuario_log,idcliente);

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `v_factura`
--

/*!50001 DROP VIEW IF EXISTS `v_factura`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_factura` AS select `tbl_factura_cab`.`factura_cab_serie` AS `factura_cab_serie`,`tbl_factura_cab`.`factura_cab_nro` AS `factura_cab_nro`,`tbl_factura_cab`.`factura_cab_femision` AS `factura_cab_femision`,`tbl_factura_cab`.`factura_cab_tipo_moneda` AS `factura_cab_tipo_moneda`,`tbl_factura_cab`.`factura_cab_valortotal` AS `factura_cab_valortotal` from `tbl_factura_cab` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_rfactura`
--

/*!50001 DROP VIEW IF EXISTS `v_rfactura`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_rfactura` AS select `fc`.`factura_cab_serie` AS `numero_serie`,`fc`.`factura_cab_femision` AS `fecha`,`tc`.`cliente_rsocial` AS `cliente`,`fc`.`factura_cab_tipo_moneda` AS `tipo_moneda`,`tp`.`producto_descripcion` AS `producto`,`tp`.`producto_stock` AS `stock`,`fc`.`factura_cab_valortotal` AS `total` from (((`tbl_factura_cab` `fc` join `tbl_cliente` `tc` on((`fc`.`cliente_id` = `tc`.`cliente_id`))) join `tbl_factura_det` `fd` on((`fc`.`factura_cab_id` = `fd`.`factura_cab_id`))) join `tbl_producto` `tp` on((`fd`.`producto_id` = `tp`.`producto_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-23 17:14:41
