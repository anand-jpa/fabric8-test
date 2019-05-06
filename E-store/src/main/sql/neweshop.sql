-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.1.38-community - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL Version:             9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for neweshop
DROP DATABASE IF EXISTS `neweshop`;
CREATE DATABASE IF NOT EXISTS `neweshop` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `neweshop`;

-- Dumping data for table neweshop.address: ~3 rows (approximately)
DELETE FROM `address`;

INSERT INTO `address` (`addressId`, `city`, `country`, `phoneNumber`, `state`, `streetName`, `userId`, `zipCode`) VALUES
	(1, 'navin', 'India', '898988989', 'naqvin', 'navin', 1, '133123'),
	(2, 'navin', 'inhw', 'qqwnasdf', 'ncvain', 'navin', 2, 'n'),
	(3, 'navin', 'navin', 'navin', 'navin', 'navin', 3, 'navin');


-- Dumping data for table neweshop.cart: ~9 rows (approximately)
DELETE FROM `cart`;

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

-- Dumping data for table neweshop.cartitem: ~7 rows (approximately)
DELETE FROM `cartitem`;

INSERT INTO `cartitem` (`cartItemId`, `quantity`, `totalPrice`, `cartId`, `productId`) VALUES
	(1, 1, 123, 1, 1),
	(2, 1, 123, 2, 1),
	(3, 1, 123, 3, 1),
	(4, 1, 123, 4, 1),
	(5, 1, 123, 5, 1),
	(6, 1, 123, 8, 1),
	(7, 1, 123, 9, 1);

-- Dumping data for table neweshop.category: ~3 rows (approximately)
DELETE FROM `category`;

INSERT INTO `category` (`id`, `categoryName`, `description`) VALUES
	(1, '12345', '123'),
	(2, '123', '123'),
	(3, '234567', '234');

-- Dumping data for table neweshop.payment: ~3 rows (approximately)
DELETE FROM `payment`;

INSERT INTO `payment` (`paymentId`, `CreditCardNumber`, `cardType`, `cvv`, `expirationDate`) VALUES
	(1, '989898989898', 'Visa', '7878', '03/2022'),
	(2, 'asdkj', 'Visa', 'aqdklj', '03/2016'),
	(3, '1231233', 'Visa', '123', '01/2017');

-- Dumping data for table neweshop.product: ~2 rows (approximately)
DELETE FROM `product`;

INSERT INTO `product` (`id`, `categoryId`, `description`, `manufacturer`, `name`, `price`, `status`, `unitInStock`) VALUES
	(1, 1, NULL, NULL, 'Bikestar', 123, b'0', 213),
	(2, 3, NULL, NULL, '123', 123, b'0', 123);


-- Dumping data for table neweshop.storeorder: ~3 rows (approximately)
DELETE FROM `storeorder`;

INSERT INTO `storeorder` (`orderGenId`, `addressId`, `cartId`, `date`, `paymentId`, `status`, `userId`) VALUES
	(1, 1, 1, NULL, 1, 'P', 1),
	(2, 2, 2, '2017-06-02', 2, 'P', 2),
	(3, 3, 3, '2017-06-06', 3, 'P', 3);

-- Dumping data for table neweshop.user: ~9 rows (approximately)
DELETE FROM `user`;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
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