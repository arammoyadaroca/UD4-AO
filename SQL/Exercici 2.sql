-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Exerici2
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Exerici2
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Exerici2` ;
USE `Exerici2` ;

-- -----------------------------------------------------
-- Table `Exerici2`.`Cine`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exerici2`.`Cine` (
  `Nom` VARCHAR(30) NOT NULL,
  `Adreça` VARCHAR(100) NOT NULL,
  `Telefon` VARCHAR(20) NOT NULL,
  `Tarifa_Cine` VARCHAR(40) NOT NULL,
  `ID` INT NOT NULL,
  `Num_sales` TINYINT NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `ID_UNIQUE` (`ID` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Exerici2`.`Tarifa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exerici2`.`Tarifa` (
  `Cine` INT NOT NULL,
  `Preu` FLOAT NOT NULL,
  `Tipo_de_tarifa_ID` VARCHAR(20) NOT NULL,
  `Cine_ID` INT NOT NULL,
  PRIMARY KEY (`Cine`),
  UNIQUE INDEX `Cine_UNIQUE` (`Cine` ASC) VISIBLE,
  INDEX `fk_Tarifa_Cine1_idx` (`Cine_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Tarifa_Cine1`
    FOREIGN KEY (`Cine_ID`)
    REFERENCES `Exerici2`.`Cine` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Exerici2`.`Pel·licula`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exerici2`.`Pel·licula` (
  `Titol` VARCHAR(100) NOT NULL,
  `ID` INT NOT NULL,
  `Projecció_Peli` INT NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `ID_UNIQUE` (`ID` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Exerici2`.`Projecció`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exerici2`.`Projecció` (
  `Data` DATE NOT NULL,
  `Sala` TINYINT NOT NULL,
  `Cine_ID` INT NOT NULL,
  `Peli` INT NOT NULL,
  `Hora` TIME NOT NULL,
  `Pel·licula_ID` INT NOT NULL,
  INDEX `fk_Projecció_Cine1_idx` (`Cine_ID` ASC) VISIBLE,
  PRIMARY KEY (`Peli`),
  UNIQUE INDEX `Peli_UNIQUE` (`Peli` ASC) VISIBLE,
  INDEX `fk_Projecció_Pel·licula1_idx` (`Pel·licula_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Projecció_Cine1`
    FOREIGN KEY (`Cine_ID`)
    REFERENCES `Exerici2`.`Cine` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Projecció_Pel·licula1`
    FOREIGN KEY (`Pel·licula_ID`)
    REFERENCES `Exerici2`.`Pel·licula` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
