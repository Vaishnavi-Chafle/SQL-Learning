SELECT *,
(total /SUM(total) OVER())*100 AS "percent_of_total" FROM (SELECT f_name,r_name,
SUM(amount) AS "total"
FROM subquery.orders t1
JOIN subquery.order_details t2 ON t1.order_id = t2.order_id
JOIN subquery.food t3 ON t2.f_id =t3.f_id
JOIN subquery.restaurants t4 ON t4. r_id = t1.r_id
WHERE r_name = "dominos"
GROUP BY f_name,r_name) t
