# Customer, Product, and Payment Analysis

## Overview
This SQL project uses the classicmodels database to explore customer information, product details, and customer payment activity.

## Database Tables Used
The script selects the classicmodels database and lists table structures for customers, employees, offices, orderdetails, orders, payments, productlines, and products.

## Customer Analysis
The queries:
- List customer contact and location details, sorted by country, state, city, and customer name.
- Sort customers by credit limit.
- Find customers in Germany, the USA, and Canada.
- Search customer names containing the word fragment “collect”.
- Find USA customers whose credit limit exceeds 100000.
- Display customers alongside their assigned sales representatives.

## Product Analysis
The queries display:
- Product prices, including buy price and MSRP.
- Product names and product lines.
- Product stock quantities.
- Products whose stock quantity is NULL.
- Products sorted by stock quantity.

## Payment Analysis
The queries examine customer payments by:
- Listing check numbers, payment dates, and amounts.
- Calculating each customer's total payment amount.
- Finding each customer's most recent payment date.
- Calculating average, minimum, and maximum payment amounts.
- Counting the number of payments per customer.

## SQL Concepts Demonstrated
- SHOW TABLES and DESC for database exploration.
- SELECT, WHERE, IN, LIKE, and ORDER BY.
- Joining customer and employee information.
- Aggregate functions such as SUM, COUNT, MAX, AVG, and MIN.
- GROUP BY for customer-level summaries.
- NULL checks with IS NULL.

## How to Run
1. Load the classicmodels database in MySQL.
2. Open the SQL file in your SQL client.
3. Execute the queries in order.

## Notes
The script contains analysis queries rather than a saved report of their returned results. Therefore, this README describes the questions explored without inventing numerical findings.
