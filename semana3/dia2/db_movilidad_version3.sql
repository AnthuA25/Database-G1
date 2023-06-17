-- MySQL Script generated by MySQL Workbench
-- Tue Jun 13 22:09:46 2023
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema db_movilidad
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema db_movilidad
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `db_movilidad` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin ;
USE `db_movilidad` ;

-- -----------------------------------------------------
-- Table `db_movilidad`.`tbl_alumno`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_movilidad`.`tbl_alumno` (
  `alumno_id` INT(11) NOT NULL AUTO_INCREMENT,
  `alumno_nombre` VARCHAR(255) NOT NULL,
  `alumno_apellido` VARCHAR(255) NOT NULL,
  `alumno_fecha_nacimiento` DATE NULL DEFAULT NULL,
  `alumno_foto` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`alumno_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;


-- -----------------------------------------------------
-- Table `db_movilidad`.`tbl_parentesco`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_movilidad`.`tbl_parentesco` (
  `parentesco_id` INT(11) NOT NULL AUTO_INCREMENT,
  `parentesco_nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`parentesco_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;


-- -----------------------------------------------------
-- Table `db_movilidad`.`tbl_apoderado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_movilidad`.`tbl_apoderado` (
  `apoderado_id` INT(11) NOT NULL AUTO_INCREMENT,
  `apoderado_nombre` VARCHAR(255) NOT NULL,
  `apoderado_apellido` VARCHAR(255) NOT NULL,
  `apoderado_telefono` VARCHAR(255) NOT NULL,
  `apoderado_documento_identidad` VARCHAR(20) NULL DEFAULT NULL,
  `parentesco_id` INT(11) NOT NULL,
  PRIMARY KEY (`apoderado_id`),
  CONSTRAINT `fk_tbl_apoderado_tbl_parentesco`
    FOREIGN KEY (`parentesco_id`)
    REFERENCES `db_movilidad`.`tbl_parentesco` (`parentesco_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;


-- -----------------------------------------------------
-- Table `db_movilidad`.`tbl_colegio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_movilidad`.`tbl_colegio` (
  `colegio_id` INT(11) NOT NULL AUTO_INCREMENT,
  `colegio_nombre` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`colegio_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;


-- -----------------------------------------------------
-- Table `db_movilidad`.`tbl_grado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_movilidad`.`tbl_grado` (
  `grado_id` INT(11) NOT NULL AUTO_INCREMENT,
  `grado_nombre` VARCHAR(50) NOT NULL,
  `grado_nivel` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`grado_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;


-- -----------------------------------------------------
-- Table `db_movilidad`.`tbl_cargo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_movilidad`.`tbl_cargo` (
  `cargo_id` INT NOT NULL AUTO_INCREMENT,
  `cargo_nombre` VARCHAR(45) NOT NULL,
  `cargo_sueldo` DOUBLE NOT NULL,
  PRIMARY KEY (`cargo_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_movilidad`.`tbl_empleado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_movilidad`.`tbl_empleado` (
  `empleado_id` INT NOT NULL AUTO_INCREMENT,
  `empleado_nombre` VARCHAR(255) NOT NULL,
  `empleado_apellido` VARCHAR(255) NOT NULL,
  `empleado_telefono` VARCHAR(45) NOT NULL,
  `supervisor_id` INT NULL,
  `cargo_id` INT NOT NULL,
  PRIMARY KEY (`empleado_id`),
  CONSTRAINT `fk_tbl_empleado_tbl_empleado1`
    FOREIGN KEY (`supervisor_id`)
    REFERENCES `db_movilidad`.`tbl_empleado` (`empleado_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_empleado_tbl_cargo1`
    FOREIGN KEY (`cargo_id`)
    REFERENCES `db_movilidad`.`tbl_cargo` (`cargo_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_movilidad`.`tbl_vehiculo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_movilidad`.`tbl_vehiculo` (
  `vehiculo_id` INT(11) NOT NULL AUTO_INCREMENT,
  `vehiculo_placa` VARCHAR(20) NOT NULL,
  `tbl_empleado_empleado_id` INT NOT NULL,
  `vehiculo_km` DOUBLE NOT NULL,
  PRIMARY KEY (`vehiculo_id`),
  CONSTRAINT `fk_tbl_vehiculo_tbl_empleado1`
    FOREIGN KEY (`tbl_empleado_empleado_id`)
    REFERENCES `db_movilidad`.`tbl_empleado` (`empleado_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;


-- -----------------------------------------------------
-- Table `db_movilidad`.`tbl_movilidad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_movilidad`.`tbl_movilidad` (
  `movilidad_id` INT(11) NOT NULL AUTO_INCREMENT,
  `movilidad_tipo_servicio` VARCHAR(45) NOT NULL,
  `movilidad_turno` VARCHAR(45) NOT NULL,
  `movilidad_seccion` VARCHAR(45) NOT NULL,
  `movilidad_docente` VARCHAR(255) NOT NULL,
  `movilidad_pago` DOUBLE NOT NULL DEFAULT '0',
  `colegio_id` INT(11) NOT NULL,
  `apoderado_id` INT(11) NOT NULL,
  `grado_id` INT(11) NOT NULL,
  `vehiculo_id` INT(11) NOT NULL,
  `alumno_id` INT(11) NOT NULL,
  PRIMARY KEY (`movilidad_id`),
  CONSTRAINT `fk_movilidad_tbl_alumno1`
    FOREIGN KEY (`alumno_id`)
    REFERENCES `db_movilidad`.`tbl_alumno` (`alumno_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_movilidad_tbl_apoderado1`
    FOREIGN KEY (`apoderado_id`)
    REFERENCES `db_movilidad`.`tbl_apoderado` (`apoderado_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_movilidad_tbl_colegio1`
    FOREIGN KEY (`colegio_id`)
    REFERENCES `db_movilidad`.`tbl_colegio` (`colegio_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_movilidad_tbl_grado1`
    FOREIGN KEY (`grado_id`)
    REFERENCES `db_movilidad`.`tbl_grado` (`grado_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_movilidad_tbl_vehiculo1`
    FOREIGN KEY (`vehiculo_id`)
    REFERENCES `db_movilidad`.`tbl_vehiculo` (`vehiculo_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;


-- -----------------------------------------------------
-- Table `db_movilidad`.`tbl_forma_pago`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_movilidad`.`tbl_forma_pago` (
  `forma_pago_id` INT NOT NULL AUTO_INCREMENT,
  `forma_pago_nombre` VARCHAR(45) NOT NULL,
  `forma_pago_referencia` VARCHAR(100) NULL,
  PRIMARY KEY (`forma_pago_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_movilidad`.`tbl_movilidad_pago`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_movilidad`.`tbl_movilidad_pago` (
  `movilidad_pago_id` INT NOT NULL AUTO_INCREMENT,
  `movilidad_pago_fecha` DATE NOT NULL,
  `movilidad_pago_monto` DOUBLE NOT NULL DEFAULT 0,
  `movilidad_id` INT(11) NOT NULL,
  `forma_pago_id` INT NOT NULL,
  PRIMARY KEY (`movilidad_pago_id`),
  CONSTRAINT `fk_tbl_movilidad_pago_tbl_movilidad1`
    FOREIGN KEY (`movilidad_id`)
    REFERENCES `db_movilidad`.`tbl_movilidad` (`movilidad_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_movilidad_pago_tbl_forma_pago1`
    FOREIGN KEY (`forma_pago_id`)
    REFERENCES `db_movilidad`.`tbl_forma_pago` (`forma_pago_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_movilidad`.`tbl_vehiculo_gasto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_movilidad`.`tbl_vehiculo_gasto` (
  `vehiculo_gasto_id` INT NOT NULL AUTO_INCREMENT,
  `vehiculo_gasto_descripcion` LONGTEXT NULL,
  `vehiculo_gasto_monto` DOUBLE NULL DEFAULT 0,
  `vehiculo_gasto_fecha` DATE NULL,
  `vehiculo_id` INT(11) NOT NULL,
  PRIMARY KEY (`vehiculo_gasto_id`),
  CONSTRAINT `fk_tbl_vehiculo_gasto_tbl_vehiculo1`
    FOREIGN KEY (`vehiculo_id`)
    REFERENCES `db_movilidad`.`tbl_vehiculo` (`vehiculo_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_movilidad`.`tbl_alumno_horario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_movilidad`.`tbl_alumno_horario` (
  `alumno_horario_id` INT NOT NULL AUTO_INCREMENT,
  `alumno_horario_ingreso` TIME NOT NULL,
  `alumno_horario_salida` TIME NOT NULL,
  `alumno_id` INT(11) NOT NULL,
  PRIMARY KEY (`alumno_horario_id`),
  CONSTRAINT `fk_tbl_alumno_horario_tbl_alumno1`
    FOREIGN KEY (`alumno_id`)
    REFERENCES `db_movilidad`.`tbl_alumno` (`alumno_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_movilidad`.`tbl_zona`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_movilidad`.`tbl_zona` (
  `zona_id` INT NOT NULL AUTO_INCREMENT,
  `zona_nombre` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`zona_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_movilidad`.`tbl_movilidad_ruta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_movilidad`.`tbl_movilidad_ruta` (
  `movilidad_ruta_id` INT NOT NULL,
  `movilidad_ruta_direccion` VARCHAR(255) NOT NULL,
  `movilidad_ruta_hora_recojo` TIME NULL,
  `movilidad_ruta_hora_retorno` TIME NULL,
  `zona_id` INT NOT NULL,
  `movilidad_id` INT(11) NOT NULL,
  PRIMARY KEY (`movilidad_ruta_id`),
  CONSTRAINT `fk_tbl_movilidad_ruta_tbl_zona1`
    FOREIGN KEY (`zona_id`)
    REFERENCES `db_movilidad`.`tbl_zona` (`zona_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_movilidad_ruta_tbl_movilidad1`
    FOREIGN KEY (`movilidad_id`)
    REFERENCES `db_movilidad`.`tbl_movilidad` (`movilidad_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_movilidad`.`tbl_tipo_mantenimiento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_movilidad`.`tbl_tipo_mantenimiento` (
  `tipo_mantenimiento_id` INT NOT NULL AUTO_INCREMENT,
  `tipo_mantenimiento_nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`tipo_mantenimiento_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_movilidad`.`tbl_vehiculo_mantenimiento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_movilidad`.`tbl_vehiculo_mantenimiento` (
  `vehiculo_mantenimiento_id` INT NOT NULL AUTO_INCREMENT,
  `vehiculo_mantenimiento_fecha` DATE NOT NULL,
  `vehiculo_mantenimiento_observacion` LONGTEXT NULL,
  `vehiculo_mantenimiento_fecha_futura` DATE NOT NULL,
  `vehiculo_mantenimiento_km` DOUBLE NOT NULL,
  `tipo_mantenimiento_id` INT NOT NULL,
  `vehiculo_id` INT(11) NOT NULL,
  PRIMARY KEY (`vehiculo_mantenimiento_id`),
  CONSTRAINT `fk_tbl_vehiculo_mantenimiento_tbl_tipo_mantenimiento1`
    FOREIGN KEY (`tipo_mantenimiento_id`)
    REFERENCES `db_movilidad`.`tbl_tipo_mantenimiento` (`tipo_mantenimiento_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_vehiculo_mantenimiento_tbl_vehiculo1`
    FOREIGN KEY (`vehiculo_id`)
    REFERENCES `db_movilidad`.`tbl_vehiculo` (`vehiculo_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_movilidad`.`empleado_honorario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_movilidad`.`empleado_honorario` (
  `empleado_honorario_id` INT NOT NULL AUTO_INCREMENT,
  `empleado_honorario_monto` DOUBLE NOT NULL,
  `empleado_honorario_fecha` DATE NOT NULL,
  `tbl_empleado_empleado_id` INT NOT NULL,
  PRIMARY KEY (`empleado_honorario_id`),
  CONSTRAINT `fk_empleado_honorario_tbl_empleado1`
    FOREIGN KEY (`tbl_empleado_empleado_id`)
    REFERENCES `db_movilidad`.`tbl_empleado` (`empleado_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;