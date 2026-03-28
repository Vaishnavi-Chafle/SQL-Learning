-- Display all movie names,genre,score and avg(score) of genre

SELECT name,genre,score,(SELECT AVG(score) 
                         FROM sql_cs_live.movies t2 WHERE t2.genre = t1.genre) AS "avg_score_genre" 
					     FROM sql_cs_live.movies t1 
