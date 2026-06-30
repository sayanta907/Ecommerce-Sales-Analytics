-- =============================================
-- E-Commerce Sales Analytics Dashboard
-- Regional Analysis
-- =============================================

USE ecommerce_sales;

-- =============================================
-- REGIONAL ANALYSIS
-- =============================================

-- Query 1: Sales by Region
SELECT
    Region,
    ROUND(SUM(Sales),2) AS TotalSales
FROM orders_raw
GROUP BY Region
ORDER BY TotalSales DESC;

-- Query 2: Profit by Region
SELECT
    Region,
    ROUND(SUM(Profit),2) AS TotalProfit
FROM orders_raw
GROUP BY Region
ORDER BY TotalProfit DESC;

-- Query 3: Total Orders by Region
SELECT
    Region,
    COUNT(DISTINCT `Order ID`) AS TotalOrders
FROM orders_raw
GROUP BY Region
ORDER BY TotalOrders DESC;

-- Query 4: Top 10 States by Sales
SELECT
    State,
    ROUND(SUM(Sales),2) AS TotalSales
FROM orders_raw
GROUP BY State
ORDER BY TotalSales DESC
LIMIT 10;

-- Query 5: Top 10 States by Profit
SELECT
    State,
    ROUND(SUM(Profit),2) AS TotalProfit
FROM orders_raw
GROUP BY State
ORDER BY TotalProfit DESC
LIMIT 10;

-- Query 6: Bottom 10 States by Profit
SELECT
    State,
    ROUND(SUM(Profit),2) AS TotalProfit
FROM orders_raw
GROUP BY State
ORDER BY TotalProfit ASC
LIMIT 10;

-- Query 7: Top 10 Cities by Sales
SELECT
    City,
    ROUND(SUM(Sales),2) AS TotalSales
FROM orders_raw
GROUP BY City
ORDER BY TotalSales DESC
LIMIT 10;

-- Query 8: Top 10 Cities by Profit
SELECT
    City,
    ROUND(SUM(Profit),2) AS TotalProfit
FROM orders_raw
GROUP BY City
ORDER BY TotalProfit DESC
LIMIT 10;

-- Query 9: Average Sales by Region
SELECT
    Region,
    ROUND(AVG(Sales),2) AS AverageSales
FROM orders_raw
GROUP BY Region
ORDER BY AverageSales DESC;

-- Query 10: Average Profit by Region
SELECT
    Region,
    ROUND(AVG(Profit),2) AS AverageProfit
FROM orders_raw
GROUP BY Region
ORDER BY AverageProfit DESC;