-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Apr 25, 2019 at 07:04 AM
-- Server version: 5.7.21
-- PHP Version: 5.6.35

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `herbs`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
CREATE TABLE IF NOT EXISTS `cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `users_id` int(11) NOT NULL,
  `products_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_cart_users1_idx` (`users_id`),
  KEY `fk_cart_products1_idx` (`products_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `herbalist`
--

DROP TABLE IF EXISTS `herbalist`;
CREATE TABLE IF NOT EXISTS `herbalist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` longtext,
  `location` text,
  `contact` varchar(45) DEFAULT NULL,
  `description` longtext,
  `Image` text,
  `password` text,
  `key` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `herbalist`
--

INSERT INTO `herbalist` (`id`, `Name`, `location`, `contact`, `description`, `Image`, `password`, `key`) VALUES
(1, 'KAZIRE', 'MBARARA', '0773411516', 'GOOD STUFF', 'NONE', '123', '123'),
(2, 'wefwefw', 'wefwefwef', '', NULL, NULL, '123', NULL),
(3, 'sdgvsgsd', 'sdgsdgsdg', '', NULL, NULL, 'sdgsdgsgsd', NULL),
(4, 'wegfwegfw', 'gwgwegweg', '', NULL, NULL, 'wegwegw', NULL),
(5, 'eegsegse', 'wsegsegsge', 'wegwegw', NULL, NULL, 'wegweg', NULL),
(6, 'eegsegse', 'wsegsegsge', 'wegwegw', NULL, NULL, 'wegweg', NULL),
(7, 'eegsegse', 'wsegsegsge', 'wegwegw', NULL, NULL, 'wegweg', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `herbs`
--

DROP TABLE IF EXISTS `herbs`;
CREATE TABLE IF NOT EXISTS `herbs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `herbname` varchar(45) DEFAULT NULL,
  `localname` text,
  `image` longtext,
  `preparation` longtext,
  `diseases` longtext,
  `rating` varchar(45) DEFAULT NULL,
  `descritpion` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `likedherbs`
--

DROP TABLE IF EXISTS `likedherbs`;
CREATE TABLE IF NOT EXISTS `likedherbs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `users_id` int(11) NOT NULL,
  `herbs_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_likedherbs_users_idx` (`users_id`),
  KEY `fk_likedherbs_herbs1_idx` (`herbs_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
CREATE TABLE IF NOT EXISTS `messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message` longtext,
  `subject` varchar(45) DEFAULT NULL,
  `herbalist_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_messages_herbalist1_idx` (`herbalist_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `message`, `subject`, `herbalist_id`) VALUES
(3, 'xsxsxxsxsxs', 'xsxsxsx', 1),
(4, 'sxcdc', 'dcdcdcc', 1),
(5, 'sxcdc', 'dcdcdcc', 1),
(6, '', '', 1),
(7, 'ytjtryutrjtyutyt', 'yutyutyu', 1),
(8, 'ytjtryutrjtyutyt', 'yutyutyu', 1),
(9, 'rr', '', 1),
(10, 'rr', '', 1),
(11, 'rr', '', 1),
(12, 'rr', '', 1),
(13, 'rr', '', 1),
(14, '', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `herbname` varchar(256) DEFAULT NULL,
  `image` longtext,
  `diseases` longtext,
  `rating` varchar(45) DEFAULT NULL,
  `cost` int(11) DEFAULT NULL,
  `herbalist_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_herbs_herbalist1_idx` (`herbalist_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `herbname`, `image`, `diseases`, `rating`, `cost`, `herbalist_id`) VALUES
(1, 'sdvcsdvsdvdsv', 'http://169.254.148.6/herbappApis/uploads/28881_1555896900.jpeg', 'sdvsdvsdvs', '0', 34555, 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text,
  `phone` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `phone`) VALUES
(1, 'jose', '123'),
(2, 'balinda', 'balinda'),
(3, 'sdcsdcdsc', 'sdcsdcdsc'),
(4, 'sdcsdcdsc', 'sdcsdcdsc'),
(5, 'sdcsdcdsc', '239889322'),
(6, 'scwcwecvwecw', '0773411515'),
(7, 'wvbwjbvwj', '0773411516'),
(8, 'dcfvdfvdfvd', 'dfvdfvfv'),
(9, 'nixc', '0712419327'),
(10, 'tydftyucftyu', '7677'),
(11, 'hgvdghujdws', '');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `fk_cart_products1` FOREIGN KEY (`products_id`) REFERENCES `products` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_cart_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `likedherbs`
--
ALTER TABLE `likedherbs`
  ADD CONSTRAINT `fk_likedherbs_herbs1` FOREIGN KEY (`herbs_id`) REFERENCES `herbs` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_likedherbs_users` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `fk_messages_herbalist1` FOREIGN KEY (`herbalist_id`) REFERENCES `herbalist` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `fk_herbs_herbalist1` FOREIGN KEY (`herbalist_id`) REFERENCES `herbalist` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
