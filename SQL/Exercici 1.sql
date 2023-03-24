-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Exercici 1
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Exercici 1
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Exercici 1` ;
USE `Exercici 1` ;

-- -----------------------------------------------------
-- Table `Exercici 1`.`Pacient`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici 1`.`Pacient` (
  `NumerosegSocial INT` VARCHAR(12) NOT NULL,
  `Nom` VARCHAR(40) NOT NULL,
  `Cognoms` VARCHAR(100) NOT NULL,
  `Telefon` VARCHAR(20) NOT NULL,
  `Adreça` VARCHAR(150) NOT NULL,
  `DNI` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`NumerosegSocial INT`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Exercici 1`.`Metge`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici 1`.`Metge` (
  `Numero Colegiat` VARCHAR(9) NOT NULL,
  `DNI` VARCHAR(45) NOT NULL,
  `Nom` VARCHAR(40) NOT NULL,
  `Cognoms` VARCHAR(100) NOT NULL,
  `Carrer` VARCHAR(20) NOT NULL,
  `Especialitat` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`Numero Colegiat`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Exercici 1`.`Consulta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici 1`.`Consulta` (
  `Pacient_NumerosegSocial INT1` VARCHAR(12) NOT NULL,
  `Metge_Numero Colegiat` VARCHAR(9) NOT NULL,
  `Numero_planta` INT NOT NULL,
  `NumLLit` INT NOT NULL,
  `Data_Vista` DATE NOT NULL,
  `Diagnostic_inicial` VARCHAR(255) NOT NULL,
  INDEX `fk_Consulta_Pacient_idx` (`Pacient_NumerosegSocial INT1` ASC) VISIBLE,
  INDEX `fk_Consulta_Metge1_idx` (`Metge_Numero Colegiat` ASC) VISIBLE,
  CONSTRAINT `fk_Consulta_Pacient`
    FOREIGN KEY (`Pacient_NumerosegSocial INT1`)
    REFERENCES `Exercici 1`.`Pacient` (`NumerosegSocial INT`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Consulta_Metge1`
    FOREIGN KEY (`Metge_Numero Colegiat`)
    REFERENCES `Exercici 1`.`Metge` (`Numero Colegiat`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
