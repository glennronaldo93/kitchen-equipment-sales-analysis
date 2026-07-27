SELECT
  product_name,
  ROUND(AVG(quantity), 2) AS rata_rata_quantity,
  COUNT(*) AS jumlah_pesanan
FROM `karirnex-day2-502015.toko_dapur.sales`
WHERE TRIM(LOWER(status)) IN ('completed', 'done')
GROUP BY product_name
HAVING COUNT(*) >= 50
ORDER BY AVG(quantity) DESC, product_name ASC
LIMIT 5;