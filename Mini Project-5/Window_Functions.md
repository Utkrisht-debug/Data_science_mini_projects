# SQL Window Functions Analysis

## Overview
This project uses SQL window functions with the classicmodels database to rank products and analyze payment trends over time.

## Database Inspection
The script selects classicmodels, lists its tables, and describes the customer, employee, order, payment, product-line, and product tables.

## Product Ranking by Product Line
The script calculates product revenue as quantity ordered multiplied by the price per item. It then uses RANK to rank products within each product line, with higher revenue ranked first.

A separate query uses DENSE_RANK to return products ranked in the top three positions within each product line.

## Cumulative Customer Payments
A SUM window function partitions payment records by customer and orders them by payment date to calculate a running cumulative payment total for each customer.

## Monthly Payment Comparisons
The script groups payments by year and month and uses LAG to retrieve the previous period's total payment. It also calculates the difference between the current month's total and the previous month's total.

## Three-Month Moving Average
A windowed AVG calculates a moving average across the current month and the two preceding monthly rows. This helps smooth short-term fluctuations in payment totals.

## SQL Concepts Demonstrated
- Aggregate revenue calculations.
- RANK and DENSE_RANK.
- SUM and AVG as window functions.
- PARTITION BY and ORDER BY within window definitions.
- LAG for comparing sequential periods.
- Moving-average frames using ROWS BETWEEN.
- Grouping payment data by year and month.

## How to Run
1. Load the classicmodels database and ensure its tables contain the expected data.
2. Open the SQL file in a MySQL version that supports window functions.
3. Execute the statements and review the ranked products and payment-trend results.

## Notes
The README explains the analyses written in the SQL file; it does not claim specific top products or payment trends because the query results are not included in the source file.
