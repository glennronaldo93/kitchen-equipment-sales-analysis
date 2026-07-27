SELECT
  SUM(shipping_fee) AS total_ongkir,
  ROUND(AVG(shipping_fee)) AS rata_rata_ongkir
FROM `karirnex-day2-502015.toko_dapur.sales`;