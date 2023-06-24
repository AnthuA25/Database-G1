-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 21, 2023 at 02:24 AM
-- Server version: 5.7.24
-- PHP Version: 7.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bd_factura`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_cliente`
--

CREATE TABLE `tbl_cliente` (
  `cliente_id` int(11) NOT NULL,
  `cliente_rsocial` varchar(255) COLLATE utf8_bin NOT NULL,
  `cliente_ruc` varchar(20) COLLATE utf8_bin NOT NULL,
  `cliente_direccion` longtext COLLATE utf8_bin NOT NULL,
  `cliente_estado` char(1) COLLATE utf8_bin NOT NULL DEFAULT '1',
  `cliente_fecha_log` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `cliente_usuario_log` varchar(255) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `tbl_cliente`
--

INSERT INTO `tbl_cliente` (`cliente_id`, `cliente_rsocial`, `cliente_ruc`, `cliente_direccion`, `cliente_estado`, `cliente_fecha_log`, `cliente_usuario_log`) VALUES
(1, 'PANADERIA LAS AMERICAS', '2020202020', 'CALLE NUEVA 123', '1', '2023-06-16 22:38:21', 'ADMIN'),
(2, 'LIBRERIA LAURITA S.A.C', '1010101010', 'CALLE ANTIGUA 123', '1', '2023-06-16 22:38:21', 'ADMIN'),
(3, 'INVERSIONES ARENA', '20102030405', 'CALLE AREQUIPA 101', '1', '2023-06-16 22:38:21', 'ADMIN'),
(4, 'razon social', '20304050601', 'direccion 100', '1', '2023-06-20 01:29:20', 'ADMIN');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_factura_cab`
--

CREATE TABLE `tbl_factura_cab` (
  `factura_cab_id` int(11) NOT NULL,
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
  `cliente_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `tbl_factura_cab`
--

INSERT INTO `tbl_factura_cab` (`factura_cab_id`, `factura_cab_serie`, `factura_cab_nro`, `factura_cab_fvencimiento`, `factura_cab_femision`, `factura_cab_tipo_moneda`, `factura_cab_observacion`, `factura_cab_valorventa`, `factura_cab_valorigv`, `factura_cab_valortotal`, `factura_cab_estado`, `factura_cab_fecha_log`, `factura_cab_usuario_log`, `cliente_id`) VALUES
(1, 'F01', '001', '2023-06-30', '2023-06-09', 'SOLES', '', 1000, 180, 1180, '1', '2023-06-16 23:08:23', 'ADMIN', 1),
(2, 'F01', '002', '2023-06-30', '2023-06-09', 'SOLES', '', 2500, 450, 2950, '1', '2023-06-16 23:08:23', 'ADMIN', 1),
(22, 'F001', '003', '2023-06-30', '2023-06-16', 'SOLES', NULL, 2000, 360, 2360, '1', '2023-06-17 01:55:47', 'ADMIN', 2);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_factura_det`
--

CREATE TABLE `tbl_factura_det` (
  `factura_det_id` int(11) NOT NULL,
  `factura_det_precio` double NOT NULL,
  `factura_det_cantidad` double NOT NULL,
  `factura_det_subtotal` double NOT NULL,
  `factura_det_fecha_log` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `factura_det_usuario_log` varchar(255) COLLATE utf8_bin NOT NULL,
  `producto_id` int(11) NOT NULL,
  `factura_cab_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `tbl_factura_det`
--

INSERT INTO `tbl_factura_det` (`factura_det_id`, `factura_det_precio`, `factura_det_cantidad`, `factura_det_subtotal`, `factura_det_fecha_log`, `factura_det_usuario_log`, `producto_id`, `factura_cab_id`) VALUES
(10, 1000, 1, 1000, '2023-06-16 23:21:50', 'ADMIN', 3, 1),
(11, 1500, 1, 1500, '2023-06-16 23:21:50', 'ADMIN', 2, 2),
(12, 1000, 1, 1000, '2023-06-16 23:21:50', 'ADMIN', 3, 2);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_producto`
--

CREATE TABLE `tbl_producto` (
  `producto_id` int(11) NOT NULL,
  `producto_descripcion` varchar(255) COLLATE utf8_bin NOT NULL,
  `producto_precio` double NOT NULL,
  `producto_estado` char(1) COLLATE utf8_bin NOT NULL DEFAULT '1',
  `producto_stock` int(11) NOT NULL,
  `producto_fecha_log` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `producto_usuario_log` varchar(255) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `tbl_producto`
--

INSERT INTO `tbl_producto` (`producto_id`, `producto_descripcion`, `producto_precio`, `producto_estado`, `producto_stock`, `producto_fecha_log`, `producto_usuario_log`) VALUES
(2, 'XIOMI REDMI 12', 1500, '1', 10, '2023-06-16 22:51:41', 'ADMIN'),
(3, 'MOTOROLA MOTO G10', 1000, '1', 15, '2023-06-16 22:51:41', 'ADMIN'),
(4, 'HUAWEI P40 LITE', 1000, '1', 10, '2023-06-17 02:57:53', 'ADMIN');

--
-- Triggers `tbl_producto`
--
DELIMITER $$
CREATE TRIGGER `tg_producto_stock` BEFORE INSERT ON `tbl_producto` FOR EACH ROW begin 
	set new.producto_stock = 10;
end
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_cliente`
--
ALTER TABLE `tbl_cliente`
  ADD PRIMARY KEY (`cliente_id`);

--
-- Indexes for table `tbl_factura_cab`
--
ALTER TABLE `tbl_factura_cab`
  ADD PRIMARY KEY (`factura_cab_id`),
  ADD KEY `fk_tbl_factura_cab_tbl_cliente` (`cliente_id`);

--
-- Indexes for table `tbl_factura_det`
--
ALTER TABLE `tbl_factura_det`
  ADD PRIMARY KEY (`factura_det_id`),
  ADD KEY `fk_tbl_factura_det_tbl_producto1` (`producto_id`),
  ADD KEY `fk_tbl_factura_det_tbl_factura_cab1` (`factura_cab_id`);

--
-- Indexes for table `tbl_producto`
--
ALTER TABLE `tbl_producto`
  ADD PRIMARY KEY (`producto_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_cliente`
--
ALTER TABLE `tbl_cliente`
  MODIFY `cliente_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_factura_cab`
--
ALTER TABLE `tbl_factura_cab`
  MODIFY `factura_cab_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `tbl_factura_det`
--
ALTER TABLE `tbl_factura_det`
  MODIFY `factura_det_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `tbl_producto`
--
ALTER TABLE `tbl_producto`
  MODIFY `producto_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_factura_cab`
--
ALTER TABLE `tbl_factura_cab`
  ADD CONSTRAINT `fk_tbl_factura_cab_tbl_cliente` FOREIGN KEY (`cliente_id`) REFERENCES `tbl_cliente` (`cliente_id`);

--
-- Constraints for table `tbl_factura_det`
--
ALTER TABLE `tbl_factura_det`
  ADD CONSTRAINT `fk_tbl_factura_det_tbl_factura_cab1` FOREIGN KEY (`factura_cab_id`) REFERENCES `tbl_factura_cab` (`factura_cab_id`),
  ADD CONSTRAINT `fk_tbl_factura_det_tbl_producto1` FOREIGN KEY (`producto_id`) REFERENCES `tbl_producto` (`producto_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
