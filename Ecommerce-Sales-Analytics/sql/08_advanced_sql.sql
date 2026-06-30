-- =============================================
-- E-Commerce Sales Analytics Dashboard
-- Advanced SQL
-- =============================================

USE ecommerce_sales;

-- =============================================
-- CTE (Common Table Expression)
-- =============================================

-- Query 1: Top 10 Customers by Sales using CTE
WITH CustomerSales AS (
    SELECT
        `Customer Name`,
        ROUND(SUM(Sales),2) AS TotalSales
    FROM orders_raw
    GROUP BY `Customer Name`
)
SELECT *
FROM CustomerSales
ORDER BY TotalSales DESC
LIMIT 10;

-- =============================================
-- WINDOW FUNCTIONS
-- =============================================

-- Query 2: Rank Products by Sales
SELECT
    `Product Name`,
    ROUND(SUM(Sales),2) AS TotalSales,
    RANK() OVER (ORDER BY SUM(Sales) DESC) AS SalesRank
FROM orders_raw
GROUP BY `Product Name`;

-- Query 3: Dense Rank Products
SELECT
    `Product Name`,
    ROUND(SUM(Profit),2) AS TotalProfit,
    DENSE_RANK() OVER (ORDER BY SUM(Profit) DESC) AS ProfitRank
FROM orders_raw
GROUP BY `Product Name`;

-- Query 4: Row Number
SELECT
    `Customer Name`,
    ROUND(SUM(Sales),2) AS TotalSales,
    ROW_NUMBER() OVER (ORDER BY SUM(Sales) DESC) AS RowNum
FROM orders_raw
GROUP BY `Customer Name`;

-- =============================================
-- CASE
-- =============================================

-- Query 5: Profit Category
SELECT
    `Order ID`,
    Profit,
    CASE
        WHEN Profit > 500 THEN 'High Profit'
        WHEN Profit > 100 THEN 'Medium Profit'
        WHEN Profit >= 0 THEN 'Low Profit'
        ELSE 'Loss'
    END AS ProfitCategory
FROM orders_raw;

-- =============================================
-- SUBQUERY
-- =============================================

-- Query 6: Products Above Average Sales
SELECT
    `Product Name`,
    Sales
FROM orders_raw
WHERE Sales >
(
    SELECT AVG(Sales)
    FROM orders_raw
);

-- =============================================
-- VIEW
-- =============================================

-- Query 7: Create Sales Summary View
CREATE OR REPLACE VIEW SalesSummary AS
SELECT
    Category,
    ROUND(SUM(Sales),2) AS TotalSales,
    ROUND(SUM(Profit),2) AS TotalProfit
FROM orders_raw
GROUP BY Category;

-- View Data
SELECT * FROM SalesSummary;

-- =============================================
-- RUNNING TOTAL
-- =============================================

-- Query 8: Running Sales Total
SELECT
    `Order Date`,
    Sales,
    SUM(Sales) OVER (
        ORDER BY STR_TO_DATE(`Order Date`, '%m/%d/%Y')
    ) AS RunningTotal
FROM orders_raw;

-- =============================================
-- TOP PRODUCT PER CATEGORY
-- =============================================

-- Query 9
WITH RankedProducts AS
(
    SELECT
        Category,
        `Product Name`,
        SUM(Sales) AS TotalSales,
        RANK() OVER
        (
            PARTITION BY Category
            ORDER BY SUM(Sales) DESC
        ) AS ProductRank
    FROM orders_raw
    GROUP BY Category, `Product Name`
)
SELECT *
FROM RankedProducts
WHERE ProductRank = 1;

-- =============================================
-- HIGHEST PROFIT ORDER
-- =============================================

-- Query 10
SELECT *
FROM orders_raw
ORDER BY Profit DESC
LIMIT 1;