-- ------------ CORELATED SUBQUERY ------------------------------
 -- 1) Find all the movies that have a rating higher than the avg rating of movies in the same genre
 
 SELECT * FROM sql_cs_live.movies m1
 WHERE  score >  ( SELECT AVG(score) FROM sql_cs_live.movies m2  WHERE m2.genre = m1.genre);

-- 2) Find the favourite food of each customer

USE subquery;
WITH fav_food AS (SELECT t1.user_id, t1.name,t4.f_name,COUNT(*) AS "count_order" FROM users t1
JOIN orders t2
ON t1.user_id = t2.user_id
JOIN order_details t3
ON t2.order_id = t3.order_id
JOIN food t4
ON t3.f_id = t4.f_id
GROUP BY t1.user_id, t1.name,t4.f_name)

SELECT * FROM fav_food  t1
WHERE count_order = (SELECT MAX(count_order) FROM fav_food t2
					 WHERE t2.user_id = t1.user_id)
