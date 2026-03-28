-- find the highest rated movie of 2000

SELECT * FROM sql_cs_live.movies
WHERE score = (SELECT MAX(score) 
				FROM sql_cs_live.movies
				WHERE year = 2000) AND year = 2000
