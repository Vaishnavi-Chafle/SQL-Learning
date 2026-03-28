-- CORELATED SUBQUERY

-- 1)  Find all the movies that have a rating higher than the average rating of movies in the same genre

SELECT * FROM sql_cs_live.movies m1
WHERE score > (SELECT AVG(score) FROM sql_cs_live.movies m2
               WHERE m1.genre = m2.genre);

-- 2)
WITH favourite_food  AS (SELECT t1.user_id,t4.name,t3.f_name,COUNT(*) AS "frequency" FROM orders t1
						JOIN order_details t2
						ON t1.order_id = t2.order_id
						JOIN food t3
						ON t2.f_id = t3.f_id
						JOIN users t4
						ON t1.user_id = t4.user_id
						GROUP BY t1.user_id,t3.f_id,t4.name,t3.f_name)
                        
SELECT * FROM favourite_food f1
WHERE frequency = (SELECT MAX(frequency) 
				   FROM favourite_food f2
				   WHERE f1.name = f2.name);
                   
-- Usage with SELECT
-- 1) 
SELECT name, 
(votes /(SELECT SUM(votes) FROM sql_cs_live.movies))*100  AS "percentage_votes" 
FROM sql_cs_live.movies ;

-- 2)
SELECT name,genre,score,(SELECT AVG(score) 
						FROM sql_cs_live.movies t2
                        WHERE t1.genre = t2.genre)  AS "avg_score"
FROM sql_cs_live.movies t1;

-- usage with  FROM 
-- 1) 
USE subquery;

SELECT r_name,t.r_id,avg_rating FROM (SELECT  r_id,AVG(restaurant_rating) AS "avg_rating" 
									FROM orders 
									GROUP BY r_id) t
JOIN restaurants t2
ON t.r_id = t2.r_id;

-- Usage with having

SELECT genre,AVG(score) 
FROM sql_cs_live.movies
GROUP BY genre
HAVING AVG(score) > (SELECT AVG(score)
					FROM sql_cs_live.movies);
                    
-- subquery in insert
 -- 
 TRUNCATE TABLE subquery.loyal_users;
 
 
USE subquery;

INSERT INTO loyal_users
(user_id,name)
SELECT t.user_id,name FROM (SELECT user_id
				FROM orders 
				GROUP BY user_id
				HAVING COUNT(*) > 3) t
JOIN users t1
ON t.user_id = t1.user_id;

 -- subquery in UPDATE
 UPDATE loyal_users t1
 SET money = (SELECT SUM(amount)*0.1
              FROM orders t2
			  WHERE t1.user_id = t2.user_id);


 -- subquery in DELETE
 
 DELETE FROM users
 WHERE user_id NOT IN (SELECT DISTINCT user_id 
                                            FROM orders);
                                            

 







