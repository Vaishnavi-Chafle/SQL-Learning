-- Independent Subquery - scaler subquery

SELECT * FROM sql_cs_live.movies
WHERE (gross - budget) =( SELECT MAX(gross - budget) FROM sql_cs_live.movies);

SELECT * FROM sql_cs_live.movies
ORDER BY gross-budget DESC LIMIT 1 ;

-- 2)
SELECT COUNT(*) FROM sql_cs_live.movies
WHERE score > (SELECT AVG(score) FROM sql_cs_live.movies);

-- 3)
SELECT * FROM (SELECT * FROM sql_cs_live.movies
			   WHERE year = 2000)  t 
ORDER BY t.score DESC LIMIT 1 ;

SELECT * FROM sql_cs_live.movies
WHERE year = 2000 AND score = (SELECT MAX(score)
								FROM sql_cs_live.movies
                                WHERE year = 2000);

-- 4)
SELECT * FROM sql_cs_live.movies
WHERE votes > (SELECT AVG(votes) FROM sql_cs_live.movies)
ORDER BY score DESC LIMIT 1;

SELECT * FROM sql_cs_live.movies
WHERE score = (SELECT MAX(score) FROM sql_cs_live.movies
			   WHERE votes > (SELECT AVG(votes) 
							   FROM sql_cs_live.movies));

-- Independent Subquery - row subquery

-- 1) find all the users who never ordered
USE subquery;

SELECT * FROM users
WHERE user_id NOT IN (SELECT DISTINCT user_id FROM subquery.orders);

-- 2) find all the movie made by top 3 directors(in terms of total gross income)

WITH top_directors AS (SELECT director FROM sql_cs_live.movies
				   GROUP BY director
				   ORDER BY SUM(gross) DESC LIMIT 3)
SELECT * FROM sql_cs_live.movies
WHERE director IN (SELECT * FROM top_directors);

-- 3)

SELECT * FROM sql_cs_live.movies
WHERE star IN (SELECT star FROM sql_cs_live.movies
				WHERE votes > 25000
				GROUP BY star
				HAVING AVG(score) > 8.5);

-- INDEPENDENT SUBQUERY - Table Subquery

-- 1) Find the most profitable movie of each year

SELECT * FROM sql_cs_live.movies
WHERE (year , gross-budget) IN (SELECT year,MAX(gross - budget) AS "profit"
								FROM sql_cs_live.movies
								GROUP BY year
								);
                                
-- 2) Find the highest rated movie of each genre votes cutoff 25000
SELECT * FROM sql_cs_live.movies
WHERE (genre,score) IN (SELECT genre,MAX(score) 
						FROM sql_cs_live.movies
						WHERE votes > 25000
						GROUP BY genre
						)
AND votes > 25000;

-- 3) find the highest grossing movies of to 5 actor/director combo in terms of total gross income
WITH top_actor_director AS (SELECT star,director,MAX(gross)
							FROM sql_cs_live.movies
							GROUP BY star,director
							ORDER BY SUM(gross) DESC LIMIT 5)
SELECT * FROM sql_cs_live.movies
WHERE (star,director,gross) IN (SELECT * FROM top_actor_director)















