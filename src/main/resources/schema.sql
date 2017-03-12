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


INSERT INTO User(userName,userType,password)
VALUES ('gaurav','admin','pass');

CREATE TABLE `BarMenu` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `itemName` varchar(20) NOT NULL DEFAULT '',
  `type` varchar(20) NOT NULL DEFAULT '',
  `cost` INT(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

CREATE TABLE `FoodMenu` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `itemName` varchar(20) NOT NULL DEFAULT '',
  `type` varchar(20) NOT NULL DEFAULT '',
  `veg` INT(1) NOT NULL DEFAULT '0',
  `cost` INT(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

CREATE TABLE `Bill` (
  `billID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `tableNumber` varchar(20) NOT NULL DEFAULT '',
  `amount` DOUBLE(20, 2) NOT NULL DEFAULT '0',
  `taxAmount` DOUBLE(20, 2) NOT NULL DEFAULT '0',
  `totalAmount` DOUBLE(20, 2) NOT NULL DEFAULT '0',
  `paymentMode` varchar(20) DEFAULT '',
  `cardNumber` varchar(20) DEFAULT '',
  PRIMARY KEY (`billID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

ALTER TABLE Bill
  drop id;
  
ALTER TABLE Bill
  add billID int(11) unsigned NOT NULL AUTO_INCREMENT;


CREATE TABLE `Orders` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `orderItem` varchar(20) NOT NULL DEFAULT '',
  `cost` DOUBLE(20, 2) NOT NULL DEFAULT '0',
  `quantity` int(50) NOT NULL DEFAULT '0',
  `type` varchar(20) NOT NULL DEFAULT '',
  `kot` varchar(20) NOT NULL DEFAULT '',
  `bill_id` int(11),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;


ALTER TABLE `Order`
ADD CONSTRAINT `order_fk1`
FOREIGN KEY (`bill_id`)
REFERENCES `Bill`(`id`)
ON DELETE CASCADE ON UPDATE CASCADE;

CREATE TABLE `Users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `userName` varchar(20) NOT NULL DEFAULT '',
  `password` varchar(64) NOT NULL DEFAULT '',
  `userType` varchar(20) NOT NULL DEFAULT '',
  `sessionID` varchar(64) 
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

Insert into Users(userName, password, userType) values('a', 'b', 'c');


