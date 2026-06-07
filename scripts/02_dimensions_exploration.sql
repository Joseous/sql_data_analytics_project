--===========================================================
--         Dimensions Exploration
-- Identify the unique values or categories in each dimension
-- Recognizing how data might be grouped or segmented, which is useful for later analysis
-- example: DISTINCT country, category, product ....
--===========================================================

-- Explore all countries our customers come from

SELECT DISTINCT
	country
FROM gold.dim_customers

-- Explore All product Categories, The major division

SELECT DISTINCT 
	category,
	subcategory,
	product_name
FROM gold.dim_products
ORDER BY 1,2,3
