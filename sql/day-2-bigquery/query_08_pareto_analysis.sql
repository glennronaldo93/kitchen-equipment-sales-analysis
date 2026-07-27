WITH clean_sales AS (
  SELECT
    product_name,
    total_sales,
    CASE
      WHEN TRIM(LOWER(status)) IN ('completed', 'done')
        THEN 'complete'
      ELSE TRIM(LOWER(status))
    END AS status
  FROM `karirnex-day2-502015.toko_dapur.sales`
),

prod AS (
  SELECT
    product_name,
    SUM(total_sales) AS revenue
  FROM clean_sales
  WHERE status = 'complete'
  GROUP BY product_name
),

kumulatif AS (
  SELECT
    product_name,
    revenue,
    ROUND(
      100 * SUM(revenue) OVER (ORDER BY revenue DESC)
      / SUM(revenue) OVER (),
      1
    ) AS pct_kumulatif
  FROM prod
)

SELECT *
FROM kumulatif
WHERE pct_kumulatif <= 80
ORDER BY pct_kumulatif;