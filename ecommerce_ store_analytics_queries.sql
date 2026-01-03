 create database Ecommerce_store
USE Ecommerce_store;
  CREATE TABLE Sales (
 Order_ID INT auto_increment primary KEY,
 Order_Date date,
 Customer_ID INT NOT NULL,
 Customer_Name VARCHAR (100),
 Country VARCHAR (100),
 Product_Category VARCHAR (100),
 Units_Sold INT NOT NULL,
 Unit_Price DECIMAL(10, 2),
 Discount DECIMAL(4, 2),
 Sales DECIMAL(12, 2),
 Profit DECIMAL(15, 6);
 
 INSERT INTO sales (
    Order_ID, Order_Date, Customer_ID, Customer_Name, Country,
    Product_Category, Units_Sold, Unit_Price, Discount, Sales, Profit
) VALUES
(1,'2023-01-01', 1102, 'Michael Jackson', 'USA', 'Beauty', 2, 322.00, 0.0, 644.00, 208.9367),
         to
(1000, '2025-09-26', 1284, 'Sophia Jackson', 'France', 'Beauty', 4, 191, 0.05, 764, 172.370939);


SELECT 
    country,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM sales
GROUP BY country
ORDER BY total_profit DESC;

SELECT 
    discount,
    ROUND(AVG(profit), 2) AS avg_profit,
    SUM(sales) AS total_sales
FROM sales
GROUP BY discount
ORDER BY discount;

SELECT 
    DATE_FORMAT(Order_Date, '%Y-%m-01') AS month, -- Groups by the 1st of each month
    Product_Category, 
    SUM(Sales) AS total_sales, 
    SUM(Profit) AS total_profit
FROM Sales
GROUP BY month, Product_Category
ORDER BY month ASC, total_sales DESC;

SELECT 
    EXTRACT(MONTH FROM order_date) AS month,
    SUM(sales) AS total_sales
FROM sales
GROUP BY month
ORDER BY month;

SELECT 
    MONTHNAME(Order_Date) AS month_name, 
    SUM(Sales) AS total_sales
FROM Sales
GROUP BY month_name
ORDER BY total_sales DESC;

SELECT  
    DATE_FORMAT(Order_Date, '%M %Y') AS month_year, 
    SUM(Sales) AS total_sales
FROM Sales
GROUP BY month_year
ORDER BY MIN(Order_Date) DESC

SELECT 
    Product_Category, 
    SUM(Units_Sold) AS total_units_sold, 
    SUM(Profit) AS total_profit
FROM Sales -- Updated to match your actual table name
GROUP BY Product_Category
ORDER BY total_units_sold DESC;

SELECT 
    product_category,
    SUM(profit) / NULLIF(SUM(sales), 0) * 100 AS profit_margin_pct
FROM ecommerce_sales
GROUP BY product_category
ORDER BY profit_margin_pct DESC;

SELECT 
    Product_Category, 
    SUM(Units_Sold) AS total_units_sold, 
    SUM(Profit) AS total_profit,
    ROUND(SUM(Profit) / SUM(Units_Sold), 2) AS profit_per_unit -- New Metric
FROM Sales
GROUP BY Product_Category
ORDER BY total_units_sold DESC;


SELECT 
    Product_Category, 
    SUM(Units_Sold) AS total_units_sold, 
    SUM(Profit) AS total_profit
FROM Sales
GROUP BY Product_Category
HAVING total_profit > 5000  -- Filters for categories making > $5,000
ORDER BY total_profit DESC;
