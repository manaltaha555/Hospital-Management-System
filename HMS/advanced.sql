create database hospital;
use hospital;
create table staff (
ID integer primary key,
FirstName varchar(20),
LastName varchar(20),
Email varchar(50),
Phone int,
Street varchar(50),
City varchar(50),
BirthDate date,
Departement varchar(50),
Gender varchar(20)
);
INSERT INTO staff (ID, FirstName, LastName, Email, phone, street, city, BirthDate, Departement, Gender)
VALUES
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

 create table nurse(
Nurse_ID integer primary key,
ShiftHours int,
foreign key (Nurse_ID) references staff(ID)
);
INSERT INTO nurse (Nurse_ID, ShiftHours) VALUES (1, 8);
INSERT INTO nurse (Nurse_ID, ShiftHours) VALUES (2, 12);
INSERT INTO nurse (Nurse_ID, ShiftHours) VALUES (3, 10);
INSERT INTO nurse (Nurse_ID, ShiftHours) VALUES (4, 8);
INSERT INTO nurse (Nurse_ID, ShiftHours) VALUES (5, 12);

create table Wardboys(
ID integer primary key,
DutyArea varchar(50),
foreign key (ID) references staff(ID)
);
INSERT INTO Wardboys (ID, DutyArea) VALUES (6, 'Emergency Room');
INSERT INTO Wardboys (ID, DutyArea) VALUES (7, 'Pediatrics Ward');
INSERT INTO Wardboys (ID, DutyArea) VALUES (8, 'Surgical Ward');
INSERT INTO Wardboys (ID, DutyArea) VALUES (9, 'ICU');
INSERT INTO Wardboys (ID, DutyArea) VALUES (10, 'Maternity Ward');
create table Doctors(
Doctor_ID integer primary key,
EducationDegree varchar(50),
foreign key (Doctor_ID) references staff(ID)
);
INSERT INTO Doctors (Doctor_ID, EducationDegree) VALUES (11, 'MD Internal Medicine');
INSERT INTO Doctors (Doctor_ID, EducationDegree) VALUES (12, 'PhD Cardiology');
INSERT INTO Doctors (Doctor_ID, EducationDegree) VALUES (13, 'MD Pediatrics');
INSERT INTO Doctors (Doctor_ID, EducationDegree) VALUES (14, 'MS Orthopedics');
INSERT INTO Doctors (Doctor_ID, EducationDegree) VALUES (15, 'MD General Surgery');

create table Rooms(
RoomNum int primary key,
Capacity int
);
INSERT INTO Rooms (RoomNum, Capacity) VALUES (101, 15);
INSERT INTO Rooms (RoomNum, Capacity) VALUES (102, 20);
INSERT INTO Rooms (RoomNum, Capacity) VALUES (103, 12);
INSERT INTO Rooms (RoomNum, Capacity) VALUES (104, 18);
INSERT INTO Rooms (RoomNum, Capacity) VALUES (105, 10);
INSERT INTO Rooms (RoomNum, Capacity) VALUES (201, 25);
INSERT INTO Rooms (RoomNum, Capacity) VALUES (202, 14);
INSERT INTO Rooms (RoomNum, Capacity) VALUES (203, 16);
INSERT INTO Rooms (RoomNum, Capacity) VALUES (204, 22);
INSERT INTO Rooms (RoomNum, Capacity) VALUES (205, 30);
create table icu(
RoomNum int primary key ,
ICUType varchar(50),
foreign key (RoomNum) references Rooms(RoomNum)
);
INSERT INTO icu (RoomNum, ICUType) VALUES (101, 'Cardiac ICU');
INSERT INTO icu (RoomNum, ICUType) VALUES (102, 'Neuro ICU');
INSERT INTO icu (RoomNum, ICUType) VALUES (103, 'Medical ICU');
INSERT INTO icu (RoomNum, ICUType) VALUES (104, 'Surgical ICU');
INSERT INTO icu (RoomNum, ICUType) VALUES (105, 'Pediatric ICU');
create table Operation_Theater(
RoomNum int primary key,
OTtype varchar(50),
foreign key (RoomNum) references Rooms(RoomNum)
);
INSERT INTO Operation_Theater (RoomNum, OTtype) VALUES (201, 'General Surgery');
INSERT INTO Operation_Theater (RoomNum, OTtype) VALUES (202, 'Orthopedic Surgery');
INSERT INTO Operation_Theater (RoomNum, OTtype) VALUES (203, 'Cardiothoracic Surgery');
INSERT INTO Operation_Theater (RoomNum, OTtype) VALUES (204, 'Neurosurgery');
INSERT INTO Operation_Theater (RoomNum, OTtype) VALUES (205, 'Gynecological Surgery');



create table patient (
patient_id INT PRIMARY KEY,
FirstName varchar(20), 
LastName varchar(20),
Email varchar(50),
Phone int,
Street varchar(50),
City varchar(50),
BirthDate date,
Departement varchar(50),
Gender varchar(20),
doctor_id INT,
RoomNum int,
FOREIGN KEY (doctor_id) REFERENCES Doctors(Doctor_ID),
FOREIGN KEY (RoomNum) REFERENCES Rooms(RoomNum)
);

INSERT INTO patient (patient_id, FirstName, LastName, Email, Phone, Street, City, BirthDate, Departement, Gender, doctor_id, RoomNum) VALUES 
(1, 'Grace', 'Walker', 'grace.walker@email.com', 1234567890, '123 Main St', 'Cityville', '1990-05-15', 'Cardiology', 'Female', 11, 101),
(2, 'Henry', 'Roberts', 'henry.roberts@email.com', 9876543210, '456 Oak St', 'Townsville', '1985-08-22', 'Orthopedics', 'Male', 12, 202),
(3, 'Sophie', 'Cooper', 'sophie.cooper@email.com', 5551234567, '789 Pine St', 'Cityburg', '1978-12-10', 'Neurology', 'Female', 13, 203),
(4, 'Nathan', 'Johnson', 'nathan.johnson@email.com', 1112223333, '101 Elm St', 'Villetown', '1995-04-03', 'Pediatrics', 'Male', 14, 204),
(5, 'Isabella', 'Turner', 'isabella.turner@email.com', 9998887777, '222 Maple St', 'Citydale', '1980-07-18', 'Surgery', 'Female', 15, 205);


create table patient_nurse(
nurseID int,
patientID int,
foreign key (patientID) references patient(patient_id),
foreign key(nurseID) references nurse(Nurse_ID),
primary key(nurseID,patientID)
);

INSERT INTO patient_nurse (nurseID, patientID) VALUES (1, 1);
INSERT INTO patient_nurse (nurseID, patientID) VALUES (2, 2);
INSERT INTO patient_nurse (nurseID, patientID) VALUES (3, 3);
INSERT INTO patient_nurse (nurseID, patientID) VALUES (4, 4);
INSERT INTO patient_nurse (nurseID, patientID) VALUES (5, 5);

create table patient_ward(
wardID int,
patientID int,
foreign key (patientID) references patient(patient_id),
foreign key(wardID) references wardboys(ID),
Primary key (wardID,patientID)
);
INSERT INTO patient_ward (wardID, patientID) VALUES (6, 1),(7, 2),(8, 3),(9, 4),(10, 5);

CREATE TABLE Treatment (
    TreatmentCode INT PRIMARY KEY,
    TreatmentDescription VARCHAR(255)
);
INSERT INTO Treatment (TreatmentCode, TreatmentDescription) VALUES (501, 'Physical Therapy for back pain');
INSERT INTO Treatment (TreatmentCode, TreatmentDescription) VALUES (502, 'Medication Prescription for flu');
INSERT INTO Treatment (TreatmentCode, TreatmentDescription) VALUES (503, 'Surgery for appendicitis');
INSERT INTO Treatment (TreatmentCode, TreatmentDescription) VALUES (504, 'Radiology scan for chest X-ray');
INSERT INTO Treatment (TreatmentCode, TreatmentDescription) VALUES (505, 'Counseling for stress management');

create table patient_treatment(
patientID int,
TreatmentCode int,
foreign key (patientID) references patient(patient_id),
foreign key (TreatmentCode) references Treatment(TreatmentCode),
primary key(patientID,TreatmentCode)
);

INSERT INTO patient_treatment (patientID, TreatmentCode) VALUES (1, 501);
INSERT INTO patient_treatment (patientID, TreatmentCode) VALUES (2, 502);
INSERT INTO patient_treatment (patientID, TreatmentCode) VALUES (3, 503);
INSERT INTO patient_treatment (patientID, TreatmentCode) VALUES (4, 504);
INSERT INTO patient_treatment (patientID, TreatmentCode) VALUES (5, 505);

create table Disease(
DiseaseID int primary key,
diseaseName varchar(50)
);

INSERT INTO Disease (DiseaseID, diseaseName) VALUES (401, 'Hypertension');
INSERT INTO Disease (DiseaseID, diseaseName) VALUES (402, 'Diabetes');
INSERT INTO Disease (DiseaseID, diseaseName) VALUES (403, 'Influenza');
INSERT INTO Disease (DiseaseID, diseaseName) VALUES (404, 'Osteoarthritis');
INSERT INTO Disease (DiseaseID, diseaseName) VALUES (405, 'Depression');

create table patientDisease(
diseaseID int,
patientID int,
foreign key (patientID) references patient(patient_id),
foreign key (diseaseID) references Disease(Diseaseid),
primary key(patientID,DiseaseID)
);

INSERT INTO patientDisease (patientID, diseaseID) VALUES (1, 401),(2, 402),(3, 403),(4, 404),(5, 405);

create table TreatmentBills(
BillID int,
TreatmentPrice int,
Description varchar(255),
NUMofDays int,
patientID int,
foreign key (patientID) references patient(patient_id),
primary key(patientID,BillID)
);

INSERT INTO TreatmentBills (BillID, TreatmentPrice, Description, NUMofDays, patientID) VALUES (301, 1500, 'Physical Therapy Sessions', 10, 1);
INSERT INTO TreatmentBills (BillID, TreatmentPrice, Description, NUMofDays, patientID) VALUES (302, 500, 'Medication Prescription', 7, 2);
INSERT INTO TreatmentBills (BillID, TreatmentPrice, Description, NUMofDays, patientID) VALUES (303, 2000, 'Surgery Cost', 3, 3);
INSERT INTO TreatmentBills (BillID, TreatmentPrice, Description, NUMofDays, patientID) VALUES (304, 800, 'Radiology Scan', 5, 4);
INSERT INTO TreatmentBills (BillID, TreatmentPrice, Description, NUMofDays, patientID) VALUES (305, 300, 'Counseling Sessions', 12, 5);
