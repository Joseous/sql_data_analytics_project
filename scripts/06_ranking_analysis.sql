/*==============================================
       Ranking Analysis

-- Order the values of dimensions by measure
-- Top N performers
-- Bottom N performers
-- Rank[Dimension] by SUM[Measure] eg rank countries by total sales
===============================================*/

-- Which 5 products generate the highest revenue

SELECT TOP 5
	p.product_name,
	SUM(f.sales_amount) AS total_revenue
FROM gold.fact_sales f
LEFT JOIN gold.dim_products p
ON p.product_key = f.product_key
GROUP BY p.product_name
ORDER BY total_revenue DESC

-- Using Window Function

SELECT *
FROM (
	SELECT TOP 5
		p.product_name,
		SUM(f.sales_amount) AS total_revenue,
		ROW_NUMBER() OVER(ORDER BY SUM(f.sales_amount) DESC) AS products_rank
	FROM gold.fact_sales f
	LEFT JOIN gold.dim_products p
	ON p.product_key = f.product_key
	GROUP BY p.product_name)t
WHERE products_rank <= 5

-- Which are the 5 worst performing products in terms of sales?

SELECT TOP 5
	p.product_name,
	SUM(f.sales_amount) AS total_revenue
FROM gold.fact_sales f
LEFT JOIN gold.dim_products p
ON p.product_key = f.product_key
GROUP BY p.product_name
ORDER BY total_revenue 

-- Find the top 10 customers who have generated the highest revenue

SELECT TOP 10
	c.customer_key,
	c.first_name,
	c.last_name,
	SUM(f.sales_amount) AS total_revenue
FROM gold.fact_sales f
LEFT JOIN gold.dim_customers c
ON c.customer_key = f.customer_key
GROUP BY 
	c.customer_key,
	c.first_name,
	c.last_name
ORDER BY total_revenue DESC


-- Find the 3 customers with lowest order

SELECT TOP 3
	c.customer_key,
	c.first_name,
	c.last_name,
	COUNT(DISTINCT order_number) AS total_orders
FROM gold.fact_sales f
LEFT JOIN gold.dim_customers c
ON c.customer_key = f.customer_key
GROUP BY 
	c.customer_key,
	c.first_name,
	c.last_name
ORDER BY total_orders 
