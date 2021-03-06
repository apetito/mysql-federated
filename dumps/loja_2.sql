-- MySQL Script generated by MySQL Workbench
-- sex 30 abr 2021 12:31:34 -03
-- Model: Federated Sample    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema loja_2
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `loja_2` DEFAULT CHARACTER SET utf8 ;
USE `loja_2` ;

-- -----------------------------------------------------
-- Table `loja_2`.`category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `loja_2`.`category` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `loja_2`.`product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `loja_2`.`product` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `category_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_product_category_idx` (`category_id` ASC),
  CONSTRAINT `fk_product_category`
    FOREIGN KEY (`category_id`)
    REFERENCES `loja_2`.`category` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `loja_2`.`customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `loja_2`.`customer` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NULL,
  `email` VARCHAR(255) NULL,
  PRIMARY KEY (`id`))
ENGINE=FEDERATED connection='mysql://root:root@171.0.0.20:3306/loja_1/customer';


-- -----------------------------------------------------
-- Table `loja_2`.`customer_has_product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `loja_2`.`customer_has_product` (
  `customer_id` INT NOT NULL,
  `product_id` INT NOT NULL,
  PRIMARY KEY (`customer_id`, `product_id`),
  INDEX `fk_customer_has_product_product1_idx` (`product_id` ASC),
  INDEX `fk_customer_has_product_customer1_idx` (`customer_id` ASC),
  CONSTRAINT `fk_customer_has_product_customer1`
    FOREIGN KEY (`customer_id`)
    REFERENCES `mydb`.`customer` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_customer_has_product_product1`
    FOREIGN KEY (`product_id`)
    REFERENCES `mydb`.`product` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -------------------------------------------------------
-- Adding data
-- -------------------------------------------------------
INSERT INTO `loja_2`.`category` (`name`) values ('categoria C');
INSERT INTO `loja_2`.`category` (`name`) values ('categoria D');

INSERT INTO `loja_2`.`product` (`name`, `category_id`) values ('Produto E', 1);
INSERT INTO `loja_2`.`product` (`name`, `category_id`) values ('Produto F', 1);
INSERT INTO `loja_2`.`product` (`name`, `category_id`) values ('Produto G', 2);
INSERT INTO `loja_2`.`product` (`name`, `category_id`) values ('Produto H', 2);

INSERT INTO `loja_2`.`customer` (`name`, `email`) values ('Jill Waters', 'jillwaters@email.com');
INSERT INTO `loja_2`.`customer` (`name`, `email`) values ('Rex Hanson', 'rexhanson@email.com');
INSERT INTO `loja_2`.`customer` (`name`, `email`) values ('Colin Parsons', 'colinparsons@email.com');

INSERT INTO `loja_2`.`customer_has_product` (`customer_id`, `product_id`) values (3,1);
INSERT INTO `loja_2`.`customer_has_product` (`customer_id`, `product_id`) values (4,2);
INSERT INTO `loja_2`.`customer_has_product` (`customer_id`, `product_id`) values (5,1);
INSERT INTO `loja_2`.`customer_has_product` (`customer_id`, `product_id`) values (6,1);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
