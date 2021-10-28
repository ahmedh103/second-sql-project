-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 28, 2021 at 01:52 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 7.4.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `college`
--

-- --------------------------------------------------------

--
-- Table structure for table `final_destion`
--

CREATE TABLE `final_destion` (
  `id` int(11) NOT NULL,
  `programId` int(11) DEFAULT NULL,
  `pre_desctionId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `id` int(11) NOT NULL,
  `news` text DEFAULT NULL,
  `image` text DEFAULT NULL,
  `pdf` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `pre_desction`
--

CREATE TABLE `pre_desction` (
  `id` int(11) NOT NULL,
  `studentId` int(11) DEFAULT NULL,
  `creatAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `program`
--

CREATE TABLE `program` (
  `id` int(11) NOT NULL,
  `program` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `qustions`
--

CREATE TABLE `qustions` (
  `id` int(11) NOT NULL,
  `answer` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `studentId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` int(11) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `gender` varchar(20) DEFAULT NULL,
  `studentPhone` varchar(15) DEFAULT NULL,
  `reg_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `student_requirment`
--

CREATE TABLE `student_requirment` (
  `id` int(11) NOT NULL,
  `raghba_1` int(11) DEFAULT NULL,
  `raghba_2` int(11) DEFAULT NULL,
  `raghba_3` int(11) DEFAULT NULL,
  `studentId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `theem`
--

CREATE TABLE `theem` (
  `id` int(11) NOT NULL,
  `them` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `final_destion`
--
ALTER TABLE `final_destion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `programId` (`programId`),
  ADD KEY `pre_desctionId` (`pre_desctionId`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pre_desction`
--
ALTER TABLE `pre_desction`
  ADD PRIMARY KEY (`id`),
  ADD KEY `studentId` (`studentId`);

--
-- Indexes for table `program`
--
ALTER TABLE `program`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `qustions`
--
ALTER TABLE `qustions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `studentId` (`studentId`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student_requirment`
--
ALTER TABLE `student_requirment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `raghba_1` (`raghba_1`),
  ADD KEY `raghba_2` (`raghba_2`),
  ADD KEY `raghba_3` (`raghba_3`),
  ADD KEY `studentId` (`studentId`);

--
-- Indexes for table `theem`
--
ALTER TABLE `theem`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `final_destion`
--
ALTER TABLE `final_destion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pre_desction`
--
ALTER TABLE `pre_desction`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `program`
--
ALTER TABLE `program`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `qustions`
--
ALTER TABLE `qustions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `student_requirment`
--
ALTER TABLE `student_requirment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `theem`
--
ALTER TABLE `theem`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `final_destion`
--
ALTER TABLE `final_destion`
  ADD CONSTRAINT `final_destion_ibfk_1` FOREIGN KEY (`programId`) REFERENCES `program` (`id`),
  ADD CONSTRAINT `final_destion_ibfk_2` FOREIGN KEY (`pre_desctionId`) REFERENCES `pre_desction` (`id`);

--
-- Constraints for table `pre_desction`
--
ALTER TABLE `pre_desction`
  ADD CONSTRAINT `pre_desction_ibfk_1` FOREIGN KEY (`studentId`) REFERENCES `students` (`id`);

--
-- Constraints for table `qustions`
--
ALTER TABLE `qustions`
  ADD CONSTRAINT `qustions_ibfk_1` FOREIGN KEY (`studentId`) REFERENCES `students` (`id`);

--
-- Constraints for table `student_requirment`
--
ALTER TABLE `student_requirment`
  ADD CONSTRAINT `student_requirment_ibfk_1` FOREIGN KEY (`raghba_1`) REFERENCES `program` (`id`),
  ADD CONSTRAINT `student_requirment_ibfk_2` FOREIGN KEY (`raghba_2`) REFERENCES `program` (`id`),
  ADD CONSTRAINT `student_requirment_ibfk_3` FOREIGN KEY (`raghba_3`) REFERENCES `program` (`id`),
  ADD CONSTRAINT `student_requirment_ibfk_4` FOREIGN KEY (`studentId`) REFERENCES `students` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
