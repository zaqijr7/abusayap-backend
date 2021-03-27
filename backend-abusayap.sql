-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 26, 2021 at 09:01 AM
-- Server version: 8.0.23-0ubuntu0.20.04.1
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
-- Database: `backend-abusayap`
--

-- --------------------------------------------------------

--
-- Table structure for table `amount_transaction`
--

CREATE TABLE `amount_transaction` (
  `id` int NOT NULL,
  `idUser` int NOT NULL,
  `income` int DEFAULT NULL,
  `expense` int DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `amount_transaction`
--

INSERT INTO `amount_transaction` (`id`, `idUser`, `income`, `expense`, `createdAt`, `updatedAt`) VALUES
(13, 67, 10000, 140000, '2021-03-25 12:31:09', '2021-03-25 15:43:01'),
(14, 66, 172012, 302000, '2021-03-25 12:31:09', '2021-03-26 07:41:37'),
(15, 68, 87048, 1741000, '2021-03-25 12:53:52', '2021-03-25 16:41:55'),
(16, 69, 1989000, 6057260, '2021-03-25 13:22:01', '2021-03-26 04:26:20'),
(17, 70, 5720280, 2218053, '2021-03-25 13:31:59', '2021-03-26 07:46:16'),
(18, 71, 2314290, 1088280, '2021-03-25 14:20:57', '2021-03-26 07:31:58'),
(19, 72, NULL, 80, '2021-03-25 17:01:38', '0000-00-00 00:00:00'),
(20, 74, 240000, 580000, '2021-03-26 03:32:59', '2021-03-26 07:46:35'),
(21, 75, 56000, 212000, '2021-03-26 04:18:32', '2021-03-26 07:46:13'),
(22, 76, 65000, 7000, '2021-03-26 07:17:05', '2021-03-26 07:49:11'),
(23, 77, 1783053, 10, '2021-03-26 07:17:05', '2021-03-26 07:58:48'),
(24, 81, NULL, 66000, '2021-03-26 07:49:11', '2021-03-26 07:54:27'),
(25, 80, NULL, 25000, '2021-03-26 07:58:48', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `top_up`
--

CREATE TABLE `top_up` (
  `id` int NOT NULL,
  `idUser` int NOT NULL,
  `amount` int NOT NULL,
  `idAdmin` int DEFAULT NULL,
  `picture` varchar(50) NOT NULL,
  `status` varchar(50) NOT NULL DEFAULT 'pending',
  `dateTransaction` datetime NOT NULL,
  `createdBy` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updateAt` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `top_up`
--

INSERT INTO `top_up` (`id`, `idUser`, `amount`, `idAdmin`, `picture`, `status`, `dateTransaction`, `createdBy`, `updateAt`) VALUES
(4, 69, 900000, 71, 'transfer-picture-1616680296836.jpg', 'accept', '2021-03-25 08:51:16', '2021-03-25 13:51:42', '2021-03-25 13:52:04'),
(5, 68, 1000000, 71, 'transfer-picture-1616680647267.jpg', 'accept', '2021-03-25 08:57:14', '2021-03-25 13:57:28', '2021-03-25 13:57:51'),
(6, 68, 1000000, 71, 'transfer-picture-1616680939307.jpg', 'accept', '2021-03-25 09:02:10', '2021-03-25 14:02:20', '2021-03-25 14:04:08'),
(7, 68, 10000, NULL, 'transfer-picture-1616681625036.jpg', 'pending', '2021-03-25 09:13:35', '2021-03-25 14:13:45', '0000-00-00 00:00:00'),
(8, 68, 2444, NULL, 'transfer-picture-1616681954347.jpg', 'pending', '2021-03-25 09:19:07', '2021-03-25 14:19:14', '0000-00-00 00:00:00'),
(9, 68, 1445, NULL, 'transfer-picture-1616682140323.jpg', 'pending', '2021-03-25 09:22:09', '2021-03-25 14:22:21', '0000-00-00 00:00:00'),
(10, 68, 4455, NULL, 'transfer-picture-1616682213486.jpg', 'pending', '2021-03-25 09:23:20', '2021-03-25 14:23:34', '0000-00-00 00:00:00'),
(11, 68, 3444, NULL, 'transfer-picture-1616682269344.jpg', 'pending', '2021-03-25 09:24:18', '2021-03-25 14:24:30', '0000-00-00 00:00:00'),
(12, 68, 23456, NULL, 'transfer-picture-1616682599843.jpg', 'pending', '2021-03-25 09:29:49', '2021-03-25 14:30:00', '0000-00-00 00:00:00'),
(13, 68, 45, NULL, 'transfer-picture-1616682703290.jpg', 'pending', '2021-03-25 09:31:33', '2021-03-25 14:31:43', '0000-00-00 00:00:00'),
(14, 68, 445, 71, 'transfer-picture-1616682726385.jpg', 'reject', '2021-03-25 09:31:56', '2021-03-25 14:32:07', '2021-03-26 06:21:57'),
(15, 68, 3344, NULL, 'transfer-picture-1616682798449.jpg', 'pending', '2021-03-25 09:33:10', '2021-03-25 14:33:19', '0000-00-00 00:00:00'),
(16, 68, 1000, 71, 'transfer-picture-1616684227326.jpg', 'reject', '2021-03-25 09:56:58', '2021-03-25 14:57:09', '2021-03-26 06:22:04'),
(17, 68, 466, 71, 'transfer-picture-1616684274605.jpg', 'reject', '2021-03-25 09:57:47', '2021-03-25 14:57:56', '2021-03-26 06:22:01'),
(18, 68, 345, NULL, 'transfer-picture-1616684330395.jpg', 'pending', '2021-03-25 09:58:35', '2021-03-25 14:58:51', '0000-00-00 00:00:00'),
(19, 68, 355, NULL, 'transfer-picture-1616684429013.png', 'pending', '2021-03-25 10:00:23', '2021-03-25 15:00:30', '0000-00-00 00:00:00'),
(20, 68, 3567, NULL, 'transfer-picture-1616684611592.jpg', 'pending', '2021-03-25 10:03:23', '2021-03-25 15:03:34', '0000-00-00 00:00:00'),
(21, 68, 55556, NULL, 'transfer-picture-1616684862185.jpg', 'pending', '2021-03-25 10:07:33', '2021-03-25 15:07:44', '0000-00-00 00:00:00'),
(22, 68, 5555, NULL, 'transfer-picture-1616685119736.png', 'pending', '2021-03-25 10:11:54', '2021-03-25 15:12:00', '0000-00-00 00:00:00'),
(23, 68, 4555, 71, 'transfer-picture-1616685182183.png', 'accept', '2021-03-25 10:12:56', '2021-03-25 15:13:03', '2021-03-26 06:22:17'),
(24, 68, 455, 71, 'transfer-picture-1616685200742.jpg', 'reject', '2021-03-25 10:13:12', '2021-03-25 15:13:22', '2021-03-26 06:21:59'),
(25, 68, 5555, NULL, 'transfer-picture-1616686892074.jpg', 'pending', '2021-03-25 10:41:22', '2021-03-25 15:41:33', '0000-00-00 00:00:00'),
(26, 71, 20000, 71, 'transfer-picture-1616688008702.jpg', 'accept', '2021-03-25 10:59:59', '2021-03-25 16:00:10', '2021-03-26 07:57:29'),
(27, 69, 5600, 71, 'transfer-picture-1616688217514.jpg', 'accept', '2021-03-25 11:03:20', '2021-03-25 16:03:42', '2021-03-26 06:22:24'),
(28, 70, 10, 71, 'transfer-picture-1616688424795.jpg', 'accept', '2021-03-25 11:06:52', '2021-03-25 16:07:06', '2021-03-26 07:57:26'),
(29, 69, 9000000, 70, 'transfer-picture-1616691097145.jpg', 'accept', '2021-03-25 11:51:08', '2021-03-25 16:51:37', '2021-03-25 16:52:34'),
(30, 69, 6000, 70, 'transfer-picture-1616691270050.jpg', 'accept', '2021-03-25 11:54:22', '2021-03-25 16:54:30', '2021-03-25 16:54:48'),
(31, 66, 4454, NULL, 'transfer-picture-1616726966245.jpg', 'pending', '2021-03-26 09:49:03', '2021-03-26 02:49:26', '0000-00-00 00:00:00'),
(32, 74, 100000, 71, 'transfer-picture-1616731257419.jpg', 'accept', '2021-03-26 11:00:47', '2021-03-26 04:00:58', '2021-03-26 04:26:43'),
(33, 75, 500000, 71, 'transfer-picture-1616732378185.jpg', 'accept', '2021-03-26 11:19:34', '2021-03-26 04:19:41', '2021-03-26 04:26:40'),
(34, 66, 10000, 71, 'transfer-picture-1616737378928.jpg', 'accept', '2021-03-26 12:42:50', '2021-03-26 05:42:59', '2021-03-26 05:44:04'),
(35, 70, 500000, 71, 'transfer-picture-1616737408325.jpg', 'accept', '2021-03-26 12:43:18', '2021-03-26 05:43:30', '2021-03-26 05:44:06'),
(36, 76, 20000, 71, 'transfer-picture-1616739382877.jpg', 'accept', '2021-03-26 01:16:09', '2021-03-26 06:16:24', '2021-03-26 07:57:21'),
(37, 77, 20000, 71, 'transfer-picture-1616740864892.jpg', 'accept', '2021-03-26 01:41:02', '2021-03-26 06:41:05', '2021-03-26 07:44:33'),
(38, 74, 20000, 71, 'transfer-picture-1616743426181.jpg', 'accept', '2021-03-26 02:23:37', '2021-03-26 07:23:46', '2021-03-26 07:57:19'),
(39, 74, 20000, 71, 'transfer-picture-1616743475178.jpg', 'accept', '2021-03-26 02:24:18', '2021-03-26 07:24:35', '2021-03-26 07:57:15'),
(40, 75, 50000, 71, 'transfer-picture-1616743537311.jpg', 'accept', '2021-03-26 02:25:28', '2021-03-26 07:25:39', '2021-03-26 07:57:13'),
(41, 77, 20000, 71, 'transfer-picture-1616743550509.jpg', 'accept', '2021-03-26 02:25:48', '2021-03-26 07:25:50', '2021-03-26 07:44:09'),
(42, 74, 20000, 71, 'transfer-picture-1616743554293.jpg', 'accept', '2021-03-26 02:25:40', '2021-03-26 07:25:57', '2021-03-26 07:26:34'),
(43, 66, 100000000, NULL, 'transfer-picture-1616743562095.jpg', 'pending', '2021-03-26 02:25:45', '2021-03-26 07:26:02', '0000-00-00 00:00:00'),
(44, 74, 2000000, 71, 'transfer-picture-1616744742088.jpg', 'accept', '2021-03-26 02:45:35', '2021-03-26 07:45:43', '2021-03-26 07:46:02'),
(45, 81, 400000, 71, 'transfer-picture-1616745119517.jpg', 'accept', '2021-03-26 02:51:44', '2021-03-26 07:52:00', '2021-03-26 07:57:06');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` int NOT NULL,
  `idSender` int NOT NULL,
  `idReceiver` int NOT NULL,
  `amount` int NOT NULL,
  `notes` text NOT NULL,
  `status` varchar(50) NOT NULL,
  `dateTransaction` datetime NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updatedAt` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `idSender`, `idReceiver`, `amount`, `notes`, `status`, `dateTransaction`, `updatedAt`) VALUES
(82, 67, 66, 20000, 'wkwkwwkw', 'transfer', '2021-03-02 00:00:00', '0000-00-00 00:00:00'),
(83, 67, 66, 20000, 'wkwkwwkw', 'transfer', '2021-03-02 00:00:00', '0000-00-00 00:00:00'),
(84, 67, 66, 20000, 'wkwkwwkw', 'transfer', '2021-03-02 00:00:00', '0000-00-00 00:00:00'),
(85, 67, 66, 20000, 'wkwkwwkw', 'transfer', '2021-03-02 00:00:00', '0000-00-00 00:00:00'),
(86, 67, 68, 20000, 'wkwkwwkw', 'transfer', '2021-03-02 00:00:00', '0000-00-00 00:00:00'),
(87, 66, 68, 1000, 'jajan', 'transfer', '2021-03-25 08:19:32', '0000-00-00 00:00:00'),
(88, 68, 66, 1000, 'Balik', 'transfer', '2021-03-25 08:20:40', '0000-00-00 00:00:00'),
(89, 66, 68, 1000, 'jajan', 'transfer', '2021-03-25 08:21:12', '0000-00-00 00:00:00'),
(90, 68, 69, 20000, 'Balik', 'transfer', '2021-03-25 08:21:56', '0000-00-00 00:00:00'),
(91, 66, 68, 1000, 'jajan', 'transfer', '2021-03-25 08:26:41', '0000-00-00 00:00:00'),
(92, 69, 68, 2000, 'Beli.baju', 'transfer', '2021-03-25 08:30:30', '0000-00-00 00:00:00'),
(93, 70, 67, 10000, 'Tes', 'transfer', '2021-03-25 08:31:41', '0000-00-00 00:00:00'),
(94, 68, 69, 20000, 'Okay', 'transfer', '2021-03-25 08:31:52', '0000-00-00 00:00:00'),
(95, 69, 68, 500, 'Beli permwn', 'transfer', '2021-03-25 08:36:29', '0000-00-00 00:00:00'),
(96, 69, 71, 6000, 'Huu', 'transfer', '2021-03-25 09:20:33', '0000-00-00 00:00:00'),
(97, 69, 68, 6000, 'Huu', 'transfer', '2021-03-25 09:21:26', '0000-00-00 00:00:00'),
(98, 69, 68, 6000, 'Huu', 'transfer', '2021-03-25 09:21:53', '0000-00-00 00:00:00'),
(99, 69, 71, 6000, 'Huu', 'transfer', '2021-03-25 09:22:35', '0000-00-00 00:00:00'),
(100, 69, 68, 6000, 'Huu', 'transfer', '2021-03-25 09:22:55', '0000-00-00 00:00:00'),
(101, 71, 69, 20000, 'Test', 'transfer', '2021-03-25 09:52:07', '0000-00-00 00:00:00'),
(102, 69, 70, 5000, 'Gg', 'transfer', '2021-03-25 10:07:32', '0000-00-00 00:00:00'),
(103, 69, 70, 5000, 'Gg', 'transfer', '2021-03-25 10:07:32', '0000-00-00 00:00:00'),
(104, 69, 70, 5000, 'Gg', 'transfer', '2021-03-25 10:07:32', '0000-00-00 00:00:00'),
(105, 69, 70, 5000, 'Gg', 'transfer', '2021-03-25 10:07:32', '0000-00-00 00:00:00'),
(106, 69, 71, 5000, 'Gg', 'transfer', '2021-03-25 10:08:54', '0000-00-00 00:00:00'),
(107, 71, 69, 20000, 'Test', 'transfer', '2021-03-25 10:08:41', '0000-00-00 00:00:00'),
(108, 69, 68, 548, 'VG', 'transfer', '2021-03-25 10:18:28', '0000-00-00 00:00:00'),
(109, 69, 68, 2000, 'Ggg', 'transfer', '2021-03-25 10:21:19', '0000-00-00 00:00:00'),
(110, 69, 71, 200, 'Ggg', 'transfer', '2021-03-25 10:28:57', '0000-00-00 00:00:00'),
(111, 67, 68, 20000, 'wkwkwwkw', 'transfer', '2021-03-02 00:00:00', '0000-00-00 00:00:00'),
(112, 67, 68, 20000, 'wkwkwwkw', 'transfer', '2021-03-02 00:00:00', '0000-00-00 00:00:00'),
(113, 69, 66, 12, 'Gg', 'transfer', '2021-03-25 10:48:12', '0000-00-00 00:00:00'),
(114, 71, 69, 7000, 'Ridho', 'transfer', '2021-03-25 11:05:39', '0000-00-00 00:00:00'),
(115, 69, 71, 85000, 'Ggfg ', 'transfer', '2021-03-25 11:06:33', '0000-00-00 00:00:00'),
(116, 68, 69, 1000000, 'Gajian', 'transfer', '2021-03-25 11:07:09', '0000-00-00 00:00:00'),
(117, 68, 70, 500000, 'Gaji bln ini', 'transfer', '2021-03-25 11:39:55', '0000-00-00 00:00:00'),
(118, 70, 68, 1000, 'Permen', 'transfer', '2021-03-25 11:40:38', '0000-00-00 00:00:00'),
(119, 68, 70, 200000, 'Ffff', 'transfer', '2021-03-25 11:41:44', '0000-00-00 00:00:00'),
(120, 69, 70, 5000000, 'Beli kasur', 'transfer', '2021-03-25 11:55:54', '0000-00-00 00:00:00'),
(121, 72, 71, 80, 'Bb', 'transfer', '2021-03-26 12:01:17', '0000-00-00 00:00:00'),
(122, 69, 71, 6000, 'Gg', 'transfer', '2021-03-26 12:20:41', '0000-00-00 00:00:00'),
(123, 71, 70, 280, 'Test', 'transfer', '2021-03-26 09:15:04', '0000-00-00 00:00:00'),
(124, 66, 71, 100000, 'Ddr', 'transfer', '2021-03-26 09:19:35', '0000-00-00 00:00:00'),
(125, 71, 66, 81000, 'buyy', 'Transfer', '2021-03-26 09:19:11', '0000-00-00 00:00:00'),
(126, 66, 69, 20000, 'Yamg', 'transfer', '2021-03-26 09:37:42', '0000-00-00 00:00:00'),
(127, 66, 69, 20000, 'Ejej', 'transfer', '2021-03-26 09:38:32', '0000-00-00 00:00:00'),
(128, 71, 69, 10000, 'Beli seblak', 'transfer', '2021-03-26 09:41:29', '0000-00-00 00:00:00'),
(129, 66, 71, 20000, 'Ejej', 'transfer', '2021-03-26 09:55:19', '0000-00-00 00:00:00'),
(130, 71, 66, 10000, 'ridho', 'Transfer', '2021-03-26 09:55:34', '0000-00-00 00:00:00'),
(131, 69, 71, 50000, 'Ha', 'transfer', '2021-03-26 10:23:49', '0000-00-00 00:00:00'),
(132, 69, 71, 800000, 'Hu', 'transfer', '2021-03-26 10:25:04', '0000-00-00 00:00:00'),
(133, 71, 69, 800000, 'Available', 'transfer', '2021-03-26 10:29:00', '0000-00-00 00:00:00'),
(134, 70, 69, 50000, 'Indomie', 'transfer', '2021-03-26 10:32:47', '0000-00-00 00:00:00'),
(135, 71, 74, 50000, 'buyy', 'Transfer', '2021-03-26 09:55:34', '0000-00-00 00:00:00'),
(136, 74, 71, 20000, 'Ridho', 'transfer', '2021-03-26 11:17:20', '0000-00-00 00:00:00'),
(137, 74, 71, 50000, 'Ridho', 'transfer', '2021-03-26 11:18:11', '0000-00-00 00:00:00'),
(138, 75, 69, 2000, 'Top Up', 'transfer', '2021-03-26 11:18:01', '0000-00-00 00:00:00'),
(139, 69, 75, 56000, 'Ggaga', 'transfer', '2021-03-26 11:26:10', '0000-00-00 00:00:00'),
(140, 71, 74, 70000, 'Seblak', 'transfer', '2021-03-26 02:16:40', '0000-00-00 00:00:00'),
(141, 76, 77, 2000, 'Test', 'transfer', '2021-03-26 02:16:42', '0000-00-00 00:00:00'),
(142, 75, 71, 5000, 'test', 'transfer', '2021-03-26 02:18:10', '0000-00-00 00:00:00'),
(143, 76, 71, 5000, 'Test', 'transfer', '2021-03-26 02:20:24', '0000-00-00 00:00:00'),
(144, 75, 71, 10000, 'buat bekel', 'transfer', '2021-03-26 02:20:39', '0000-00-00 00:00:00'),
(145, 66, 74, 100000, 'Jajan', 'transfer', '2021-03-26 02:20:22', '0000-00-00 00:00:00'),
(146, 71, 74, 20000, 'seblak', 'Transfer', '2021-03-26 02:06:44', '0000-00-00 00:00:00'),
(147, 66, 71, 10000, 'Wwwj', 'transfer', '2021-03-26 02:28:37', '0000-00-00 00:00:00'),
(148, 74, 71, 20000, 'seblak', 'transfer', '2021-03-26 02:29:49', '0000-00-00 00:00:00'),
(149, 77, 71, 10, 'Test', 'transfer', '2021-03-26 02:30:56', '0000-00-00 00:00:00'),
(150, 66, 71, 1000, 'Ehehe', 'transfer', '2021-03-26 02:30:46', '0000-00-00 00:00:00'),
(151, 75, 71, 5000, 'jajan bro', 'transfer', '2021-03-26 02:31:02', '0000-00-00 00:00:00'),
(152, 74, 71, 90000, '200000', 'transfer', '2021-03-26 02:31:18', '0000-00-00 00:00:00'),
(153, 70, 71, 1000000, 'Permen', 'transfer', '2021-03-26 02:31:32', '0000-00-00 00:00:00'),
(154, 66, 71, 20000, 'Wkwkw', 'transfer', '2021-03-26 02:31:50', '0000-00-00 00:00:00'),
(155, 66, 77, 8000, 'Shs', 'transfer', '2021-03-26 02:41:30', '0000-00-00 00:00:00'),
(156, 75, 77, 5000, 'test', 'transfer', '2021-03-26 02:41:35', '0000-00-00 00:00:00'),
(157, 74, 77, 300000, 'Notes', 'transfer', '2021-03-26 02:41:51', '0000-00-00 00:00:00'),
(158, 70, 77, 1000000, 'Seblal', 'transfer', '2021-03-26 02:41:58', '0000-00-00 00:00:00'),
(159, 75, 77, 50000, 'test', 'transfer', '2021-03-26 02:42:09', '0000-00-00 00:00:00'),
(160, 75, 77, 50000, 'test', 'transfer', '2021-03-26 02:42:45', '0000-00-00 00:00:00'),
(161, 70, 77, 10000, 'Tes', 'transfer', '2021-03-26 02:42:46', '0000-00-00 00:00:00'),
(162, 70, 77, 123465, 'Tes', 'transfer', '2021-03-26 02:45:35', '0000-00-00 00:00:00'),
(163, 75, 77, 5000, 'test', 'transfer', '2021-03-26 02:45:42', '0000-00-00 00:00:00'),
(164, 75, 77, 80000, 'test', 'transfer', '2021-03-26 02:46:04', '0000-00-00 00:00:00'),
(165, 70, 77, 23588, 'Tes', 'transfer', '2021-03-26 02:46:09', '0000-00-00 00:00:00'),
(166, 74, 77, 100000, 'Notes', 'transfer', '2021-03-26 02:46:22', '0000-00-00 00:00:00'),
(167, 81, 76, 65000, 'Tumbas jajan', 'transfer', '2021-03-26 02:48:54', '0000-00-00 00:00:00'),
(168, 81, 77, 1000, 'Jkkk', 'transfer', '2021-03-26 02:54:24', '0000-00-00 00:00:00'),
(169, 80, 77, 25000, 'Kkkk', 'transfer', '2021-03-26 02:58:44', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) DEFAULT ' ',
  `email` varchar(50) NOT NULL,
  `password` varchar(60) NOT NULL,
  `phoneNumber` varchar(15) DEFAULT NULL,
  `pin` varchar(60) DEFAULT NULL,
  `balance` int NOT NULL,
  `picture` varchar(100) DEFAULT NULL,
  `role` int NOT NULL,
  `status` varchar(50) NOT NULL,
  `token` varchar(255) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `email`, `password`, `phoneNumber`, `pin`, `balance`, `picture`, `role`, `status`, `token`, `createdAt`, `updatedAt`) VALUES
(66, 'matthew', '', 'mathiuskormasela12@gmail.com', '$2b$10$n/MSvuh4.f3lG1eGrQnFfO7nyPYnPC7mg0WYuZwiSQuEAFDPcoayi', NULL, '$2b$10$mId2boSMu/Oc7SlB1ymORORqPs4B6zpdlYpe3.IJ8hnjdh70XS5IW', 20000000, NULL, 2, 'active', 'dbhlI0otTHOwv68o2aHN6s:APA91bGCu_WhmM9klYqD1dBhQjybYgHe2hQtU-HgFQSqgZv8102L0Z9I_HQnoG5JnFE_D66-wjOim0w2J1ypcaZ_VOcEmMiz539XBMKTUMhM9--JxCuXsPcuBGuEw60ybINrkVQTF3UD', '2021-03-25 12:25:07', '2021-03-26 07:46:05'),
(67, 'mathius', '', 'mathiuskormasela12rpl@gmail.com', '$2b$10$qJM2Qveq9nL7UOJk1q/qju5dIeNHKbZ0d3O6yC0f3H7TmTA9G0i2q', NULL, '$2b$10$lFwcrOsHJR.CypQmI/WXLerWlw14FAIYPn5CeeL/WQSXT6l1PwdMy', 9980000, NULL, 2, 'active', 'null', '2021-03-25 12:27:24', '2021-03-25 15:43:01'),
(68, 'Nayeon', '', 'nayeontwice123456@gmail.com', '$2b$10$OoasIhBj1piMaUZ13Hn5SO3IomRCm5O.qSgzbc5vfdNHXAiQQCN/6', '5555888888', '$2b$10$VD1MdsuN7U0bbrPC5R0S8.Hem3UaBCrFntoQWwp6oLOFzfNxbKRe.', 472969, 'profile-picture-1616687598116.jpg', 2, 'active', 'null', '2021-03-25 12:53:12', '2021-03-26 06:22:17'),
(69, 'Zaqi', 'jr', 'zaqijr7@gmail.com', '$2b$10$DKxSNAr9b3drwIAHbY9DLuREsnP7UiKmlnMIBsECcb746x32SKIBa', NULL, '$2b$10$SOp41t/8sVM1FiNSZ2gEyu6VyhHM6EClqIy0FOo4HJ2qW4p0W/g0i', 5963340, 'profile-picture-1616736043365.jpg', 1, 'active', 'null', '2021-03-25 13:19:11', '2021-03-26 06:22:24'),
(70, 'Yosef', 'balabala', 'yosefsitumorang97@gmail.com', '$2b$10$mSwRuMA9Jr0g62dm2FemnuZ/oHr9N5neXGr1XaTPWLxRxCffeh4YS', 'null', '$2b$10$Do5kyvYH1ujBSxLgvc47A.BBGrw8cBg1wu83bpII1w33savXpokEW', 4122237, 'profile-picture-1616688094194.jpg', 1, 'active', 'cpcLAbeZStqO25IIphS53X:APA91bFtySjoOcgBTmCV5Sy2o6BFecKBFMJAyiln_xKOnpVJnIgtd0bR7UxqDIEX8WzUF7eS2X5zxE2u8s5IijRgUqS_35KBFqDKquB36GjpHzmEHhjy0sjxSj56GankU1uEWwqhNG9T', '2021-03-25 13:28:59', '2021-03-26 07:57:26'),
(71, 'Ridho', '', 'ridhomujizat@gmail.com', '$2b$10$VUQVxJUqrK3ZiYL5x3zzCurVSWieFXtv7KOrnorC1RaVrEdIjnLsy', '85811588248', '$2b$10$Kl7t/KjeK..N5/JLHm79aOO4K2Anra22j7o3mGzK9J0MFsSuDVDCC', 1366010, 'profile-picture-1616742767048.jpg', 1, 'active', 'null', '2021-03-25 13:31:19', '2021-03-26 07:57:29'),
(72, 'Haha', '', 'haha@gmail.com', '$2b$10$41lZu.lP1Y8gLjEKBMIfeuU//lXdlebNbUgIPBvKW3K.lxeyaXX6m', NULL, '$2b$10$t0yCtJIA0hqgeshvkXonnuSCs5GLDgXfOjSi7m7Jz7egmdmzP6i7.', 119920, NULL, 2, 'active', 'null', '2021-03-25 16:57:41', '2021-03-25 17:05:21'),
(73, 'Zack', 'btc', 'zackbtc02@gmail.com', '$2b$10$NjJvf0cAaWvrfoaNtjF3dOxGL1vot/gXV.JXdcr4YgDAHoT.3sX8a', NULL, '$2b$10$Z1.MRhXndtBMfuj.Qm5BN.5gaYNS/9KjrH4f4QYjYL7u1BpNKEc7O', 120000, NULL, 2, 'active', 'null', '2021-03-26 01:18:10', '2021-03-26 02:10:31'),
(74, 'Rahma', '', 'rahmarayanti@gmail.com', '$2b$10$n6dwmIDvsB2LyT61Ao3EKOmwTHdovPK/nsHlXmjXt0HaswjlfHuBW', NULL, '$2b$10$h9vv/Uy5cczfw5v5jaOgtOzXSa3fAfha09eqFmF/b4GXJuhs7bSAu', 1940000, 'profile-picture-1616728892883.jpg', 2, 'active', 'dwLQFcMMSSykdlT8CPtQV6:APA91bG2RuWeeAkJ57ukGIr22xfo90UJx8cE1kZGDm8sXAoTHSHtiIlttuQuWKWs_o5G-CrEVHKxNkVzBw-tYLxr8XOvvYPmC-0DgturaAS6iPB64IH0RjoLgIuyf-4KkbBGV7VqXTLs', '2021-03-26 03:05:52', '2021-03-26 07:57:19'),
(75, 'abbi', '', 'abbisatria98@gmail.com', '$2b$10$8f4//7UQ/ozlwEy9hV8YcuODKS5DP2ZRBT61DwPOpYewGW4N/tvIi', '8997212282', '$2b$10$wPd/f1OhzCbpQEqFQtD40eDJSu0BEfrO/UOhpPl1t.9dYuQo.2nUW', 514000, 'profile-picture-1616742761525.jpg', 2, 'active', 'eecO7TqVRCCR0WiAhWlfZE:APA91bGYrYMkGsqgBKamxft97egacTozDw658y6qZAnxMnnmP_zpB60StYUDd1T78HyC0nTIXmVQron5eYm-EDZMTckjb0KiNpjh-sA-IREXeLJHl5BGSRcHljNdJH48-L6S78ObaT88', '2021-03-26 03:57:31', '2021-03-26 07:57:13'),
(76, 'rizkirim', '', 'rizukirimu@gmail.com', '$2b$10$1g1pOKpkFXODwcRwF0KTEOTIN/0.tcsgD.laEitnG.73vKy3Pupx.', '82126555187', '$2b$10$m09zjrtSFXNGSaqYi0KjdeGnu6O5UNg0kbcQLd27UTaSzN32uKn/2', 198000, 'profile-picture-1616742939766.jpg', 2, 'active', 'eef_YC-CSIe4Lnv33xBWcW:APA91bHk7tR1sKUdAc_D1UHyx1m4sRG2QPVRKM2HwYabM165NosvlPVqOuEASMVVm7YWJoZcsPg9ckAq_mK_vL_6dLb1zGjJLVFP67Si4_1x7Kw2c1tVP8PjP6UQEl6Bb1B9ulF0_o95', '2021-03-26 06:12:37', '2021-03-26 07:57:21'),
(77, 'fahrul', '', 'fahrul@mail.com', '$2b$10$qpEnKBd7RC.7B/Vd0d.Fk.sySANQfHqoXkMQlw01SNVI4u8K5IXUy', '81222333444', '$2b$10$Nj4tZ1XJv6NOIhCweSEsvuQGPqk8LM.wszSCwDr1ZvCJlyAyN.OtS', 1943043, 'profile-picture-1616742550175.jpg', 2, 'active', 'cHgxEmEkTuy1drXEeqkDBD:APA91bFYAIyXbSHPLPFdXY18HrR1TF4fYIEbXdngkvZJnE-P85-b6RE9iDH706PMi_G4b3iTp-lNq2moI-Q-DZ8eC3zZ39wwJTwSKT6MIaD-tXOEHZ_iw2Cz7YkId0ia4vANKod3I_zT', '2021-03-26 06:37:39', '2021-03-26 07:58:48'),
(78, 'Nano', 'milk', 'yosefsitumorang03@gmail.com', '$2b$10$e136e02x3asqjRmgPOkTzuZriBrQa09ueniEJqOKQBcnaKNdp/0g6', NULL, '$2b$10$0UCAwGLKtoSLiK9PkElX1uDNY0YPMSmElHzEeSti8ueA.E6eQRx92', 120000, NULL, 2, 'active', 'drByEqcaSmqmA2Y6RclN2s:APA91bEnifVkHowBGlI6SNMFSLYMGRmjV01qQFYHQ_KaOv1eP0q5UOThuoML0pPpU1FgcDWTVzYPwFIdXem2xMgqGdV_7TTbMeShYkLaGeljLOjbsHZYesErA9mJYcThqHlIHNB6Xz4D', '2021-03-26 06:47:22', '2021-03-26 06:47:49'),
(79, 'Zaqi', 'aja', 'zackbtc0@gmail.com', '$2b$10$T6YTSY3XzpPR.CuTV0/Vi.6tLz3u7N0nppdN7R7aKFFAGXGnbnm6e', NULL, '$2b$10$LpU8MatnWQpNDvPAm..TS.wI2baHjF4Bw4OuGgafcHpsCBO3MxMXe', 120000, NULL, 2, 'active', NULL, '2021-03-26 06:51:40', '2021-03-26 06:52:30'),
(80, 'Faela', '', 'Faelashufa.fs@gmail.com', '$2b$10$RzUQrOXkVZlYxB3YJehuOupExPq/qACe1iWxtZK9nKIqQDoN3riPG', NULL, '$2b$10$TkTDgDrCbWM18Nslm5kE.ONItw2RdMO9qFcxvSCju2qKnKUOXFGIC', 95000, NULL, 2, 'active', 'fRH_Lgp9Sp6LdoRjWAD0q8:APA91bG-V5Yk3i4oYIgu0Yh6Rr4qUy6Bxa42VURhTDexvp_xf2_d11c4s0R36qFeJFbyxA7Qn_BW12rmbAWITMNiGXZGK537zFNekZhO_PsyK76LPYV0wAJ_SHgVCqcJe0he1qO3gFqD', '2021-03-26 07:26:09', '2021-03-26 07:58:48'),
(81, 'Shafa', 'Naura', 'shafa@gmail.com', '$2b$10$L9MNFTbSg6l6sZPwmvtD2e0akiP2j/iV4DIa0kFq6TmrKmXXTCUmG', '89539869669', '$2b$10$66M5zh7AQjvKlfvP28LtSugqWSi857BjViSANbadDpiekw0F4tMPy', 454000, 'profile-picture-1616744906954.png', 2, 'active', 'f3Mubfp-QQ-ZrC2FhpHOY7:APA91bHq594IaoW2CB9CAa-Dm02egKlS_6HjuGOFA84xuLEgW2BK1RMylOd4zpVfP-6M9_--IgqxgSG3PZu5pyWDvnUJmcdXkMGCPvhNYscK7YvEcS0ppN2FyDP3uUia5sZU4orvEiok', '2021-03-26 07:47:31', '2021-03-26 07:57:06');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `amount_transaction`
--
ALTER TABLE `amount_transaction`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idUser` (`idUser`);

--
-- Indexes for table `top_up`
--
ALTER TABLE `top_up`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idUser` (`idUser`),
  ADD KEY `idAdmin` (`idAdmin`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idReceiver` (`idReceiver`),
  ADD KEY `transactions_ibfk_2` (`idSender`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `amount_transaction`
--
ALTER TABLE `amount_transaction`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `top_up`
--
ALTER TABLE `top_up`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=170;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `amount_transaction`
--
ALTER TABLE `amount_transaction`
  ADD CONSTRAINT `amount_transaction_ibfk_1` FOREIGN KEY (`idUser`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `top_up`
--
ALTER TABLE `top_up`
  ADD CONSTRAINT `top_up_ibfk_1` FOREIGN KEY (`idUser`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `top_up_ibfk_2` FOREIGN KEY (`idAdmin`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`idReceiver`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `transactions_ibfk_2` FOREIGN KEY (`idSender`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
