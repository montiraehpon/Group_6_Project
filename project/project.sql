-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 31, 2021 at 06:34 PM
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
-- Database: `project`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `cart_id` int(11) NOT NULL,
  `product_id` varchar(10) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_price` float NOT NULL,
  `product_imgpath` varchar(255) NOT NULL,
  `product_quantity` int(11) NOT NULL,
  `order_time` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `total_price` float DEFAULT NULL,
  `type` varchar(10) NOT NULL,
  `sp_id` varchar(10) NOT NULL,
  `cus_id` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`cart_id`, `product_id`, `product_name`, `product_price`, `product_imgpath`, `product_quantity`, `order_time`, `status`, `total_price`, `type`, `sp_id`, `cus_id`) VALUES
(2, 'PET00002', 'cat food', 15.2, 'regeg', 0, NULL, NULL, NULL, 'Pet', 'SP001', 'CUS002'),
(3, 'PET00002', 'cat food', 15.2, 'regeg', 0, NULL, NULL, NULL, 'Pet', 'SP001', 'CUS001');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `cus_id` varchar(10) NOT NULL,
  `username` varchar(50) NOT NULL,
  `cus_name` varchar(255) NOT NULL,
  `cus_imgpath` varchar(255) DEFAULT NULL,
  `phone_num` varchar(50) NOT NULL,
  `cus_gender` varchar(20) NOT NULL,
  `cus_address` varchar(255) NOT NULL,
  `cus_dob` date NOT NULL,
  `email` varchar(255) NOT NULL,
  `user_id` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`cus_id`, `username`, `cus_name`, `cus_imgpath`, `phone_num`, `cus_gender`, `cus_address`, `cus_dob`, `email`, `user_id`) VALUES
('CUS001', 'aa', 'Siti Ramlah', 'Capture.PNG', '0123456789', 'Male', 'Kampung Indah', '2021-03-30', 'siti@fake-box.com', 'USER002'),
('CUS002', 'minnie', 'minnie', NULL, '01123456789', 'Female', 'Kampung Indah', '2021-04-01', 'vichuda2086@gmail.com', 'USER006');

--
-- Triggers `customer`
--
DELIMITER $$
CREATE TRIGGER `tg_customer_insert` BEFORE INSERT ON `customer` FOR EACH ROW BEGIN
  INSERT INTO customer_seq VALUES (NULL);
  SET NEW.cus_id = CONCAT('CUS', LPAD(LAST_INSERT_ID(), 3, '0'));
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `customer_seq`
--

CREATE TABLE `customer_seq` (
  `cus_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer_seq`
--

INSERT INTO `customer_seq` (`cus_id`) VALUES
(1),
(2);

-- --------------------------------------------------------

--
-- Table structure for table `cus_bank`
--

CREATE TABLE `cus_bank` (
  `acc_id` int(16) NOT NULL,
  `accnum` int(16) NOT NULL,
  `accname` varchar(255) NOT NULL,
  `bankname` varchar(255) NOT NULL,
  `cus_id` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `fd_image`
--

CREATE TABLE `fd_image` (
  `fd_imgid` int(11) NOT NULL,
  `imgpath` varchar(255) NOT NULL,
  `get_imgid` varchar(10) NOT NULL,
  `sp_id` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `food`
--

CREATE TABLE `food` (
  `fd_id` varchar(10) NOT NULL,
  `fd_name` varchar(255) NOT NULL,
  `fd_detail` varchar(255) NOT NULL,
  `fd_price` float NOT NULL,
  `fd_imgid` varchar(50) NOT NULL,
  `fd_coverpath` varchar(255) NOT NULL,
  `fd_quantity` int(11) NOT NULL,
  `fd_variation` varchar(50) NOT NULL,
  `sp_id` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Triggers `food`
--
DELIMITER $$
CREATE TRIGGER `tg_food_insert` BEFORE INSERT ON `food` FOR EACH ROW BEGIN
  INSERT INTO food_seq VALUES (NULL);
  SET NEW.fd_id = CONCAT('FD', LPAD(LAST_INSERT_ID(), 5, '0'));
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `food_seq`
--

CREATE TABLE `food_seq` (
  `fd_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `gd_image`
--

CREATE TABLE `gd_image` (
  `gd_imgid` int(11) NOT NULL,
  `imgpath` varchar(255) NOT NULL,
  `get_imgid` varchar(10) NOT NULL,
  `sp_id` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `goods`
--

CREATE TABLE `goods` (
  `gd_id` varchar(10) NOT NULL,
  `gd_name` varchar(255) NOT NULL,
  `gd_detail` varchar(255) NOT NULL,
  `gd_price` float NOT NULL,
  `gd_imgid` varchar(50) NOT NULL,
  `gd_coverpath` varchar(255) NOT NULL,
  `gd_quantity` int(11) NOT NULL,
  `gd_variation` varchar(50) NOT NULL,
  `sp_id` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Triggers `goods`
--
DELIMITER $$
CREATE TRIGGER `tg_goods_insert` BEFORE INSERT ON `goods` FOR EACH ROW BEGIN
  INSERT INTO goods_seq VALUES (NULL);
  SET NEW.gd_id = CONCAT('GD', LPAD(LAST_INSERT_ID(), 5, '0'));
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `goods_seq`
--

CREATE TABLE `goods_seq` (
  `gd_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `medicine`
--

CREATE TABLE `medicine` (
  `med_id` varchar(10) NOT NULL,
  `med_name` varchar(255) NOT NULL,
  `med_detail` varchar(255) NOT NULL,
  `med_price` float NOT NULL,
  `med_imgid` varchar(50) NOT NULL,
  `med_coverpath` varchar(255) NOT NULL,
  `med_quantity` int(11) NOT NULL,
  `med_variation` varchar(50) NOT NULL,
  `sp_id` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Triggers `medicine`
--
DELIMITER $$
CREATE TRIGGER `tg_med_insert` BEFORE INSERT ON `medicine` FOR EACH ROW BEGIN
  INSERT INTO medicine_seq VALUES (NULL);
  SET NEW.med_id = CONCAT('MED', LPAD(LAST_INSERT_ID(), 5, '0'));
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `medicine_seq`
--

CREATE TABLE `medicine_seq` (
  `med_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `med_image`
--

CREATE TABLE `med_image` (
  `med_imgid` int(11) NOT NULL,
  `imgpath` varchar(255) NOT NULL,
  `get_imgid` varchar(10) NOT NULL,
  `sp_id` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ordered`
--

CREATE TABLE `ordered` (
  `order_id` int(11) NOT NULL,
  `product_id` varchar(10) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_price` float NOT NULL,
  `product_quantity` int(11) NOT NULL,
  `product_type` varchar(255) NOT NULL,
  `order_time` varchar(255) NOT NULL,
  `order_droptime` varchar(255) DEFAULT NULL,
  `total_price` float NOT NULL,
  `status` varchar(255) NOT NULL,
  `rn_id` varchar(10) DEFAULT NULL,
  `sp_id` varchar(10) NOT NULL,
  `cus_id` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `payment_id` int(11) NOT NULL,
  `total_price` float NOT NULL,
  `date` varchar(255) NOT NULL,
  `payment_status` varchar(255) NOT NULL,
  `cus_id` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pet`
--

CREATE TABLE `pet` (
  `pet_id` varchar(10) NOT NULL,
  `pet_name` varchar(255) NOT NULL,
  `pet_detail` varchar(255) NOT NULL,
  `pet_price` float NOT NULL,
  `pet_imgid` varchar(50) NOT NULL,
  `pet_coverpath` varchar(255) NOT NULL,
  `pet_quantity` int(11) NOT NULL,
  `pet_variation` varchar(50) NOT NULL,
  `sp_id` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pet`
--

INSERT INTO `pet` (`pet_id`, `pet_name`, `pet_detail`, `pet_price`, `pet_imgid`, `pet_coverpath`, `pet_quantity`, `pet_variation`, `sp_id`) VALUES
('PET00002', 'cat food', 'wdfefref', 15.2, 'eff', 'regeg', 5, 'Toy', 'SP001');

--
-- Triggers `pet`
--
DELIMITER $$
CREATE TRIGGER `tg_pet_insert` BEFORE INSERT ON `pet` FOR EACH ROW BEGIN
  INSERT INTO pet_seq VALUES (NULL);
  SET NEW.pet_id = CONCAT('PET', LPAD(LAST_INSERT_ID(), 5, '0'));
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `pet_image`
--

CREATE TABLE `pet_image` (
  `pet_imgid` int(11) NOT NULL,
  `imgpath` varchar(255) NOT NULL,
  `get_imgid` varchar(10) NOT NULL,
  `sp_id` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pet_seq`
--

CREATE TABLE `pet_seq` (
  `pet_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pet_seq`
--

INSERT INTO `pet_seq` (`pet_id`) VALUES
(2);

-- --------------------------------------------------------

--
-- Table structure for table `rn_bank`
--

CREATE TABLE `rn_bank` (
  `acc_id` int(16) NOT NULL,
  `accnum` int(16) NOT NULL,
  `accname` varchar(255) NOT NULL,
  `bankname` varchar(255) NOT NULL,
  `rn_id` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `runner`
--

CREATE TABLE `runner` (
  `rn_id` varchar(10) NOT NULL,
  `rn_name` varchar(255) NOT NULL,
  `rn_ic` varchar(50) NOT NULL,
  `rn_icpath` varchar(255) NOT NULL,
  `rn_imgpath` varchar(255) DEFAULT NULL,
  `rn_licensepath` varchar(255) NOT NULL,
  `phone_num` varchar(50) NOT NULL,
  `rn_gender` varchar(50) NOT NULL,
  `rn_address` varchar(255) NOT NULL,
  `status` varchar(50) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `user_id` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `runner`
--

INSERT INTO `runner` (`rn_id`, `rn_name`, `rn_ic`, `rn_icpath`, `rn_imgpath`, `rn_licensepath`, `phone_num`, `rn_gender`, `rn_address`, `status`, `email`, `user_id`) VALUES
('RN001', 'qa', '123456', 'Capture.PNG', NULL, 'Capture.PNG', '1233555', 'Male', 'trhthytj', 'Pass', 'ehponmontira@gmail.com', 'USER008');

--
-- Triggers `runner`
--
DELIMITER $$
CREATE TRIGGER `tg_runner_insert` BEFORE INSERT ON `runner` FOR EACH ROW BEGIN
  INSERT INTO runner_seq VALUES (NULL);
  SET NEW.rn_id = CONCAT('RN', LPAD(LAST_INSERT_ID(), 3, '0'));
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `runner_seq`
--

CREATE TABLE `runner_seq` (
  `rn_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `runner_seq`
--

INSERT INTO `runner_seq` (`rn_id`) VALUES
(1);

-- --------------------------------------------------------

--
-- Table structure for table `sp`
--

CREATE TABLE `sp` (
  `sp_id` varchar(10) NOT NULL,
  `sp_name` varchar(255) NOT NULL,
  `sp_ic` varchar(50) NOT NULL,
  `sp_icpath` varchar(255) NOT NULL,
  `sp_imgpath` varchar(255) DEFAULT NULL,
  `phone_num` varchar(50) NOT NULL,
  `sp_address` varchar(255) NOT NULL,
  `sp_shop_name` varchar(100) NOT NULL,
  `status` varchar(50) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `user_id` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sp`
--

INSERT INTO `sp` (`sp_id`, `sp_name`, `sp_ic`, `sp_icpath`, `sp_imgpath`, `phone_num`, `sp_address`, `sp_shop_name`, `status`, `email`, `user_id`) VALUES
('SP001', 'comp', '963258741', 'hhgg', NULL, '2365678', 'nbhkfg', 'fihg', 'Pass', 'jb', 'USER002'),
('SP002', 'aa', '123456789', 'Capture.PNG', NULL, '012548749', 'weffrere', 'aa', NULL, 'ehponmontira@gmail.com', 'USER005'),
('SP003', 'Siti Ramlah', '123456', 'Capture.PNG', NULL, '0123456789', 'Kampung Indah', 'Siti Ramlah', 'Pass', 'montiraehpon99@gmail.com', 'USER007');

--
-- Triggers `sp`
--
DELIMITER $$
CREATE TRIGGER `tg_sp_insert` BEFORE INSERT ON `sp` FOR EACH ROW BEGIN
  INSERT INTO sp_seq VALUES (NULL);
  SET NEW.sp_id = CONCAT('SP', LPAD(LAST_INSERT_ID(), 3, '0'));
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `sp_bank`
--

CREATE TABLE `sp_bank` (
  `acc_id` int(16) NOT NULL,
  `accnum` int(16) NOT NULL,
  `accname` varchar(255) NOT NULL,
  `bankname` varchar(255) NOT NULL,
  `sp_id` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sp_seq`
--

CREATE TABLE `sp_seq` (
  `sp_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sp_seq`
--

INSERT INTO `sp_seq` (`sp_id`) VALUES
(1),
(2),
(3);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` varchar(10) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `user_type` varchar(20) NOT NULL,
  `token` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `email`, `password`, `user_type`, `token`) VALUES
('USER001', 'sdwsec4grp5@gmail.com', 'sec4grp5', 'Admin', NULL),
('USER002', 'siti@fake-box.com', '$2y$10$1AXqRuo9s8FS2wYd0cQ.xedufI15gIBaeLu1kN/FDHDhS53LTdoX6', 'Customer', NULL),
('USER004', 'aavvb@gmail.com', '$2y$10$VYki1RERn..gzdDjXzJWxenlM0SrmdjtTj/.vxI.fc5klflPZiSle', 'Service Provider', 'k8mydelnfj'),
('USER005', 'ehponmontira@gmail.com', '$2y$10$19k1M9Ob1bQLo7RkHm727.Dk9MBRkMRfdqWeddDC9zZo5huULhmXG', 'Service Provider', 'gybjohkr1v'),
('USER006', 'vichuda2086@gmail.com', '$2y$10$xeeenXc9dnK6RpJuB0wIyOWfc91PcP28Qb48hUQeApIiNV9csao9m', 'Customer', NULL),
('USER007', 'montiraehpon99@gmail.com', '$2y$10$tZLL2E7czoG0AFTIUcfEtOXnmTxgyzbLbcDFnNCsV.Q3n0xeq36uC', 'Service Provider', 'bo96uhemgt'),
('USER008', 'ehponmontira@gmail.com', '$2y$10$0/AHFp18cYVqYsOqmtemnevTsESauvi5w55HaMmntaCUmH5ZuWEHK', 'Runner', 'sbvalj3rhk'),
('USER009', 'saifulzolkipli@gmail.com', '$2y$10$ZS/aHiM2ekIjfn6ujsGEteorALbB6XKhdj5AxCBaU5xsv/38i5VoG', 'Service Provider', 'm7wp61f2gq'),
('USER010', 'miaoxliae@gmail.com', '$2y$10$gRfvM.YSkK1qFO1TMqAEqujT6agKZz5CsbvbWFdk8U2O6cMQ9XEGG', 'Runner', 'm9u14e2fow'),
('USER011', 'saifulzolkipli@gmail.com', '$2y$10$gh2ujxyNHy6t3oetzosCauhm4VO6.cqXDmbTEIT7tdZrx2sTCkGm.', 'Runner', 'e2176cswrl'),
('USER012', 'miaoxliae@gmail.com', '$2y$10$sg4VoKTYh/OJiO.xf3dza.gVhUktihswFJp7YeVeaLodqwr2Cj3f2', 'Service Provider', 'zio1emaq87'),
('USER013', 'syafiqnikli@gmail.com', '$2y$10$9VAKyCgvIpB1OI4cWoeLQOamghmR7gkkD9s6robXu/QN5anWR3R6e', 'Runner', 'zu3a9ybsc8'),
('USER014', 'syafiqnikli@gmail.com', '$2y$10$RcalOFu/.WT0eF2dH0klLeWHHjiuuPlHDw/K7OC.GpttK8X/QfnKO', 'Service Provider', 'swi2lf4dqa'),
('USER015', 'azlyn.lieyana@gmail.com', '$2y$10$FPeM42bH.d0kpFKeyXmBJu9YbEByXcwRTZzxR65Q//jZljrPA5WJ.', 'Runner', 'gjs4l71bn0'),
('USER016', 'azlyn.lieyana@gmail.com', '$2y$10$WJRzUNfpbzonUb.4sHK58.RuaMvilUC96wDz4ficZxcEVGam6DkWe', 'Service Provider', '9go7yl8mke');

--
-- Triggers `user`
--
DELIMITER $$
CREATE TRIGGER `tg_user_insert` BEFORE INSERT ON `user` FOR EACH ROW BEGIN
  INSERT INTO user_seq VALUES (NULL);
  SET NEW.user_id = CONCAT('USER', LPAD(LAST_INSERT_ID(), 3, '0'));
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `user_seq`
--

CREATE TABLE `user_seq` (
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_seq`
--

INSERT INTO `user_seq` (`user_id`) VALUES
(1),
(2),
(3),
(4),
(5),
(6),
(7),
(8),
(9),
(10),
(11),
(12),
(13),
(14),
(15),
(16);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cart_id`),
  ADD UNIQUE KEY `cart_id` (`cart_id`),
  ADD KEY `fk_cartsp_id` (`sp_id`),
  ADD KEY `fk_cartcus_id` (`cus_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`cus_id`),
  ADD UNIQUE KEY `cus_id` (`cus_id`),
  ADD KEY `fk_cus_id` (`user_id`);

--
-- Indexes for table `customer_seq`
--
ALTER TABLE `customer_seq`
  ADD PRIMARY KEY (`cus_id`);

--
-- Indexes for table `cus_bank`
--
ALTER TABLE `cus_bank`
  ADD PRIMARY KEY (`acc_id`),
  ADD UNIQUE KEY `acc_id` (`acc_id`),
  ADD KEY `fk_cus_bank_id` (`cus_id`);

--
-- Indexes for table `fd_image`
--
ALTER TABLE `fd_image`
  ADD PRIMARY KEY (`fd_imgid`),
  ADD UNIQUE KEY `fd_imgid` (`fd_imgid`),
  ADD KEY `fk_fd_imgid` (`get_imgid`),
  ADD KEY `fk_fdimg_spid` (`sp_id`);

--
-- Indexes for table `food`
--
ALTER TABLE `food`
  ADD PRIMARY KEY (`fd_id`),
  ADD UNIQUE KEY `fd_id` (`fd_id`),
  ADD KEY `fk_fd_spid` (`sp_id`);

--
-- Indexes for table `food_seq`
--
ALTER TABLE `food_seq`
  ADD PRIMARY KEY (`fd_id`);

--
-- Indexes for table `gd_image`
--
ALTER TABLE `gd_image`
  ADD PRIMARY KEY (`gd_imgid`),
  ADD UNIQUE KEY `gd_imgid` (`gd_imgid`),
  ADD KEY `fk_gd_imgid` (`get_imgid`),
  ADD KEY `fk_gdimg_spid` (`sp_id`);

--
-- Indexes for table `goods`
--
ALTER TABLE `goods`
  ADD PRIMARY KEY (`gd_id`),
  ADD UNIQUE KEY `gd_id` (`gd_id`),
  ADD KEY `fk_gd_spid` (`sp_id`);

--
-- Indexes for table `goods_seq`
--
ALTER TABLE `goods_seq`
  ADD PRIMARY KEY (`gd_id`);

--
-- Indexes for table `medicine`
--
ALTER TABLE `medicine`
  ADD PRIMARY KEY (`med_id`),
  ADD UNIQUE KEY `med_id` (`med_id`),
  ADD KEY `fk_med_spid` (`sp_id`);

--
-- Indexes for table `medicine_seq`
--
ALTER TABLE `medicine_seq`
  ADD PRIMARY KEY (`med_id`);

--
-- Indexes for table `med_image`
--
ALTER TABLE `med_image`
  ADD PRIMARY KEY (`med_imgid`),
  ADD UNIQUE KEY `med_imgid` (`med_imgid`),
  ADD KEY `fk_med_imgid` (`get_imgid`),
  ADD KEY `fk_medimg_spid` (`sp_id`);

--
-- Indexes for table `ordered`
--
ALTER TABLE `ordered`
  ADD PRIMARY KEY (`order_id`),
  ADD UNIQUE KEY `order_id` (`order_id`),
  ADD KEY `fk_orderrn_id` (`rn_id`),
  ADD KEY `fk_ordercus_id` (`cus_id`),
  ADD KEY `fk_ordersp_id` (`sp_id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`payment_id`),
  ADD UNIQUE KEY `payment_id` (`payment_id`),
  ADD KEY `fk_paycus_id` (`cus_id`);

--
-- Indexes for table `pet`
--
ALTER TABLE `pet`
  ADD PRIMARY KEY (`pet_id`),
  ADD UNIQUE KEY `pet_id` (`pet_id`),
  ADD KEY `fk_pet_spid` (`sp_id`);

--
-- Indexes for table `pet_image`
--
ALTER TABLE `pet_image`
  ADD PRIMARY KEY (`pet_imgid`),
  ADD UNIQUE KEY `pet_imgid` (`pet_imgid`),
  ADD KEY `fk_pet_imgid` (`get_imgid`),
  ADD KEY `fk_petimg_spid` (`sp_id`);

--
-- Indexes for table `pet_seq`
--
ALTER TABLE `pet_seq`
  ADD PRIMARY KEY (`pet_id`);

--
-- Indexes for table `rn_bank`
--
ALTER TABLE `rn_bank`
  ADD PRIMARY KEY (`acc_id`),
  ADD UNIQUE KEY `acc_id` (`acc_id`),
  ADD KEY `fk_rn_bank_id` (`rn_id`);

--
-- Indexes for table `runner`
--
ALTER TABLE `runner`
  ADD PRIMARY KEY (`rn_id`),
  ADD UNIQUE KEY `rn_id` (`rn_id`),
  ADD KEY `fk_rn_id` (`user_id`);

--
-- Indexes for table `runner_seq`
--
ALTER TABLE `runner_seq`
  ADD PRIMARY KEY (`rn_id`);

--
-- Indexes for table `sp`
--
ALTER TABLE `sp`
  ADD PRIMARY KEY (`sp_id`),
  ADD UNIQUE KEY `sp_id` (`sp_id`),
  ADD KEY `fk_sp_id` (`user_id`);

--
-- Indexes for table `sp_bank`
--
ALTER TABLE `sp_bank`
  ADD PRIMARY KEY (`acc_id`),
  ADD UNIQUE KEY `acc_id` (`acc_id`),
  ADD KEY `fk_sp_bank_id` (`sp_id`);

--
-- Indexes for table `sp_seq`
--
ALTER TABLE `sp_seq`
  ADD PRIMARY KEY (`sp_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `user_seq`
--
ALTER TABLE `user_seq`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `cart_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `customer_seq`
--
ALTER TABLE `customer_seq`
  MODIFY `cus_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `cus_bank`
--
ALTER TABLE `cus_bank`
  MODIFY `acc_id` int(16) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fd_image`
--
ALTER TABLE `fd_image`
  MODIFY `fd_imgid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `food_seq`
--
ALTER TABLE `food_seq`
  MODIFY `fd_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gd_image`
--
ALTER TABLE `gd_image`
  MODIFY `gd_imgid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `goods_seq`
--
ALTER TABLE `goods_seq`
  MODIFY `gd_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `medicine_seq`
--
ALTER TABLE `medicine_seq`
  MODIFY `med_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `med_image`
--
ALTER TABLE `med_image`
  MODIFY `med_imgid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ordered`
--
ALTER TABLE `ordered`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pet_image`
--
ALTER TABLE `pet_image`
  MODIFY `pet_imgid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pet_seq`
--
ALTER TABLE `pet_seq`
  MODIFY `pet_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `rn_bank`
--
ALTER TABLE `rn_bank`
  MODIFY `acc_id` int(16) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `runner_seq`
--
ALTER TABLE `runner_seq`
  MODIFY `rn_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sp_bank`
--
ALTER TABLE `sp_bank`
  MODIFY `acc_id` int(16) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sp_seq`
--
ALTER TABLE `sp_seq`
  MODIFY `sp_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user_seq`
--
ALTER TABLE `user_seq`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `fk_cartcus_id` FOREIGN KEY (`cus_id`) REFERENCES `customer` (`cus_id`),
  ADD CONSTRAINT `fk_cartsp_id` FOREIGN KEY (`sp_id`) REFERENCES `sp` (`sp_id`);

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `fk_cus_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

--
-- Constraints for table `cus_bank`
--
ALTER TABLE `cus_bank`
  ADD CONSTRAINT `fk_cus_bank_id` FOREIGN KEY (`cus_id`) REFERENCES `customer` (`cus_id`);

--
-- Constraints for table `fd_image`
--
ALTER TABLE `fd_image`
  ADD CONSTRAINT `fk_fd_imgid` FOREIGN KEY (`get_imgid`) REFERENCES `food` (`fd_id`),
  ADD CONSTRAINT `fk_fdimg_spid` FOREIGN KEY (`sp_id`) REFERENCES `sp` (`sp_id`);

--
-- Constraints for table `food`
--
ALTER TABLE `food`
  ADD CONSTRAINT `fk_fd_spid` FOREIGN KEY (`sp_id`) REFERENCES `sp` (`sp_id`);

--
-- Constraints for table `gd_image`
--
ALTER TABLE `gd_image`
  ADD CONSTRAINT `fk_gd_imgid` FOREIGN KEY (`get_imgid`) REFERENCES `goods` (`gd_id`),
  ADD CONSTRAINT `fk_gdimg_spid` FOREIGN KEY (`sp_id`) REFERENCES `sp` (`sp_id`);

--
-- Constraints for table `goods`
--
ALTER TABLE `goods`
  ADD CONSTRAINT `fk_gd_spid` FOREIGN KEY (`sp_id`) REFERENCES `sp` (`sp_id`);

--
-- Constraints for table `medicine`
--
ALTER TABLE `medicine`
  ADD CONSTRAINT `fk_med_spid` FOREIGN KEY (`sp_id`) REFERENCES `sp` (`sp_id`);

--
-- Constraints for table `med_image`
--
ALTER TABLE `med_image`
  ADD CONSTRAINT `fk_med_imgid` FOREIGN KEY (`get_imgid`) REFERENCES `medicine` (`med_id`),
  ADD CONSTRAINT `fk_medimg_spid` FOREIGN KEY (`sp_id`) REFERENCES `sp` (`sp_id`);

--
-- Constraints for table `ordered`
--
ALTER TABLE `ordered`
  ADD CONSTRAINT `fk_ordercus_id` FOREIGN KEY (`cus_id`) REFERENCES `customer` (`cus_id`),
  ADD CONSTRAINT `fk_orderrn_id` FOREIGN KEY (`rn_id`) REFERENCES `runner` (`rn_id`),
  ADD CONSTRAINT `fk_ordersp_id` FOREIGN KEY (`sp_id`) REFERENCES `sp` (`sp_id`);

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `fk_paycus_id` FOREIGN KEY (`cus_id`) REFERENCES `customer` (`cus_id`);

--
-- Constraints for table `pet`
--
ALTER TABLE `pet`
  ADD CONSTRAINT `fk_pet_spid` FOREIGN KEY (`sp_id`) REFERENCES `sp` (`sp_id`);

--
-- Constraints for table `pet_image`
--
ALTER TABLE `pet_image`
  ADD CONSTRAINT `fk_pet_imgid` FOREIGN KEY (`get_imgid`) REFERENCES `pet` (`pet_id`),
  ADD CONSTRAINT `fk_petimg_spid` FOREIGN KEY (`sp_id`) REFERENCES `sp` (`sp_id`);

--
-- Constraints for table `rn_bank`
--
ALTER TABLE `rn_bank`
  ADD CONSTRAINT `fk_rn_bank_id` FOREIGN KEY (`rn_id`) REFERENCES `runner` (`rn_id`);

--
-- Constraints for table `runner`
--
ALTER TABLE `runner`
  ADD CONSTRAINT `fk_rn_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

--
-- Constraints for table `sp`
--
ALTER TABLE `sp`
  ADD CONSTRAINT `fk_sp_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

--
-- Constraints for table `sp_bank`
--
ALTER TABLE `sp_bank`
  ADD CONSTRAINT `fk_sp_bank_id` FOREIGN KEY (`sp_id`) REFERENCES `sp` (`sp_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
