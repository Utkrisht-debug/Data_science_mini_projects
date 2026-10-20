# Classic Models Database

## Overview
The classicmodels database is a sample business database commonly used to practice SQL queries and relational database concepts. In the provided SQL scripts, it is used to explore customers, employees, offices, orders, products, and payments.

## Main Tables
The project scripts reference these tables:

- **customers** — customer names, contact details, locations, credit limits, and assigned sales representatives.
- **employees** — employee names, office assignments, and reporting relationships.
- **offices** — office locations and address details.
- **orders** — order records, including order dates, shipped dates, and comments.
- **orderdetails** — individual product lines within orders, including quantities ordered and prices.
- **payments** — customer payment records, including check numbers, payment dates, and amounts.
- **products** — product names, product lines, stock quantities, buy prices, and suggested retail prices.
- **productlines** — descriptions and groupings for products.

## Relationships Explored
The SQL scripts demonstrate several relationships between the tables:

- Customers can have payment records in payments.
- Customers may be assigned a sales representative from employees.
- Employees are associated with offices and may report to another employee.
- Orders contain line items recorded in orderdetails.
- Order details refer to products.
- Products are organized into product lines.

These relationships are explored in the supplied JOIN and analysis scripts; this README does not replace the database's schema definition.

## Analyses Included in the Project
The supplied SQL files use classicmodels to investigate:

- Customer locations and credit limits.
- Customers in selected countries and customers matching a name search.
- Customer payments, including totals, counts, averages, minimums, maximums, and most recent payment dates.
- Product prices, product lines, stock quantities, and products with NULL stock values.
- Payment totals by country.
- Customers without recorded payments.
- Employee and office details, sales representative assignments, and employee reporting hierarchies.
- Product revenue and product ranking within each product line.
- Cumulative customer payments, monthly payment comparisons, payment changes, and moving averages.

## SQL Concepts Practiced
The project provides examples of:

- SELECT, WHERE, IN, LIKE, and ORDER BY.
- JOIN operations, including LEFT JOIN, RIGHT JOIN, NATURAL JOIN, and self-joins.
- GROUP BY and HAVING.
- Aggregate functions such as SUM, COUNT, AVG, MIN, and MAX.
- NULL checks and display-level handling with COALESCE and IFNULL.
- Data-quality checks with TRIM.
- Window functions such as RANK, DENSE_RANK, LAG, and cumulative or moving aggregates.

## How to Use
1. Make sure the classicmodels database is installed and available in your MySQL environment.
2. Open a SQL script in MySQL Workbench or another compatible SQL client.
3. Run the queries and review the returned result sets.
4. Use the README files for each individual script to understand the specific analysis being performed.

## Notes
The uploaded scripts select the existing classicmodels database using USE classicmodels; they do not include the full database creation or sample-data loading process. The exact schema and records depend on the classicmodels installation in your environment. The findings described here summarize the types of queries in the provided scripts and do not claim specific numerical results.
