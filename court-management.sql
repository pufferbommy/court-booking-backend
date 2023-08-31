-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Aug 31, 2023 at 01:01 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `court-management`
--

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `id` int(11) NOT NULL,
  `court` varchar(20) NOT NULL,
  `timeRange` varchar(20) NOT NULL,
  `userId` varchar(20) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`id`, `court`, `timeRange`, `userId`, `date`) VALUES
(20, '1', '19:00 - 19:30', '64105315', '2023-08-30'),
(21, '1', '18:00 - 18:30', '64105315', '2023-08-30'),
(24, '2', '19:30 - 20:00', '1234', '2023-08-29'),
(72, '2', '19:00 - 19:30', '1234', '2023-08-31'),
(73, '1', '18:00 - 18:30', '64105315', '2023-08-31'),
(74, '3', '18:30 - 19:00', '64105315', '2023-08-31'),
(75, '3', '19:00 - 19:30', '64105315', '2023-08-31'),
(76, '1', '18:30 - 19:00', '123', '2023-08-31'),
(77, '2', '18:30 - 19:00', '123', '2023-08-31'),
(78, '4', '18:30 - 19:00', '123', '2023-08-31'),
(79, '1', '19:30 - 20:00', '123', '2023-08-31');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `fullName` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `password`, `fullName`) VALUES
('123', '123', 'นางสาวจักร วงดี'),
('1234', '1234', 'นายหนึ่ง สองสามสี่'),
('12345', '12345', 'นายรักเล้ง หวังดี'),
('64105315', '64105315', 'นางสาวเรียนดี รักเรียน');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_bookings_users_id` (`userId`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `fk_bookings_users_id` FOREIGN KEY (`userId`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
