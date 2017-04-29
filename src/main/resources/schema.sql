CREATE TABLE `Tables` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `tableNumber` varchar(20) NOT NULL DEFAULT '',
  `type` varchar(20) NOT NULL DEFAULT '',
  `capacity` varchar(20) NOT NULL DEFAULT '',
  `isActive` varchar(2) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
INSERT INTO Tables(tableNumber,type,capacity,isActive)
VALUES ('43','Bar','5','1');
INSERT INTO Tables(tableNumber,type,capacity,isActive)
VALUES ('44','Bar','5','1');
INSERT INTO Tables(tableNumber,type,capacity,isActive)
VALUES ('45','Bar','5','1');
UPDATE Tables
SET tableNumber = 42
where id = 3;

CREATE TABLE `Waiter` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `firstName` varchar(20) NOT NULL DEFAULT '',
  `middleName` varchar(20) NOT NULL DEFAULT '',
  `lastName` varchar(20) NOT NULL DEFAULT '',
  `tableNumber` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO Waiter(firstName,middleName,lastName,tableNumber)
VALUES ('Rahul','middle','last','42');

CREATE TABLE `Users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `userName` varchar(20) NOT NULL DEFAULT '',
  `password` varchar(20) NOT NULL DEFAULT '',
  `userType` varchar(20) NOT NULL DEFAULT '',
  `sessionID` varchar(64) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO Users(userName,userType,password)
VALUES ('gaurav','admin','pass');
ALTER TABLE Users
  modify `sessionID` varchar(64) DEFAULT '';

CREATE TABLE `BarMenu` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `itemName` varchar(20) NOT NULL DEFAULT '',
  `type` varchar(20) NOT NULL DEFAULT '',
  `cost` INT(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO BarMenu(itemName,type,cost)
VALUES ('Jack Daniels','whisky',500);
INSERT INTO BarMenu(itemName,type,cost)
VALUES ('Malibu','rum',400);
INSERT INTO BarMenu(itemName,type,cost)
VALUES ('Smirnoff','vodka',400);

CREATE TABLE `FoodMenu` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `itemName` varchar(20) NOT NULL DEFAULT '',
  `type` varchar(20) NOT NULL DEFAULT '',
  `veg` INT(1) NOT NULL DEFAULT '0',
  `cost` INT(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO FoodMenu(itemName,type,veg,cost)
VALUES ('Chicken Tikka','starter',0,500);
INSERT INTO FoodMenu(itemName,type,veg,cost)
VALUES ('Paneer Kabab','starter',1,300);
INSERT INTO FoodMenu(itemName,type,veg,cost)
VALUES ('Chicken Kadai','main course',0,600);

CREATE TABLE `Bill` (
  `billID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `tableNumber` varchar(20) NOT NULL DEFAULT '',
  `amount` DOUBLE(20, 2) NOT NULL DEFAULT '0',
  `taxAmount` DOUBLE(20, 2) NOT NULL DEFAULT '0',
  `totalAmount` DOUBLE(20, 2) NOT NULL DEFAULT '0',
  `paymentMode` varchar(20) DEFAULT '',
  `cardNumber` varchar(20) DEFAULT '',
  `isActive` varchar(2) NOT NULL DEFAULT '',
  PRIMARY KEY (`billID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

ALTER TABLE Bill
  drop id;
  
ALTER TABLE Bill
  add billID int(11) unsigned NOT NULL AUTO_INCREMENT;
ALTER TABLE Bill
  add `isActive` varchar(2) NOT NULL DEFAULT '';
UPDATE Bill
SET isActive = 1
where billID = 7;


CREATE TABLE `Orders` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `orderItem` varchar(20) NOT NULL DEFAULT '',
  `cost` DOUBLE(20, 2) NOT NULL DEFAULT '0',
  `quantity` int(50) NOT NULL DEFAULT '0',
  `type` varchar(20) NOT NULL DEFAULT '',
  `kot` varchar(20) NOT NULL DEFAULT '',
  `billID` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `billID` (`billID`),
  CONSTRAINT `orders_fk1` FOREIGN KEY (billID) REFERENCES Bill(billID)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

alter table Bill add column waiterID int(11);
alter table Orders add column waiterID int(11);

alter table Bill add column creationDate DateTime NOT NULL DEFAULT CURRENT_TIMESTAMP;
alter table Orders add column creationDate DateTime NOT NULL DEFAULT CURRENT_TIMESTAMP;

alter table Bill add column modificationDate DateTime NOT NULL DEFAULT CURRENT_TIMESTAMP;
alter table Orders add column modificationDate DateTime NOT NULL DEFAULT CURRENT_TIMESTAMP;

CREATE TABLE `Cards` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `cardNumber` varchar(20) NOT NULL DEFAULT '',
  `balance` DOUBLE(20, 2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO Cards(cardNumber,balance)
VALUES ('10193',1000);

CREATE TABLE `Payments` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `paymentMode` varchar(20) NOT NULL DEFAULT '',
  `cost` DOUBLE(20, 2) NOT NULL DEFAULT '0',
  `cardNumber` varchar(20),
  `denomination` varchar(100),
  creationDate DateTime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  modificationDate DateTime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `billID` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `billID` (`billID`),
  CONSTRAINT `payments_fk1` FOREIGN KEY (billID) REFERENCES Bill(billID)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;


CREATE TABLE `TaxDetail` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `itemType` varchar(20) NOT NULL DEFAULT '',
  `taxType` varchar(20) NOT NULL DEFAULT '',
  `taxValue` DOUBLE(20, 2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO TaxDetail(itemType,taxType,taxValue)
VALUES ('FOOD','SERVICE CHARGE',5);

INSERT INTO TaxDetail(itemType,taxType,taxValue)
VALUES ('FOOD','VAT',12.5);

INSERT INTO TaxDetail(itemType,taxType,taxValue)
VALUES ('FOOD','SERVICE TAX',6);

INSERT INTO TaxDetail(itemType,taxType,taxValue)
VALUES ('BAR','SERVICE CHARGE',5);

INSERT INTO TaxDetail(itemType,taxType,taxValue)
VALUES ('BAR','VAT',5);

INSERT INTO TaxDetail(itemType,taxType,taxValue)
VALUES ('BAR','SERVICE TAX',6);

alter table Bill add column charges DOUBLE(20, 2) NOT NULL DEFAULT '0' 

alter table Bill drop column paymentMode;
alter table Bill drop column cardNumber;

CREATE TABLE `CardHistory` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `cardNumber` varchar(30) NOT NULL DEFAULT '',
  `transactionDate` DateTime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `amount` DOUBLE(20, 2) NOT NULL DEFAULT '0',
  `transactionType` varchar(20) NOT NULL DEFAULT '',
  `balance` DOUBLE(20, 2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

alter table Payments add column `transactionID` int(11) unsigned ;
ALTER TABLE Payments ADD CONSTRAINT fk_tran_id FOREIGN KEY (transactionID) REFERENCES CardHistory(id);

CREATE TABLE `DailyTransaction` (
	`id` int(11) unsigned NOT NULL AUTO_INCREMENT,
	`startTime` DateTime NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `endTime` DateTime DEFAULT CURRENT_TIMESTAMP,
    `businessDay` Date NOT NULL,
    `totalSale` DOUBLE(20, 2) DEFAULT '0',
    `barSale` DOUBLE(20, 2) DEFAULT '0',
	`foodSale` DOUBLE(20, 2) DEFAULT '0',
    `totalTax` DOUBLE(20, 2) DEFAULT '0',
    `barTax` DOUBLE(20, 2) DEFAULT '0',
    `foodTax` DOUBLE(20, 2) DEFAULT '0',
    `cashPayment` DOUBLE(20, 2) DEFAULT '0',
    `cardPayment` DOUBLE(20, 2) DEFAULT '0',
    `yoyocardPayment` DOUBLE(20, 2) DEFAULT '0',
    `isActive` int(1) unsigned NOT NULL,
    `reportFile` BLOB,
    PRIMARY KEY (`id`)
);

alter table Bill add column businessDay Date NOT NULL default '2017-01-01';

alter table DailyTransaction add column businessDay Date NOT NULL;
alter table DailyTransaction add column isActive int(1) unsigned NOT NULL;
alter table DailyTransaction add column reportFile BLOB;

alter table Bill add column userID int(11) unsigned NOT NULL;
alter table Bill add column discount int(2) unsigned;

alter table Orders add chalanID varchar(100) NOT NULL ;
alter table Orders drop column orderItem;
alter table Orders add column orderItemID int(11) unsigned NOT NULL;

update Bill set Discount=0 ;
INSERT INTO CardHistory(cardNumber,amount,transctionType,balance)
VALUES ('10193',-1200,'DEBIT', 0.0);
update Payments set transactionID=2 ;

ALTER TABLE Payments DROP FOREIGN KEY fk_tran_id;
alter table Orders modify column orderItemID varchar(10) NOT NULL;




INSERT INTO Cards(cardNumber,balance)
VALUES ('10194',3000);
INSERT INTO Cards(cardNumber,balance)
VALUES ('10195',6000);

alter table CardHistory drop column transactionType;
alter table CardHistory add column transactionType varchar(30);

INSERT INTO Tables(tableNumber,type,capacity,isActive)
VALUES ('YOYOCard','Extra','5','1');




/*for role management*/
alter table Users add role varchar(30);

INSERT INTO `Users` (`id`,`userName`,`password`,`userType`,`sessionID`,`role`) VALUES (1,'a','a','c',NULL,'Admin,Cashier');
INSERT INTO `Users` (`id`,`userName`,`password`,`userType`,`sessionID`,`role`) VALUES (2,'x','y','z',NULL,NULL);
INSERT INTO `Users` (`id`,`userName`,`password`,`userType`,`sessionID`,`role`) VALUES (3,'m','m','a',NULL,'Podium');
INSERT INTO `Users` (`id`,`userName`,`password`,`userType`,`sessionID`,`role`) VALUES (4,'b','b','b',NULL,'Admin');
INSERT INTO `Users` (`id`,`userName`,`password`,`userType`,`sessionID`,`role`) VALUES (5,'c','c','c',NULL,'Cashier');
