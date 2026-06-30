-- =============================================
-- E-Commerce Sales Analytics Dashboard
-- Customer Analysis
-- =============================================

USE ecommerce_sales;

-- =============================================
-- CUSTOMER ANALYSIS
-- =============================================

-- Query 1: Total Unique Customers
SELECT
    COUNT(DISTINCT `Customer ID`) AS TotalCustomers
FROM orders_raw;

-- Query 2: Top 10 Customers by Sales
SELECT
    `Customer Name`,
    ROUND(SUM(Sales),2) AS TotalSales
FROM orders_raw
GROUP BY `Customer Name`
ORDER BY TotalSales DESC
LIMIT 10;

-- Query 3: Top 10 Customers by Profit
SELECT
    `Customer Name`,
    ROUND(SUM(Profit),2) AS TotalProfit
FROM orders_raw
GROUP BY `Customer Name`
ORDER BY TotalProfit DESC
LIMIT 10;

-- Query 4: Sales by Customer Segment
SELECT
    Segment,
    ROUND(SUM(Sales),2) AS TotalSales
FROM orders_raw
GROUP BY Segment
ORDER BY TotalSales DESC;

-- Query 5: Profit by Customer Segment
SELECT
    Segment,
    ROUND(SUM(Profit),2) AS TotalProfit
FROM orders_raw
GROUP BY Segment
ORDER BY TotalProfit DESC;

-- Query 6: Average Sales Per Customer
SELECT
    `Customer Name`,
    ROUND(AVG(Sales),2) AS AverageSales
FROM orders_raw
GROUP BY `Customer Name`
ORDER BY AverageSales DESC
LIMIT 10;

-- Query 7: Customers with Most Orders
SELECT
    `Customer Name`,
    COUNT(`Order ID`) AS TotalOrders
FROM orders_raw
GROUP BY `Customer Name`
ORDER BY TotalOrders DESC
LIMIT 10;

-- Query 8: Customers with Negative Profit
SELECT
    `Customer Name`,
    ROUND(SUM(Profit),2) AS TotalProfit
FROM orders_raw
GROUP BY `Customer Name`
HAVING TotalProfit < 0
ORDER BY TotalProfit;

-- Query 9: Sales by Customer State
SELECT
    State,
    ROUND(SUM(Sales),2) AS TotalSales
FROM orders_raw
GROUP BY State
ORDER BY TotalSales DESC
LIMIT 10;

-- Query 10: Customers Who Generated More Than $10,000 in Sales
SELECT
    `Customer Name`,
    ROUND(SUM(Sales),2) AS TotalSales
FROM orders_raw
GROUP BY `Customer Name`
HAVING TotalSales > 10000
ORDER BY TotalSales DESC;