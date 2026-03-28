-- Usage with FROM
-- display avg rating of all the restraurants
 -- WITH rating AS (SELECT r_id,AVG(restaurant_rating) AS "avg_rating" 
--                   FROM subquery.orders
--                   GROUP BY r_id)
--  SELECT r_name,avg_rating FROM rating t1
--  JOIN subquery.restaurants t2
--  ON t1.r_id = t2.r_id

SELECT r_name,avg_rating
FROM (SELECT r_id,AVG(restaurant_rating) AS "avg_rating" 
                  FROM subquery.orders
                  GROUP BY r_id) t1  
JOIN subquery.restaurants t2
ON t1.r_id = t2.r_id