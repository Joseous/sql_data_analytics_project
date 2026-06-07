/*========================================================
        Measures Exploration
==========================================================

 Calculate the key metric of the business(Big Numbers)
 Highest level of Aggregation | Lowest level of Details
 [Measure] like: SUM(sales0,AVG(price),SUM(quantity) 
========================================================*/

-- Find the total sales
SELECT 
	SUM(sales_amount) AS total_sales
FROM gold.fact_sales

-- Find how many items are sold
SELECT 
	SUM(quantity) AS total_quantity
FROM gold.fact_sales

-- Find the average selling price
SELECT 
	AVG(price) AS avg_price
FROM gold.fact_sales

-- Find the total number of orders
SELECT 
	COUNT(order_number) AS total_orders
FROM gold.fact_sales

SELECT 
	COUNT( DISTINCT order_number) AS total_orders
FROM gold.fact_sales

-- Find the total number of products
SELECT 
	COUNT(DISTINCT product_key) AS total_products
FROM gold.dim_products

-- Find the total number of customers
SELECT 
	COUNT(customer_key) AS total_customers
FROM gold.dim_customers

-- Find the total number of customers that placed an order
SELECT 
	COUNT(DISTINCT customer_key) AS total_customers
FROM gold.fact_sales

--============================================================
-- Generate Report that shows all key metrics of the business
--============================================================
SELECT 'Total Sales' AS measure_name, SUM(sales_amount) AS measure_value FROM gold.fact_sales
UNION ALL
SELECT 'Total Qnty', SUM(quantity) FROM gold.fact_sales
UNION ALL
SELECT 'Average Price', AVG(price) FROM gold.fact_sales
UNION ALL
SELECT 'Total Orders', COUNT( DISTINCT order_number) FROM gold.fact_sales
UNION ALL
SELECT 'Total Products', COUNT(DISTINCT product_key) FROM gold.dim_products
UNION ALL
SELECT 'Total Customers', COUNT(DISTINCT customer_key) FROM gold.dim_customers


