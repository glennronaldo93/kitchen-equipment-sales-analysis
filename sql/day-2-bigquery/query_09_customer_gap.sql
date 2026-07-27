WITH clean_sales AS (
  SELECT
    customer_name_clean AS customer,
    sales_date,
    status_clean AS status
  FROM `karirnex-day2-502015.toko_dapur.sales`
  WHERE order_id IS NOT NULL
),

setia AS (
  SELECT
    customer
  FROM clean_sales
  WHERE status = 'complete'
  GROUP BY customer
  HAVING COUNT(*) > 5
),

jeda AS (
  SELECT
    c.customer,
    DATE_DIFF(
      sales_date,
      LAG(sales_date) OVER (
        PARTITION BY c.customer
        ORDER BY sales_date
      ),
      DAY
    ) AS gap_hari
  FROM clean_sales c
  JOIN setia USING(customer)
  WHERE status = 'complete'
)

SELECT
  customer,
  ROUND(AVG(gap_hari), 1) AS avg_gap
FROM jeda
WHERE gap_hari IS NOT NULL
GROUP BY customer
ORDER BY avg_gap;