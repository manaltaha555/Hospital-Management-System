-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 17, 2023 at 06:31 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hospital`

-- --------------------------------------------------------

--
-- Table structure for table `disease`
--

use hospital;

CREATE TABLE `disease` (
  `DiseaseID` int(11) NOT NULL,
  `diseaseName` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `disease`
--

INSERT INTO `disease` (`DiseaseID`, `diseaseName`) VALUES
(401, 'Hypertension'),
(402, 'Diabetes'),
(403, 'Influenza'),
(404, 'Osteoarthritis'),
(405, 'Depression');

-- --------------------------------------------------------

--
-- Table structure for table `doctors`
--

CREATE TABLE `doctors` (
  `Doctor_ID` int(11) NOT NULL,
  `EducationDegree` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

 -- create an index on the doctor_id column
CREATE index idx_Doctor_ID on doctors(Doctor_ID);
--
-- Dumping data for table `doctors`
--

INSERT INTO `doctors` (`Doctor_ID`, `EducationDegree`) VALUES
(11, 'MD Internal Medicine'),
(12, 'PhD Cardiology'),
(13, 'MD Pediatrics'),
(14, 'MS Orthopedics'),
(15, 'MD General Surgery');

-- --------------------------------------------------------

--
-- Table structure for table `icu`
--

CREATE TABLE `icu` (
  `RoomNum` int(11) NOT NULL,
  `ICUType` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `icu`
--

INSERT INTO `icu` (`RoomNum`, `ICUType`) VALUES
(101, 'Cardiac ICU'),
(102, 'Neuro ICU'),
(103, 'Medical ICU'),
(104, 'Surgical ICU'),
(105, 'Pediatric ICU');

-- --------------------------------------------------------

--
-- Table structure for table `nurse`
--

CREATE TABLE `nurse` (
  `Nurse_ID` int(11) NOT NULL,
  `ShiftHours` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `nurse`
--

INSERT INTO `nurse` (`Nurse_ID`, `ShiftHours`) VALUES
(1, 8),
(2, 12),
(3, 10),
(4, 8),
(5, 12);

-- --------------------------------------------------------

--
-- Table structure for table `operation_theater`
--

CREATE TABLE `operation_theater` (
  `RoomNum` int(11) NOT NULL,
  `OTtype` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `operation_theater`
--

INSERT INTO `operation_theater` (`RoomNum`, `OTtype`) VALUES
(201, 'General Surgery'),
(202, 'Orthopedic Surgery'),
(203, 'Cardiothoracic Surgery'),
(204, 'Neurosurgery'),
(205, 'Gynecological Surgery');

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE `patient` (
  `patient_id` int(11) NOT NULL,
  `FirstName` varchar(20) DEFAULT NULL,
  `LastName` varchar(20) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `Phone` int(11) DEFAULT NULL,
  `Street` varchar(50) DEFAULT NULL,
  `City` varchar(50) DEFAULT NULL,
  `BirthDate` date DEFAULT NULL,
  `Departement` varchar(50) DEFAULT NULL,
  `Gender` varchar(20) DEFAULT NULL,
  `doctor_id` int(11) DEFAULT NULL,
  `RoomNum` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

 -- create an index on the patient_id column
CREATE index idx_patient_id on patient(patient_id); 

--
-- Dumping data for table `patient`
--

INSERT INTO `patient` (`patient_id`, `FirstName`, `LastName`, `Email`, `Phone`, `Street`, `City`, `BirthDate`, `Departement`, `Gender`, `doctor_id`, `RoomNum`) VALUES
(1, 'Grace', 'Walker', 'grace.walker@email.com', 1234567890, '123 Main St', 'Cityville', '1990-05-15', 'Cardiology', 'Female', 11, 101),
(2, 'Henry', 'Roberts', 'henry.roberts@email.com', 2147483647, '456 Oak St', 'Townsville', '1985-08-22', 'Orthopedics', 'Male', 12, 202),
(3, 'Sophie', 'Cooper', 'sophie.cooper@email.com', 2147483647, '789 Pine St', 'Cityburg', '1978-12-10', 'Neurology', 'Female', 13, 203),
(4, 'Nathan', 'Johnson', 'nathan.johnson@email.com', 1112223333, '101 Elm St', 'Villetown', '1995-04-03', 'Pediatrics', 'Male', 14, 204),
(5, 'Isabella', 'Turner', 'isabella.turner@email.com', 2147483647, '222 Maple St', 'Citydale', '1980-07-18', 'Surgery', 'Female', 15, 205);

-- --------------------------------------------------------

--
-- Table structure for table `patientdisease`
--

CREATE TABLE `patientdisease` (
  `diseaseID` int(11) NOT NULL,
  `patientID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `patientdisease`
--

INSERT INTO `patientdisease` (`diseaseID`, `patientID`) VALUES
(401, 1),
(402, 2),
(403, 3),
(404, 4),
(405, 5);

-- --------------------------------------------------------

--
-- Table structure for table `patient_nurse`
--

CREATE TABLE `patient_nurse` (
  `nurseID` int(11) NOT NULL,
  `patientID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `patient_nurse`
--

INSERT INTO `patient_nurse` (`nurseID`, `patientID`) VALUES
(1, 1),
(2, 2),
(3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `patient_treatment`
--

CREATE TABLE `patient_treatment` (
  `patientID` int(11) NOT NULL,
  `TreatmentCode` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `patient_treatment`
--

INSERT INTO `patient_treatment` (`patientID`, `TreatmentCode`) VALUES
(1, 501),
(2, 502),
(3, 503),
(4, 504),
(5, 505);

-- --------------------------------------------------------

--
-- Table structure for table `patient_ward`
--

CREATE TABLE `patient_ward` (
  `wardID` int(11) NOT NULL,
  `patientID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `patient_ward`
--

INSERT INTO `patient_ward` (`wardID`, `patientID`) VALUES
(6, 1),
(7, 2),
(8, 3),
(9, 4),
(10, 5);

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `RoomNum` int(11) NOT NULL,
  `Capacity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

 -- create an index on the RoomNum column
CREATE index idx_RoomNum on rooms(RoomNum); 

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`RoomNum`, `Capacity`) VALUES
(101, 15),
(102, 20),
(103, 12),
(104, 18),
(105, 10),
(201, 25),
(202, 14),
(203, 16),
(204, 22),
(205, 30);

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `ID` int(11) NOT NULL,
  `FirstName` varchar(20) DEFAULT NULL,
  `LastName` varchar(20) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `Phone` int(11) DEFAULT NULL,
  `Street` varchar(50) DEFAULT NULL,
  `City` varchar(50) DEFAULT NULL,
  `BirthDate` date DEFAULT NULL,
  `Departement` varchar(50) DEFAULT NULL,
  `Gender` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

 -- create an index on the Department column
CREATE index idx_Departement on staff(Departement); 

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`ID`, `FirstName`, `LastName`, `Email`, `Phone`, `Street`, `City`, `BirthDate`, `Departement`, `Gender`) VALUES
(1, 'John', 'Doe', 'john.doe@email.com', 123456789, '123 Main St', 'New York City', '1990-01-01', 'Cardiology', 'Male'),
(2, 'Jane', 'Smith', 'jane.smith@email.com', 987654321, '456 Oak Ave', 'Los Angeles', '1985-05-15', 'Urology', 'Female'),
(3, 'Bob', 'Johnson', 'bob.johnson@email.com', 555123456, '789 Pine Ln', 'Houston', '1995-07-20', 'Pediatrics', 'Male'),
(4, 'Alice', 'Williams', 'alice.williams@email.com', 999888777, '101 Elm St', 'Miami', '1988-11-10', 'Obstetrics and Gynecology', 'Female'),
(5, 'Charlie', 'Brown', 'charlie.brown@email.com', 111222333, '202 Maple Ave', 'Chicago', '1992-03-25', 'Emergency Medicine', 'Male'),
(6, 'Eva', 'Davis', 'eva.davis@email.com', 444555666, '303 Cedar Blvd', 'Seattle', '1980-09-05', 'Cardiology', 'Female'),
(7, 'Michael', 'Clark', 'michael.clark@email.com', 777888999, '404 Pine St', 'Phoenix', '1998-12-12', 'Urology', 'Male'),
(8, 'Sophia', 'Anderson', 'sophia.anderson@email.com', 123789456, '505 Oak Ln', 'Atlanta', '1983-04-30', 'Pediatrics', 'Female'),
(9, 'David', 'Miller', 'david.miller@email.com', 555666777, '606 Maple Ave', 'Cleveland', '1994-06-18', 'Emergency Medicine', 'Male'),
(10, 'Olivia', 'White', 'olivia.white@email.com', 987654321, '707 Elm St', 'Detroit', '1987-08-22', 'Obstetrics and Gynecology', 'Female'),
(11, 'Daniel', 'Jones', 'daniel.jones@email.com', 111222333, '808 Pine Ln', 'Boston', '1991-02-28', 'Radiology', 'Male'),
(12, 'Mia', 'Martinez', 'mia.martinez@email.com', 333444555, '909 Cedar Blvd', 'San Francisco', '1986-10-15', 'Orthopedics', 'Female'),
(13, 'William', 'Taylor', 'william.taylor@email.com', 777888999, '1010 Oak Ave', 'Denver', '1997-07-07', 'Oncology', 'Male'),
(14, 'Ava', 'Harris', 'ava.harris@email.com', 222333444, '1111 Elm St', 'Newark', '1989-05-08', 'Radiology', 'Female'),
(15, 'Andrew', 'Brown', 'andrew.brown@email.com', 555666777, '1212 Maple Ave', 'Dallas', '1993-09-30', 'Oncology', 'Male');

-- --------------------------------------------------------

--
-- Table structure for table `treatment`
--

CREATE TABLE `treatment` (
  `TreatmentCode` int(11) NOT NULL,
  `TreatmentDescription` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `treatment`
--

INSERT INTO `treatment` (`TreatmentCode`, `TreatmentDescription`) VALUES
(501, 'Physical Therapy for back pain'),
(502, 'Medication Prescription for flu'),
(503, 'Surgery for appendicitis'),
(504, 'Radiology scan for chest X-ray'),
(505, 'Counseling for stress management');

-- --------------------------------------------------------

--
-- Table structure for table `treatmentbills`
--

CREATE TABLE `treatmentbills` (
  `BillID` int(11) NOT NULL,
  `TreatmentPrice` int(11) DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `NUMofDays` int(11) DEFAULT NULL,
  `patientID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

 -- create an index on the BillID column
CREATE index idx_BillId on treatmentbills(BillID);

--
-- Dumping data for table `treatmentbills`
--

INSERT INTO `treatmentbills` (`BillID`, `TreatmentPrice`, `Description`, `NUMofDays`, `patientID`) VALUES
(301, 1500, 'Physical Therapy Sessions', 10, 1),
(302, 500, 'Medication Prescription', 7, 2),
(303, 2000, 'Surgery Cost', 3, 3),
(304, 800, 'Radiology Scan', 5, 4),
(305, 300, 'Counseling Sessions', 12, 5);

-- --------------------------------------------------------

--
-- Table structure for table `wardboys`
--

CREATE TABLE `wardboys` (
  `ID` int(11) NOT NULL,
  `DutyArea` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `wardboys`
--

INSERT INTO `wardboys` (`ID`, `DutyArea`) VALUES
(6, 'Emergency Room'),
(7, 'Pediatrics Ward'),
(8, 'Surgical Ward'),
(9, 'ICU'),
(10, 'Maternity Ward');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `disease`
--
ALTER TABLE `disease`
  ADD PRIMARY KEY (`DiseaseID`);

--
-- Indexes for table `doctors`
--
ALTER TABLE `doctors`
  ADD PRIMARY KEY (`Doctor_ID`);

--
-- Indexes for table `icu`
--
ALTER TABLE `icu`
  ADD PRIMARY KEY (`RoomNum`);

--
-- Indexes for table `nurse`
--
ALTER TABLE `nurse`
  ADD PRIMARY KEY (`Nurse_ID`);

--
-- Indexes for table `operation_theater`
--
ALTER TABLE `operation_theater`
  ADD PRIMARY KEY (`RoomNum`);

--
-- Indexes for table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`patient_id`),
  ADD KEY `doctor_id` (`doctor_id`),
  ADD KEY `RoomNum` (`RoomNum`);

--
-- Indexes for table `patientdisease`
--
ALTER TABLE `patientdisease`
  ADD PRIMARY KEY (`patientID`,`diseaseID`),
  ADD KEY `diseaseID` (`diseaseID`);

--
-- Indexes for table `patient_nurse`
--
ALTER TABLE `patient_nurse`
  ADD PRIMARY KEY (`nurseID`,`patientID`),
  ADD KEY `patientID` (`patientID`);

--
-- Indexes for table `patient_treatment`
--
ALTER TABLE `patient_treatment`
  ADD PRIMARY KEY (`patientID`,`TreatmentCode`),
  ADD KEY `TreatmentCode` (`TreatmentCode`);

--
-- Indexes for table `patient_ward`
--
ALTER TABLE `patient_ward`
  ADD PRIMARY KEY (`wardID`,`patientID`),
  ADD KEY `patientID` (`patientID`);

--
-- Indexes for table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`RoomNum`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `treatment`
--
ALTER TABLE `treatment`
  ADD PRIMARY KEY (`TreatmentCode`);

--
-- Indexes for table `treatmentbills`
--
ALTER TABLE `treatmentbills`
  ADD PRIMARY KEY (`patientID`,`BillID`);

--
-- Indexes for table `wardboys`
--
ALTER TABLE `wardboys`
  ADD PRIMARY KEY (`ID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `doctors`
--
ALTER TABLE `doctors`
  ADD CONSTRAINT `doctors_ibfk_1` FOREIGN KEY (`Doctor_ID`) REFERENCES `staff` (`ID`);

--
-- Constraints for table `icu`
--
ALTER TABLE `icu`
  ADD CONSTRAINT `icu_ibfk_1` FOREIGN KEY (`RoomNum`) REFERENCES `rooms` (`RoomNum`);

--
-- Constraints for table `nurse`
--
ALTER TABLE `nurse`
  ADD CONSTRAINT `nurse_ibfk_1` FOREIGN KEY (`Nurse_ID`) REFERENCES `staff` (`ID`);

--
-- Constraints for table `operation_theater`
--
ALTER TABLE `operation_theater`
  ADD CONSTRAINT `operation_theater_ibfk_1` FOREIGN KEY (`RoomNum`) REFERENCES `rooms` (`RoomNum`);

--
-- Constraints for table `patient`
--
ALTER TABLE `patient`
  ADD CONSTRAINT `patient_ibfk_1` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`Doctor_ID`),
  ADD CONSTRAINT `patient_ibfk_2` FOREIGN KEY (`RoomNum`) REFERENCES `rooms` (`RoomNum`);

--
-- Constraints for table `patientdisease`
--
ALTER TABLE `patientdisease`
  ADD CONSTRAINT `patientdisease_ibfk_1` FOREIGN KEY (`patientID`) REFERENCES `patient` (`patient_id`),
  ADD CONSTRAINT `patientdisease_ibfk_2` FOREIGN KEY (`diseaseID`) REFERENCES `disease` (`DiseaseID`);

--
-- Constraints for table `patient_nurse`
--
ALTER TABLE `patient_nurse`
  ADD CONSTRAINT `patient_nurse_ibfk_1` FOREIGN KEY (`patientID`) REFERENCES `patient` (`patient_id`),
  ADD CONSTRAINT `patient_nurse_ibfk_2` FOREIGN KEY (`nurseID`) REFERENCES `nurse` (`Nurse_ID`);

--
-- Constraints for table `patient_treatment`
--
ALTER TABLE `patient_treatment`
  ADD CONSTRAINT `patient_treatment_ibfk_1` FOREIGN KEY (`patientID`) REFERENCES `patient` (`patient_id`),
  ADD CONSTRAINT `patient_treatment_ibfk_2` FOREIGN KEY (`TreatmentCode`) REFERENCES `treatment` (`TreatmentCode`);

--
-- Constraints for table `patient_ward`
--
ALTER TABLE `patient_ward`
  ADD CONSTRAINT `patient_ward_ibfk_1` FOREIGN KEY (`patientID`) REFERENCES `patient` (`patient_id`),
  ADD CONSTRAINT `patient_ward_ibfk_2` FOREIGN KEY (`wardID`) REFERENCES `wardboys` (`ID`);

--
-- Constraints for table `treatmentbills`
--
ALTER TABLE `treatmentbills`
  ADD CONSTRAINT `treatmentbills_ibfk_1` FOREIGN KEY (`patientID`) REFERENCES `patient` (`patient_id`);

--
-- Constraints for table `wardboys`
--
ALTER TABLE `wardboys`
  ADD CONSTRAINT `wardboys_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `staff` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
