-- 2.Find all the movies made by top 3 directors (in terms of total gross income)

WITH top_director AS (SELECT director
						FROM sql_cs_live.movies 
						GROUP BY director
						ORDER BY SUM(gross) DESC LIMIT 3)
SELECT * FROM sql_cs_live.movies
WHERE director IN (SELECT * FROM top_director)
