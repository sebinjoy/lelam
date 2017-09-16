-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.0.45-community-nt - MySQL Community Edition (GPL)
-- Server OS:                    Win32
-- HeidiSQL Version:             9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for db_lelam
CREATE DATABASE IF NOT EXISTS `db_lelam` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `db_lelam`;

-- Dumping structure for table db_lelam.fddeback_admin
CREATE TABLE IF NOT EXISTS `fddeback_admin` (
  `f_id` int(11) NOT NULL auto_increment,
  `feedback` varchar(50) default NULL,
  `author` varchar(50) default NULL,
  `date` varchar(50) default NULL,
  PRIMARY KEY  (`f_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table db_lelam.tbl_bank
CREATE TABLE IF NOT EXISTS `tbl_bank` (
  `bank_id` int(11) NOT NULL auto_increment,
  `bank_amt` varchar(50) default NULL,
  PRIMARY KEY  (`bank_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table db_lelam.tbl_bidder
CREATE TABLE IF NOT EXISTS `tbl_bidder` (
  `bid_id` int(11) NOT NULL auto_increment,
  `product_id` varchar(50) default NULL,
  `buyer_id` varchar(50) default NULL,
  `bid_date` varchar(50) default NULL,
  `bid_price` varchar(50) default NULL,
  PRIMARY KEY  (`bid_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table db_lelam.tbl_category
CREATE TABLE IF NOT EXISTS `tbl_category` (
  `cat_id` int(11) NOT NULL,
  `cat_name` varchar(50) default NULL,
  PRIMARY KEY  (`cat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table db_lelam.tbl_dist
CREATE TABLE IF NOT EXISTS `tbl_dist` (
  `dist_id` int(11) NOT NULL,
  `state_id` int(11) NOT NULL,
  `dist_name` varchar(50) default NULL,
  PRIMARY KEY  (`dist_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table db_lelam.tbl_feedback
CREATE TABLE IF NOT EXISTS `tbl_feedback` (
  `f_id` int(11) NOT NULL auto_increment,
  `feedback` varchar(50) default NULL,
  `buyer_id` varchar(50) default NULL,
  `seller_id` varchar(50) default NULL,
  `date` varchar(50) default NULL,
  PRIMARY KEY  (`f_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table db_lelam.tbl_login
CREATE TABLE IF NOT EXISTS `tbl_login` (
  `username` varchar(50) NOT NULL,
  `pwd` varchar(50) NOT NULL,
  PRIMARY KEY  (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table db_lelam.tbl_product
CREATE TABLE IF NOT EXISTS `tbl_product` (
  `product_id` int(11) NOT NULL auto_increment,
  `cat_id` varchar(50) default NULL,
  `seller_id` varchar(50) default NULL,
  `product_name` varchar(50) default NULL,
  `description` varchar(50) default NULL,
  `min_bidprice` varchar(50) default NULL,
  `photo` varchar(50) default NULL,
  `startdate` varchar(50) default NULL,
  `enddate` varchar(50) default NULL,
  `status` varchar(50) default NULL,
  PRIMARY KEY  (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table db_lelam.tbl_state
CREATE TABLE IF NOT EXISTS `tbl_state` (
  `state_id` int(11) NOT NULL,
  `state_name` varchar(50) default NULL,
  PRIMARY KEY  (`state_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table db_lelam.tbl_userbuyer
CREATE TABLE IF NOT EXISTS `tbl_userbuyer` (
  `buyer_id` int(11) NOT NULL auto_increment,
  `first_name` varchar(50) default NULL,
  `lastname` varchar(50) default NULL,
  `gender` varchar(50) default NULL,
  `address` varchar(50) default NULL,
  `country` varchar(50) default NULL,
  `state` varchar(50) default NULL,
  `city` varchar(50) default NULL,
  `e_mail` varchar(50) default NULL,
  `pwd` varchar(50) default NULL,
  `photo` varchar(50) default NULL,
  `cc_number` varchar(50) default NULL,
  `status` int(11) default NULL,
  PRIMARY KEY  (`buyer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table db_lelam.tbl_userseller
CREATE TABLE IF NOT EXISTS `tbl_userseller` (
  `seller_id` int(11) NOT NULL auto_increment,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) default NULL,
  `gender` varchar(50) default NULL,
  `address` varchar(50) default NULL,
  `country` varchar(50) default NULL,
  `state` varchar(50) default NULL,
  `city` varchar(50) default NULL,
  `e_mail` varchar(50) default NULL,
  `pwd` varchar(50) default NULL,
  `photo` varchar(50) default NULL,
  `cc_number` varchar(50) default NULL,
  `status` int(11) default NULL,
  PRIMARY KEY  (`seller_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
