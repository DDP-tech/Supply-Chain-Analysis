-- Supply Chain Analysis
-- Tool: MySQL
-- Description:
-- This SQL file contains solutions for basic and advanced analysis tasks
-- performed on a superstore sales dataset, focusing on customers, products,
-- orders, shipments, sales, and profitability.


CREATE DATABASE superstoresdb;
USE superstoresdb;
SHOW TABLES;

SELECT * FROM cust_dimen;
SELECT * FROM market_fact;
SELECT * FROM orders_dimen;
SELECT * FROM prod_dimen;
SELECT * FROM shipping_dimen;


-- Task 2: Basic Analysis

-- A. Find the total and the average sales (display total_sales and avg_sales) 
SELECT ROUND(SUM(Sales), 2) AS total_sales,
       ROUND(AVG(Sales), 2) AS avg_sales
FROM market_fact;

-- B. Display the number of customers in each region in decreasing order of
-- no_of_customers. The result should contain columns Region, no_of_customers
SELECT Region,
       COUNT(DISTINCT Cust_id) AS no_of_customers
FROM cust_dimen
GROUP BY Region
ORDER BY no_of_customers DESC;

-- C. Find the region having maximum customers (display the region name and
-- max(no_of_customers)
SELECT Region, 
	   COUNT(DISTINCT Cust_id) AS no_of_customers
FROM cust_dimen
GROUP BY Region
ORDER BY no_of_customers DESC LIMIT 1;

-- D. Find the number and id of products sold in decreasing order of products sold (display
-- product id, no_of_products sold
SELECT Prod_id, SUM(Order_Quantity) AS no_of_products_sold
FROM market_fact
GROUP BY Prod_id
ORDER BY no_of_products_sold DESC;

-- E. Find all the customers from Atlantic region who have ever purchased ‘TABLES’ and
-- the number of tables purchased (display the customer name, no_of_tables
-- purchased)
SELECT cus.Customer_Name, 
	   SUM(mar.Order_Quantity) AS no_of_tables_purchased
FROM cust_dimen cus
JOIN market_fact mar ON cus.Cust_id = mar.Cust_id
JOIN prod_dimen pro ON mar.Prod_id = pro.Prod_id
WHERE pro.Product_Sub_Category = 'TABLES' AND cus.Region = 'Atlantic'
GROUP BY cus.Customer_Name
ORDER BY no_of_tables_purchased DESC;


-- Task 3: Advanced Analysis

-- A. Display the product categories in descending order of profits (display the product
-- category wise profits i.e. product_category, profits)?
SELECT pro.Product_Category,
	   ROUND(SUM(mar.Profit), 2) AS total_profits
FROM prod_dimen pro
JOIN market_fact mar ON pro.Prod_id = mar.Prod_id
GROUP BY pro.Product_Category
ORDER BY total_profits DESC;

-- B. Display the product category, product sub-category and the profit within each subcategory 
-- in three columns. 
SELECT pro.Product_Category,
	   pro.Product_Sub_Category,
	   ROUND(SUM(mar.Profit), 2) AS total_profits
FROM prod_dimen pro
JOIN market_fact mar ON pro.Prod_id = mar.Prod_id
GROUP BY pro.Product_Sub_Category, 
		 pro.Product_Category
ORDER BY pro.Product_Category DESC, 
		 pro.Product_Sub_Category DESC;

-- C. Where is the least profitable product subcategory shipped the most? For the least
-- profitable product sub-category, display the region-wise no_of_shipments and the
-- profit made in each region in decreasing order of profits (i.e. region,
-- no_of_shipments, profit_in_each_region)
-- o Note: You can hardcode the name of the least profitable product subcategory

-- Least Profitable Product
SELECT pro.Product_Sub_Category,
	   ROUND(SUM(mar.Profit), 2) AS total_profit
FROM prod_dimen pro
JOIN market_fact mar ON pro.Prod_id = mar.Prod_id
GROUP BY pro.Product_Sub_Category
ORDER BY total_profit LIMIT 1;

-- 'TABLES' identified as least profitable sub-category from previous query
SELECT cus.Region,
	   COUNT(mar.Ship_id) AS no_of_shipments,
       ROUND(SUM(mar.Profit), 2) AS profit_in_each_region
FROM cust_dimen cus
JOIN market_fact mar ON cus.Cust_id = mar.Cust_id
JOIN prod_dimen pro ON mar.Prod_id = pro.Prod_id
WHERE pro.Product_Sub_Category = 'TABLES'
GROUP BY cus.Region
ORDER BY profit_in_each_region DESC;
