# Hospital Database SQL Project

## Overview
This project demonstrates basic SQL database and table operations using a hospital patient dataset in MySQL.

## Database and Table
The script creates a database named HospitalDB and a table named Patients. The table stores patient details such as patient ID, name, age, gender, diagnosis, admission date, bill amount, and treatment status.

## Data and Constraints
The script inserts sample records for ten patients. It uses constraints to require patient names and admission dates, restrict age values, limit gender and status to specified choices, and provide a default bill amount of zero.

## SQL Operations Covered
- Creating and selecting a database.
- Creating a table with primary key, NOT NULL, CHECK, and DEFAULT constraints.
- Inserting sample patient records.
- Adding a phone number column.
- Renaming the disease column to diagnosis.
- Updating a patient's bill amount and phone number.
- Deleting a patient record.
- Using CASE to classify bills as LOW, MEDIUM, or HIGH.
- Truncating a table, dropping a table, and dropping a database.

## Important Notes
The script includes destructive commands at the end: TRUNCATE TABLE, DROP TABLE, and DROP DATABASE. Running the full script will remove the patient records, table, and database it created. Remove or comment out those commands if you want to preserve the data.

The script updates patient 105's bill amount to 25000 and adds a phone number. It also deletes patient 107 before the final query.

## How to Run
1. Open the SQL script in a MySQL client.
2. Ensure your MySQL account has permission to create and drop databases.
3. Run the script in order, reviewing the destructive commands before execution.

## Scope
This README describes the operations present in the SQL file. It does not report external validation or additional hospital analytics.
