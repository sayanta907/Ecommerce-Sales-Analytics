-- =============================================
-- E-Commerce Sales Analytics Dashboard
-- Product Analysis
-- =============================================

USE ecommerce_sales;

-- =============================================
-- PRODUCT ANALYSIS
-- =============================================

-- Query 1: Top 10 Products by Sales
SELECT
    `Product Name`,
    ROUND(SUM(Sales),2) AS TotalSales
FROM orders_raw
GROUP BY `Product Name`
ORDER BY TotalSales DESC
LIMIT 10;

-- Query 2: Top 10 Products by Profit
SELECT
    `Product Name`,
    ROUND(SUM(Profit),2) AS TotalProfit
FROM orders_raw
GROUP BY `Product Name`
ORDER BY TotalProfit DESC
LIMIT 10;

-- Query 3: Bottom 10 Products by Profit
SELECT
    `Product Name`,
    ROUND(SUM(Profit),2) AS TotalProfit
FROM orders_raw
GROUP BY `Product Name`
ORDER BY TotalProfit ASC
LIMIT 10;

-- Query 4: Most Ordered Products
SELECT
    `Product Name`,
    SUM(Quantity) AS TotalQuantity
FROM orders_raw
GROUP BY `Product Name`
ORDER BY TotalQuantity DESC
LIMIT 10;

-- Query 5: Sales by Sub-Category
SELECT
    `Sub-Category`,
    ROUND(SUM(Sales),2) AS TotalSales
FROM orders_raw
GROUP BY `Sub-Category`
ORDER BY TotalSales DESC;

-- Query 6: Profit by Sub-Category
SELECT
    `Sub-Category`,
    ROUND(SUM(Profit),2) AS TotalProfit
FROM orders_raw
GROUP BY `Sub-Category`
ORDER BY TotalProfit DESC;

-- Query 7: Average Discount by Category
SELECT
    Category,
    ROUND(AVG(Discount),2) AS AverageDiscount
FROM orders_raw
GROUP BY Category;

-- Query 8: Average Discount by Sub-Category
SELECT
    `Sub-Category`,
    ROUND(AVG(Discount),2) AS AverageDiscount
FROM orders_raw
GROUP BY `Sub-Category`
ORDER BY AverageDiscount DESC;

-- Query 9: Products with Highest Average Discount
SELECT
    `Product Name`,
    ROUND(AVG(Discount),2) AS AverageDiscount
FROM orders_raw
GROUP BY `Product Name`
ORDER BY AverageDiscount DESC
LIMIT 10;

-- Query 10: Top 10 Products by Sales Quantity
SELECT
    `Product Name`,
    SUM(Quantity) AS TotalQuantity
FROM orders_raw
GROUP BY `Product Name`
ORDER BY TotalQuantity DESC
LIMIT 10;