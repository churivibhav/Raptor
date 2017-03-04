CREATE TABLE `Tables` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `tableNumber` varchar(20) NOT NULL DEFAULT '',
  `type` varchar(20) NOT NULL DEFAULT '',
  `capacity` varchar(20) NOT NULL DEFAULT '',
  `isActive` varchar(2) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

CREATE TABLE `Waiter` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `firstName` varchar(20) NOT NULL DEFAULT '',
  `middleName` varchar(20) NOT NULL DEFAULT '',
  `lastName` varchar(20) NOT NULL DEFAULT '',
  `tableNumber` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

CREATE TABLE `User` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `userName` varchar(20) NOT NULL DEFAULT '',
  `password` varchar(20) NOT NULL DEFAULT '',
  `userType` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;


CREATE TABLE `Bill` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `tableNumber` varchar(20) NOT NULL DEFAULT '',
  `amount` DOUBLE(20, 2) NOT NULL DEFAULT '0',
  `taxAmount` DOUBLE(20, 2) NOT NULL DEFAULT '0',
  `totalAmount` DOUBLE(20, 2) NOT NULL DEFAULT '0',
  `paymentMode` varchar(20) NOT NULL DEFAULT '',
  `cardNumber` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;


CREATE TABLE `Order` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `orderItem` varchar(20) NOT NULL DEFAULT '',
  `cost` DOUBLE(20, 2) NOT NULL DEFAULT '0',
  `quantity` int(50) NOT NULL DEFAULT '0',
  `type` varchar(20) NOT NULL DEFAULT '',
  `kot` varchar(20) NOT NULL DEFAULT '',
  `bill_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`)
  
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;


ALTER TABLE `Order`
ADD CONSTRAINT `order_fk1`
FOREIGN KEY (`bill_id`)
REFERENCES `Bill`(`id`)
ON DELETE CASCADE ON UPDATE CASCADE;
