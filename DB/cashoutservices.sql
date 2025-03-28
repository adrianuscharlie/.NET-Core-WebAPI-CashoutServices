-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 14, 2025 at 03:20 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.0.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cashoutservices`
--

-- --------------------------------------------------------

--
-- Table structure for table `list_url`
--

CREATE TABLE `list_url` (
  `partnerID` text NOT NULL,
  `url` text NOT NULL,
  `trxType` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `list_url`
--

INSERT INTO `list_url` (`partnerID`, `url`, `trxType`) VALUES
('000101', 'http://host.docker.internal:5002/api/Cashout/Dana', 'CASHOUT'),
('000102', 'http://host.docker.internal:5002/api/Cashout/Gopay', 'CASHOUT'),
('000102', 'http://host.docker.internal:5002/api/B2BToken/Gopay', 'TOKEN'),
('000103', 'http://host.docker.internal:5002/api/Cashout/ISaku', 'CASHOUT'),
('000103', 'http://host.docker.internal:5002/api/B2BToken/ISaku', 'TOKEN'),
('000101', 'http://host.docker.internal:5002/api/Reversal/Dana', 'REVERSAL'),
('000101y', 'http://host.docker.internal:5002/api/Cashout/Dana', 'CASHOUT');

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE `logs` (
  `id` int(11) NOT NULL,
  `Timestamp` varchar(100) DEFAULT NULL,
  `Level` varchar(15) DEFAULT NULL,
  `Template` text DEFAULT NULL,
  `Message` text DEFAULT NULL,
  `Exception` text DEFAULT NULL,
  `Properties` text DEFAULT NULL,
  `_ts` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `mastermerchant`
--

CREATE TABLE `mastermerchant` (
  `partnerID` varchar(50) NOT NULL,
  `productType` varchar(50) NOT NULL,
  `partner` varchar(50) NOT NULL,
  `kredigram` varchar(50) NOT NULL,
  `clientID` varchar(50) NOT NULL,
  `isToken` tinyint(1) NOT NULL,
  `extraParam1` text NOT NULL,
  `extraParam2` text NOT NULL,
  `extraParam3` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `mastermerchant`
--

INSERT INTO `mastermerchant` (`partnerID`, `productType`, `partner`, `kredigram`, `clientID`, `isToken`, `extraParam1`, `extraParam2`, `extraParam3`) VALUES
('000101', 'DANACO', 'DANA', 'STANDARD', 'd@n@', 0, '', '', ''),
('000101y', 'DANACO', 'DANA', 'STANDARD', 'd@n@', 0, '', '', ''),
('000102', 'GOPAYCO', 'GOPAY', 'SNAP', 'gop@y', 1, '', '', ''),
('000103', 'ISAKUCO', 'ISAKU', 'SNAP', 'is@ku', 1, '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `reversal`
--

CREATE TABLE `reversal` (
  `trxID` varchar(50) NOT NULL,
  `productType` varchar(50) NOT NULL,
  `timeStamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `amount` float NOT NULL,
  `otp` varchar(50) NOT NULL,
  `customerNumber` varchar(50) NOT NULL,
  `cacode` varchar(50) NOT NULL,
  `request` longtext NOT NULL,
  `response` longtext NOT NULL,
  `responseCode` varchar(50) NOT NULL,
  `responseMessage` text NOT NULL,
  `trxConfirm` varchar(50) NOT NULL,
  `trxType` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `reversal`
--

INSERT INTO `reversal` (`trxID`, `productType`, `timeStamp`, `amount`, `otp`, `customerNumber`, `cacode`, `request`, `response`, `responseCode`, `responseMessage`, `trxConfirm`, `trxType`) VALUES
('C0000120250309202717', 'DANACO', '2025-03-09 13:28:05', 250000, '108936', '', 'C00001', '{\"timeStamp\":\"2025-03-09 20:28:05\",\"clientdID\":\"d@n@\",\"productType\":\"DANACO\",\"trxType\":\"REVERSAL\",\"Detail\":{\"trxID\":\"C0000120250309202717\",\"token\":\"108936\",\"amount\":\"250000\",\"noHp\":\"\"}}', '{\"timeStamp\":\"2025-03-09 20:28:05\",\"clientID\":\"d@n@\",\"productType\":\"DANACO\",\"trxType\":\"REVERSAL\",\"detail\":{\"trxID\":\"C0000120250309202717\",\"token\":\"108936\",\"amount\":\"250000\",\"noHp\":\"\"},\"respCode\":\"OK\",\"respDetail\":\"Reversal Success\"}', 'OK', 'Reversal Success', 'OK', 'REVERSAL'),
('C0000120250309221654', 'GOPAYCO', '2025-03-09 15:18:13', 400000, '512254', '', 'C00001', '{\"originalPartnerReferenceNo\":\"C0000120250309221654\",\"originalReferenceNo\":null,\"customerNumber\":\"\",\"reason\":null,\"additionalInfo\":{\"merchantId\":\"C00001\",\"merchantName\":\"INDONESIA C00001\",\"externalStoreId\":\"\",\"branchId\":\"\",\"terminalId\":\"\"}}', '', '', '', '', 'REVERSAL');

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

CREATE TABLE `transaction` (
  `trxID` varchar(50) NOT NULL,
  `productType` varchar(50) NOT NULL,
  `timeStamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `amount` float NOT NULL,
  `otp` varchar(50) NOT NULL,
  `customerNumber` varchar(50) NOT NULL,
  `cacode` varchar(50) NOT NULL,
  `request` longtext NOT NULL,
  `response` longtext NOT NULL,
  `responseCode` varchar(50) NOT NULL,
  `responseMessage` text NOT NULL,
  `trxConfirm` varchar(50) NOT NULL,
  `trxType` varchar(50) NOT NULL,
  `reversalDate` timestamp NULL DEFAULT NULL,
  `reversalCode` varchar(50) DEFAULT NULL,
  `reversalMessage` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `transaction`
--

INSERT INTO `transaction` (`trxID`, `productType`, `timeStamp`, `amount`, `otp`, `customerNumber`, `cacode`, `request`, `response`, `responseCode`, `responseMessage`, `trxConfirm`, `trxType`, `reversalDate`, `reversalCode`, `reversalMessage`) VALUES
('C0000120250309202717', 'DANACO', '2025-03-09 13:28:05', 250000, '108936', '', 'C00001', '{\"timeStamp\":\"2025-03-09 20:27:17\",\"clientdID\":\"d@n@\",\"productType\":\"DANACO\",\"trxType\":\"CASHOUT\",\"Detail\":{\"trxID\":\"C0000120250309202717\",\"token\":\"108936\",\"amount\":\"250000\",\"noHp\":\"\"}}', '{\"timeStamp\":\"2025-03-09 20:27:18\",\"clientID\":\"d@n@\",\"productType\":\"DANACO\",\"trxType\":\"CASHOUT\",\"detail\":{\"trxID\":\"C0000120250309202717\",\"token\":\"108936\",\"amount\":\"250000\",\"noHp\":\"\"},\"respCode\":\"9990\",\"respDetail\":\"Token Expired\"}', '9990', 'Token Expired', 'OK', 'CASHOUT', '2025-03-09 13:28:05', 'XX', 'Before Request'),
('C0000120250309204604', 'GOPAYCO', '2025-03-09 13:46:04', 500000, '526962', '', 'C00001', '{\"partnerReferenceNo\":\"C0000120250309204604\",\"customerNumber\":\"\",\"otp\":\"526962\",\"amount\":{\"value\":\"500000\",\"currency\":\"IDR\"},\"additionalInfo\":{\"merchantId\":\"C00001\",\"merchantName\":\"INDONESIA C00001\",\"externalStoreId\":\"\",\"branchId\":\"\",\"terminalId\":\"\"}}', '', '', '', '', 'CASHOUT', NULL, NULL, NULL),
('C0000120250309204657', 'GOPAYCO', '2025-03-09 13:48:00', 400000, '588849', '', 'C00001', '{\"partnerReferenceNo\":\"C0000120250309204657\",\"customerNumber\":\"\",\"otp\":\"588849\",\"amount\":{\"value\":\"400000\",\"currency\":\"IDR\"},\"additionalInfo\":{\"merchantId\":\"C00001\",\"merchantName\":\"INDONESIA C00001\",\"externalStoreId\":\"\",\"branchId\":\"\",\"terminalId\":\"\"}}', '', '', '', 'FAIL', 'CASHOUT', NULL, NULL, NULL),
('C0000120250309205247', 'GOPAYCO', '2025-03-09 13:54:27', 500000, '544981', '', 'C00001', '{\"partnerReferenceNo\":\"C0000120250309205247\",\"customerNumber\":\"\",\"otp\":\"544981\",\"amount\":{\"value\":\"500000\",\"currency\":\"IDR\"},\"additionalInfo\":{\"merchantId\":\"C00001\",\"merchantName\":\"INDONESIA C00001\",\"externalStoreId\":\"\",\"branchId\":\"\",\"terminalId\":\"\"}}', '', '', '', 'FAIL', 'CASHOUT', NULL, NULL, NULL),
('C0000120250309210139', 'GOPAYCO', '2025-03-09 14:02:06', 650000, '208238', '', 'C00001', '{\"partnerReferenceNo\":\"C0000120250309210139\",\"customerNumber\":\"\",\"otp\":\"208238\",\"amount\":{\"value\":\"650000\",\"currency\":\"IDR\"},\"additionalInfo\":{\"merchantId\":\"C00001\",\"merchantName\":\"INDONESIA C00001\",\"externalStoreId\":\"\",\"branchId\":\"\",\"terminalId\":\"\"}}', '', '', '', 'FAIL', 'CASHOUT', NULL, NULL, NULL),
('C0000120250309210526', 'GOPAYCO', '2025-03-09 14:06:22', 450000, '919725', '', 'C00001', '{\"partnerReferenceNo\":\"C0000120250309210526\",\"customerNumber\":\"\",\"otp\":\"919725\",\"amount\":{\"value\":\"450000\",\"currency\":\"IDR\"},\"additionalInfo\":{\"merchantId\":\"C00001\",\"merchantName\":\"INDONESIA C00001\",\"externalStoreId\":\"\",\"branchId\":\"\",\"terminalId\":\"\"}}', '', '', '', 'FAIL', 'CASHOUT', NULL, NULL, NULL),
('C0000120250309211059', 'GOPAYCO', '2025-03-09 14:13:41', 700000, '946002', '', 'C00001', '{\"partnerReferenceNo\":\"C0000120250309211059\",\"customerNumber\":\"\",\"otp\":\"946002\",\"amount\":{\"value\":\"700000\",\"currency\":\"IDR\"},\"additionalInfo\":{\"merchantId\":\"C00001\",\"merchantName\":\"INDONESIA C00001\",\"externalStoreId\":\"\",\"branchId\":\"\",\"terminalId\":\"\"}}', '', '', '', 'FAIL', 'CASHOUT', NULL, NULL, NULL),
('C0000120250309211703', 'GOPAYCO', '2025-03-09 14:17:48', 950000, '125959', '', 'C00001', '{\"partnerReferenceNo\":\"C0000120250309211703\",\"customerNumber\":\"\",\"otp\":\"125959\",\"amount\":{\"value\":\"950000\",\"currency\":\"IDR\"},\"additionalInfo\":{\"merchantId\":\"C00001\",\"merchantName\":\"INDONESIA C00001\",\"externalStoreId\":\"\",\"branchId\":\"\",\"terminalId\":\"\"}}', '{\"responseCode\":\"00\",\"responseMessage\":\"SUKSES\",\"referenceNo\":\"Gopay-C0000120250309211703\",\"partnerReferenceNo\":\"C0000120250309211703\",\"transactionDate\":\"2025-03-09 21:17:40\",\"additionalInfo\":{\"merchantId\":\"C00001\",\"merchantName\":\"INDONESIA C00001\",\"externalStoreId\":\"\",\"branchId\":\"\",\"terminalId\":\"\"}}', '', '', '', 'CASHOUT', NULL, NULL, NULL),
('C0000120250309211947', 'GOPAYCO', '2025-03-09 14:20:41', 50000, '945600', '', 'C00001', '{\"partnerReferenceNo\":\"C0000120250309211947\",\"customerNumber\":\"\",\"otp\":\"945600\",\"amount\":{\"value\":\"50000\",\"currency\":\"IDR\"},\"additionalInfo\":{\"merchantId\":\"C00001\",\"merchantName\":\"INDONESIA C00001\",\"externalStoreId\":\"\",\"branchId\":\"\",\"terminalId\":\"\"}}', '{\"responseCode\":\"00\",\"responseMessage\":\"SUKSES\",\"referenceNo\":\"Gopay-C0000120250309211947\",\"partnerReferenceNo\":\"C0000120250309211947\",\"transactionDate\":\"2025-03-09 21:19:52\",\"additionalInfo\":{\"merchantId\":\"C00001\",\"merchantName\":\"INDONESIA C00001\",\"externalStoreId\":\"\",\"branchId\":\"\",\"terminalId\":\"\"}}', '', '', '', 'CASHOUT', NULL, NULL, NULL),
('C0000120250309212223', 'GOPAYCO', '2025-03-09 14:23:04', 750000, '939024', '', 'C00001', '{\"partnerReferenceNo\":\"C0000120250309212223\",\"customerNumber\":\"\",\"otp\":\"939024\",\"amount\":{\"value\":\"750000\",\"currency\":\"IDR\"},\"additionalInfo\":{\"merchantId\":\"C00001\",\"merchantName\":\"INDONESIA C00001\",\"externalStoreId\":\"\",\"branchId\":\"\",\"terminalId\":\"\"}}', '{\"responseCode\":\"00\",\"responseMessage\":\"SUKSES\",\"referenceNo\":\"Gopay-C0000120250309212223\",\"partnerReferenceNo\":\"C0000120250309212223\",\"transactionDate\":\"2025-03-09 21:22:23\",\"additionalInfo\":{\"merchantId\":\"C00001\",\"merchantName\":\"INDONESIA C00001\",\"externalStoreId\":\"\",\"branchId\":\"\",\"terminalId\":\"\"}}', '', '', '', 'CASHOUT', NULL, NULL, NULL),
('C0000120250309212703', 'GOPAYCO', '2025-03-09 14:27:20', 300000, '460124', '', 'C00001', '{\"partnerReferenceNo\":\"C0000120250309212703\",\"customerNumber\":\"\",\"otp\":\"460124\",\"amount\":{\"value\":\"300000\",\"currency\":\"IDR\"},\"additionalInfo\":{\"merchantId\":\"C00001\",\"merchantName\":\"INDONESIA C00001\",\"externalStoreId\":\"\",\"branchId\":\"\",\"terminalId\":\"\"}}', '{\"responseCode\":\"00\",\"responseMessage\":\"SUKSES\",\"referenceNo\":\"Gopay-C0000120250309212703\",\"partnerReferenceNo\":\"C0000120250309212703\",\"transactionDate\":\"2025-03-09 21:27:16\",\"additionalInfo\":{\"merchantId\":\"C00001\",\"merchantName\":\"INDONESIA C00001\",\"externalStoreId\":\"\",\"branchId\":\"\",\"terminalId\":\"\"}}', '00', 'SUKSES', 'Gopay-C0000120250309212703', 'CASHOUT', NULL, NULL, NULL),
('C0000120250309220400', 'DANACO', '2025-03-09 15:04:00', 450000, '541919', '', 'C00001', '{\"timeStamp\":\"2025-03-09 22:04:00\",\"clientdID\":\"d@n@\",\"productType\":\"DANACO\",\"trxType\":\"CASHOUT\",\"Detail\":{\"trxID\":\"C0000120250309220400\",\"token\":\"541919\",\"amount\":\"450000\",\"noHp\":\"\"}}', '', '', '', '', 'CASHOUT', NULL, NULL, NULL),
('C0000120250309220441', 'DANACO', '2025-03-09 15:04:41', 550000, '712561', '', 'C00001', '{\"timeStamp\":\"2025-03-09 22:04:41\",\"clientdID\":\"d@n@\",\"productType\":\"DANACO\",\"trxType\":\"CASHOUT\",\"Detail\":{\"trxID\":\"C0000120250309220441\",\"token\":\"712561\",\"amount\":\"550000\",\"noHp\":\"\"}}', '', '', '', '', 'CASHOUT', NULL, NULL, NULL),
('C0000120250309220503', 'DANACO', '2025-03-09 15:05:03', 700000, '857483', '', 'C00001', '{\"timeStamp\":\"2025-03-09 22:05:03\",\"clientdID\":\"d@n@\",\"productType\":\"DANACO\",\"trxType\":\"CASHOUT\",\"Detail\":{\"trxID\":\"C0000120250309220503\",\"token\":\"857483\",\"amount\":\"700000\",\"noHp\":\"\"}}', '', '', '', '', 'CASHOUT', NULL, NULL, NULL),
('C0000120250309220637', 'DANACO', '2025-03-09 15:06:58', 900000, '262607', '', 'C00001', '{\"timeStamp\":\"2025-03-09 22:06:37\",\"clientdID\":\"d@n@\",\"productType\":\"DANACO\",\"trxType\":\"CASHOUT\",\"Detail\":{\"trxID\":\"C0000120250309220637\",\"token\":\"262607\",\"amount\":\"900000\",\"noHp\":\"\"}}', '{\"timeStamp\":\"2025-03-09 22:06:40\",\"clientID\":\"d@n@\",\"productType\":\"DANACO\",\"trxType\":\"CASHOUT\",\"detail\":{\"trxID\":\"C0000120250309220637\",\"token\":\"262607\",\"amount\":\"900000\",\"noHp\":\"\"},\"respCode\":\"9990\",\"respDetail\":\"Token Expired\"}', '9990', 'Token Expired', 'OK', 'CASHOUT', NULL, NULL, NULL),
('C0000120250309221123', 'DANACO', '2025-03-09 15:12:19', 150000, '874921', '', 'C00001', '{\"timeStamp\":\"2025-03-09 22:11:23\",\"clientdID\":\"d@n@\",\"productType\":\"DANACO\",\"trxType\":\"CASHOUT\",\"Detail\":{\"trxID\":\"C0000120250309221123\",\"token\":\"874921\",\"amount\":\"150000\",\"noHp\":\"\"}}', '{\"timeStamp\":\"2025-03-09 22:11:25\",\"clientID\":\"d@n@\",\"productType\":\"DANACO\",\"trxType\":\"CASHOUT\",\"detail\":{\"trxID\":\"C0000120250309221123\",\"token\":\"874921\",\"amount\":\"150000\",\"noHp\":\"\"},\"respCode\":\"9990\",\"respDetail\":\"Token Expired\"}', '9990', 'Token Expired', 'OK', 'CASHOUT', NULL, NULL, NULL),
('C0000120250309221603', 'DANACO', '2025-03-09 15:16:27', 250000, '340640', '', 'C00001', '{\"timeStamp\":\"2025-03-09 22:16:03\",\"clientdID\":\"d@n@\",\"productType\":\"DANACO\",\"trxType\":\"CASHOUT\",\"Detail\":{\"trxID\":\"C0000120250309221603\",\"token\":\"340640\",\"amount\":\"250000\",\"noHp\":\"\"}}', '{\"timeStamp\":\"2025-03-09 22:16:08\",\"clientID\":\"d@n@\",\"productType\":\"DANACO\",\"trxType\":\"CASHOUT\",\"detail\":{\"trxID\":\"C0000120250309221603\",\"token\":\"340640\",\"amount\":\"250000\",\"noHp\":\"\"},\"respCode\":\"9990\",\"respDetail\":\"Token Expired\"}', '9990', 'Token Expired', 'OK', 'CASHOUT', NULL, NULL, NULL),
('C0000120250309221654', 'GOPAYCO', '2025-03-09 15:18:13', 400000, '512254', '', 'C00001', '{\"partnerReferenceNo\":\"C0000120250309221654\",\"customerNumber\":\"\",\"otp\":\"512254\",\"amount\":{\"value\":\"400000\",\"currency\":\"IDR\"},\"additionalInfo\":{\"merchantId\":\"C00001\",\"merchantName\":\"INDONESIA C00001\",\"externalStoreId\":\"\",\"branchId\":\"\",\"terminalId\":\"\"}}', '{\"responseCode\":\"00\",\"responseMessage\":\"SUKSES\",\"referenceNo\":\"Gopay-C0000120250309221654\",\"partnerReferenceNo\":\"C0000120250309221654\",\"transactionDate\":\"2025-03-09 22:16:54\",\"additionalInfo\":{\"merchantId\":\"C00001\",\"merchantName\":\"INDONESIA C00001\",\"externalStoreId\":\"\",\"branchId\":\"\",\"terminalId\":\"\"}}', '00', 'SUKSES', 'Gopay-C0000120250309221654', 'CASHOUT', '2025-03-09 15:18:13', 'XX', 'Before Request'),
('C0000120250309221945', 'ISAKUCO', '2025-03-09 15:19:49', 900000, '638957', '', 'C00001', '{\"partnerReferenceNo\":\"C0000120250309221945\",\"customerNumber\":\"\",\"otp\":\"638957\",\"amount\":{\"value\":\"900000\",\"currency\":\"IDR\"},\"additionalInfo\":{\"TrxType\":\"CASHOUT\",\"merchantId\":\"C00001\",\"subMerchantId\":\"INDONESIA C00001\",\"externalStoreId\":\"\"}}', '{\"responseCode\":\"00\",\"responseMessage\":\"SUKSES\",\"referenceNo\":\"ISaku-C0000120250309221945\",\"partnerReferenceNo\":\"C0000120250309221945\",\"transactionDate\":\"2025-03-09 22:19:45\",\"additionalInfo\":{\"TrxType\":\"CASHOUT\",\"merchantId\":\"C00001\",\"subMerchantId\":\"INDONESIA C00001\",\"externalStoreId\":\"\"}}', '00', 'SUKSES', 'ISaku-C0000120250309221945', 'CASHOUT', NULL, NULL, NULL),
('C0000120250309221955', 'GOPAYCO', '2025-03-09 15:19:57', 450000, '402137', '', 'C00001', '{\"partnerReferenceNo\":\"C0000120250309221955\",\"customerNumber\":\"\",\"otp\":\"402137\",\"amount\":{\"value\":\"450000\",\"currency\":\"IDR\"},\"additionalInfo\":{\"merchantId\":\"C00001\",\"merchantName\":\"INDONESIA C00001\",\"externalStoreId\":\"\",\"branchId\":\"\",\"terminalId\":\"\"}}', '{\"responseCode\":\"00\",\"responseMessage\":\"SUKSES\",\"referenceNo\":\"Gopay-C0000120250309221955\",\"partnerReferenceNo\":\"C0000120250309221955\",\"transactionDate\":\"2025-03-09 22:19:55\",\"additionalInfo\":{\"merchantId\":\"C00001\",\"merchantName\":\"INDONESIA C00001\",\"externalStoreId\":\"\",\"branchId\":\"\",\"terminalId\":\"\"}}', '00', 'SUKSES', 'Gopay-C0000120250309221955', 'CASHOUT', NULL, NULL, NULL),
('C0000120250309223451', 'GOPAYCO', '2025-03-09 15:34:53', 650000, '566911', '', 'C00001', '{\"partnerReferenceNo\":\"C0000120250309223451\",\"customerNumber\":\"\",\"otp\":\"566911\",\"amount\":{\"value\":\"650000\",\"currency\":\"IDR\"},\"additionalInfo\":{\"merchantId\":\"C00001\",\"merchantName\":\"INDONESIA C00001\",\"externalStoreId\":\"\",\"branchId\":\"\",\"terminalId\":\"\"}}', '{\"responseCode\":\"00\",\"responseMessage\":\"SUKSES\",\"referenceNo\":\"Gopay-C0000120250309223451\",\"partnerReferenceNo\":\"C0000120250309223451\",\"transactionDate\":\"2025-03-09 22:34:53\",\"additionalInfo\":{\"merchantId\":\"C00001\",\"merchantName\":\"INDONESIA C00001\",\"externalStoreId\":\"\",\"branchId\":\"\",\"terminalId\":\"\"}}', '00', 'SUKSES', 'Gopay-C0000120250309223451', 'CASHOUT', NULL, NULL, NULL),
('C0000120250314131812', 'DANACO', '2025-03-14 13:18:13', 900000, '880764', '', 'C00001', '{\"timeStamp\":\"2025-03-14 13:18:12\",\"clientdID\":\"d@n@\",\"productType\":\"DANACO\",\"trxType\":\"CASHOUT\",\"Detail\":{\"trxID\":\"C0000120250314131812\",\"token\":\"880764\",\"amount\":\"900000\",\"noHp\":\"\"}}', '', '21', '21', 'FAIL', 'CASHOUT', NULL, NULL, NULL),
('C0000120250314132125', 'DANACO', '2025-03-14 13:21:25', 650000, '754760', '', 'C00001', '{\"timeStamp\":\"2025-03-14 13:21:25\",\"clientdID\":\"d@n@\",\"productType\":\"DANACO\",\"trxType\":\"CASHOUT\",\"Detail\":{\"trxID\":\"C0000120250314132125\",\"token\":\"754760\",\"amount\":\"650000\",\"noHp\":\"\"}}', '', '21', '21', 'FAIL', 'CASHOUT', NULL, NULL, NULL),
('C0000120250314132605', 'DANACO', '2025-03-14 13:26:05', 700000, '430926', '', 'C00001', '{\"timeStamp\":\"2025-03-14 13:26:05\",\"clientdID\":\"d@n@\",\"productType\":\"DANACO\",\"trxType\":\"CASHOUT\",\"Detail\":{\"trxID\":\"C0000120250314132605\",\"token\":\"430926\",\"amount\":\"700000\",\"noHp\":\"\"}}', '', '21', '21', 'FAIL', 'CASHOUT', NULL, NULL, NULL),
('C0000120250314132607', 'DANACO', '2025-03-14 13:26:07', 100000, '457686', '', 'C00001', '{\"timeStamp\":\"2025-03-14 13:26:07\",\"clientdID\":\"d@n@\",\"productType\":\"DANACO\",\"trxType\":\"CASHOUT\",\"Detail\":{\"trxID\":\"C0000120250314132607\",\"token\":\"457686\",\"amount\":\"100000\",\"noHp\":\"\"}}', '', '21', '21', 'FAIL', 'CASHOUT', NULL, NULL, NULL),
('C0000120250314132842', 'DANACO', '2025-03-14 13:28:42', 750000, '348079', '', 'C00001', '{\"timeStamp\":\"2025-03-14 13:28:42\",\"clientdID\":\"d@n@\",\"productType\":\"DANACO\",\"trxType\":\"CASHOUT\",\"Detail\":{\"trxID\":\"C0000120250314132842\",\"token\":\"348079\",\"amount\":\"750000\",\"noHp\":\"\"}}', '', '21', '21', 'FAIL', 'CASHOUT', NULL, NULL, NULL),
('C0000120250314134649', 'DANACO', '2025-03-14 13:47:39', 200000, '146653', '', 'C00001', '{\"timeStamp\":\"2025-03-14 13:46:53\",\"clientdID\":\"d@n@\",\"productType\":\"DANACO\",\"trxType\":\"CASHOUT\",\"Detail\":{\"trxID\":\"C0000120250314134649\",\"token\":\"146653\",\"amount\":\"200000\",\"noHp\":\"\"}}', '', '21', '21', 'FAIL', 'CASHOUT', NULL, NULL, NULL),
('C0000120250314134847', 'DANACO', '2025-03-14 13:48:47', 700000, '134608', '', 'C00001', '{\"timeStamp\":\"2025-03-14 13:48:47\",\"clientdID\":\"d@n@\",\"productType\":\"DANACO\",\"trxType\":\"CASHOUT\",\"Detail\":{\"trxID\":\"C0000120250314134847\",\"token\":\"134608\",\"amount\":\"700000\",\"noHp\":\"\"}}', '', '21', '21', 'FAIL', 'CASHOUT', NULL, NULL, NULL),
('C0000120250314134903', 'DANACO', '2025-03-14 13:50:54', 550000, '290448', '', 'C00001', '{\"timeStamp\":\"2025-03-14 13:49:11\",\"clientdID\":\"d@n@\",\"productType\":\"DANACO\",\"trxType\":\"CASHOUT\",\"Detail\":{\"trxID\":\"C0000120250314134903\",\"token\":\"290448\",\"amount\":\"550000\",\"noHp\":\"\"}}', '', '21', '21', 'FAIL', 'CASHOUT', NULL, NULL, NULL),
('C0000120250314135152', 'DANACO', '2025-03-14 13:52:06', 400000, '347651', '', 'C00001', '{\"timeStamp\":\"2025-03-14 13:51:52\",\"clientdID\":\"d@n@\",\"productType\":\"DANACO\",\"trxType\":\"CASHOUT\",\"Detail\":{\"trxID\":\"C0000120250314135152\",\"token\":\"347651\",\"amount\":\"400000\",\"noHp\":\"\"}}', '', '21', '21', 'FAIL', 'CASHOUT', NULL, NULL, NULL),
('C0000120250314135222', 'DANACO', '2025-03-14 13:53:32', 1000000, '867420', '', 'C00001', '{\"timeStamp\":\"2025-03-14 13:52:22\",\"clientdID\":\"d@n@\",\"productType\":\"DANACO\",\"trxType\":\"CASHOUT\",\"Detail\":{\"trxID\":\"C0000120250314135222\",\"token\":\"867420\",\"amount\":\"1000000\",\"noHp\":\"\"}}', '', '21', '21', 'FAIL', 'CASHOUT', NULL, NULL, NULL),
('C0000120250314135338', 'DANACO', '2025-03-14 13:58:10', 900000, '306238', '', 'C00001', '{\"timeStamp\":\"2025-03-14 13:53:38\",\"clientdID\":\"d@n@\",\"productType\":\"DANACO\",\"trxType\":\"CASHOUT\",\"Detail\":{\"trxID\":\"C0000120250314135338\",\"token\":\"306238\",\"amount\":\"900000\",\"noHp\":\"\"}}', '', '21', '21', 'FAIL', 'CASHOUT', NULL, NULL, NULL),
('C0000120250314135814', 'DANACO', '2025-03-14 13:58:32', 450000, '467901', '', 'C00001', '{\"timeStamp\":\"2025-03-14 13:58:14\",\"clientdID\":\"d@n@\",\"productType\":\"DANACO\",\"trxType\":\"CASHOUT\",\"Detail\":{\"trxID\":\"C0000120250314135814\",\"token\":\"467901\",\"amount\":\"450000\",\"noHp\":\"\"}}', '{\"timeStamp\":\"2025-03-14 20:58:16\",\"clientID\":\"d@n@\",\"productType\":\"DANACO\",\"trxType\":\"CASHOUT\",\"detail\":{\"trxID\":\"C0000120250314135814\",\"token\":\"467901\",\"amount\":\"450000\",\"noHp\":\"\"},\"respCode\":\"00\",\"respDetail\":\"Success!\"}', '00', 'Success!', 'OK', 'CASHOUT', NULL, NULL, NULL),
('C0000120250314140158', 'DANACO', '2025-03-14 14:01:58', 400000, '929226', '', 'C00001', '{\"timeStamp\":\"2025-03-14 14:01:58\",\"clientdID\":\"d@n@\",\"productType\":\"DANACO\",\"trxType\":\"CASHOUT\",\"Detail\":{\"trxID\":\"C0000120250314140158\",\"token\":\"929226\",\"amount\":\"400000\",\"noHp\":\"\"}}', '{\"timeStamp\":\"2025-03-14 21:01:58\",\"clientID\":\"d@n@\",\"productType\":\"DANACO\",\"trxType\":\"CASHOUT\",\"detail\":{\"trxID\":\"C0000120250314140158\",\"token\":\"929226\",\"amount\":\"400000\",\"noHp\":\"\"},\"respCode\":\"00\",\"respDetail\":\"Success!\"}', '00', 'Success!', 'OK', 'CASHOUT', NULL, NULL, NULL),
('C0000120250314140244', 'GOPAYCO', '2025-03-14 07:02:44', 950000, '420914', '', 'C00001', '{\"partnerReferenceNo\":\"C0000120250314140244\",\"customerNumber\":\"\",\"otp\":\"420914\",\"amount\":{\"value\":\"950000\",\"currency\":\"IDR\"},\"additionalInfo\":{\"merchantId\":\"C00001\",\"merchantName\":\"INDONESIA C00001\",\"externalStoreId\":\"\",\"branchId\":\"\",\"terminalId\":\"\"}}', '', '', '', '', 'CASHOUT', NULL, NULL, NULL),
('C0000120250314140402', 'GOPAYCO', '2025-03-14 07:04:02', 100000, '185592', '', 'C00001', '{\"partnerReferenceNo\":\"C0000120250314140402\",\"customerNumber\":\"\",\"otp\":\"185592\",\"amount\":{\"value\":\"100000\",\"currency\":\"IDR\"},\"additionalInfo\":{\"merchantId\":\"C00001\",\"merchantName\":\"INDONESIA C00001\",\"externalStoreId\":\"\",\"branchId\":\"\",\"terminalId\":\"\"}}', '', '', '', '', 'CASHOUT', NULL, NULL, NULL),
('C0000120250314140525', 'GOPAYCO', '2025-03-14 07:05:25', 100000, '260510', '', 'C00001', '{\"partnerReferenceNo\":\"C0000120250314140525\",\"customerNumber\":\"\",\"otp\":\"260510\",\"amount\":{\"value\":\"100000\",\"currency\":\"IDR\"},\"additionalInfo\":{\"merchantId\":\"C00001\",\"merchantName\":\"INDONESIA C00001\",\"externalStoreId\":\"\",\"branchId\":\"\",\"terminalId\":\"\"}}', '', '', '', '', 'CASHOUT', NULL, NULL, NULL),
('C0000120250314140709', 'GOPAYCO', '2025-03-14 14:07:11', 300000, '636110', '', 'C00001', '{\"partnerReferenceNo\":\"C0000120250314140709\",\"customerNumber\":\"\",\"otp\":\"636110\",\"amount\":{\"value\":\"300000\",\"currency\":\"IDR\"},\"additionalInfo\":{\"merchantId\":\"C00001\",\"merchantName\":\"INDONESIA C00001\",\"externalStoreId\":\"\",\"branchId\":\"\",\"terminalId\":\"\"}}', '{\"responseCode\":\"00\",\"responseMessage\":\"SUKSES\",\"referenceNo\":\"Gopay-C0000120250314140709\",\"partnerReferenceNo\":\"C0000120250314140709\",\"transactionDate\":\"2025-03-14 21:07:11\",\"additionalInfo\":{\"merchantId\":\"C00001\",\"merchantName\":\"INDONESIA C00001\",\"externalStoreId\":\"\",\"branchId\":\"\",\"terminalId\":\"\"}}', '00', 'SUKSES', 'Gopay-C0000120250314140709', 'CASHOUT', NULL, NULL, NULL),
('C0000120250314140717', 'GOPAYCO', '2025-03-14 14:07:17', 400000, '941008', '', 'C00001', '{\"partnerReferenceNo\":\"C0000120250314140717\",\"customerNumber\":\"\",\"otp\":\"941008\",\"amount\":{\"value\":\"400000\",\"currency\":\"IDR\"},\"additionalInfo\":{\"merchantId\":\"C00001\",\"merchantName\":\"INDONESIA C00001\",\"externalStoreId\":\"\",\"branchId\":\"\",\"terminalId\":\"\"}}', '{\"responseCode\":\"00\",\"responseMessage\":\"SUKSES\",\"referenceNo\":\"Gopay-C0000120250314140717\",\"partnerReferenceNo\":\"C0000120250314140717\",\"transactionDate\":\"2025-03-14 21:07:17\",\"additionalInfo\":{\"merchantId\":\"C00001\",\"merchantName\":\"INDONESIA C00001\",\"externalStoreId\":\"\",\"branchId\":\"\",\"terminalId\":\"\"}}', '00', 'SUKSES', 'Gopay-C0000120250314140717', 'CASHOUT', NULL, NULL, NULL),
('C0000120250314140720', 'GOPAYCO', '2025-03-14 14:07:20', 800000, '218059', '', 'C00001', '{\"partnerReferenceNo\":\"C0000120250314140720\",\"customerNumber\":\"\",\"otp\":\"218059\",\"amount\":{\"value\":\"800000\",\"currency\":\"IDR\"},\"additionalInfo\":{\"merchantId\":\"C00001\",\"merchantName\":\"INDONESIA C00001\",\"externalStoreId\":\"\",\"branchId\":\"\",\"terminalId\":\"\"}}', '{\"responseCode\":\"00\",\"responseMessage\":\"SUKSES\",\"referenceNo\":\"Gopay-C0000120250314140720\",\"partnerReferenceNo\":\"C0000120250314140720\",\"transactionDate\":\"2025-03-14 21:07:20\",\"additionalInfo\":{\"merchantId\":\"C00001\",\"merchantName\":\"INDONESIA C00001\",\"externalStoreId\":\"\",\"branchId\":\"\",\"terminalId\":\"\"}}', '00', 'SUKSES', 'Gopay-C0000120250314140720', 'CASHOUT', NULL, NULL, NULL),
('C0000120250314140850', 'GOPAYCO', '2025-03-14 14:08:50', 150000, '672446', '', 'C00001', '{\"partnerReferenceNo\":\"C0000120250314140850\",\"customerNumber\":\"\",\"otp\":\"672446\",\"amount\":{\"value\":\"150000\",\"currency\":\"IDR\"},\"additionalInfo\":{\"merchantId\":\"C00001\",\"merchantName\":\"INDONESIA C00001\",\"externalStoreId\":\"\",\"branchId\":\"\",\"terminalId\":\"\"}}', '{\"responseCode\":\"00\",\"responseMessage\":\"SUKSES\",\"referenceNo\":\"Gopay-C0000120250314140850\",\"partnerReferenceNo\":\"C0000120250314140850\",\"transactionDate\":\"2025-03-14 21:08:50\",\"additionalInfo\":{\"merchantId\":\"C00001\",\"merchantName\":\"INDONESIA C00001\",\"externalStoreId\":\"\",\"branchId\":\"\",\"terminalId\":\"\"}}', '00', 'SUKSES', 'Gopay-C0000120250314140850', 'CASHOUT', NULL, NULL, NULL),
('C0000120250314140918', 'DANACO', '2025-03-14 14:09:18', 1000000, '121361', '', 'C00001', '{\"timeStamp\":\"2025-03-14 14:09:18\",\"clientdID\":\"d@n@\",\"productType\":\"DANACO\",\"trxType\":\"CASHOUT\",\"Detail\":{\"trxID\":\"C0000120250314140918\",\"token\":\"121361\",\"amount\":\"1000000\",\"noHp\":\"\"}}', '{\"timeStamp\":\"2025-03-14 21:09:18\",\"clientID\":\"d@n@\",\"productType\":\"DANACO\",\"trxType\":\"CASHOUT\",\"detail\":{\"trxID\":\"C0000120250314140918\",\"token\":\"121361\",\"amount\":\"1000000\",\"noHp\":\"\"},\"respCode\":\"00\",\"respDetail\":\"Success!\"}', '00', 'Success!', 'OK', 'CASHOUT', NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mastermerchant`
--
ALTER TABLE `mastermerchant`
  ADD PRIMARY KEY (`partnerID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=469;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
