SELECT
  COUNT(*) AS jumlah_pesanan,
  SUM(total_sales) AS total_revenue
FROM `karirnex-day2-502015.toko_dapur.sales`
WHERE TRIM(LOWER(status)) IN ('completed', 'done')
  AND EXTRACT(YEAR FROM sales_date) = 2025
  AND EXTRACT(QUARTER FROM sales_date) = 4;