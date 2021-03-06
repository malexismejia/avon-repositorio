-- MySQL Script generated by MySQL Workbench
-- Sat May  9 21:18:50 2020
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema avon
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema avon
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `avon` DEFAULT CHARACTER SET latin1 ;
USE `avon` ;

-- -----------------------------------------------------
-- Table `avon`.`tipousuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `avon`.`tipousuario` (
  `idtipousuario` INT NOT NULL,
  `tipo_usuario` BIT(1) NULL,
  `descripcion` VARCHAR(30) NULL,
  PRIMARY KEY (`idtipousuario`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_spanish_ci;


-- -----------------------------------------------------
-- Table `avon`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `avon`.`usuario` (
  `idusuario` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NULL,
  `usuario` VARCHAR(10) NULL,
  `clave` VARCHAR(100) NULL,
  `correo` VARCHAR(100) NULL,
  `telcel` VARCHAR(9) NULL,
  `telfijo` VARCHAR(9) NULL,
  `idtipousuario` INT NOT NULL,
  `fechacreacion` DATE NULL,
  `fechainicio` DATE NULL,
  `estado` BIT(1) NULL,
  PRIMARY KEY (`idusuario`),
  UNIQUE INDEX `idusuario_UNIQUE` (`idusuario` ASC) ,
  UNIQUE INDEX `usuario_UNIQUE` (`usuario` ASC) ,
  INDEX `fk_usuario_tipousuario1_idx` (`idtipousuario` ASC) ,
  CONSTRAINT `fk_usuario_tipousuario1`
    FOREIGN KEY (`idtipousuario`)
    REFERENCES `avon`.`tipousuario` (`idtipousuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_spanish_ci;


-- -----------------------------------------------------
-- Table `avon`.`direccion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `avon`.`direccion` (
  `iddireccion` INT NOT NULL,
  `idusuario` INT NOT NULL,
  `direccion` VARCHAR(250) NULL,
  `estado` BIT(1) NULL,
  PRIMARY KEY (`iddireccion`),
  INDEX `fk_direccion_usuario_idx` (`idusuario` ASC) ,
  CONSTRAINT `fk_direccion_usuario`
    FOREIGN KEY (`idusuario`)
    REFERENCES `avon`.`usuario` (`idusuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_spanish_ci;


-- -----------------------------------------------------
-- Table `avon`.`categorias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `avon`.`categorias` (
  `idcategorias` INT NOT NULL,
  `descripcion` VARCHAR(45) NULL,
  PRIMARY KEY (`idcategorias`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_spanish_ci;


-- -----------------------------------------------------
-- Table `avon`.`tipo_campania`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `avon`.`tipo_campania` (
  `idtipo_campania` INT NOT NULL,
  `descripcion` VARCHAR(100) NULL,
  `categorias` INT NOT NULL,
  `estado` VARCHAR(45) NULL,
  PRIMARY KEY (`idtipo_campania`),
  INDEX `fk_tipo_campania_categorias1_idx` (`categorias` ASC) ,
  CONSTRAINT `fk_tipo_campania_categorias1`
    FOREIGN KEY (`categorias`)
    REFERENCES `avon`.`categorias` (`idcategorias`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_spanish_ci;


-- -----------------------------------------------------
-- Table `avon`.`campania`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `avon`.`campania` (
  `idcampania` INT NOT NULL,
  `tipo_campania` INT NOT NULL,
  `codigocampania` VARCHAR(30) NULL,
  `descripcion` VARCHAR(100) NULL,
  `fechainicio` DATE NULL,
  `fechafin` DATE NULL,
  `estado` BIT(1) NULL,
  PRIMARY KEY (`idcampania`),
  INDEX `fk_campania_tipo_campania1_idx` (`tipo_campania` ASC) ,
  CONSTRAINT `fk_campania_tipo_campania1`
    FOREIGN KEY (`tipo_campania`)
    REFERENCES `avon`.`tipo_campania` (`idtipo_campania`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_spanish_ci;


-- -----------------------------------------------------
-- Table `avon`.`productos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `avon`.`productos` (
  `idproductos` INT NOT NULL,
  `descripcion` VARCHAR(100) NULL,
  `precio` DOUBLE NULL,
  `stoc` INT(4) NULL,
  `imagen` VARCHAR(200) NULL,
  `categorias` INT NOT NULL,
  `fecha_creacion` DATE NULL,
  `estado` BIT(1) NULL,
  PRIMARY KEY (`idproductos`),
  INDEX `fk_productos_categorias1_idx` (`categorias` ASC) ,
  CONSTRAINT `fk_productos_categorias1`
    FOREIGN KEY (`categorias`)
    REFERENCES `avon`.`categorias` (`idcategorias`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_spanish_ci;


-- -----------------------------------------------------
-- Table `avon`.`formapago`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `avon`.`formapago` (
  `idformapago` INT NOT NULL,
  `descripcion` VARCHAR(100) NULL,
  `estado` BIT(1) NULL,
  PRIMARY KEY (`idformapago`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_spanish_ci;


-- -----------------------------------------------------
-- Table `avon`.`pedidos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `avon`.`pedidos` (
  `idpedidos` INT NOT NULL,
  `fechacreacion` DATE NULL,
  `usuario_add` INT NOT NULL,
  `montopedido` DOUBLE NULL,
  `dui_cliente` VARCHAR(10) NULL,
  `fecha_entrega` DATE NULL,
  `estado` BIT(1) NULL,
  `pedidoscol` VARCHAR(45) NULL,
  `idcampania` INT NOT NULL,
  `direccionentrega` VARCHAR(200) NULL,
  `idformapago` INT NOT NULL,
  PRIMARY KEY (`idpedidos`),
  INDEX `fk_pedidos_usuario1_idx` (`usuario_add` ASC) ,
  INDEX `fk_pedidos_campania1_idx` (`idcampania` ASC) ,
  INDEX `fk_pedidos_formapago1_idx` (`idformapago` ASC) ,
  CONSTRAINT `fk_pedidos_usuario1`
    FOREIGN KEY (`usuario_add`)
    REFERENCES `avon`.`usuario` (`idusuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pedidos_campania1`
    FOREIGN KEY (`idcampania`)
    REFERENCES `avon`.`campania` (`idcampania`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pedidos_formapago1`
    FOREIGN KEY (`idformapago`)
    REFERENCES `avon`.`formapago` (`idformapago`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_spanish_ci;


-- -----------------------------------------------------
-- Table `avon`.`detallepedido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `avon`.`detallepedido` (
  `iddetallepedido` INT NOT NULL,
  `idpedidos` INT NOT NULL,
  `idproductos` INT NOT NULL,
  `cantidad` INT(3) NULL,
  `precio` DOUBLE NULL,
  PRIMARY KEY (`iddetallepedido`),
  INDEX `fk_detallepedido_pedidos1_idx` (`idpedidos` ASC) ,
  INDEX `fk_detallepedido_productos1_idx` (`idproductos` ASC) ,
  CONSTRAINT `fk_detallepedido_pedidos1`
    FOREIGN KEY (`idpedidos`)
    REFERENCES `avon`.`pedidos` (`idpedidos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_detallepedido_productos1`
    FOREIGN KEY (`idproductos`)
    REFERENCES `avon`.`productos` (`idproductos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_spanish_ci;


-- -----------------------------------------------------
-- Table `avon`.`abono`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `avon`.`abono` (
  `idabono` INT NOT NULL,
  `idpedidos` INT NOT NULL,
  `monto` DOUBLE NULL,
  `fechaabono` DATE NULL,
  PRIMARY KEY (`idabono`),
  INDEX `fk_abono_pedidos1_idx` (`idpedidos` ASC) ,
  CONSTRAINT `fk_abono_pedidos1`
    FOREIGN KEY (`idpedidos`)
    REFERENCES `avon`.`pedidos` (`idpedidos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_spanish_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
