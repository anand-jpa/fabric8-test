DROP DATABASE IF EXISTS `neweshop`;
CREATE DATABASE IF NOT EXISTS `neweshop`;
USE `neweshop`;

DROP TABLE IF EXISTS `address`;

CREATE TABLE `address` (
  `addressId` int(11) NOT NULL AUTO_INCREMENT,
  `city` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `phoneNumber` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `streetName` varchar(255) DEFAULT NULL,
  `userId` int(11) NOT NULL,
  `zipCode` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`addressId`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
INSERT INTO `address` (`addressId`, `city`, `country`, `phoneNumber`, `state`, `streetName`, `userId`, `zipCode`) VALUES
	(1, 'navin', 'India', '898988989', 'naqvin', 'navin', 1, '133123'),
	(2, 'navin', 'inhw', 'qqwnasdf', 'ncvain', 'navin', 2, 'n'),
	(3, 'navin', 'navin', 'navin', 'navin', 'navin', 3, 'navin');
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;

CREATE TABLE `cart` (
  `cartId` int(11) NOT NULL AUTO_INCREMENT,
  `grandTotal` double NOT NULL,
  `sessionId` varchar(255) DEFAULT NULL,
  `userId` int(11) NOT NULL,
  PRIMARY KEY (`cartId`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=latin1;


--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
INSERT INTO `cart` (`cartId`, `grandTotal`, `sessionId`, `userId`) VALUES
	(1, 123, '4D64643D207A01E4D35A748AAF2C8A9F', -1),
	(2, 123, '0D7E7FA65C1FE3658703B18938C879DB', -1),
	(3, 123, '1344153953746E5FEC81EED418E54883', -1),
	(4, 123, '54EE9806985F6DA99AE6901FDDA985B4', -1),
	(5, 123, '1253CBB2EDF26ED234D075A410C791AD', -1),
	(6, 0, '052ECD9442D0D76F5A5C376707D1CACF', -1),
	(7, 0, '3EDBC5748CCEE1F37DD184EB4095C7A6', -1),
	(8, 123, '7C43E7C9BB5F21630C14BBA038B51497', -1),
	(9, 123, '906DB212D4981B1BD5FF607A025F177D', -1);
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categoryId` int(11) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `manufacturer` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `price` double NOT NULL,
  `status` bit(1) DEFAULT NULL,
  `unitInStock` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
INSERT INTO `product` (`id`, `categoryId`, `description`, `manufacturer`, `name`, `price`, `status`, `unitInStock`) VALUES
	(1, 1, NULL, NULL, 'Bikestar', 123, b'0', 213),
	(2, 3, NULL, NULL, '123', 123, b'0', 123);
UNLOCK TABLES;

--
-- Table structure for table `cartItem`
--

DROP TABLE IF EXISTS `cartItem`;
CREATE TABLE `cartItem` (
  `cartItemId` int(11) NOT NULL AUTO_INCREMENT,
  `quantity` int(11) NOT NULL,
  `totalPrice` double NOT NULL,
  `cartId` int(11) DEFAULT NULL,
  `productId` int(11) DEFAULT NULL,
  PRIMARY KEY (`cartItemId`),
  KEY `FK5EDA53A3C40D94` (`productId`),
  KEY `FK5EDA53C21CEAE0` (`cartId`),
  CONSTRAINT `FK5EDA53A3C40D94` FOREIGN KEY (`productId`) REFERENCES `product` (`id`),
  CONSTRAINT `FK5EDA53C21CEAE0` FOREIGN KEY (`cartId`) REFERENCES `cart` (`cartId`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cartItem`
--

LOCK TABLES `cartItem` WRITE;
INSERT INTO `cartItem` (`cartItemId`, `quantity`, `totalPrice`, `cartId`, `productId`) VALUES
	(1, 1, 123, 1, 1),
	(2, 1, 123, 2, 1),
	(3, 1, 123, 3, 1),
	(4, 1, 123, 4, 1),
	(5, 1, 123, 5, 1),
	(6, 1, 123, 8, 1),
	(7, 1, 123, 9, 1);
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categoryName` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
INSERT INTO `category` (`id`, `categoryName`, `description`) VALUES
	(1, '12345', '123'),
	(2, '123', '123'),
	(3, '234567', '234');
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
CREATE TABLE `payment` (
  `paymentId` int(11) NOT NULL AUTO_INCREMENT,
  `CreditCardNumber` varchar(255) DEFAULT NULL,
  `cardType` varchar(255) DEFAULT NULL,
  `cvv` varchar(255) DEFAULT NULL,
  `expirationDate` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`paymentId`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
INSERT INTO `payment` (`paymentId`, `CreditCardNumber`, `cardType`, `cvv`, `expirationDate`) VALUES
	(1, '989898989898', 'Visa', '7878', '03/2022'),
	(2, 'asdkj', 'Visa', 'aqdklj', '03/2016'),
	(3, '1231233', 'Visa', '123', '01/2017');
UNLOCK TABLES;

--
-- Table structure for table `storeOrder`
--

DROP TABLE IF EXISTS `storeOrder`;
CREATE TABLE `storeOrder` (
  `orderGenId` int(11) NOT NULL AUTO_INCREMENT,
  `addressId` int(11) NOT NULL,
  `cartId` int(11) NOT NULL,
  `date` date DEFAULT NULL,
  `paymentId` int(11) NOT NULL,
  `status` varchar(255) DEFAULT NULL,
  `userId` int(11) NOT NULL,
  PRIMARY KEY (`orderGenId`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `storeOrder`
--

LOCK TABLES `storeOrder` WRITE;
INSERT INTO `storeOrder` (`orderGenId`, `addressId`, `cartId`, `date`, `paymentId`, `status`, `userId`) VALUES
	(1, 1, 1, NULL, 1, 'P', 1),
	(2, 2, 2, '2017-06-02', 2, 'P', 2),
	(3, 3, 3, '2017-06-06', 3, 'P', 3);
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `emailAddress` varchar(255) DEFAULT NULL,
  `enabled` bit(1) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
INSERT INTO `user` (`userId`, `emailAddress`, `enabled`, `name`, `password`, `role`) VALUES
	(1, 'navin@kl.conm', b'1', 'navin', 'navin', 'ADMIN\r\n'),
	(2, 'sdnvkn', b'1', 'navinqweqwe', 'XXRCxsQC', 'USER'),
	(3, 'nvin@kl.com', b'1', 'navin', 'IZWvmJI8', 'USER'),
	(4, 'admin@admin.com', b'1', 'admin', 'admin', 'ADMIN'),
	(5, 'joker@joker.com', b'1', 'joker', 'joker', 'USER'),
	(6, 'vivek170607034214614@xyz.com', b'1', 'vivek170607034214614', 'yG2PtZ70', 'USER'),
	(7, 'nm@nm.com', b'1', 'nm', 'nm', 'USER'),
	(8, 'op@op.com', b'1', 'op', 'op', 'USER'),
	(9, 'vivek170628115134634@xyz.com', b'1', 'vivek170628115134634', '8itywsv4', 'USER');
UNLOCK TABLES;
