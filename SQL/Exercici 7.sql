-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Exercici 7
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Exercici 7
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Exercici 7` ;
USE `Exercici 7` ;

-- -----------------------------------------------------
-- Table `Exercici 7`.`Empleat`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici 7`.`Empleat` (
  `ID` INT NOT NULL,
  `Nom` VARCHAR(40) NOT NULL,
  `Adreça` VARCHAR(100) NOT NULL,
  `Datanaixament` DATE NOT NULL,
  `Edat` INT NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `ID_UNIQUE` (`ID` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Exercici 7`.`Ticket`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici 7`.`Ticket` (
  `ID` INT NOT NULL,
  `Numfactura` VARCHAR(10) NOT NULL,
  `DataiHora` DATETIME NOT NULL,
  `TotalIVAinclos` FLOAT NOT NULL,
  `Empleat_ID` INT NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `ID_UNIQUE` (`ID` ASC) VISIBLE,
  INDEX `fk_Ticket_Empleat_idx` (`Empleat_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Ticket_Empleat`
    FOREIGN KEY (`Empleat_ID`)
    REFERENCES `Exercici 7`.`Empleat` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Exercici 7`.`Producte`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici 7`.`Producte` (
  `CodiIntern` INT NOT NULL,
  `Descripcio` VARCHAR(50) NOT NULL,
  `CodiBarres` VARCHAR(13) NOT NULL,
  `PreuVenta` FLOAT NOT NULL,
  `CuotalIVA` FLOAT NOT NULL,
  `PVP` FLOAT NOT NULL,
  PRIMARY KEY (`CodiIntern`),
  UNIQUE INDEX `CodiIntern_UNIQUE` (`CodiIntern` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Exercici 7`.`Liniaticket`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici 7`.`Liniaticket` (
  `ID` INT NOT NULL,
  `Codiproducte` VARCHAR(45) NOT NULL,
  `DescripcioProd` VARCHAR(45) NOT NULL,
  `Unitats` VARCHAR(45) NOT NULL,
  `Descompte` VARCHAR(45) NOT NULL,
  `PreuUnitari` VARCHAR(45) NOT NULL,
  `PreuLinia` VARCHAR(45) NOT NULL,
  `Ticket_ID` INT NOT NULL,
  `Producte_CodiIntern` INT NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `ID_UNIQUE` (`ID` ASC) VISIBLE,
  INDEX `fk_Liniaticket_Ticket1_idx` (`Ticket_ID` ASC) VISIBLE,
  INDEX `fk_Liniaticket_Producte1_idx` (`Producte_CodiIntern` ASC) VISIBLE,
  CONSTRAINT `fk_Liniaticket_Ticket1`
    FOREIGN KEY (`Ticket_ID`)
    REFERENCES `Exercici 7`.`Ticket` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Liniaticket_Producte1`
    FOREIGN KEY (`Producte_CodiIntern`)
    REFERENCES `Exercici 7`.`Producte` (`CodiIntern`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
