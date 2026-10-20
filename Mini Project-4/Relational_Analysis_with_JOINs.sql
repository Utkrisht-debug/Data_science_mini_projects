-- 1. Loading dataset
USE classicmodels;

-- 2. Displaying tables list
SHOW TABLES;

-- 3. Finding out Table Structure
DESC customers;
DESC employees;
DESC offices;
DESC orderdetails;
DESC orders;
DESC payments;
DESC productlines;
DESC products;

-- 4. Customer and Payment Analysis
-- Displaying payment related information of a customer
SELECT customerNumber, customerName, checkNumber, paymentDate, amount FROM customers NATURAL LEFT JOIN payments ORDER BY customerName;

-- Displaying total payments made by a customer
SELECT customerNumber, customerName, SUM(amount) AS totalPayment FROM customers NATURAL LEFT JOIN payments GROUP BY customerNumber ORDER BY customerName;

-- Customers who haven't made a single payment
SELECT customerNumber, customerName FROM customers NATURAL LEFT JOIN payments GROUP BY customerNumber HAVING SUM(amount) IS NULL ORDER BY customerName;

-- Average payments and total payments made by a country
SELECT country, AVG(amount) AS avg_payment, SUM(amount) AS total_payment FROM customers NATURAL JOIN payments GROUP BY country ORDER BY total_payment;

-- 5. Employee and Office Analysis
-- Displaying office details of each employee
SELECT employeeNumber, CONCAT(firstName, ' ', lastName) AS 'EName', officeCode, city, state, country, postalCode FROM employees NATURAL RIGHT JOIN offices ORDER BY EName;

-- Total Employees in a office
SELECT officeCode, city, country, COUNT(employeeNumber) AS 'totalEmp' FROM employees NATURAL JOIN offices GROUP BY officeCode ORDER BY officeCode;

-- 6. Order and Product Analysis
-- How many orders of each product type?
SELECT productCode, productName, COUNT(orderNumber) AS 'totalOrder' FROM orderdetails NATURAL RIGHT JOIN products GROUP BY productCode ORDER BY productName;

-- 7. Sales Representative Analysis
-- Customers and their Sales Representatives
SELECT customerNumber, customerName, salesRepEmployeeNumber, CONCAT(firstName, ' ', lastName) AS 'emp_Name' FROM customers, employees WHERE customers.salesRepEmployeeNumber=employees.employeeNumber ORDER BY emp_Name;

-- Number of customers each sales representative represent
SELECT salesRepEmployeeNumber, CONCAT(firstName, ' ', lastName) AS 'emp_Name' , COUNT(customerNumber) AS 'total_customers' FROM customers, employees WHERE customers.salesRepEmployeeNumber=employees.employeeNumber GROUP BY salesRepEmployeeNumber ORDER BY emp_Name;

-- 8. Employee Hierarchy
SELECT e.employeeNumber AS 'employee-id', CONCAT(e.lastName, ' ', e.firstName) AS 'employee-name', m.employeeNumber AS 'Report-to-ID', CONCAT(m.firstName, ' ', m.lastName) AS 'Report-to-Name' FROM employees e RIGHT JOIN employees m ON e.reportsTo = m.employeeNumber ORDER BY CONCAT(m.firstName, ' ', m.lastName);