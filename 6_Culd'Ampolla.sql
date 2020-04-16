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
-- Table `mydb`.`Address`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Address` (
  `Street` INT NOT NULL,
  `Number` VARCHAR(8) NULL,
  `Floor` VARCHAR(10) NULL,
  `Door` VARCHAR(10) NULL,
  `City` VARCHAR(45) NULL,
  `Zip` VARCHAR(45) NULL,
  `Country` VARCHAR(45) NULL,
  `Id` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Supplier`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Supplier` (
  `Id` INT NOT NULL,
  `Name` VARCHAR(45) NOT NULL,
  `Phone` VARCHAR(45) NOT NULL,
  `Fax` VARCHAR(45) NOT NULL,
  `NIFSupplier` INT(9) NOT NULL,
  `Address_Id` VARCHAR(45) NOT NULL,
  UNIQUE INDEX `IdSupplier_UNIQUE` (`Id` ASC) VISIBLE,
  PRIMARY KEY (`Id`, `Address_Id`),
  UNIQUE INDEX `NIFSupplier_UNIQUE` (`NIFSupplier` ASC) VISIBLE,
  INDEX `fk_Supplier_Address1_idx` (`Address_Id` ASC) VISIBLE,
  CONSTRAINT `fk_Supplier_Address1`
    FOREIGN KEY (`Address_Id`)
    REFERENCES `mydb`.`Address` (`Id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Glass`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Glass` (
  `Id` INT NOT NULL,
  `Brand` VARCHAR(45) NOT NULL,
  `Graduation` INT NOT NULL,
  `FrameColour` VARCHAR(45) NOT NULL,
  `GlassColour` VARCHAR(45) NOT NULL,
  `Supplier_Id` INT NOT NULL,
  `FrameMaterial` VARCHAR(45) NULL DEFAULT 'Rimless/ Acetate/ Metal',
  `Price` FLOAT NOT NULL,
  UNIQUE INDEX `IdGlass_UNIQUE` (`Id` ASC) VISIBLE,
  PRIMARY KEY (`Id`, `Price`),
  UNIQUE INDEX `BrandGlass_UNIQUE` (`Brand` ASC) VISIBLE,
  INDEX `fk_Glass_Supplier_idx` (`Supplier_Id` ASC) VISIBLE,
  UNIQUE INDEX `FrameMaterial_UNIQUE` (`FrameMaterial` ASC) VISIBLE,
  CONSTRAINT `fk_Glass_Supplier`
    FOREIGN KEY (`Supplier_Id`)
    REFERENCES `mydb`.`Supplier` (`Id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Customer` (
  `Id` INT NOT NULL,
  `Name` VARCHAR(45) NOT NULL,
  `Address` VARCHAR(45) NOT NULL,
  `Phone` VARCHAR(45) NOT NULL,
  `Referral` VARCHAR(45) NOT NULL,
  `Registration` TIMESTAMP(14) NOT NULL,
  UNIQUE INDEX `IdCustomer_UNIQUE` (`Id` ASC) VISIBLE,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Sale_manager`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Sale_manager` (
  `Id` INT NOT NULL,
  `Name` VARCHAR(45) NOT NULL,
  `Surname` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Order` (
  `Id` INT NOT NULL,
  `Customer_Id` INT NOT NULL,
  `Sale_manager_Id` INT NOT NULL,
  `Glass_Id` INT NOT NULL,
  `Glass_Price` FLOAT NOT NULL,
  PRIMARY KEY (`Id`),
  INDEX `fk_Order_Customer1_idx` (`Customer_Id` ASC) VISIBLE,
  INDEX `fk_Order_Sale_manager1_idx` (`Sale_manager_Id` ASC) VISIBLE,
  INDEX `fk_Order_Glass1_idx` (`Glass_Id` ASC, `Glass_Price` ASC) VISIBLE,
  CONSTRAINT `fk_Order_Customer1`
    FOREIGN KEY (`Customer_Id`)
    REFERENCES `mydb`.`Customer` (`Id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Order_Sale_manager1`
    FOREIGN KEY (`Sale_manager_Id`)
    REFERENCES `mydb`.`Sale_manager` (`Id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Order_Glass1`
    FOREIGN KEY (`Glass_Id` , `Glass_Price`)
    REFERENCES `mydb`.`Glass` (`Id` , `Price`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
