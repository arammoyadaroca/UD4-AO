-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Exercici 5
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Exercici 5
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Exercici 5` ;
USE `Exercici 5` ;

-- -----------------------------------------------------
-- Table `Exercici 5`.`Client`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici 5`.`Client` (
  `DNI` VARCHAR(10) NOT NULL,
  `Nom` VARCHAR(40) NOT NULL,
  `Cognoms` VARCHAR(100) NOT NULL,
  `Adreça` VARCHAR(150) NOT NULL,
  `Poblacio` VARCHAR(50) NOT NULL,
  `Email 1` VARCHAR(150) NOT NULL,
  `Telefon 1` VARCHAR(20) NOT NULL,
  `NomUsuari` VARCHAR(20) NOT NULL,
  `Contrasenya` VARCHAR(20) NOT NULL,
  `NumVehicles` INT NOT NULL,
  PRIMARY KEY (`DNI`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Exercici 5`.`Vehicle`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici 5`.`Vehicle` (
  `Matricula` INT NOT NULL,
  `Client_DNI` VARCHAR(10) NOT NULL,
  `Tipus_Vehicle` VARCHAR(11) NOT NULL,
  PRIMARY KEY (`Matricula`),
  INDEX `fk_Vehicle_Client_idx` (`Client_DNI` ASC) VISIBLE,
  CONSTRAINT `fk_Vehicle_Client`
    FOREIGN KEY (`Client_DNI`)
    REFERENCES `Exercici 5`.`Client` (`DNI`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Exercici 5`.`Cita`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici 5`.`Cita` (
  `Vehicle_Matricula` INT NOT NULL,
  `Client_DNI` VARCHAR(10) NOT NULL,
  `Matricula` VARCHAR(45) NOT NULL,
  `Data` DATE NOT NULL,
  `Hora` TIME NOT NULL,
  PRIMARY KEY (`Matricula`),
  INDEX `fk_Cita_Client1_idx` (`Client_DNI` ASC) VISIBLE,
  CONSTRAINT `fk_Cita_Vehicle1`
    FOREIGN KEY (`Vehicle_Matricula`)
    REFERENCES `Exercici 5`.`Vehicle` (`Matricula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Cita_Client1`
    FOREIGN KEY (`Client_DNI`)
    REFERENCES `Exercici 5`.`Client` (`DNI`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
