-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 18, 2020 at 08:01 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fooddom`
--

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `res_name` varchar(50) NOT NULL,
  `res_address` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `food`
--

CREATE TABLE `food` (
  `food_ID` int(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `number_range` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `func_random`
--

CREATE TABLE `func_random` (
  `func_ID` int(10) NOT NULL,
  `date` varchar(19) NOT NULL,
  `have_price` tinyint(1) NOT NULL,
  `username` varchar(20) NOT NULL,
  `res_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `func_select`
--

CREATE TABLE `func_select` (
  `func_ID` int(10) NOT NULL,
  `date` varchar(19) NOT NULL,
  `have_price` tinyint(1) NOT NULL,
  `username` varchar(20) NOT NULL,
  `res_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

CREATE TABLE `member` (
  `username` varchar(20) NOT NULL,
  `password` varchar(100) NOT NULL,
  `Fname` varchar(50) NOT NULL,
  `Lname` varchar(50) NOT NULL,
  `phone` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `res_name` varchar(50) NOT NULL,
  `food_ID` int(20) NOT NULL,
  `prices` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `rangeprice`
--

CREATE TABLE `rangeprice` (
  `number_range` int(11) NOT NULL,
  `price_range` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ref_range`
--

CREATE TABLE `ref_range` (
  `res_name` varchar(50) NOT NULL,
  `number_range` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `restaurant`
--

CREATE TABLE `restaurant` (
  `name` varchar(50) NOT NULL,
  `open_close` varchar(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tables`
--

CREATE TABLE `tables` (
  `No_Table` int(20) NOT NULL,
  `res_name` varchar(50) NOT NULL,
  `chair` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`res_name`,`res_address`);

--
-- Indexes for table `food`
--
ALTER TABLE `food`
  ADD PRIMARY KEY (`food_ID`),
  ADD KEY `number_range` (`number_range`);

--
-- Indexes for table `func_random`
--
ALTER TABLE `func_random`
  ADD PRIMARY KEY (`func_ID`),
  ADD KEY `username` (`username`,`res_name`),
  ADD KEY `res_name` (`res_name`);

--
-- Indexes for table `func_select`
--
ALTER TABLE `func_select`
  ADD PRIMARY KEY (`func_ID`),
  ADD KEY `username` (`username`,`res_name`),
  ADD KEY `res_name` (`res_name`);

--
-- Indexes for table `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`res_name`,`food_ID`),
  ADD KEY `food_ID` (`food_ID`);

--
-- Indexes for table `rangeprice`
--
ALTER TABLE `rangeprice`
  ADD PRIMARY KEY (`number_range`);

--
-- Indexes for table `ref_range`
--
ALTER TABLE `ref_range`
  ADD PRIMARY KEY (`res_name`,`number_range`),
  ADD KEY `number_range` (`number_range`);

--
-- Indexes for table `restaurant`
--
ALTER TABLE `restaurant`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `tables`
--
ALTER TABLE `tables`
  ADD PRIMARY KEY (`res_name`,`No_Table`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `food`
--
ALTER TABLE `food`
  MODIFY `food_ID` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `func_random`
--
ALTER TABLE `func_random`
  MODIFY `func_ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `func_select`
--
ALTER TABLE `func_select`
  MODIFY `func_ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `address`
--
ALTER TABLE `address`
  ADD CONSTRAINT `address_ibfk_1` FOREIGN KEY (`res_name`) REFERENCES `restaurant` (`name`);

--
-- Constraints for table `food`
--
ALTER TABLE `food`
  ADD CONSTRAINT `food_ibfk_2` FOREIGN KEY (`number_range`) REFERENCES `rangeprice` (`number_range`);

--
-- Constraints for table `func_random`
--
ALTER TABLE `func_random`
  ADD CONSTRAINT `func_random_ibfk_1` FOREIGN KEY (`username`) REFERENCES `member` (`username`),
  ADD CONSTRAINT `func_random_ibfk_2` FOREIGN KEY (`res_name`) REFERENCES `restaurant` (`name`);

--
-- Constraints for table `func_select`
--
ALTER TABLE `func_select`
  ADD CONSTRAINT `func_select_ibfk_1` FOREIGN KEY (`username`) REFERENCES `member` (`username`),
  ADD CONSTRAINT `func_select_ibfk_2` FOREIGN KEY (`res_name`) REFERENCES `restaurant` (`name`);

--
-- Constraints for table `menu`
--
ALTER TABLE `menu`
  ADD CONSTRAINT `menu_ibfk_1` FOREIGN KEY (`res_name`) REFERENCES `restaurant` (`name`),
  ADD CONSTRAINT `menu_ibfk_2` FOREIGN KEY (`food_ID`) REFERENCES `food` (`food_ID`);

--
-- Constraints for table `ref_range`
--
ALTER TABLE `ref_range`
  ADD CONSTRAINT `ref_range_ibfk_1` FOREIGN KEY (`res_name`) REFERENCES `restaurant` (`name`),
  ADD CONSTRAINT `ref_range_ibfk_2` FOREIGN KEY (`number_range`) REFERENCES `rangeprice` (`number_range`);

--
-- Constraints for table `tables`
--
ALTER TABLE `tables`
  ADD CONSTRAINT `tables_ibfk_1` FOREIGN KEY (`res_name`) REFERENCES `restaurant` (`name`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
