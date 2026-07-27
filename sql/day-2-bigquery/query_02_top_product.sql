SELECT
  product_name,
  SUM(quantity) AS unit_terjual
FROM `karirnex-day2-502015.toko_dapur.sales`
WHERE TRIM(LOWER(status)) IN ('completed', 'done')
GROUP BY product_name
ORDER BY unit_terjual DESC
LIMIT 5;