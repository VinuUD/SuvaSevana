-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jul 02, 2019 at 03:09 AM
-- Server version: 5.7.24
-- PHP Version: 7.2.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `suvasevana`
--

-- --------------------------------------------------------

--
-- Table structure for table `attendant`
--

DROP TABLE IF EXISTS `attendant`;
CREATE TABLE IF NOT EXISTS `attendant` (
  `empID` int(11) NOT NULL,
  `hourChargeRate` float NOT NULL,
  PRIMARY KEY (`empID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `bed`
--

DROP TABLE IF EXISTS `bed`;
CREATE TABLE IF NOT EXISTS `bed` (
  `bedID` int(11) NOT NULL,
  `wardID` int(11) NOT NULL,
  PRIMARY KEY (`bedID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cleaner`
--

DROP TABLE IF EXISTS `cleaner`;
CREATE TABLE IF NOT EXISTS `cleaner` (
  `contractNum` int(11) NOT NULL,
  `empID` int(11) NOT NULL,
  `startDate` date NOT NULL,
  `endDate` date NOT NULL,
  PRIMARY KEY (`contractNum`),
  UNIQUE KEY `empID` (`empID`),
  KEY `empID_2` (`empID`),
  KEY `empID_3` (`empID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `diagnosticUnit`
--

DROP TABLE IF EXISTS `diagnosticUnit`;
CREATE TABLE IF NOT EXISTS `diagnosticUnit` (
  `duID` int(11) NOT NULL,
  `duName` varchar(20) NOT NULL,
  `pcuID` int(11) NOT NULL,
  PRIMARY KEY (`duID`),
  UNIQUE KEY `pcuID_2` (`pcuID`),
  KEY `duName` (`duName`),
  KEY `pcuID` (`pcuID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `doctor`
--

DROP TABLE IF EXISTS `doctor`;
CREATE TABLE IF NOT EXISTS `doctor` (
  `deaNum` int(11) NOT NULL,
  `empID` int(11) NOT NULL,
  `speciality` varchar(100) NOT NULL,
  PRIMARY KEY (`deaNum`),
  UNIQUE KEY `empID` (`empID`),
  KEY `deaNum` (`deaNum`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `drug`
--

DROP TABLE IF EXISTS `drug`;
CREATE TABLE IF NOT EXISTS `drug` (
  `drugCode` int(11) NOT NULL,
  `drugName` varchar(50) NOT NULL,
  `type` char(1) NOT NULL,
  `unitCost` float NOT NULL,
  PRIMARY KEY (`drugCode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `emgContact`
--

DROP TABLE IF EXISTS `emgContact`;
CREATE TABLE IF NOT EXISTS `emgContact` (
  `patientID` int(11) NOT NULL,
  `contactNum` int(11) NOT NULL,
  `firstName` varchar(20) NOT NULL,
  `lastName` varchar(20) NOT NULL,
  `relationship` varchar(20) NOT NULL,
  `address` varchar(70) NOT NULL,
  PRIMARY KEY (`patientID`,`contactNum`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
CREATE TABLE IF NOT EXISTS `employee` (
  `empID` int(11) NOT NULL,
  `empName` varchar(50) NOT NULL,
  `address` varchar(75) NOT NULL,
  `workingStatus` char(1) NOT NULL,
  `contact` int(11) NOT NULL,
  PRIMARY KEY (`empID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `inPatient`
--

DROP TABLE IF EXISTS `inPatient`;
CREATE TABLE IF NOT EXISTS `inPatient` (
  `patientID` int(11) NOT NULL,
  `admitDnT` date NOT NULL,
  `dischargeDnT` date NOT NULL,
  `primaryDocID` int(11) NOT NULL,
  `wardID` int(11) NOT NULL,
  `bedID` int(11) NOT NULL,
  PRIMARY KEY (`patientID`,`admitDnT`),
  KEY `primaryDocID` (`primaryDocID`),
  KEY `wardID` (`wardID`),
  KEY `bedID` (`bedID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `insSubDetails`
--

DROP TABLE IF EXISTS `insSubDetails`;
CREATE TABLE IF NOT EXISTS `insSubDetails` (
  `patientID` int(11) NOT NULL,
  `firstName` varchar(20) NOT NULL,
  `lastName` varchar(20) NOT NULL,
  `relationship` varchar(20) NOT NULL,
  `address` varchar(75) NOT NULL,
  `contactNum` int(11) NOT NULL,
  PRIMARY KEY (`patientID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `medicalStaff`
--

DROP TABLE IF EXISTS `medicalStaff`;
CREATE TABLE IF NOT EXISTS `medicalStaff` (
  `mcRegNum` int(11) NOT NULL,
  `empID` int(11) NOT NULL,
  `joinedDate` date NOT NULL,
  `resignedDate` date NOT NULL,
  PRIMARY KEY (`mcRegNum`),
  UNIQUE KEY `empID` (`empID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `nurse`
--

DROP TABLE IF EXISTS `nurse`;
CREATE TABLE IF NOT EXISTS `nurse` (
  `empID` int(11) NOT NULL,
  PRIMARY KEY (`empID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `outPatient`
--

DROP TABLE IF EXISTS `outPatient`;
CREATE TABLE IF NOT EXISTS `outPatient` (
  `patientID` int(11) NOT NULL,
  `arrivalDnT` datetime NOT NULL,
  `duID` int(11) NOT NULL,
  PRIMARY KEY (`patientID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
CREATE TABLE IF NOT EXISTS `patient` (
  `patientID` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `NIC` varchar(12) NOT NULL,
  `insPolicyNum` int(11) NOT NULL,
  `insCompanyNum` int(11) NOT NULL,
  `insBranchName` varchar(20) NOT NULL,
  `isInsSubsFlag` int(11) NOT NULL,
  PRIMARY KEY (`patientID`),
  KEY `insPolicyNum` (`insPolicyNum`),
  KEY `insCompanyNum` (`insCompanyNum`),
  KEY `insBranchName` (`insBranchName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `PCU`
--

DROP TABLE IF EXISTS `PCU`;
CREATE TABLE IF NOT EXISTS `PCU` (
  `pcuID` int(11) NOT NULL,
  `inChargeID` int(11) NOT NULL,
  PRIMARY KEY (`pcuID`),
  UNIQUE KEY `inChargeID` (`inChargeID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `record`
--

DROP TABLE IF EXISTS `record`;
CREATE TABLE IF NOT EXISTS `record` (
  `patientID` int(11) NOT NULL,
  `DnT` datetime NOT NULL,
  `bodyTemp` float NOT NULL,
  `pulse` int(11) NOT NULL,
  `bloodP` int(11) NOT NULL,
  `weight` float NOT NULL,
  `symptoms` varchar(100) NOT NULL,
  `nurseID` int(11) NOT NULL,
  PRIMARY KEY (`patientID`,`DnT`),
  KEY `nurseID` (`nurseID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sellDrug`
--

DROP TABLE IF EXISTS `sellDrug`;
CREATE TABLE IF NOT EXISTS `sellDrug` (
  `drugCode` int(11) NOT NULL,
  `vendorRegNum` int(11) NOT NULL,
  `suppliedDate` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `drugType` int(11) NOT NULL,
  `unitCost` int(11) NOT NULL,
  `totalCost` int(11) NOT NULL,
  PRIMARY KEY (`drugCode`,`vendorRegNum`,`suppliedDate`),
  KEY `vendorRegNum` (`vendorRegNum`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `test`
--

DROP TABLE IF EXISTS `test`;
CREATE TABLE IF NOT EXISTS `test` (
  `testCode` int(11) NOT NULL,
  `testName` varchar(50) NOT NULL,
  `cost` float NOT NULL,
  PRIMARY KEY (`testCode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `treatment`
--

DROP TABLE IF EXISTS `treatment`;
CREATE TABLE IF NOT EXISTS `treatment` (
  `patientID` int(11) NOT NULL,
  `DnT` int(11) NOT NULL,
  `docID` int(11) NOT NULL,
  `testCode` int(11) NOT NULL,
  `drugCode` int(11) NOT NULL,
  PRIMARY KEY (`patientID`,`DnT`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `vendor`
--

DROP TABLE IF EXISTS `vendor`;
CREATE TABLE IF NOT EXISTS `vendor` (
  `regNum` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `address` varchar(75) NOT NULL,
  `contactNum` int(11) NOT NULL,
  PRIMARY KEY (`regNum`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ward`
--

DROP TABLE IF EXISTS `ward`;
CREATE TABLE IF NOT EXISTS `ward` (
  `wardID` int(11) NOT NULL,
  `wardName` int(11) NOT NULL,
  `pcuID` int(11) NOT NULL,
  PRIMARY KEY (`wardID`),
  UNIQUE KEY `wardName` (`wardName`),
  UNIQUE KEY `pcuID` (`pcuID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `worksIn`
--

DROP TABLE IF EXISTS `worksIn`;
CREATE TABLE IF NOT EXISTS `worksIn` (
  `empID` int(11) NOT NULL,
  `pcuID` int(11) NOT NULL,
  `weeklyHours` time NOT NULL,
  PRIMARY KEY (`empID`,`pcuID`),
  KEY `pcuID` (`pcuID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attendant`
--
ALTER TABLE `attendant`
  ADD CONSTRAINT `attendant_ibfk_1` FOREIGN KEY (`empID`) REFERENCES `employee` (`empID`);

--
-- Constraints for table `cleaner`
--
ALTER TABLE `cleaner`
  ADD CONSTRAINT `cleaner_ibfk_2` FOREIGN KEY (`empID`) REFERENCES `employee` (`empID`);

--
-- Constraints for table `diagnosticUnit`
--
ALTER TABLE `diagnosticUnit`
  ADD CONSTRAINT `diagnosticunit_ibfk_1` FOREIGN KEY (`pcuID`) REFERENCES `PCU` (`pcuID`);

--
-- Constraints for table `doctor`
--
ALTER TABLE `doctor`
  ADD CONSTRAINT `doctor_ibfk_1` FOREIGN KEY (`empID`) REFERENCES `employee` (`empID`);

--
-- Constraints for table `emgContact`
--
ALTER TABLE `emgContact`
  ADD CONSTRAINT `emgcontact_ibfk_1` FOREIGN KEY (`patientID`) REFERENCES `patient` (`patientID`);

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`empID`) REFERENCES `attendant` (`empID`);

--
-- Constraints for table `inPatient`
--
ALTER TABLE `inPatient`
  ADD CONSTRAINT `inpatient_ibfk_1` FOREIGN KEY (`patientID`) REFERENCES `patient` (`patientID`),
  ADD CONSTRAINT `inpatient_ibfk_2` FOREIGN KEY (`primaryDocID`) REFERENCES `doctor` (`empID`),
  ADD CONSTRAINT `inpatient_ibfk_3` FOREIGN KEY (`wardID`) REFERENCES `ward` (`wardID`);

--
-- Constraints for table `medicalStaff`
--
ALTER TABLE `medicalStaff`
  ADD CONSTRAINT `medicalstaff_ibfk_1` FOREIGN KEY (`empID`) REFERENCES `employee` (`empID`);

--
-- Constraints for table `nurse`
--
ALTER TABLE `nurse`
  ADD CONSTRAINT `nurse_ibfk_1` FOREIGN KEY (`empID`) REFERENCES `employee` (`empID`);

--
-- Constraints for table `record`
--
ALTER TABLE `record`
  ADD CONSTRAINT `record_ibfk_1` FOREIGN KEY (`patientID`) REFERENCES `patient` (`patientID`),
  ADD CONSTRAINT `record_ibfk_2` FOREIGN KEY (`nurseID`) REFERENCES `nurse` (`empID`);

--
-- Constraints for table `sellDrug`
--
ALTER TABLE `sellDrug`
  ADD CONSTRAINT `selldrug_ibfk_1` FOREIGN KEY (`vendorRegNum`) REFERENCES `vendor` (`regNum`),
  ADD CONSTRAINT `selldrug_ibfk_2` FOREIGN KEY (`drugCode`) REFERENCES `drug` (`drugCode`);

--
-- Constraints for table `ward`
--
ALTER TABLE `ward`
  ADD CONSTRAINT `ward_ibfk_1` FOREIGN KEY (`pcuID`) REFERENCES `PCU` (`pcuID`);

--
-- Constraints for table `worksIn`
--
ALTER TABLE `worksIn`
  ADD CONSTRAINT `worksin_ibfk_1` FOREIGN KEY (`empID`) REFERENCES `employee` (`empID`),
  ADD CONSTRAINT `worksin_ibfk_2` FOREIGN KEY (`pcuID`) REFERENCES `PCU` (`pcuID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
