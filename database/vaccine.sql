-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 06, 2021 at 05:42 PM
-- Server version: 10.1.40-MariaDB
-- PHP Version: 7.3.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `vaccine`
--

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `id` int(11) NOT NULL,
  `recipient` varchar(50) NOT NULL,
  `date` date NOT NULL,
  `vaccine` varchar(50) NOT NULL,
  `centre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`id`, `recipient`, `date`, `vaccine`, `centre`) VALUES
(1, 'Tezz', '2021-12-11', 'phifzer', 'Case'),
(2, 'kere', '2021-12-24', 'Pit', 'Maternal'),
(3, 'Johnson', '2021-12-14', 'phifzer', 'St Luke'),
(4, 'Tiomo Werner', '2021-12-16', 'phifzer', 'Maternal'),
(5, 'Tiomo Werner', '2021-12-16', 'phifzer', 'Maternal');

-- --------------------------------------------------------

--
-- Table structure for table `centres`
--

CREATE TABLE `centres` (
  `id` int(11) NOT NULL,
  `name` varchar(40) NOT NULL,
  `location` varchar(50) NOT NULL,
  `patients` int(20) NOT NULL,
  `doses` int(20) NOT NULL,
  `email` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `centres`
--

INSERT INTO `centres` (`id`, `name`, `location`, `patients`, `doses`, `email`) VALUES
(17, 'Bazzy', 'Kabowa', 89678, 8899999, 'Kik@gmail.com'),
(18, 'kkk', 'kkk', 898, 700, 'K@gmail.com'),
(19, 'gfgf', 'hdhf', 99, 13800, 'dsd@hh.com');

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE `inventory` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `doses` int(20) NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `inventory`
--

INSERT INTO `inventory` (`id`, `name`, `doses`, `status`) VALUES
(2, 'Pit', 48470, 'Donation'),
(4, 'phifzer', 997296, 'Donation');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(5) NOT NULL,
  `email` varchar(50) NOT NULL,
  `name` varchar(40) NOT NULL,
  `password` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `email`, `name`, `password`) VALUES
(1, 'brunomugire@gmail.com', 'Bruno Mugire', '12345678'),
(2, 'admin@demo.com', 'admin@demo.com', 'admin'),
(3, 'brunodonatelo@gmail.com', 'admin', 'admin'),
(4, 'bb@gajaj.cpom', 'bbb', 'dhdjdj'),
(6, '', '', ''),
(7, 'hehh@hshs.com', 'hehhe', '152626'),
(8, 'doe@doe.com', 'Tom Doe', 'doe');

-- --------------------------------------------------------

--
-- Table structure for table `vaccinated`
--

CREATE TABLE `vaccinated` (
  `id` int(11) NOT NULL,
  `person` varchar(40) NOT NULL,
  `centre` varchar(40) NOT NULL,
  `vaccine` varchar(40) NOT NULL,
  `firstdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `seconddate` date NOT NULL,
  `nin` varchar(50) NOT NULL,
  `email` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `vaccinated`
--

INSERT INTO `vaccinated` (`id`, `person`, `centre`, `vaccine`, `firstdate`, `seconddate`, `nin`, `email`) VALUES
(9, 'jjjsjsjs', 'Case', 'Pit', '2021-12-05 08:50:34', '2021-12-15', 'iiuhi', 'brunomugire@gmail.com'),
(10, 'Bruno Mugire', 'Case', 'Pit', '2021-12-05 08:57:00', '2021-12-24', 'brunodonatelo@gmail.com', 'brunodonatelo@gmail.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `centres`
--
ALTER TABLE `centres`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `vaccinated`
--
ALTER TABLE `vaccinated`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `booking`
--
ALTER TABLE `booking`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `centres`
--
ALTER TABLE `centres`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `inventory`
--
ALTER TABLE `inventory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `vaccinated`
--
ALTER TABLE `vaccinated`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
