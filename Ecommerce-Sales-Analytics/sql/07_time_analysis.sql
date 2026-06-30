-- =============================================
-- E-Commerce Sales Analytics Dashboard
-- Time Analysis
-- =============================================

USE ecommerce_sales;

-- =============================================
-- TIME ANALYSIS
-- =============================================

-- Query 1: Monthly Sales
SELECT
    MONTH(STR_TO_DATE(`Order Date`, '%m/%d/%Y')) AS MonthNumber,
    MONTHNAME(STR_TO_DATE(`Order Date`, '%m/%d/%Y')) AS MonthName,
    ROUND(SUM(Sales),2) AS TotalSales
FROM orders_raw
GROUP BY MonthNumber, MonthName
ORDER BY MonthNumber;

-- Query 2: Monthly Profit
SELECT
    MONTH(STR_TO_DATE(`Order Date`, '%m/%d/%Y')) AS MonthNumber,
    MONTHNAME(STR_TO_DATE(`Order Date`, '%m/%d/%Y')) AS MonthName,
    ROUND(SUM(Profit),2) AS TotalProfit
FROM orders_raw
GROUP BY MonthNumber, MonthName
ORDER BY MonthNumber;

-- Query 3: Monthly Orders
SELECT
    MONTH(STR_TO_DATE(`Order Date`, '%m/%d/%Y')) AS MonthNumber,
    MONTHNAME(STR_TO_DATE(`Order Date`, '%m/%d/%Y')) AS MonthName,
    COUNT(DISTINCT `Order ID`) AS TotalOrders
FROM orders_raw
GROUP BY MonthNumber, MonthName
ORDER BY MonthNumber;

-- Query 4: Yearly Sales
SELECT
    YEAR(STR_TO_DATE(`Order Date`, '%m/%d/%Y')) AS Year,
    ROUND(SUM(Sales),2) AS TotalSales
FROM orders_raw
GROUP BY Year
ORDER BY Year;

-- Query 5: Yearly Profit
SELECT
    YEAR(STR_TO_DATE(`Order Date`, '%m/%d/%Y')) AS Year,
    ROUND(SUM(Profit),2) AS TotalProfit
FROM orders_raw
GROUP BY Year
ORDER BY Year;

-- Query 6: Average Monthly Sales
SELECT
    MONTHNAME(STR_TO_DATE(`Order Date`, '%m/%d/%Y')) AS Month,
    ROUND(AVG(Sales),2) AS AverageSales
FROM orders_raw
GROUP BY Month
ORDER BY MONTH(STR_TO_DATE(Month,'%M'));

-- Query 7: Average Monthly Profit
SELECT
    MONTHNAME(STR_TO_DATE(`Order Date`, '%m/%d/%Y')) AS Month,
    ROUND(AVG(Profit),2) AS AverageProfit
FROM orders_raw
GROUP BY Month
ORDER BY MONTH(STR_TO_DATE(Month,'%M'));

-- Query 8: Best Sales Month
SELECT
    MONTHNAME(STR_TO_DATE(`Order Date`, '%m/%d/%Y')) AS Month,
    ROUND(SUM(Sales),2) AS TotalSales
FROM orders_raw
GROUP BY Month
ORDER BY TotalSales DESC
LIMIT 1;

-- Query 9: Best Profit Month
SELECT
    MONTHNAME(STR_TO_DATE(`Order Date`, '%m/%d/%Y')) AS Month,
    ROUND(SUM(Profit),2) AS TotalProfit
FROM orders_raw
GROUP BY Month
ORDER BY TotalProfit DESC
LIMIT 1;

-- Query 10: Sales and Profit by Year
SELECT
    YEAR(STR_TO_DATE(`Order Date`, '%m/%d/%Y')) AS Year,
    ROUND(SUM(Sales),2) AS TotalSales,
    ROUND(SUM(Profit),2) AS TotalProfit
FROM orders_raw
GROUP BY Year
ORDER BY Year;