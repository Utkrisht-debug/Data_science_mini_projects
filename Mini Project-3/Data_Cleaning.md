# Data Cleaning and Quality Checks

## Overview
This SQL script performs preliminary data-quality checks on the classicmodels database. It focuses on identifying missing values and demonstrating ways to display replacement values.

## Database Inspection
The script selects classicmodels, lists the available tables, and inspects the structures of customers, employees, offices, orderdetails, orders, payments, productlines, and products.

## Missing-Value Checks
The queries search for NULL values in selected fields:
- Customers: addressLine2, state, postalCode, salesRepEmployeeNumber, and creditLimit.
- Employees: reportsTo.
- Offices: addressLine2 and state.
- Orders: shippedDate and comments.
- Product lines: textDescription, htmlDescription, and image.

These checks help identify records that may need review. A NULL value is not automatically an error; its meaning depends on the field and analysis requirements.

## Demonstration of NULL Handling
A customer query uses COALESCE and IFNULL to display fallback values such as N/A when selected fields are NULL. This demonstrates query-level handling for output and does not permanently update the stored data.

## Inconsistent-Data Check
The script begins a query using TRIM to check whether customer names contain leading or trailing whitespace. The uploaded SQL file ends partway through this query, so the full intended inconsistency check cannot be confirmed from the provided content.

## SQL Concepts Demonstrated
- Database and table inspection.
- IS NULL conditions.
- COALESCE and IFNULL.
- TRIM for whitespace checks.

## How to Run
1. Load the classicmodels database.
2. Open the SQL file in MySQL Workbench or another compatible SQL client.
3. Run the completed statements and inspect the returned records.

## Notes
The visible script primarily identifies potential data issues and demonstrates how to present fallback values. It does not show permanent cleanup updates or a complete final cleaning workflow.
