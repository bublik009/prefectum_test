-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Feb 24, 2019 at 03:30 PM
-- Server version: 5.7.24-0ubuntu0.18.04.1
-- PHP Version: 7.2.15-1+ubuntu18.04.1+deb.sury.org+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `test_base`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`mykola`@`localhost` PROCEDURE `debtRepayment` (IN `DebtID` INT(10))  BEGIN  


DECLARE debtorID int(10);
DECLARE creditorID int(10);
DECLARE sumOfDebt double;

#Определяем долг как возвращенный
UPDATE debts SET repaid_status = 1 WHERE id = DebtID;

#берем айди учасников и суму долга для манипуляций с таблицей учасников
SET @sumOfDebt = (SELECT sum_Of_Debt FROM debts WHERE id = DebtID);
SET @debtorID  = (SELECT debtor_id FROM debts WHERE id = DebtID);
SET @creditorID = (SELECT creditor_id FROM debts WHERE id = DebtD);
#обновляем баланс учасников
UPDATE participants SET balance = balance - @sumOfDebt WHERE id = @debtorID;


UPDATE participants SET balance = balance + @sumOfDebt WHERE id = @debtorID;



END$$
#процедура займа
CREATE DEFINER=`mykola`@`localhost` PROCEDURE `setDebts` (IN `debtor` INT, IN `creditor` INT, IN `sumOfDebt` DOUBLE, IN `endOfTerm` INT)  BEGIN  

DECLARE QueryString varchar(1000);

DECLARE insertQueryString varchar(1000);
DECLARE updateCredQueryString varchar(1000);
DECLARE updateDebtQueryString varchar(1000);





#создаем строку запроса добавления операции в таблицу долгов
SET @insertQueryString = CONCAT('INSERT INTO debts SET debtor_id = ',debtor,', creditor_id = ',creditor,', sum_Of_Debt = ', sumOfDebt,', end_Of_Term = ',endOfTerm);

#создаем строки запроса обновления баланса задеяных лиц
SET @updateCredQueryString = CONCAT('UPDATE participants SET balance = ','balance -', sumOfDebt,' ','WHERE id = ',creditor);
SET @updateDebtQueryString = CONCAT('UPDATE participants SET balance = ','balance +', sumOfDebt,' ','WHERE id = ',debtor);

#Обьединяем строки запросов
#SET @QueryString = CONCAT(@insertQueryString,';',  @updateCredQueryString,';', @updateDebtQueryString);

#Выполняем все запросы
PREPARE setNewDebt FROM @insertQueryString;
EXECUTE setNewDebt;
PREPARE setNewCredBalance FROM @updateCredQueryString;
EXECUTE setNewCredBalance;
PREPARE setNewDebtBalance FROM @updateDebtQueryString;
EXECUTE setNewDebtBalance;



END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `debts`
--

CREATE TABLE `debts` (
  `id` int(11) NOT NULL,
  `creditor_id` int(11) NOT NULL,
  `debtor_id` int(11) NOT NULL,
  `sum_Of_Debt` double NOT NULL,
  `debt_issued` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `end_Of_Term` datetime NOT NULL,
  `repaid_status` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `debts`
--

INSERT INTO `debts` (`id`, `creditor_id`, `debtor_id`, `sum_Of_Debt`, `debt_issued`, `end_Of_Term`, `repaid_status`) VALUES
(5, 2, 1, 22, '2019-07-15 15:28:37', '2020-12-12 15:28:37', 1);

-- --------------------------------------------------------

--
-- Table structure for table `participants`
--

CREATE TABLE `participants` (
  `id` int(10) NOT NULL,
  `firstName` varchar(30) NOT NULL,
  `lastName` varchar(30) NOT NULL,
  `balance` double NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `participants`
--

INSERT INTO `participants` (`id`, `firstName`, `lastName`, `balance`) VALUES
(1, 'kolya', 'baydak', 171),
(2, 'vlad', 'novikov', 56);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `debts`
--
ALTER TABLE `debts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `participants`
--
ALTER TABLE `participants`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `debts`
--
ALTER TABLE `debts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `participants`
--
ALTER TABLE `participants`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
