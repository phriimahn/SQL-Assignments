SELECT fruit_sales.fruit_id,fruits.fruit_name,
SUM(fruit_sales.total_sales_value)
FROM fruit_sales
JOIN fruits ON fruit_sales.fruit_id = fruits.fruit_id
WHERE MONTH(fruit_sales.order_date) = 05
AND YEAR(fruit_sales.order_date) = 2022
GROUP BY fruit_sales.fruit_id,fruits.fruit_name
ORDER BY SUM(fruit_sales.total_sales_value) DESC
;