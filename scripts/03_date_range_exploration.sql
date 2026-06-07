--==================================================
--       Date Exploration
-- identify the eariest and latest dates(bounderies)
-- Understand the scope of data and timespan
-- MIN/MAX[Date Dimension]
--===================================================

-- Find the date of the first and last order
-- How many years of nsales are available

SELECT 
	MIN(order_date) AS first_order_date,
	MAX(order_date) AS last_order_date,
	DATEDIFF(year, MIN(order_date), MAX(order_date)) AS order_range_years 
FROM gold.fact_sales

-- Find the youngest and oldest customer based on birth_date

SELECT 
	MIN(birth_date) AS oldest_birthdate,
	DATEDIFF(year, MIN(birth_date), GETDATE()) AS oldest_age,
	MAX(birth_date) AS youngest_birthdate,
	DATEDIFF(year, MAX(birth_date), GETDATE()) AS youngest_age
FROM gold.dim_customers

