SELECT fruit_name FROM fruits
JOIN (
    SELECT fruit_id,
           SUM(CASE WHEN YEAR(order_date) = 2021 THEN total_sales_value ELSE 0 END) as sales_2021,
           SUM(CASE WHEN YEAR(order_date) = 2022 THEN total_sales_value ELSE 0 END) as sales_2022
    FROM fruit_sales
    WHERE YEAR(order_date) IN (2021, 2022)
    GROUP BY fruit_id
)
 aggregated_sales ON fruits.fruit_id = aggregated_sales.fruit_id
WHERE aggregated_sales.sales_2022 < aggregated_sales.sales_2021;