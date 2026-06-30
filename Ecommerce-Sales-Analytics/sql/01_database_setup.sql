-- =============================================
-- E-Commerce Sales Analytics Dashboard
-- Database Setup
-- =============================================

-- Create Database
CREATE DATABASE IF NOT EXISTS ecommerce_sales;

-- Use Database
USE ecommerce_sales;

-- Create Raw Orders Table
CREATE TABLE orders_raw (
    `Row ID` INT,
    `Order ID` TEXT,
    `Order Date` TEXT,
    `Ship Date` TEXT,
    `Ship Mode` TEXT,
    `Customer ID` TEXT,
    `Customer Name` TEXT,
    Segment TEXT,
    Country TEXT,
    City TEXT,
    State TEXT,
    `Postal Code` INT,
    Region TEXT,
    `Product ID` TEXT,
    Category TEXT,
    `Sub-Category` TEXT,
    `Product Name` TEXT,
    Sales DOUBLE,
    Quantity INT,
    Discount DOUBLE,
    Profit DOUBLE
);