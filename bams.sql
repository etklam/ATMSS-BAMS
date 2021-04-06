-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- 主機： localhost
-- 產生時間： 2021 年 04 月 05 日 15:59
-- 伺服器版本： 10.5.9-MariaDB-1:10.5.9+maria~focal
-- PHP 版本： 7.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫： `admin_bams`
--

-- --------------------------------------------------------

--
-- 資料表結構 `Account`
--

CREATE TABLE `Account` (
  `acctNum` char(20) NOT NULL,
  `credit` float NOT NULL,
  `acctType` char(20) NOT NULL,
  `CardNo` char(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 傾印資料表的資料 `Account`
--

INSERT INTO `Account` (`acctNum`, `credit`, `acctType`, `CardNo`) VALUES
('0000-00', 10000, 'Current', '0000'),
('0000-01', 10000, 'Saving', '0000');

-- --------------------------------------------------------

--
-- 資料表結構 `Client`
--

CREATE TABLE `Client` (
  `CardNo` char(20) NOT NULL,
  `Pin` char(6) NOT NULL,
  `firstName` char(20) NOT NULL,
  `lastName` char(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 傾印資料表的資料 `Client`
--

INSERT INTO `Client` (`CardNo`, `Pin`, `firstName`, `lastName`) VALUES
('0000', '000000', 'Elliot', 'Chan'),
('0001', '000000', 'Elliot2', 'Chan');

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `Account`
--
ALTER TABLE `Account`
  ADD PRIMARY KEY (`acctNum`),
  ADD KEY `CardNo` (`CardNo`);

--
-- 資料表索引 `Client`
--
ALTER TABLE `Client`
  ADD PRIMARY KEY (`CardNo`);

--
-- 已傾印資料表的限制式
--

--
-- 資料表的限制式 `Account`
--
ALTER TABLE `Account`
  ADD CONSTRAINT `Account_ibfk_1` FOREIGN KEY (`CardNo`) REFERENCES `Client` (`CardNo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
