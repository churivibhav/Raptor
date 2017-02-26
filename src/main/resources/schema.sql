CREATE TABLE `Customer` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `firstName` varchar(20) NOT NULL DEFAULT '',
  `lastName` varchar(20) NOT NULL DEFAULT '',
  `email` varchar(20) NOT NULL DEFAULT '',
  `mobile` varchar(20) NOT NULL DEFAULT '',
  `dateOfBirth` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

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

