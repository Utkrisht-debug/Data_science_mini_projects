-- 1. Loading datasets
USE classicmodels;

-- 2. Tables list in the database
SHOW TABLES;

-- 3. Table Structures
DESC customers;
DESC employees;
DESC offices;
DESC orderdetails;
DESC orders;
DESC payments;
DESC productlines;
DESC products;

-- 4. Checking null values in nullable fields
SELECT * FROM customers WHERE addressLine2 IS NULL OR state IS NULL OR postalCode IS NULL OR salesRepEmployeeNumber IS NULL OR creditLimit IS NULL;
SELECT * FROM employees WHERE reportsTo IS NULL;
SELECT * FROM offices WHERE addressLine2 IS NULL OR state IS NULL;
SELECT * FROM orders WHERE shippedDate IS NULL OR comments IS NULL;
SELECT * FROM productlines WHERE textDescription IS NULL OR htmlDescription IS NULL OR image IS NULL;

-- 5. Handling NULL values
-- Not necessary unless the missing values are creating problems for data analysis or are incorrect
-- Example step of how to handle null data
SELECT customerNumber, customerName, phone, addressLine1, COALESCE(addressLine2, 'N/A') AS addressLine2, city, IFNULL(state, 'N/A') AS state, IFNULL(postalCode, 'N/A'), COALESCE(creditLimit, 'N/A') FROM customers;

-- 6. Handling inconsistent data
SELECT customerNumber, customerName <> TRIM(customerName) AS 'Name', CONCAT(coctactFirstName, ' ',contactLastName) AS