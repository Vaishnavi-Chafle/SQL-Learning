-- ----------------- ROW SUBQUERY (ONE COM MULTI ROWS) ----------------
USE subquery;

-- 1) Find all users who never ordered

SELECT * FROM users
WHERE user_id NOT IN (SELECT DISTINCT(user_id) FROM orders);

-- 2) find all the movies made by top 3 directors (in terms of total gross income)

WITH top_directors AS (SELECT director FROM sql_cs_live.movies
					   GROUP BY director
					   ORDER BY SUM(gross) DESC LIMIT 3)
SELECT * FROM sql_cs_live.movies
WHERE director IN (SELECT * FROM top_directors);

-- 3) Find all movies of all those actors whose filmography's avg rating > 8.5 (take 25000 votes as cutoff)

WITH top_star AS (SELECT star FROM sql_cs_live.movies
				WHERE votes > 25000
				GROUP BY star
				HAVING AVG(score) > 8.5)
                
SELECT * FROM sql_cs_live.movies
WHERE star IN (SELECT * FROM top_star) AND votes > 25000

