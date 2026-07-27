WITH clean_sales AS (
  SELECT
    sales_date,
    total_sales,

    CASE
      WHEN TRIM(LOWER(category)) IN (
        'cookware',
        'peralatan masak',
        'alat potong',
        'bakeware',
        'elektronik dapur'
      ) THEN 'Alat Masak'

      WHEN TRIM(LOWER(category)) IN (
        'peralatan saji',
        'peralatan minum'
      ) THEN 'Alat Saji'

      WHEN TRIM(LOWER(category)) IN (
        'penyimpanan',
        'aksesori dapur'
      ) THEN 'Alat Simpan'

      ELSE 'Lainnya'
    END AS category,

    CASE
      WHEN TRIM(LOWER(status)) IN ('completed', 'done')
        THEN 'complete'
      ELSE TRIM(LOWER(status))
    END AS status

  FROM `karirnex-day2-502015.toko_dapur.sales`
),

bulanan AS (
  SELECT
    category,
    FORMAT_DATE('%Y-%m', sales_date) AS bulan,
    SUM(total_sales) AS revenue
  FROM clean_sales
  WHERE status = 'complete'
  GROUP BY category, bulan
)

SELECT
  category,
  bulan,
  revenue,
  ROW_NUMBER() OVER (
    PARTITION BY category
    ORDER BY revenue DESC
  ) AS rnk
FROM bulanan
QUALIFY rnk = 1;