SELECT
  product_name,
  COUNT(*) AS jumlah_pesanan,

  ROUND(
    100 * SAFE_DIVIDE(
      COUNTIF(status_clean = 'refund'),
      COUNT(*)
    ),
    2
  ) AS refund_rate,

  SUM(
    IF(
      status_clean = 'refund',
      total_sales,
      0
    )
  ) AS nilai_refund

FROM `karirnex-day2-502015.toko_dapur.sales`
WHERE order_id IS NOT NULL
GROUP BY product_name
HAVING COUNT(*) >= 100
ORDER BY refund_rate DESC
LIMIT 5;