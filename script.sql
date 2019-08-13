-- MySQL Workbench Forward Engineering
use mydb;


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
-- Table `mydb`.`Riders Personal Info`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Riders Personal Info` (
  `Rider Name` VARCHAR(45) NOT NULL,
  `Rider Age` INT(2) NOT NULL,
  `Rider country` VARCHAR(45) NOT NULL,
  `Bike Number` INT(2) NOT NULL,
  PRIMARY KEY (`Bike Number`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Riders MotoGP Info`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Riders MotoGP Info` (
  `ID` INT(2) NOT NULL,
  `Bike Numer` INT(2) NOT NULL,
  `Career Wins` INT(5) NOT NULL,
  `Career Podiums` INT(5) NOT NULL,
  `Career GP Starts` INT(5) NOT NULL,
  `World Championships` INT(2) NOT NULL,
  `Career Pole positions` INT(2) NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk1_idx` (`Bike Numer` ASC) VISIBLE,
  CONSTRAINT `fk1`
    FOREIGN KEY (`Bike Numer`)
    REFERENCES `mydb`.`Riders Personal Info` (`Bike Number`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Previous Results`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Previous Results` (
  `Previous Result ID` INT(2) NOT NULL,
  `Bike Number` INT(2) NOT NULL,
  `Year` INT(4) NOT NULL,
  `Championship Standing` INT(10) NOT NULL,
  PRIMARY KEY (`Previous Result ID`),
  INDEX `fk2_idx` (`Bike Number` ASC) VISIBLE,
  CONSTRAINT `fk2`
    FOREIGN KEY (`Bike Number`)
    REFERENCES `mydb`.`Riders Personal Info` (`Bike Number`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Team Table`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Team Table` (
  `Team ID` INT(2) NOT NULL,
  `Team Name` VARCHAR(45) NOT NULL,
  `Bike Number` INT(2) NOT NULL,
  PRIMARY KEY (`Team ID`),
  INDEX `fk3_idx` (`Bike Number` ASC) VISIBLE,
  CONSTRAINT `fk3`
    FOREIGN KEY (`Bike Number`)
    REFERENCES `mydb`.`Riders Personal Info` (`Bike Number`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Team Stats 2018`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Team Stats 2018` (
  `Team Stats ID` INT(2) NOT NULL,
  `Team ID` INT(2) NOT NULL,
  `Number of Wins` INT(2) NOT NULL,
  `Number of Podiums` INT(2) NOT NULL,
  `Number of Poles` INT(2) NOT NULL,
  `2018 Standing` INT(2) NOT NULL,
  `Total Points` INT(5) NOT NULL,
  PRIMARY KEY (`Team Stats ID`),
  INDEX `fk4_idx` (`Team ID` ASC) VISIBLE,
  CONSTRAINT `fk4`
    FOREIGN KEY (`Team ID`)
    REFERENCES `mydb`.`Team Table` (`Team ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Calender Table 2018`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Calender Table 2018` (
  `Race ID` INT(2) NOT NULL,
  `Race winner` INT(2) NOT NULL,
  `Grand Prix Name` VARCHAR(100) NOT NULL,
  `Country` VARCHAR(45) NOT NULL,
  `Grand Prix Race Date` DATETIME NOT NULL,
  `Grand Prix Qualifing Date` DATETIME NOT NULL,
  PRIMARY KEY (`Race ID`),
  INDEX `fk6_idx` (`Race winner` ASC) VISIBLE,
  CONSTRAINT `fk6`
    FOREIGN KEY (`Race winner`)
    REFERENCES `mydb`.`Riders Personal Info` (`Bike Number`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Race Result Table`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Race Result Table` (
  ` race result ID` INT(2) NOT NULL,
  `Bike Number` INT(2) NOT NULL,
  `Rider Time` float(10) NOT NULL,
  `Race ID` INT(2) NOT NULL,
  `Points Obtained` INT(2) NOT NULL,
  PRIMARY KEY (` race result ID`),
  INDEX `fk7_idx` (`Bike Number` ASC) VISIBLE,
  INDEX `fk8_idx` (`Race ID` ASC) VISIBLE,
  CONSTRAINT `fk7`
    FOREIGN KEY (`Bike Number`)
    REFERENCES `mydb`.`Riders Personal Info` (`Bike Number`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk8`
    FOREIGN KEY (`Race ID`)
    REFERENCES `mydb`.`Calender Table 2018` (`Race ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Riders points Table`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Riders points Table` (
  `Rider point ID` INT(2) NOT NULL,
  `Bike Number` INT(2) NOT NULL,
  `Points` INT(5) NOT NULL,
  `Number of Race Wins` INT(2) NOT NULL,
  `Number of Pole Positions` INT(2) NOT NULL,
  `Championship standing` INT (10),
  PRIMARY KEY (`Rider point ID`),
  INDEX `fk9_idx` (`Bike Number` ASC) VISIBLE,
  CONSTRAINT `fk9`
    FOREIGN KEY (`Bike Number`)
    REFERENCES `mydb`.`Riders Personal Info` (`Bike Number`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `mydb`.`Riders Personal Info`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`Riders Personal Info` (`Rider Name`, `Rider Age`, `Rider country`, `Bike Number`) VALUES ('Andrea Dovizioso', 32, 'Italy', 4);
INSERT INTO `mydb`.`Riders Personal Info` (`Rider Name`, `Rider Age`, `Rider country`, `Bike Number`) VALUES ('Johaan Zarco', 28, 'France', 5);
INSERT INTO `mydb`.`Riders Personal Info` (`Rider Name`, `Rider Age`, `Rider country`, `Bike Number`) VALUES ('Danilo Petrucci', 28, 'Italy', 9);
INSERT INTO `mydb`.`Riders Personal Info` (`Rider Name`, `Rider Age`, `Rider country`, `Bike Number`) VALUES ('Xavier Simeon', 29, 'Belgian', 10);
INSERT INTO `mydb`.`Riders Personal Info` (`Rider Name`, `Rider Age`, `Rider country`, `Bike Number`) VALUES ('Tom Luthi', 32, 'Switzerland', 12);
INSERT INTO `mydb`.`Riders Personal Info` (`Rider Name`, `Rider Age`, `Rider country`, `Bike Number`) VALUES ('Karel Abraham', 28, 'Czech Republic', 17);
INSERT INTO `mydb`.`Riders Personal Info` (`Rider Name`, `Rider Age`, `Rider country`, `Bike Number`) VALUES ('Alvaro Bautista', 34, 'Spain', 19);
INSERT INTO `mydb`.`Riders Personal Info` (`Rider Name`, `Rider Age`, `Rider country`, `Bike Number`) VALUES ('Franco Morbidelli', 24, 'Italy', 21);
INSERT INTO `mydb`.`Riders Personal Info` (`Rider Name`, `Rider Age`, `Rider country`, `Bike Number`) VALUES ('Maverick Vinales', 23, 'Spain', 25);
INSERT INTO `mydb`.`Riders Personal Info` (`Rider Name`, `Rider Age`, `Rider country`, `Bike Number`) VALUES ('Dani Pedrosa', 33, 'Spain', 26);
INSERT INTO `mydb`.`Riders Personal Info` (`Rider Name`, `Rider Age`, `Rider country`, `Bike Number`) VALUES ('Andrea Innone', 29, 'Italy', 29);
INSERT INTO `mydb`.`Riders Personal Info` (`Rider Name`, `Rider Age`, `Rider country`, `Bike Number`) VALUES ('Takaaki Nakagami', 26, 'Japan', 30);
INSERT INTO `mydb`.`Riders Personal Info` (`Rider Name`, `Rider Age`, `Rider country`, `Bike Number`) VALUES ('Cal Crutchlow', 33, 'England', 35);
INSERT INTO `mydb`.`Riders Personal Info` (`Rider Name`, `Rider Age`, `Rider country`, `Bike Number`) VALUES ('Bradley Smith', 28, 'England', 38);
INSERT INTO `mydb`.`Riders Personal Info` (`Rider Name`, `Rider Age`, `Rider country`, `Bike Number`) VALUES ('Aleix Espargaro', 29, 'Spain', 41);
INSERT INTO `mydb`.`Riders Personal Info` (`Rider Name`, `Rider Age`, `Rider country`, `Bike Number`) VALUES ('Alex Rins', 23, 'Spain', 42);
INSERT INTO `mydb`.`Riders Personal Info` (`Rider Name`, `Rider Age`, `Rider country`, `Bike Number`) VALUES ('Jack Miller', 23, 'Australia', 43);
INSERT INTO `mydb`.`Riders Personal Info` (`Rider Name`, `Rider Age`, `Rider country`, `Bike Number`) VALUES ('Pol Espargaro', 27, 'Spain', 44);
INSERT INTO `mydb`.`Riders Personal Info` (`Rider Name`, `Rider Age`, `Rider country`, `Bike Number`) VALUES ('Scott Redding', 25, 'England', 45);
INSERT INTO `mydb`.`Riders Personal Info` (`Rider Name`, `Rider Age`, `Rider country`, `Bike Number`) VALUES ('Valentino Rossi', 39, 'Italy', 46);
INSERT INTO `mydb`.`Riders Personal Info` (`Rider Name`, `Rider Age`, `Rider country`, `Bike Number`) VALUES ('Tito Rabat', 29, 'Spain', 53);
INSERT INTO `mydb`.`Riders Personal Info` (`Rider Name`, `Rider Age`, `Rider country`, `Bike Number`) VALUES ('Hafizh Syahrin', 24, 'Malaysia', 55);
INSERT INTO `mydb`.`Riders Personal Info` (`Rider Name`, `Rider Age`, `Rider country`, `Bike Number`) VALUES ('Marc Marquez', 25, 'Spain', 93);
INSERT INTO `mydb`.`Riders Personal Info` (`Rider Name`, `Rider Age`, `Rider country`, `Bike Number`) VALUES ('Jorge Lorenzo', 31, 'Spain', 99);

COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb`.`Riders MotoGP Info`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`Riders MotoGP Info` (`ID`, `Bike Numer`, `Career Wins`, `Career Podiums`, `Career GP Starts`, `World Championships`, `Career Pole positions`) VALUES (1, 4, 21, 92, 294, 1, 20);
INSERT INTO `mydb`.`Riders MotoGP Info` (`ID`, `Bike Numer`, `Career Wins`, `Career Podiums`, `Career GP Starts`, `World Championships`, `Career Pole positions`) VALUES (2, 5, 16, 47, 174, 2, 23);
INSERT INTO `mydb`.`Riders MotoGP Info` (`ID`, `Bike Numer`, `Career Wins`, `Career Podiums`, `Career GP Starts`, `World Championships`, `Career Pole positions`) VALUES (3, 9, 0, 6, 118, 0, 0);
INSERT INTO `mydb`.`Riders MotoGP Info` (`ID`, `Bike Numer`, `Career Wins`, `Career Podiums`, `Career GP Starts`, `World Championships`, `Career Pole positions`) VALUES (4, 10, 1, 4, 144, 0, 2);
INSERT INTO `mydb`.`Riders MotoGP Info` (`ID`, `Bike Numer`, `Career Wins`, `Career Podiums`, `Career GP Starts`, `World Championships`, `Career Pole positions`) VALUES (5, 12, 16, 57, 267, 1, 12);
INSERT INTO `mydb`.`Riders MotoGP Info` (`ID`, `Bike Numer`, `Career Wins`, `Career Podiums`, `Career GP Starts`, `World Championships`, `Career Pole positions`) VALUES (6, 17, 1, 0, 195, 0, 0);
INSERT INTO `mydb`.`Riders MotoGP Info` (`ID`, `Bike Numer`, `Career Wins`, `Career Podiums`, `Career GP Starts`, `World Championships`, `Career Pole positions`) VALUES (7, 19, 16, 49, 274, 1, 18);
INSERT INTO `mydb`.`Riders MotoGP Info` (`ID`, `Bike Numer`, `Career Wins`, `Career Podiums`, `Career GP Starts`, `World Championships`, `Career Pole positions`) VALUES (8, 21, 8, 6, 87, 1, 6);
INSERT INTO `mydb`.`Riders MotoGP Info` (`ID`, `Bike Numer`, `Career Wins`, `Career Podiums`, `Career GP Starts`, `World Championships`, `Career Pole positions`) VALUES (9, 25, 21, 56, 139, 1, 17);
INSERT INTO `mydb`.`Riders MotoGP Info` (`ID`, `Bike Numer`, `Career Wins`, `Career Podiums`, `Career GP Starts`, `World Championships`, `Career Pole positions`) VALUES (10, 26, 54, 153, 295, 3, 49);
INSERT INTO `mydb`.`Riders MotoGP Info` (`ID`, `Bike Numer`, `Career Wins`, `Career Podiums`, `Career GP Starts`, `World Championships`, `Career Pole positions`) VALUES (11, 29, 13, 35, 246, 0, 10);
INSERT INTO `mydb`.`Riders MotoGP Info` (`ID`, `Bike Numer`, `Career Wins`, `Career Podiums`, `Career GP Starts`, `World Championships`, `Career Pole positions`) VALUES (12, 30, 2, 14, 157, 0, 5);
INSERT INTO `mydb`.`Riders MotoGP Info` (`ID`, `Bike Numer`, `Career Wins`, `Career Podiums`, `Career GP Starts`, `World Championships`, `Career Pole positions`) VALUES (13, 35, 3, 16, 138, 0, 4);
INSERT INTO `mydb`.`Riders MotoGP Info` (`ID`, `Bike Numer`, `Career Wins`, `Career Podiums`, `Career GP Starts`, `World Championships`, `Career Pole positions`) VALUES (14, 38, 2, 11, 145, 0, 6);
INSERT INTO `mydb`.`Riders MotoGP Info` (`ID`, `Bike Numer`, `Career Wins`, `Career Podiums`, `Career GP Starts`, `World Championships`, `Career Pole positions`) VALUES (15, 41, 0, 2, 265, 0, 2);
INSERT INTO `mydb`.`Riders MotoGP Info` (`ID`, `Bike Numer`, `Career Wins`, `Career Podiums`, `Career GP Starts`, `World Championships`, `Career Pole positions`) VALUES (16, 42, 12, 45, 119, 0, 17);
INSERT INTO `mydb`.`Riders MotoGP Info` (`ID`, `Bike Numer`, `Career Wins`, `Career Podiums`, `Career GP Starts`, `World Championships`, `Career Pole positions`) VALUES (17, 43, 7, 11, 105, 0, 9);
INSERT INTO `mydb`.`Riders MotoGP Info` (`ID`, `Bike Numer`, `Career Wins`, `Career Podiums`, `Career GP Starts`, `World Championships`, `Career Pole positions`) VALUES (18, 44, 15, 45, 152, 1, 17);
INSERT INTO `mydb`.`Riders MotoGP Info` (`ID`, `Bike Numer`, `Career Wins`, `Career Podiums`, `Career GP Starts`, `World Championships`, `Career Pole positions`) VALUES (19, 45, 4, 18, 120, 0, 3);
INSERT INTO `mydb`.`Riders MotoGP Info` (`ID`, `Bike Numer`, `Career Wins`, `Career Podiums`, `Career GP Starts`, `World Championships`, `Career Pole positions`) VALUES (20, 46, 115, 232, 383, 9, 65);
INSERT INTO `mydb`.`Riders MotoGP Info` (`ID`, `Bike Numer`, `Career Wins`, `Career Podiums`, `Career GP Starts`, `World Championships`, `Career Pole positions`) VALUES (21, 53, 13, 36, 160, 1, 16);
INSERT INTO `mydb`.`Riders MotoGP Info` (`ID`, `Bike Numer`, `Career Wins`, `Career Podiums`, `Career GP Starts`, `World Championships`, `Career Pole positions`) VALUES (22, 55, 0, 3, 96, 0, 0);
INSERT INTO `mydb`.`Riders MotoGP Info` (`ID`, `Bike Numer`, `Career Wins`, `Career Podiums`, `Career GP Starts`, `World Championships`, `Career Pole positions`) VALUES (23, 93, 70, 116, 186, 7, 80);
INSERT INTO `mydb`.`Riders MotoGP Info` (`ID`, `Bike Numer`, `Career Wins`, `Career Podiums`, `Career GP Starts`, `World Championships`, `Career Pole positions`) VALUES (24, 99, 68, 152, 266, 5, 69);

COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb`.`Previous Results`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`Previous Results` (`Previous Result ID`, `Bike Number`, `Year`, `Championship Standing`) VALUES (1, 4, 2018, 2);
INSERT INTO `mydb`.`Previous Results` (`Previous Result ID`, `Bike Number`, `Year`, `Championship Standing`) VALUES (2, 5, 2018, 6);
INSERT INTO `mydb`.`Previous Results` (`Previous Result ID`, `Bike Number`, `Year`, `Championship Standing`) VALUES (3, 9, 2018, 8);
INSERT INTO `mydb`.`Previous Results` (`Previous Result ID`, `Bike Number`, `Year`, `Championship Standing`) VALUES (4, 10, 2018, 23);
INSERT INTO `mydb`.`Previous Results` (`Previous Result ID`, `Bike Number`, `Year`, `Championship Standing`) VALUES (5, 12, 2018, 24);
INSERT INTO `mydb`.`Previous Results` (`Previous Result ID`, `Bike Number`, `Year`, `Championship Standing`) VALUES (6, 17, 2018, 22);
INSERT INTO `mydb`.`Previous Results` (`Previous Result ID`, `Bike Number`, `Year`, `Championship Standing`) VALUES (7, 19, 2018, 12);
INSERT INTO `mydb`.`Previous Results` (`Previous Result ID`, `Bike Number`, `Year`, `Championship Standing`) VALUES (8, 21, 2018, 15);
INSERT INTO `mydb`.`Previous Results` (`Previous Result ID`, `Bike Number`, `Year`, `Championship Standing`) VALUES (9, 25, 2018, 4);
INSERT INTO `mydb`.`Previous Results` (`Previous Result ID`, `Bike Number`, `Year`, `Championship Standing`) VALUES (10, 26, 2018, 11);
INSERT INTO `mydb`.`Previous Results` (`Previous Result ID`, `Bike Number`, `Year`, `Championship Standing`) VALUES (11, 29, 2018, 10);
INSERT INTO `mydb`.`Previous Results` (`Previous Result ID`, `Bike Number`, `Year`, `Championship Standing`) VALUES (12, 30, 2018, 33);
INSERT INTO `mydb`.`Previous Results` (`Previous Result ID`, `Bike Number`, `Year`, `Championship Standing`) VALUES (13, 35, 2018, 7);
INSERT INTO `mydb`.`Previous Results` (`Previous Result ID`, `Bike Number`, `Year`, `Championship Standing`) VALUES (14, 38, 2018, 18);
INSERT INTO `mydb`.`Previous Results` (`Previous Result ID`, `Bike Number`, `Year`, `Championship Standing`) VALUES (15, 41, 2018, 17);
INSERT INTO `mydb`.`Previous Results` (`Previous Result ID`, `Bike Number`, `Year`, `Championship Standing`) VALUES (16, 42, 2018, 5);
INSERT INTO `mydb`.`Previous Results` (`Previous Result ID`, `Bike Number`, `Year`, `Championship Standing`) VALUES (17, 43, 2018, 13);
INSERT INTO `mydb`.`Previous Results` (`Previous Result ID`, `Bike Number`, `Year`, `Championship Standing`) VALUES (18, 44, 2018, 14);
INSERT INTO `mydb`.`Previous Results` (`Previous Result ID`, `Bike Number`, `Year`, `Championship Standing`) VALUES (19, 45, 2018, 21);
INSERT INTO `mydb`.`Previous Results` (`Previous Result ID`, `Bike Number`, `Year`, `Championship Standing`) VALUES (20, 46, 2018, 3);
INSERT INTO `mydb`.`Previous Results` (`Previous Result ID`, `Bike Number`, `Year`, `Championship Standing`) VALUES (21, 53, 2018, 19);
INSERT INTO `mydb`.`Previous Results` (`Previous Result ID`, `Bike Number`, `Year`, `Championship Standing`) VALUES (22, 55, 2018, 16);
INSERT INTO `mydb`.`Previous Results` (`Previous Result ID`, `Bike Number`, `Year`, `Championship Standing`) VALUES (23, 93, 2018, 1);
INSERT INTO `mydb`.`Previous Results` (`Previous Result ID`, `Bike Number`, `Year`, `Championship Standing`) VALUES (24, 99, 2018, 9);

COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb`.`Team Table`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`Team Table` (`Team ID`, `Team Name`, `Bike Number`) VALUES (1, 'Alma Pramac Racing', 9);
INSERT INTO `mydb`.`Team Table` (`Team ID`, `Team Name`, `Bike Number`) VALUES (1, 'Alma Pramac Racing', 43);
INSERT INTO `mydb`.`Team Table` (`Team ID`, `Team Name`, `Bike Number`) VALUES (2, 'Aprilia Racing Team Gresini', 41);
INSERT INTO `mydb`.`Team Table` (`Team ID`, `Team Name`, `Bike Number`) VALUES (2, 'Aprilia Racing Team Gresini', 45);
INSERT INTO `mydb`.`Team Table` (`Team ID`, `Team Name`, `Bike Number`) VALUES (3, 'Ducati Team', 4);
INSERT INTO `mydb`.`Team Table` (`Team ID`, `Team Name`, `Bike Number`) VALUES (3, 'Ducati Team', 99);
INSERT INTO `mydb`.`Team Table` (`Team ID`, `Team Name`, `Bike Number`) VALUES (4, 'Repsol Honda Team', 93);
INSERT INTO `mydb`.`Team Table` (`Team ID`, `Team Name`, `Bike Number`) VALUES (4, 'Repsol Honda Team', 26);
INSERT INTO `mydb`.`Team Table` (`Team ID`, `Team Name`, `Bike Number`) VALUES (5, 'Yamaha Factory Racing', 46);
INSERT INTO `mydb`.`Team Table` (`Team ID`, `Team Name`, `Bike Number`) VALUES (5, 'Yamaha Factory Racing', 25);
INSERT INTO `mydb`.`Team Table` (`Team ID`, `Team Name`, `Bike Number`) VALUES (6, 'Team Suzuki MotoGP', 29);
INSERT INTO `mydb`.`Team Table` (`Team ID`, `Team Name`, `Bike Number`) VALUES (6, 'Team Suzuki MotoGP', 42);
INSERT INTO `mydb`.`Team Table` (`Team ID`, `Team Name`, `Bike Number`) VALUES (7, 'Tech 3', 5);
INSERT INTO `mydb`.`Team Table` (`Team ID`, `Team Name`, `Bike Number`) VALUES (7, 'Tech 3', 55);
INSERT INTO `mydb`.`Team Table` (`Team ID`, `Team Name`, `Bike Number`) VALUES (8, 'Team LCR', 35);
INSERT INTO `mydb`.`Team Table` (`Team ID`, `Team Name`, `Bike Number`) VALUES (8, 'Team LCR', 30);
INSERT INTO `mydb`.`Team Table` (`Team ID`, `Team Name`, `Bike Number`) VALUES (9, 'Angel Nieto Team', 17);
INSERT INTO `mydb`.`Team Table` (`Team ID`, `Team Name`, `Bike Number`) VALUES (10, 'Redbull KTM Factory Racing', 44);
INSERT INTO `mydb`.`Team Table` (`Team ID`, `Team Name`, `Bike Number`) VALUES (10, 'Redbull KTM Factory Racing', 38);
INSERT INTO `mydb`.`Team Table` (`Team ID`, `Team Name`, `Bike Number`) VALUES (11, 'Marc VDS Racing', 21);
INSERT INTO `mydb`.`Team Table` (`Team ID`, `Team Name`, `Bike Number`) VALUES (11, 'Marc VDS Racing', 12);
INSERT INTO `mydb`.`Team Table` (`Team ID`, `Team Name`, `Bike Number`) VALUES (12, 'Avintia Racing', 53);
INSERT INTO `mydb`.`Team Table` (`Team ID`, `Team Name`, `Bike Number`) VALUES (12, 'Avintia Racing', 10);

COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb`.`Team Stats 2018`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`Team Stats 2018` (`Team Stats ID`, `Team ID`, `Number of Wins`, `Number of Podiums`, `Number of Poles`, `2018 Standing`, `Total Points`) VALUES (1, 1, 0, 1, 1, 5, 235);
INSERT INTO `mydb`.`Team Stats 2018` (`Team Stats ID`, `Team ID`, `Number of Wins`, `Number of Podiums`, `Number of Poles`, `2018 Standing`, `Total Points`) VALUES (2, 2, 0, 0, 0, 10, 64);
INSERT INTO `mydb`.`Team Stats 2018` (`Team Stats ID`, `Team ID`, `Number of Wins`, `Number of Podiums`, `Number of Poles`, `2018 Standing`, `Total Points`) VALUES (3, 3, 7, 13, 6, 2, 392);
INSERT INTO `mydb`.`Team Stats 2018` (`Team Stats ID`, `Team ID`, `Number of Wins`, `Number of Podiums`, `Number of Poles`, `2018 Standing`, `Total Points`) VALUES (4, 4, 9, 14, 7, 1, 438);
INSERT INTO `mydb`.`Team Stats 2018` (`Team Stats ID`, `Team ID`, `Number of Wins`, `Number of Podiums`, `Number of Poles`, `2018 Standing`, `Total Points`) VALUES (5, 5, 1, 10, 2, 3, 391);
INSERT INTO `mydb`.`Team Stats 2018` (`Team Stats ID`, `Team ID`, `Number of Wins`, `Number of Podiums`, `Number of Poles`, `2018 Standing`, `Total Points`) VALUES (6, 6, 0, 9, 0, 4, 302);
INSERT INTO `mydb`.`Team Stats 2018` (`Team Stats ID`, `Team ID`, `Number of Wins`, `Number of Podiums`, `Number of Poles`, `2018 Standing`, `Total Points`) VALUES (7, 7, 0, 3, 2, 6, 204);
INSERT INTO `mydb`.`Team Stats 2018` (`Team Stats ID`, `Team ID`, `Number of Wins`, `Number of Podiums`, `Number of Poles`, `2018 Standing`, `Total Points`) VALUES (8, 8, 1, 3, 1, 7, 191);
INSERT INTO `mydb`.`Team Stats 2018` (`Team Stats ID`, `Team ID`, `Number of Wins`, `Number of Podiums`, `Number of Poles`, `2018 Standing`, `Total Points`) VALUES (9, 9, 0, 0, 0, 8, 104);
INSERT INTO `mydb`.`Team Stats 2018` (`Team Stats ID`, `Team ID`, `Number of Wins`, `Number of Podiums`, `Number of Poles`, `2018 Standing`, `Total Points`) VALUES (10, 10, 0, 1, 0, 9, 89);
INSERT INTO `mydb`.`Team Stats 2018` (`Team Stats ID`, `Team ID`, `Number of Wins`, `Number of Podiums`, `Number of Poles`, `2018 Standing`, `Total Points`) VALUES (11, 11, 0, 0, 0, 11, 50);
INSERT INTO `mydb`.`Team Stats 2018` (`Team Stats ID`, `Team ID`, `Number of Wins`, `Number of Podiums`, `Number of Poles`, `2018 Standing`, `Total Points`) VALUES (12, 12, 0, 0, 0, 12, 37);

COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb`.`Calender Table 2018`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`Calender Table 2018` (`Race ID`, `Race winner`, `Grand Prix Name`, `Country`, `Grand Prix Race Date`, `Grand Prix Qualifing Date`) VALUES (1, 4, 'Grand Prix of Qatar', 'Qatar', '18-Mar', '17-Mar');
INSERT INTO `mydb`.`Calender Table 2018` (`Race ID`, `Race winner`, `Grand Prix Name`, `Country`, `Grand Prix Race Date`, `Grand Prix Qualifing Date`) VALUES (2, 35, 'Gran Premio Motul de la Republica Argentina', 'Argentina', '08-Apr', '07-Apr');
INSERT INTO `mydb`.`Calender Table 2018` (`Race ID`, `Race winner`, `Grand Prix Name`, `Country`, `Grand Prix Race Date`, `Grand Prix Qualifing Date`) VALUES (3, 93, 'Red Bull Grand Prix of Americas', 'United States', '22-Apr', '21-Apr');
INSERT INTO `mydb`.`Calender Table 2018` (`Race ID`, `Race winner`, `Grand Prix Name`, `Country`, `Grand Prix Race Date`, `Grand Prix Qualifing Date`) VALUES (4, 93, 'Gran Premio Red Bull de Espana', 'Spain', '06-May', '05-May');
INSERT INTO `mydb`.`Calender Table 2018` (`Race ID`, `Race winner`, `Grand Prix Name`, `Country`, `Grand Prix Race Date`, `Grand Prix Qualifing Date`) VALUES (5, 93, 'HJC Helmets Grand Prix de France', 'France', '20-May', '19-May');
INSERT INTO `mydb`.`Calender Table 2018` (`Race ID`, `Race winner`, `Grand Prix Name`, `Country`, `Grand Prix Race Date`, `Grand Prix Qualifing Date`) VALUES (6, 99, 'Gran Premio d\'Italia Oakley', 'Italy', '03-Jun', '02-Jun');
INSERT INTO `mydb`.`Calender Table 2018` (`Race ID`, `Race winner`, `Grand Prix Name`, `Country`, `Grand Prix Race Date`, `Grand Prix Qualifing Date`) VALUES (7, 99, 'Gran Premi Monster Energy de Catalunya', 'Catalunya', '17-Jun', '16-Jun');
INSERT INTO `mydb`.`Calender Table 2018` (`Race ID`, `Race winner`, `Grand Prix Name`, `Country`, `Grand Prix Race Date`, `Grand Prix Qualifing Date`) VALUES (8, 93, 'Motul TT Assen', 'Netherlands', '01-Jul', '30-Jun');
INSERT INTO `mydb`.`Calender Table 2018` (`Race ID`, `Race winner`, `Grand Prix Name`, `Country`, `Grand Prix Race Date`, `Grand Prix Qualifing Date`) VALUES (9, 93, 'Pramac Motorrad Grand Prix Deutschland', 'Germany', '15-Jul', '14-Jul');
INSERT INTO `mydb`.`Calender Table 2018` (`Race ID`, `Race winner`, `Grand Prix Name`, `Country`, `Grand Prix Race Date`, `Grand Prix Qualifing Date`) VALUES (10, 4, 'Monster Energy Grand Prix Ceske republiky', 'Czech Republic', '05-Aug', '04-Aug');
INSERT INTO `mydb`.`Calender Table 2018` (`Race ID`, `Race winner`, `Grand Prix Name`, `Country`, `Grand Prix Race Date`, `Grand Prix Qualifing Date`) VALUES (11, 99, 'Eyetime Motorrad Grand Prix von Osterreich', 'Austria', '12-Aug', '11-Aug');
INSERT INTO `mydb`.`Calender Table 2018` (`Race ID`, `Race winner`, `Grand Prix Name`, `Country`, `Grand Prix Race Date`, `Grand Prix Qualifing Date`) VALUES (12, null, 'GoPro British Grand Prix', 'England', '26-Aug', '25-Aug');
INSERT INTO `mydb`.`Calender Table 2018` (`Race ID`, `Race winner`, `Grand Prix Name`, `Country`, `Grand Prix Race Date`, `Grand Prix Qualifing Date`) VALUES (13, 4, 'Gran Premio Octo di San Marino e Della', 'Italy', '09-Sep', '08-Sep');
INSERT INTO `mydb`.`Calender Table 2018` (`Race ID`, `Race winner`, `Grand Prix Name`, `Country`, `Grand Prix Race Date`, `Grand Prix Qualifing Date`) VALUES (14, 93, 'Gran Premio Movistar de Aragon', 'Spain', '23-Sep', '22-Sep');
INSERT INTO `mydb`.`Calender Table 2018` (`Race ID`, `Race winner`, `Grand Prix Name`, `Country`, `Grand Prix Race Date`, `Grand Prix Qualifing Date`) VALUES (15, 93, 'PTT Thailand Grand Prix', 'Thailand', '07-Oct', '06-Oct');
INSERT INTO `mydb`.`Calender Table 2018` (`Race ID`, `Race winner`, `Grand Prix Name`, `Country`, `Grand Prix Race Date`, `Grand Prix Qualifing Date`) VALUES (16, 93, 'Motul Grand Prix of Japan', 'Japan', '21-Oct', '20-Oct');
INSERT INTO `mydb`.`Calender Table 2018` (`Race ID`, `Race winner`, `Grand Prix Name`, `Country`, `Grand Prix Race Date`, `Grand Prix Qualifing Date`) VALUES (17, 25, 'Michelin Australian Motorcycle Grand Prix', 'Australia', '28-Oct', '27-Oct');
INSERT INTO `mydb`.`Calender Table 2018` (`Race ID`, `Race winner`, `Grand Prix Name`, `Country`, `Grand Prix Race Date`, `Grand Prix Qualifing Date`) VALUES (18, 93, 'Shell Malaysia Motorcycle Grand Prix', 'Malaysia', '04-Nov', '03-Nov');
INSERT INTO `mydb`.`Calender Table 2018` (`Race ID`, `Race winner`, `Grand Prix Name`, `Country`, `Grand Prix Race Date`, `Grand Prix Qualifing Date`) VALUES (19, 4, 'Gran Premio Motul de la Comunitat Valenciana', 'Spain', '18-Nov', '17-Nov');

COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb`.`Riders points Table`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`Riders points Table` (`Rider point ID`, `Bike Number`, `Points`, `Number of Race Wins`, `Number of Pole Positions`) VALUES (1, 4, 245, 4, 2);
INSERT INTO `mydb`.`Riders points Table` (`Rider point ID`, `Bike Number`, `Points`, `Number of Race Wins`, `Number of Pole Positions`) VALUES (2, 5, 158, 0, 2);
INSERT INTO `mydb`.`Riders points Table` (`Rider point ID`, `Bike Number`, `Points`, `Number of Race Wins`, `Number of Pole Positions`) VALUES (3, 9, 144, 0, 0);
INSERT INTO `mydb`.`Riders points Table` (`Rider point ID`, `Bike Number`, `Points`, `Number of Race Wins`, `Number of Pole Positions`) VALUES (4, 10, 1, 0, 0);
INSERT INTO `mydb`.`Riders points Table` (`Rider point ID`, `Bike Number`, `Points`, `Number of Race Wins`, `Number of Pole Positions`) VALUES (5, 12, 0, 0, 0);
INSERT INTO `mydb`.`Riders points Table` (`Rider point ID`, `Bike Number`, `Points`, `Number of Race Wins`, `Number of Pole Positions`) VALUES (6, 17, 12, 0, 0);
INSERT INTO `mydb`.`Riders points Table` (`Rider point ID`, `Bike Number`, `Points`, `Number of Race Wins`, `Number of Pole Positions`) VALUES (7, 19, 105, 0, 0);
INSERT INTO `mydb`.`Riders points Table` (`Rider point ID`, `Bike Number`, `Points`, `Number of Race Wins`, `Number of Pole Positions`) VALUES (8, 21, 50, 0, 0);
INSERT INTO `mydb`.`Riders points Table` (`Rider point ID`, `Bike Number`, `Points`, `Number of Race Wins`, `Number of Pole Positions`) VALUES (9, 25, 193, 1, 1);
INSERT INTO `mydb`.`Riders points Table` (`Rider point ID`, `Bike Number`, `Points`, `Number of Race Wins`, `Number of Pole Positions`) VALUES (10, 26, 117, 0, 0);
INSERT INTO `mydb`.`Riders points Table` (`Rider point ID`, `Bike Number`, `Points`, `Number of Race Wins`, `Number of Pole Positions`) VALUES (11, 29, 133, 0, 0);
INSERT INTO `mydb`.`Riders points Table` (`Rider point ID`, `Bike Number`, `Points`, `Number of Race Wins`, `Number of Pole Positions`) VALUES (12, 30, 33, 0, 0);
INSERT INTO `mydb`.`Riders points Table` (`Rider point ID`, `Bike Number`, `Points`, `Number of Race Wins`, `Number of Pole Positions`) VALUES (13, 35, 148, 1, 1);
INSERT INTO `mydb`.`Riders points Table` (`Rider point ID`, `Bike Number`, `Points`, `Number of Race Wins`, `Number of Pole Positions`) VALUES (14, 38, 38, 0, 0);
INSERT INTO `mydb`.`Riders points Table` (`Rider point ID`, `Bike Number`, `Points`, `Number of Race Wins`, `Number of Pole Positions`) VALUES (15, 41, 44, 0, 0);
INSERT INTO `mydb`.`Riders points Table` (`Rider point ID`, `Bike Number`, `Points`, `Number of Race Wins`, `Number of Pole Positions`) VALUES (16, 42, 169, 0, 0);
INSERT INTO `mydb`.`Riders points Table` (`Rider point ID`, `Bike Number`, `Points`, `Number of Race Wins`, `Number of Pole Positions`) VALUES (17, 43, 91, 0, 1);
INSERT INTO `mydb`.`Riders points Table` (`Rider point ID`, `Bike Number`, `Points`, `Number of Race Wins`, `Number of Pole Positions`) VALUES (18, 44, 51, 0, 0);
INSERT INTO `mydb`.`Riders points Table` (`Rider point ID`, `Bike Number`, `Points`, `Number of Race Wins`, `Number of Pole Positions`) VALUES (19, 45, 20, 0, 0);
INSERT INTO `mydb`.`Riders points Table` (`Rider point ID`, `Bike Number`, `Points`, `Number of Race Wins`, `Number of Pole Positions`) VALUES (20, 46, 198, 0, 1);
INSERT INTO `mydb`.`Riders points Table` (`Rider point ID`, `Bike Number`, `Points`, `Number of Race Wins`, `Number of Pole Positions`) VALUES (21, 53, 35, 0, 0);
INSERT INTO `mydb`.`Riders points Table` (`Rider point ID`, `Bike Number`, `Points`, `Number of Race Wins`, `Number of Pole Positions`) VALUES (22, 55, 46, 0, 0);
INSERT INTO `mydb`.`Riders points Table` (`Rider point ID`, `Bike Number`, `Points`, `Number of Race Wins`, `Number of Pole Positions`) VALUES (23, 93, 321, 9, 7);
INSERT INTO `mydb`.`Riders points Table` (`Rider point ID`, `Bike Number`, `Points`, `Number of Race Wins`, `Number of Pole Positions`) VALUES (24, 99, 134, 3, 4);

COMMIT;




select * from `riders personal info`;
select * from `Riders MotoGP Info`;
select * from `previous results`;
select * from `calender table 2018`;
select * from `race result table`;
select * from `riders points table`;
select * from `team stats 2018`;
select * from `team table`;

Alter Table `calender table 2018` MODIFY COLUMN `Grand Prix Race Date` DATE;
alter table `calender table 2018` modify column `Grand Prix Qualifing Date` DATE;
alter table `race result table` drop column `Qualifing Time`;
alter table`race result table` modify column `Rider Time` float;

show create table `calender table 2018`;

alter table `calender table 2018` drop foreign key `fk6`;
alter table `calender table 2018` drop column `Race winner`;

select * from `race result table` where `Bike Number` = 93;
select avg(`Rider Time`) as rTime from `race result table` where `Bike Number` = 93;

SELECT MAKETIME(LPAD(SUBSTRING_INDEX('6.3', '.', 1),2,0),RPAD(SUBSTRING_INDEX('6.3', '.', -1),2,0),00);

delimiter $$
create procedure `avgtime`(in ibikeno int)
begin
declare ab int;
select `Rider Name`,`Rider Age`,`Bike Number` from `riders personal info` where `riders personal info`.`Bike Number` = ibikeno;
set ab= (select avg(`Rider Time`) as rTime from `race result table` where `Bike Number` = ibikeno);
SELECT MAKETIME(LPAD(SUBSTRING_INDEX(ab, '.', 1),2,0),RPAD(SUBSTRING_INDEX(ab, '.', -1),2,0),00) as AVGTIME;
end$$ 
delimiter ;

call avgtime(93);

select `Rider Name`,`Rider Age`,`riders points table`.`Bike Number`,Points,`Number of Race Wins`,`Number of Race Wins`,
`Number of Pole Positions`,`Championship standing` 
from `riders personal info` 
join `riders points table` 
on `riders points table`.`Bike Number`= `riders personal info`.`Bike Number`;


create view `top10` as 
select `Rider Name`,`Rider Age`,`riders personal info`.`Bike Number`,`Championship Standing` 
from  `riders personal info`
join `previous results` on `riders personal info`.`Bike Number`=`previous results`.`Bike Number`
having `Championship Standing` < 11
order by `Championship Standing` asc ;

select * from `top10`;




select `Bike Number`from `race result table` where `race result table`.`Points Obtained` >= 25;

select `Points Obtained` from `race result table` where `Bike Number` = 93;
select `Points Obtained` from `race result table` where `Bike Number` = 93 and if(`Points Obtained`>=16,'gold','silver');


create view `top15` as 
select `Rider Name`,`Rider Age`,`riders personal info`.`Bike Number`,`Championship Standing` 
from  `riders personal info`
join `previous results` on `riders personal info`.`Bike Number`=`previous results`.`Bike Number`
having `Championship Standing` < 16
order by `Championship Standing` asc ;

select * from `top15`;


CREATE TABLE `race changes` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `raceid` INT NOT NULL,
    `oldracedate` DATE,
    `time` TIME DEFAULT NULL,
    action VARCHAR(50) DEFAULT NULL
);


DELIMITER $$
CREATE TRIGGER before_update_race_date
    BEFORE UPDATE ON `calender table 2018`
    FOR EACH ROW 
BEGIN
    INSERT INTO `race changes`
    SET action = 'update',
     oldracedate = OLD.`Grand Prix Race Date`,
        raceid = OLD.`Race ID`,
        time = NOW(); 
END$$
DELIMITER ;

update `calender table 2018` set `Grand Prix Race Date` = '2018-01-01' where `Race ID`= 1;

select * from `race changes`;

