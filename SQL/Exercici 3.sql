-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Alumnes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Alumnes` (
  `DNI` INT NOT NULL,
  `Nom` VARCHAR(45) NOT NULL,
  `Cognoms` VARCHAR(45) NOT NULL,
  `Email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`DNI`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Professors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Professors` (
  `DNI` INT NOT NULL,
  `Nom` VARCHAR(45) NOT NULL,
  `Cognoms` VARCHAR(45) NOT NULL,
  `Email` VARCHAR(45) NOT NULL,
  `Alumnes_DNI` INT NOT NULL,
  PRIMARY KEY (`DNI`),
  INDEX `fk_Professors_Alumnes_idx` (`Alumnes_DNI` ASC) VISIBLE,
  CONSTRAINT `fk_Professors_Alumnes`
    FOREIGN KEY (`Alumnes_DNI`)
    REFERENCES `mydb`.`Alumnes` (`DNI`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Departaments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Departaments` (
  `Nom` INT NOT NULL,
  `Professors_DNI` INT NOT NULL,
  PRIMARY KEY (`Nom`),
  INDEX `fk_Departaments_Professors1_idx` (`Professors_DNI` ASC) VISIBLE,
  CONSTRAINT `fk_Departaments_Professors1`
    FOREIGN KEY (`Professors_DNI`)
    REFERENCES `mydb`.`Professors` (`DNI`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Asignatura_dels_Cicles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Asignatura_dels_Cicles` (
  `Nom` INT NOT NULL,
  `Professors_DNI` VARCHAR(45) NOT NULL,
  `Departaments_Nom` INT NOT NULL,
  PRIMARY KEY (`Nom`),
  INDEX `fk_Asignatura_dels_Cicles_Departaments1_idx` (`Departaments_Nom` ASC) VISIBLE,
  CONSTRAINT `fk_Asignatura_dels_Cicles_Departaments1`
    FOREIGN KEY (`Departaments_Nom`)
    REFERENCES `mydb`.`Departaments` (`Nom`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
