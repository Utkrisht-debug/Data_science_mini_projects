-- 1. Loading Datasets
USE classicmodels;

-- 2. Display Tables
SHOW TABLES;

-- 3. Table Structures
DESC customers;
DESC employees;
DESC orderdetails;
DESC orders;
DESC payments;
DESC productlines;
DESC products;

-- 4. Product Ranking within productLine
SELECT
    productCode,
    productName,
    productLine,
    revenue,
    RANK() OVER (
        PARTITION BY productLine
        ORDER BY revenue DESC
    ) AS product_rank
FROM(
    SELECT
        p.productCode,
        p.productName,
        p.productLine,
        SUM(od.quantityOrdered * od.priceEach) AS revenue
    FROM products p
    JOIN orderdetails od ON p.productCode = od.productCode
    GROUP BY p.productCode
) AS ProductRevenue
ORDER BY productLine, product_rank;

-- 5. Calculate cumulative payment values
SELECT
    customerNumber,
    paymentDate,
    amount,
    SUM(amount) OVER (
		PARTITION BY customerNumber
        ORDER BY paymentDate
    ) AS cumulative_total
FROM payments
ORDER BY customerNumber;

-- 6. Identify the highest-ranked products within product lines.
SELECT * FROM(SELECT
    productName,
    productLine,
    SUM(od.quantityOrdered * od.priceEach) AS revenue,
    DENSE_RANK() OVER (
        PARTITION BY p.productLine
        ORDER BY SUM(od.quantityOrdered * od.priceEach) DESC
    ) AS product_rank
FROM products p
JOIN orderdetails od ON p.productCode = od.productCode
GROUP BY p.productCode, p.productName, p.productLine
ORDER BY productLine, product_rank) AS ranked
WHERE product_rank <= 3
ORDER BY productLine, product_rank;

-- 7. Compare values between different months
SELECT
    MONTH(paymentDate) AS month,
    YEAR(paymentDate) AS year,
    SUM(amount) AS total_payment,
    LAG(SUM(amount)) OVER (
        ORDER BY YEAR(paymentDate), MONTH(paymentDate)
    ) AS previous_month
FROM payments
GROUP BY YEAR(paymentDate), MONTH(paymentDate)
ORDER BY year, month;

-- 8. Calculate changes between periods
SELECT
    YEAR(paymentDate) AS year,
    MONTH(paymentDate) AS month,
    SUM(amount) AS total_payment,
    SUM(amount) - LAG(SUM(amount)) OVER (
        ORDER BY YEAR(paymentDate), MONTH(paymentDate)
    ) AS payment_change
FROM payments
GROUP BY YEAR(paymentDate), MONTH(paymentDate)
ORDER BY year, month;

-- 9. Calculate a three-month moving average. 
SELECT
    YEAR(paymentDate) AS year,
    MONTH(paymentDate) AS month,
    SUM(amount) AS total_payment,
    AVG(SUM(amount)) OVER (
        ORDER BY YEAR(paymentDate), MONTH(paymentDate)
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
    ) AS moving_average
FROM payments
GROUP BY YEAR(paymentDate), MONTH(paymentDate)
ORDER BY year, month;