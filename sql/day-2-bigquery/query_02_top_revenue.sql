SELECT
  product_name,
  SUM(total_sales) AS revenue
FROM `karirnex-day2-502015.toko_dapur.sales`
WHERE TRIM(LOWER(status)) IN ('completed', 'done')
GROUP BY product_name
ORDER BY revenue DESC
LIMIT 5;