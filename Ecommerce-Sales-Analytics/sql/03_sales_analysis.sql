-- =============================================
-- E-Commerce Sales Analytics Dashboard
-- Sales Analysis
-- =============================================

USE ecommerce_sales;

-- =============================================
-- OVERALL SALES
-- =============================================

-- Query 1: Total Sales
SELECT
    SUM(Sales) AS TotalSales
FROM orders_raw;

-- Query 2: Total Orders
SELECT
    COUNT(*) AS TotalOrders
FROM orders_raw;

-- Query 3: Average Sales Per Order
SELECT
    AVG(Sales) AS AverageSales
FROM orders_raw;

-- Query 4: Highest Sale
SELECT
    MAX(Sales) AS HighestSale
FROM orders_raw;

-- Query 5: Lowest Sale
SELECT
    MIN(Sales) AS LowestSale
FROM orders_raw;

-- =============================================
-- CATEGORY SALES
-- =============================================

-- Query 6: Sales by Category
SELECT
    Category,
    SUM(Sales) AS TotalSales
FROM orders_raw
GROUP BY Category
ORDER BY TotalSales DESC;

-- Query 7: Sales by Sub-Category
SELECT
    `Sub-Category`,
    SUM(Sales) AS TotalSales
FROM orders_raw
GROUP BY `Sub-Category`
ORDER BY TotalSales DESC;

-- Query 8: Top 10 Products by Sales
SELECT
    `Product Name`,
    SUM(Sales) AS TotalSales
FROM orders_raw
GROUP BY `Product Name`
ORDER BY TotalSales DESC
LIMIT 10;

-- Query 9: Sales by Segment
SELECT
    Segment,
    SUM(Sales) AS TotalSales
FROM orders_raw
GROUP BY Segment
ORDER BY TotalSales DESC;

-- Query 10: Average Sales by Category
SELECT
    Category,
    AVG(Sales) AS AverageSales
FROM orders_raw
GROUP BY Category
ORDER BY AverageSales DESC;