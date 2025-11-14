-- Create Database
CREATE DATABASE hospital_management;
USE hospital_management;

-- 1. Employee Table (Superclass)
CREATE TABLE Employee (
    E_ID INT PRIMARY KEY,
    Name VARCHAR(50),
    Sex VARCHAR(10),
    Salary DECIMAL(10,2),
    Mob_No VARCHAR(15),
    Address VARCHAR(100),
    City VARCHAR(50),
    State VARCHAR(50),
    Pin_No VARCHAR(10)
);

-- 2. Doctor (Subclass of Employee)
CREATE TABLE Doctor (
    E_ID INT PRIMARY KEY,
    Dept VARCHAR(50),
    Qualification VARCHAR(50),
    FOREIGN KEY (E_ID) REFERENCES Employee(E_ID)
);

-- 3. Nurse (Subclass of Employee)
CREATE TABLE Nurse (
    E_ID INT PRIMARY KEY,
    Qualification VARCHAR(50),
    FOREIGN KEY (E_ID) REFERENCES Employee(E_ID)
);

-- 4. Receptionist (Subclass of Employee)
CREATE TABLE Receptionist (
    E_ID INT PRIMARY KEY,
    FOREIGN KEY (E_ID) REFERENCES Employee(E_ID)
);

-- 5. Patient
CREATE TABLE Patient (
    P_ID INT PRIMARY KEY,
    Name VARCHAR(50),
    Gender VARCHAR(10),
    Age INT,
    DOB DATE,
    Mob_No VARCHAR(15)
);

-- 6. Rooms
CREATE TABLE Rooms (
    R_ID INT PRIMARY KEY,
    Type VARCHAR(50),
    Capacity INT,
    Availability VARCHAR(10)
);

-- 7. Bills
CREATE TABLE Bills (
    B_ID INT PRIMARY KEY,
    P_ID INT,
    Amount DECIMAL(10,2),
    FOREIGN KEY (P_ID) REFERENCES Patient(P_ID)
);

-- 8. Test_Report
CREATE TABLE Test_Report (
    Report_ID INT PRIMARY KEY,
    P_ID INT,
    Test_Type VARCHAR(50),
    Result VARCHAR(50),
    FOREIGN KEY (P_ID) REFERENCES Patient(P_ID)
);

-- 9. Records
CREATE TABLE Records (
    Record_No INT PRIMARY KEY,
    App_No INT
);

-- 10. Relationship Tables

-- Patient consults Doctor (Many-to-Many)
CREATE TABLE Consults (
    P_ID INT,
    E_ID INT,
    PRIMARY KEY (P_ID, E_ID),
    FOREIGN KEY (P_ID) REFERENCES Patient(P_ID),
    FOREIGN KEY (E_ID) REFERENCES Doctor(E_ID)
);

-- Patient assigned to Room (Many-to-Many)
CREATE TABLE Assigned (
    P_ID INT,
    R_ID INT,
    PRIMARY KEY (P_ID, R_ID),
    FOREIGN KEY (P_ID) REFERENCES Patient(P_ID),
    FOREIGN KEY (R_ID) REFERENCES Rooms(R_ID)
);

-- Nurse governs Room (Many-to-Many)
CREATE TABLE Governs (
    E_ID INT,
    R_ID INT,
    PRIMARY KEY (E_ID, R_ID),
    FOREIGN KEY (E_ID) REFERENCES Nurse(E_ID),
    FOREIGN KEY (R_ID) REFERENCES Rooms(R_ID)
);

-- Receptionist maintains Records (Many-to-Many)
CREATE TABLE Maintains (
    E_ID INT,
    Record_No INT,
    PRIMARY KEY (E_ID, Record_No),
    FOREIGN KEY (E_ID) REFERENCES Receptionist(E_ID),
    FOREIGN KEY (Record_No) REFERENCES Records(Record_No)
);


show tables;
desc patient;
show create table consults;