CREATE TABLE `loginTable` (
	`id` INT(25) NOT NULL AUTO_INCREMENT UNIQUE,
	`userIDCode` INT(25) NOT NULL UNIQUE,
	`password` varchar(255) NOT NULL,
	`isAdmin` BOOLEAN NOT NULL DEFAULT 'false',
	PRIMARY KEY (`userIDCode`)
);

CREATE TABLE `schoolCodes` (
	`id` INT(25) NOT NULL AUTO_INCREMENT UNIQUE,
	`schoolCode` INT(25) NOT NULL UNIQUE,
	`SchoolName` varchar(25) NOT NULL UNIQUE,
	PRIMARY KEY (`schoolCode`)
);

CREATE TABLE `userSchool` (
	`id` INT(25) NOT NULL AUTO_INCREMENT UNIQUE,
	`userIDCode` INT(25) NOT NULL AUTO_INCREMENT UNIQUE,
	`schoolCode` INT(25) NOT NULL,
	PRIMARY KEY (`userIDCode`)
);

CREATE TABLE `testView` (
	`id` INT(25) NOT NULL AUTO_INCREMENT UNIQUE,
	`userIDCode` INT(25) NOT NULL,
	`schoolCode` INT(25) NOT NULL,
	`testID` INT(25) NOT NULL,
	PRIMARY KEY (`userIDCode`)
);

CREATE TABLE `AnswerTabel` (
	`id` INT(25) NOT NULL AUTO_INCREMENT UNIQUE,
	`userIDCode` INT(25) NOT NULL,
	`answerArray` varchar(255) NOT NULL,
	`testID` INT(25) NOT NULL,
	PRIMARY KEY (`userIDCode`)
);

CREATE TABLE `testDetails` (
	`id` INT(25) NOT NULL AUTO_INCREMENT UNIQUE,
	`testID` INT(25) NOT NULL UNIQUE,
	`testLocation` varchar(255) NOT NULL
);

ALTER TABLE `userSchool` ADD CONSTRAINT `userSchool_fk0` FOREIGN KEY (`userIDCode`) REFERENCES `loginTable`(`userIDCode`);

ALTER TABLE `userSchool` ADD CONSTRAINT `userSchool_fk1` FOREIGN KEY (`schoolCode`) REFERENCES `schoolCodes`(`schoolCode`);

ALTER TABLE `testView` ADD CONSTRAINT `testView_fk0` FOREIGN KEY (`userIDCode`) REFERENCES `loginTable`(`userIDCode`);

ALTER TABLE `testView` ADD CONSTRAINT `testView_fk1` FOREIGN KEY (`schoolCode`) REFERENCES `schoolCodes`(`schoolCode`);

ALTER TABLE `testView` ADD CONSTRAINT `testView_fk2` FOREIGN KEY (`testID`) REFERENCES `testDetails`(`testID`);

ALTER TABLE `AnswerTabel` ADD CONSTRAINT `AnswerTabel_fk0` FOREIGN KEY (`userIDCode`) REFERENCES `loginTable`(`userIDCode`);

ALTER TABLE `AnswerTabel` ADD CONSTRAINT `AnswerTabel_fk1` FOREIGN KEY (`testID`) REFERENCES `testDetails`(`testID`);

