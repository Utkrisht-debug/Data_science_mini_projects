-- Loading dataset
USE classicmodels;

-- Displaying all tables in the dataset
SHOW TABLES;

-- Understanfing the table structures
DESC customers;
DESC employees;
DESC offices;
DESC orderdetails;
DESC orders;
DESC payments;
DESC productlines;
DESC products;

-- Customer Analysis

-- Displaying customers and their address organized in order of their Country, State, City and Name
SELECT customerNumber, customerName, addressLine1, city, state, postalCode, country FROM customers ORDER BY country ASC, state ASC, city ASC, customerName ASC;

-- Displaying customers and their credit limit by order of their credit limits;
SELECT customerNumber, customerName, creditLimit FROM customers ORDER BY creditLimit DESC;

-- Finding Customer's based on different conditions
SELECT customerNumber, customerName, country FROM customers WHERE country IN ('Germany', 'USA', 'Canada') ORDER BY COUNTRY ASC;   -- Finding customers in Germany, USA and Canada and sorting them by Country
SELECT customerNumber, customerName FROM customers WHERE customerName LIKE '%collect%';   -- Displaying all customers whose name contains collect 
SELECT * FROM customers WHERE country= 'USA' AND creditLimit>100000 ORDER BY customerName ASC;  -- Displaying all details of customers from USA and credit limit greater than 100000 ordered by their name

-- Displaying customers and their sales representative ordered by customer name
SELECT customerNumber, customerName, employeeNumber, CONCAT(firstName, ' ', lastName) AS fullName FROM customers, employees WHERE salesRepEmployeeNumber=employeeNumber ORDER BY customerName;

-- Customer Payments
SELECT customers.customerNumber, customerName, checkNumber, paymentDate, amount FROM customers, payments WHERE customers.customerNumber=payments.customerNumber ORDER BY customerName;  -- Displaying customerPayments ordered by their name
SELECT customers.customerNumber, customerName, SUM(amount) AS Total_payment FROM customers, payments WHERE customers.customerNumber=payments.customerNumber GROUP BY customerNumber ORDER BY customerName;   -- Displaying customers and their total payments ordered by their name

-- Product Analysis

-- Displaying Product Prices ordered by productName
SELECT productCode, productName, buyPrice, MSRP FROM products ORDER BY productName;

-- Displaying Prodcutlines of each product ordered by productLine
SELECT productCode, productName, productLine FROM products ORDER BY productLine;

-- Displaying stock levels of each product
SELECT productCode, productName, quantityInStock FROM products ORDER BY productName;

-- Searching Product whose stock is NULL
SELECT productCode, productName FROM products WHERE quantityInStock IS NULL;

-- Sorting Products based on their quantity
SELECT productCode, productName, quantityInStock FROM products ORDER BY quantityInStock;

-- Payment Analysis

-- Displaying dates of payment by a customer
SELECT customers.customerNumber, customerName, paymentDate FROM customers, payments WHERE customers.customerNumber=payments.customerNumber ORDER BY customerName;  -- Displaying customerPayments ordered by their name

-- Displaying total payments made by a Customer
SELECT customers.customerNumber, customerName, COUNT(*) AS total_payments_count FROM customers, payments WHERE customers.customerNumber=payments.customerNumber GROUP BY customerNumber ORDER BY customerName;

-- Finding Most recent payment of each Customer
SELECT customers.customerNumber, customerName, MAX(paymentDate) AS recent_payment FROM customers, payments WHERE customers.customerNumber=payments.customerNumber GROUP BY customerNumber ORDER BY customerName;

-- Finding average payment of each customer
SELECT customers.customerNumber, customerName, AVG(amount) AS average_amount FROM customers, payments WHERE customers.customerNumber=payments.customerNumber GROUP BY customerNumber ORDER BY customerName;

-- Finding minimum and maximum payments of each customer
SELECT customers.customerNumber, customerName, MIN(amount) AS minimum_payment, MAX(amount) AS maximum_payment FROM customers, payments WHERE customers.customerNumber=payments.customerNumber GROUP BY customerNumber ORDER BY customerName;
