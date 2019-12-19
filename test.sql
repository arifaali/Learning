-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 19, 2019 at 05:12 AM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `test`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`` PROCEDURE `AddGeometryColumn` (`catalog` VARCHAR(64), `t_schema` VARCHAR(64), `t_name` VARCHAR(64), `geometry_column` VARCHAR(64), `t_srid` INT)  begin
  set @qwe= concat('ALTER TABLE ', t_schema, '.', t_name, ' ADD ', geometry_column,' GEOMETRY REF_SYSTEM_ID=', t_srid); PREPARE ls from @qwe; execute ls; deallocate prepare ls; end$$

CREATE DEFINER=`` PROCEDURE `DropGeometryColumn` (`catalog` VARCHAR(64), `t_schema` VARCHAR(64), `t_name` VARCHAR(64), `geometry_column` VARCHAR(64))  begin
  set @qwe= concat('ALTER TABLE ', t_schema, '.', t_name, ' DROP ', geometry_column); PREPARE ls from @qwe; execute ls; deallocate prepare ls; end$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_admin_login`
--

CREATE TABLE `tbl_admin_login` (
  `admin_id` int(11) NOT NULL,
  `user_name` varchar(30) NOT NULL,
  `user_password` text NOT NULL,
  `profile_image` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_admin_login`
--

INSERT INTO `tbl_admin_login` (`admin_id`, `user_name`, `user_password`, `profile_image`) VALUES
(1, 'admin@gmail.com', '202cb962ac59075b964b07152d234b70', '');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_banner`
--

CREATE TABLE `tbl_banner` (
  `banner_id` int(11) NOT NULL,
  `banner_caption` text NOT NULL,
  `banner_image` text NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_date` datetime NOT NULL,
  `delete_status` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_banner`
--

INSERT INTO `tbl_banner` (`banner_id`, `banner_caption`, `banner_image`, `status`, `created_date`, `modified_date`, `delete_status`) VALUES
(1, 'safsdg', 'bg.jpg', 1, '2019-11-20 12:38:05', '2019-11-20 11:19:00', 0),
(2, 'sdh', 'bg1.jpg', 1, '2019-11-20 15:49:19', '0000-00-00 00:00:00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_contact_us`
--

CREATE TABLE `tbl_contact_us` (
  `contact_id` int(11) NOT NULL,
  `contact_name` varchar(50) DEFAULT NULL,
  `contact_mob` varchar(11) DEFAULT NULL,
  `contact_address` text,
  `contact_remark` text,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_date` datetime DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '1=>New 2=>replied',
  `delete_status` int(11) NOT NULL DEFAULT '0',
  `status_remark` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_contact_us`
--

INSERT INTO `tbl_contact_us` (`contact_id`, `contact_name`, `contact_mob`, `contact_address`, `contact_remark`, `created_date`, `modified_date`, `status`, `delete_status`, `status_remark`) VALUES
(1, 'Arifa', '7412589633', 'test', 'testing', '2019-12-03 15:53:30', '2019-12-03 00:00:00', 2, 0, 'ttt');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_products`
--

CREATE TABLE `tbl_products` (
  `category` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product` text NOT NULL,
  `price` int(50) NOT NULL,
  `product_description` text,
  `delete_status` int(11) NOT NULL DEFAULT '0',
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_products`
--

INSERT INTO `tbl_products` (`category`, `product_id`, `product`, `price`, `product_description`, `delete_status`, `created_date`, `modified_date`) VALUES
(2, 3, 'aa', 1, '', 0, '2019-11-20 18:43:46', NULL),
(1, 4, '111', 12, 'dsa', 0, '2019-11-21 18:46:43', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product_category`
--

CREATE TABLE `tbl_product_category` (
  `categ_id` int(11) NOT NULL,
  `categ_name` varchar(200) NOT NULL,
  `categ_image` text NOT NULL,
  `categ_description` text NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_date` datetime DEFAULT NULL,
  `delete_status` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_product_category`
--

INSERT INTO `tbl_product_category` (`categ_id`, `categ_name`, `categ_image`, `categ_description`, `status`, `created_date`, `modified_date`, `delete_status`) VALUES
(1, 'Category12fsdfsdfsdsd', 'bg.jpg', 'Category 1sd', 1, '2019-11-14 00:49:58', '2019-11-20 10:42:00', 0),
(2, 'Category2', '1487946977-1307.jpg', 'Testing 2', 1, '2019-11-14 01:26:11', '2019-11-19 00:00:00', 1),
(3, 't', 'ff1.jpg', 'rtret', 1, '2019-11-20 12:55:19', NULL, 0),
(4, 'saddf', 'bg1.jpg', 'df', 1, '2019-11-20 14:28:11', NULL, 0),
(5, 'sfsdgfd222', 'bg11.jpg', 'fg', 1, '2019-11-20 14:38:10', '2019-11-20 10:12:00', 0),
(6, 'sdfdfg', 'bg12.jpg', 'fdg', 1, '2019-11-20 14:44:27', NULL, 0),
(7, 'gjhjk', 'ff2.jpg', 'hjl', 1, '2019-11-20 14:45:32', NULL, 0),
(8, 'dsgg', 'ff3.jpg', 'gdfh', 1, '2019-11-20 14:56:20', '2019-11-20 11:09:00', 0),
(9, 'sdgdfg', 'ff4.jpg', 'fdgdf', 1, '2019-11-20 14:57:33', '2019-11-20 00:00:00', 1),
(10, 'sds', 'ff5.jpg', 'ds', 1, '2019-11-20 15:05:37', '2019-11-20 00:00:00', 1),
(11, 'safsd', 'ff6.jpg', '', 1, '2019-11-20 15:11:43', '2019-11-20 00:00:00', 1),
(12, 'rter', 'bg13.jpg', '', 1, '2019-11-20 15:12:46', '2019-11-20 00:00:00', 1),
(13, 'fff', 'ff4.jpg', 'df', 1, '2019-11-20 15:36:23', '2019-11-20 00:00:00', 1),
(14, 'rtty', 'ff4.jpg', '', 1, '2019-11-20 15:37:48', '2019-11-20 00:00:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product_images`
--

CREATE TABLE `tbl_product_images` (
  `image_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_img` text NOT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_product_images`
--

INSERT INTO `tbl_product_images` (`image_id`, `product_id`, `product_img`, `created_date`) VALUES
(2, 3, 'bg12.jpg', '2019-11-20 18:43:46'),
(3, 3, 'bg3.jpg', '2019-11-20 18:43:46'),
(4, 4, 'bg13.jpg', '2019-11-21 18:46:43');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_admin_login`
--
ALTER TABLE `tbl_admin_login`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `tbl_banner`
--
ALTER TABLE `tbl_banner`
  ADD PRIMARY KEY (`banner_id`);

--
-- Indexes for table `tbl_contact_us`
--
ALTER TABLE `tbl_contact_us`
  ADD PRIMARY KEY (`contact_id`);

--
-- Indexes for table `tbl_products`
--
ALTER TABLE `tbl_products`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `tbl_product_category`
--
ALTER TABLE `tbl_product_category`
  ADD PRIMARY KEY (`categ_id`);

--
-- Indexes for table `tbl_product_images`
--
ALTER TABLE `tbl_product_images`
  ADD PRIMARY KEY (`image_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_admin_login`
--
ALTER TABLE `tbl_admin_login`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_banner`
--
ALTER TABLE `tbl_banner`
  MODIFY `banner_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_contact_us`
--
ALTER TABLE `tbl_contact_us`
  MODIFY `contact_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_products`
--
ALTER TABLE `tbl_products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_product_category`
--
ALTER TABLE `tbl_product_category`
  MODIFY `categ_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `tbl_product_images`
--
ALTER TABLE `tbl_product_images`
  MODIFY `image_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
