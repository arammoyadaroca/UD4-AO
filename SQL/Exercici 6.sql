-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Exercici 6
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Exercici 6
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Exercici 6` ;
USE `Exercici 6` ;

-- -----------------------------------------------------
-- Table `Exercici 6`.`Avio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici 6`.`Avio` (
  `ID` VARCHAR(10) NOT NULL,
  `Model` VARCHAR(30) NOT NULL,
  `Capacitat` INT NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `ID_UNIQUE` (`ID` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Exercici 6`.`Vol`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici 6`.`Vol` (
  `Num_vol` INT NOT NULL,
  `Origen` VARCHAR(45) NOT NULL,
  `Desti` VARCHAR(45) NOT NULL,
  `id_avio` VARCHAR(45) NOT NULL,
  `Data_Sortida` VARCHAR(45) NOT NULL,
  `Hora_Sortida` VARCHAR(45) NOT NULL,
  `Data_Arribada` VARCHAR(45) NOT NULL,
  `Hora_Arribada` VARCHAR(45) NOT NULL,
  `Avio_ID` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`Num_vol`),
  UNIQUE INDEX `Num_vol_UNIQUE` (`Num_vol` ASC) VISIBLE,
  INDEX `fk_Vol_Avio_idx` (`Avio_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Vol_Avio`
    FOREIGN KEY (`Avio_ID`)
    REFERENCES `Exercici 6`.`Avio` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Exercici 6`.`Passatger`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici 6`.`Passatger` (
  `DNI_Passatger` INT NOT NULL,
  `Nom` VARCHAR(45) NOT NULL,
  `Cognoms` VARCHAR(45) NOT NULL,
  `Adreça` VARCHAR(45) NOT NULL,
  `Telefon` VARCHAR(45) NOT NULL,
  `Email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`DNI_Passatger`),
  UNIQUE INDEX `DNI_Passatger_UNIQUE` (`DNI_Passatger` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Exercici 6`.`Reserva`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici 6`.`Reserva` (
  `ID` INT NOT NULL,
  `Data_Reserva` VARCHAR(45) NOT NULL,
  `Vol_Num_vol` INT NOT NULL,
  `Passatger_DNI_Passatger` INT NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `ID_UNIQUE` (`ID` ASC) VISIBLE,
  INDEX `fk_Reserva_Vol1_idx` (`Vol_Num_vol` ASC) VISIBLE,
  INDEX `fk_Reserva_Passatger1_idx` (`Passatger_DNI_Passatger` ASC) VISIBLE,
  CONSTRAINT `fk_Reserva_Vol1`
    FOREIGN KEY (`Vol_Num_vol`)
    REFERENCES `Exercici 6`.`Vol` (`Num_vol`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Reserva_Passatger1`
    FOREIGN KEY (`Passatger_DNI_Passatger`)
    REFERENCES `Exercici 6`.`Passatger` (`DNI_Passatger`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
