# Relational Analysis with JOINs

## Overview
This SQL project explores relationships between tables in the classicmodels database using JOIN operations and aggregate queries.

## Database Inspection
The script selects classicmodels, lists available tables, and describes the customers, employees, offices, orderdetails, orders, payments, productlines, and products tables.

## Customer and Payment Analysis
The queries:
- List customer payment details, including check number, payment date, and amount.
- Calculate total payments for each customer.
- Identify customers with no recorded payments.
- Calculate average and total payment amounts by country.

LEFT JOIN is used in customer-payment queries so customers can remain in the result even when no matching payment exists.

## Employee and Office Analysis
The queries display office details alongside employee information and count employees by office. The script uses RIGHT JOIN and INNER JOIN patterns for these tasks.

## Order and Product Analysis
A RIGHT JOIN between order details and products is used to count orders associated with each product, including products without matching order-detail records.

## Sales Representative Analysis
The queries show customers and their sales representatives, then count how many customers are assigned to each representative.

## Employee Hierarchy
A self-join on the employees table compares employees with the employees they report to, displaying employee IDs and names alongside reporting-manager details.

## SQL Concepts Demonstrated
- NATURAL JOIN, LEFT JOIN, RIGHT JOIN, and INNER JOIN behavior.
- Joining related business tables.
- Self-joins for employee hierarchies.
- SUM, AVG, and COUNT aggregate functions.
- GROUP BY, HAVING, and ORDER BY.

## How to Run
1. Load the classicmodels database.
2. Open the SQL file in a MySQL client.
3. Execute the queries and review the result sets.

## Notes
The file contains analytical queries, not stored numerical conclusions. Results depend on the data in the classicmodels database and the SQL environment.
