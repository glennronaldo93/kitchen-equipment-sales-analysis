SELECT
  INITCAP(TRIM(city)) AS kota,
  ROUND(AVG(shipping_fee)) AS rata_rata_ongkir
FROM `karirnex-day2-502015.toko_dapur.sales`
GROUP BY kota
ORDER BY rata_rata_ongkir DESC;