-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 23, 2023 at 07:20 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `capstone`
--

-- --------------------------------------------------------

--
-- Table structure for table `batch`
--

CREATE TABLE `batch` (
  `id` int(11) NOT NULL,
  `batch` varchar(255) NOT NULL,
  `date` varchar(255) NOT NULL,
  `amount` varchar(255) NOT NULL,
  `daily` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `batch`
--

INSERT INTO `batch` (`id`, `batch`, `date`, `amount`, `daily`) VALUES
(28, 'batch_1', '2023-09-15', '7,000', 60),
(31, 'batch_2', '2023-09-22', '9,000', 60);

-- --------------------------------------------------------

--
-- Table structure for table `list`
--

CREATE TABLE `list` (
  `id` int(11) NOT NULL,
  `batch` varchar(255) NOT NULL,
  `oneth` varchar(255) NOT NULL,
  `twoth` varchar(255) NOT NULL,
  `threeth` varchar(255) NOT NULL,
  `fourth` varchar(255) NOT NULL,
  `fiveth` varchar(255) NOT NULL,
  `sixth` varchar(255) NOT NULL,
  `seventh` varchar(255) NOT NULL,
  `eigthth` varchar(255) NOT NULL,
  `nineth` varchar(255) NOT NULL,
  `tenth` varchar(255) NOT NULL,
  `eleventh` varchar(255) NOT NULL,
  `twelveth` varchar(255) NOT NULL,
  `thirtenth` varchar(255) NOT NULL,
  `fourthenth` varchar(255) NOT NULL,
  `fifthenth` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `list`
--

INSERT INTO `list` (`id`, `batch`, `oneth`, `twoth`, `threeth`, `fourth`, `fiveth`, `sixth`, `seventh`, `eigthth`, `nineth`, `tenth`, `eleventh`, `twelveth`, `thirtenth`, `fourthenth`, `fifthenth`) VALUES
(24, 'batch_1', 'Jessica Fernan', 'Jessica Fernan', 'Jessica Fernan', 'Jessica Fernan', 'Jessica Fernan', 'Jessica Fernan', 'Jessica Fernan', 'Jessica Fernan', 'Jessica Fernan', 'Jessica Fernan', 'Jessica Fernan', 'Jessica Fernan', 'Jessica Fernan', 'Jessica Fernan', 'Jessica Fernan'),
(27, 'batch_4', 'Jelly Rose', 'Jelly Rose', 'jljkljkljkklkjljkjjljl', 'Jelly Rose', 'Jelly Rose', 'Jelly Rose', 'Jelly Rose', 'Jelly Rose', 'Jelly Rose', 'Jelly Rose', 'fghgfhhgfhgf', 'jljkljkljkklkjljkjjljl', 'fghgfhhgfhgf', 'fghgfhhgfhgf', 'jljkljkljkklkjljkjjljl'),
(28, 'batch_2', 'ASAS', 'Junrhey Fernan', 'iyiyiyiyi', 'adsasdas', 'Junrhey Fernan', 'Junrhey Fernan', 'Junrhey Fernan', 'Junrhey Fernan', 'Junrhey Fernan', 'Junrhey Fernan', 'Junrhey Fernan', 'Junrhey Fernan', 'Junrhey Fernan', 'Junrhey Fernan', 'Junrhey Fernan'),
(29, 'batch_2', 'Junrhey Fernan', 'Junrhey Fernan', 'Junrhey Fernan', 'Junrhey Fernan', 'Junrhey Fernan', 'Junrhey Fernan', 'Junrhey Fernan', 'Junrhey Fernan', 'Junrhey Fernan', 'Junrhey Fernan', 'Junrhey Fernan', 'Junrhey Fernan', 'iyiyiyiyi', 'Junrhey Fernan', 'ASAS'),
(30, 'batch_4', 'jljkljkljkklkjljkjjljl', 'Jelly Rose', 'fghgfhhgfhgf', 'Jelly Rose', 'Jelly Rose', 'Jelly Rose', 'Jelly Rose', 'Jelly Rose', 'Jelly Rose', 'Jelly Rose', 'Jelly Rose', 'Jelly Rose', 'Jelly Rose', 'Jelly Rose', 'Jelly Rose');

-- --------------------------------------------------------

--
-- Table structure for table `members`
--

CREATE TABLE `members` (
  `id` int(11) NOT NULL,
  `batch` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `age` int(100) NOT NULL,
  `gender` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `cellphone` int(100) NOT NULL,
  `location` varchar(255) NOT NULL,
  `work` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `members`
--

INSERT INTO `members` (`id`, `batch`, `name`, `age`, `gender`, `image`, `cellphone`, `location`, `work`) VALUES
(5, 'batch_1', 'Jessica Fernan', 88, '', 'mine.jpg', 999999999, 'Gairan, Bogo City', 'House Wife'),
(6, 'batch_2', 'Junrhey Fernan', 99, '', 'jun.jpg', 988888888, 'Nailon, Bogo City', 'Furniture Maker'),
(7, 'batch_4', 'Jelly Rose', 26, '', 'Jeel.jpg', 977777777, 'Carbon Gairan', 'Call Center'),
(8, 'batch_5', 'Junzkey Fer', 44, '', 'zkey.jpg', 944444444, 'CRMC lang', 'Keeper'),
(9, 'batch_2', 'adsasdas', 23, '', 'adada.jpg', 0, 'asdasdasdsadds', 'adasdsadsaada'),
(10, 'batch_4', 'fghgfhhgfhgf', 23, '', 'dfggdfgdfgdgf.jpg', 0, 'vsfsfssfss', 'sdfdsfdsfdsfsf'),
(11, 'batch_2', 'iyiyiyiyi', 23, '', 'adada.jpg', 9555555, 'asdasdasdsadds', 'adasdsadsaada'),
(12, 'batch_4', 'jljkljkljkklkjljkjjljl', 23, '', 'dfggdfgdfgdgf.jpg', 9777777, 'vsfsfssfss', 'sdfdsfdsfdsfsf'),
(13, 'batch_3', 'CVCV', 25, 'on', '365565769_6690653007640190_377762972583992729_n.jpg', 2147483647, 'Central 1, Bogo City', 'Wala lang tambay'),
(14, 'batch_2', '', 22, 'on', '365402213_613369790945163_4063063047254030144_n.png', 2147483647, 'Central 2, Bogo City', 'Perme nalang tambay'),
(15, 'batch_2', 'ASAS', 75, 'male', '64458516_101858917768303_652131650787868672_n.jpg', 93333333, 'Central 3, Bogo City', 'Cege lang tambay');

-- --------------------------------------------------------

--
-- Table structure for table `record7`
--

CREATE TABLE `record7` (
  `id` int(11) NOT NULL,
  `batch` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `day1` varchar(255) NOT NULL,
  `day2` varchar(255) NOT NULL,
  `day3` varchar(255) NOT NULL,
  `day4` varchar(255) NOT NULL,
  `day5` varchar(255) NOT NULL,
  `day6` varchar(255) NOT NULL,
  `day7` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `record7`
--

INSERT INTO `record7` (`id`, `batch`, `name`, `day1`, `day2`, `day3`, `day4`, `day5`, `day6`, `day7`) VALUES
(35, 'batch_2', 'junrhey fernan', '---', '---', '---', '---', '---', '---', '---'),
(37, 'batch_1', 'jessica fernan', '---', '---', '---', '---', '---', '---', '---'),
(38, 'batch_4', 'Jelly Rose', '---', '---', '---', '---', '---', '---', '---');

-- --------------------------------------------------------

--
-- Table structure for table `records1`
--

CREATE TABLE `records1` (
  `id` int(11) NOT NULL,
  `code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `day1` varchar(255) NOT NULL,
  `day2` varchar(255) NOT NULL,
  `day3` varchar(255) NOT NULL,
  `day4` varchar(255) NOT NULL,
  `day5` varchar(255) NOT NULL,
  `day6` varchar(255) NOT NULL,
  `day7` varchar(255) NOT NULL,
  `day8` varchar(255) NOT NULL,
  `day9` varchar(255) NOT NULL,
  `day10` varchar(255) NOT NULL,
  `day11` varchar(255) NOT NULL,
  `day12` varchar(255) NOT NULL,
  `day13` varchar(255) NOT NULL,
  `day14` varchar(255) NOT NULL,
  `day15` varchar(255) NOT NULL,
  `day16` varchar(255) NOT NULL,
  `day17` varchar(255) NOT NULL,
  `day18` varchar(255) NOT NULL,
  `day19` varchar(255) NOT NULL,
  `day20` varchar(255) NOT NULL,
  `day21` varchar(255) NOT NULL,
  `day22` varchar(255) NOT NULL,
  `day23` varchar(255) NOT NULL,
  `day24` varchar(255) NOT NULL,
  `day25` varchar(255) NOT NULL,
  `day26` varchar(255) NOT NULL,
  `day27` varchar(255) NOT NULL,
  `day28` varchar(255) NOT NULL,
  `day29` varchar(255) NOT NULL,
  `day30` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `records1`
--

INSERT INTO `records1` (`id`, `code`, `name`, `day1`, `day2`, `day3`, `day4`, `day5`, `day6`, `day7`, `day8`, `day9`, `day10`, `day11`, `day12`, `day13`, `day14`, `day15`, `day16`, `day17`, `day18`, `day19`, `day20`, `day21`, `day22`, `day23`, `day24`, `day25`, `day26`, `day27`, `day28`, `day29`, `day30`) VALUES
(12, 'batch_4', 'Jelly Rose', '---', '---', '---', '---', '---', '---', '---', '---', '---', '---', '---', '---', '---', '---', '---', '---', '---', '---', '---', '---', '---', '---', '---', '---', '---', '---', '---', '---', '---', '---'),
(13, 'batch_1', 'Jessica Fernan', 'PAID', 'PAID', 'PAID', 'PAID', 'PAID', '---', '---', '---', '---', '---', '---', '---', '---', '---', '---', '---', '---', '---', '---', '---', '---', '---', '---', '---', '---', '---', '---', '---', '---', 'PAID'),
(14, 'batch_2', 'ASAS', '---', '---', '---', '---', '---', '---', '---', '---', '---', '---', '---', '---', '---', '---', '---', '---', '---', '---', '---', '---', '---', '---', '---', '---', '---', '---', '---', '---', '---', '---');

-- --------------------------------------------------------

--
-- Table structure for table `signup`
--

CREATE TABLE `signup` (
  `id` int(11) NOT NULL,
  `user` varchar(255) NOT NULL,
  `pass` varchar(255) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `middlename` varchar(255) NOT NULL,
  `age` int(100) NOT NULL,
  `birthdate` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `signup`
--

INSERT INTO `signup` (`id`, `user`, `pass`, `firstname`, `lastname`, `middlename`, `age`, `birthdate`) VALUES
(1, 'admin', 'damin', 'tampus', 'obligar', 'roma', 99, '2023-08-22');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `batch`
--
ALTER TABLE `batch`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `list`
--
ALTER TABLE `list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `members`
--
ALTER TABLE `members`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `record7`
--
ALTER TABLE `record7`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `records1`
--
ALTER TABLE `records1`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `signup`
--
ALTER TABLE `signup`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `batch`
--
ALTER TABLE `batch`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `list`
--
ALTER TABLE `list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `members`
--
ALTER TABLE `members`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `record7`
--
ALTER TABLE `record7`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `records1`
--
ALTER TABLE `records1`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `signup`
--
ALTER TABLE `signup`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
