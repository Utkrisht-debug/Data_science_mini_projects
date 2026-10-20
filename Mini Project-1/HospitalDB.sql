-- Creating Database
CREATE DATABASE HospitalDB;

-- Using the Created Database
USE HospitalDB;

-- Creating a Table within the Database
CREATE TABLE Patients(
patient_id INT PRIMARY KEY, 
patient_name VARCHAR(50) NOT NULL, 
age INT CHECK (AGE>=0 AND AGE<120), 
gender CHAR(1) CHECK (gender in ('M', 'F', 'O')),
disease VARCHAR(100), 
admission_date DATE NOT NULL,
bill_amount INT DEFAULT 0, 
status VARCHAR(30) CHECK (status in ('Admitted', 'Discharged', 'Under Treatment', 'Critical', 'Referred', 'Deceased')) NOT NULL
);

-- Inserting values in the Table
INSERT INTO Patients VALUES
(101, 'Rahul Sharma', 35, 'M', 'Fracture', '2026-09-20', 25000, 'Under Treatment'),
(102, 'Priya Singh', 28, 'F', 'Dengue', '2026-09-22', 18000, 'Admitted'),
(103, 'Amit Verma', 52, 'M', 'Heart Disease', '2026-09-10', 85000, 'Discharged'),
(104, 'Neha Gupta', 41, 'F', 'Pneumonia', '2026-09-25', 32000, 'Critical'),
(105, 'Rohan Mishra', 19, 'M', 'Appendicitis', '2026-09-27', 22000, 'Discharged'),
(106, 'Anjali Yadav', 63, 'F', 'Diabetes', '2026-09-15', 15000, 'Under Treatment'),
(107, 'Vikas Kumar', 47, 'M', 'Kidney Stone', '2026-09-28', 12000, 'Admitted'),
(108, 'Sneha Patel', 31, 'F', 'Migraine', '2026-09-29', 7000, 'Discharged'),
(109, 'Arjun Mehta', 70, 'M', 'Stroke', '2026-09-18', 95000, 'Critical'),
(110, 'Kavita Joshi', 45, 'F', 'Asthma', '2026-09-30', 10000, 'Referred');

-- Altering table by adding a column
ALTER TABLE Patients ADD COLUMN phone_number VARCHAR(20) DEFAULT NULL;

-- Altering table by renaming a column
ALTER TABLE Patients RENAME COLUMN disease TO diagnosis;

-- Updating patient details
UPDATE Patients SET bill_amount = 25000, phone_number= '+919450743202' WHERE patient_id= 105;

-- Deleting a Patient details from the table
DELETE FROM Patients WHERE patient_id= 107;

-- Displaying the entire table along with bill category
SELECT *, 
CASE 
WHEN bill_amount<=10000 THEN 'LOW'
WHEN bill_amount>10000 AND bill_amount<50000 THEN 'MEDIUM'
WHEN bill_amount>=50000 THEN 'HIGH'
END AS bill_category 
FROM Patients;

-- Removing all entries from the table
TRUNCATE TABLE Patients;

-- Deleting the entire table along with structure
DROP TABLE Patients;

-- Deleting the entire database
DROP DATABASE HospitalDB