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