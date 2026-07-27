SELECT
  SUM(
    IF(
      TRIM(LOWER(status)) IN ('refund', 'refunded'),
      total_sales,
      0
    )
  ) AS nilai_refund,

  ROUND(
    100 * SAFE_DIVIDE(
      SUM(
        IF(
          TRIM(LOWER(status)) IN ('refund', 'refunded'),
          total_sales,
          0
        )
      ),
      SUM(total_sales)
    ),
    2
  ) AS persentase_dari_gross
FROM `karirnex-day2-502015.toko_dapur.sales`;