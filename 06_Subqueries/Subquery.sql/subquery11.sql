-- Find the highest grossing movies of top 5 actor/director combo in term of total gross income
WITH top_actor_director AS (SELECT star,director,MAX(gross)
								FROM sql_cs_live.movies
								GROUP BY star,director
								ORDER BY SUM(gross) DESC LIMIT 5)

SELECT * FROM sql_cs_live.movies
WHERE (star,director,gross) IN (SELECT * FROM top_actor_director)
