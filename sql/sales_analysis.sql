-- Kitchen Equipment Sales Analysis
-- SQL Query Documentation


-- 1. Total Sales Performance

SELECT
    SUM(total_sales) AS total_sales
FROM sales_data;


-- 2. Sales by Category

SELECT
    category,
    SUM(total_sales) AS sales
FROM sales_data
GROUP BY category
ORDER BY sales DESC;


-- 3. Monthly Sales Trend

SELECT
    DATE_TRUNC(sales_date, MONTH) AS month,
    SUM(total_sales) AS monthly_sales
FROM sales_data
GROUP BY month
ORDER BY month;


-- 4. Top Selling Products

SELECT
    product_name,
    SUM(total_sales) AS sales
FROM sales_data
GROUP BY product_name
ORDER BY sales DESC
LIMIT 10;
