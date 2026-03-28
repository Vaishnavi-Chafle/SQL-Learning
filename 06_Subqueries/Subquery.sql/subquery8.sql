-- 3. Find all movies of all those actors whose filmography's avg rating > 8.5(take 25000 vote as cutoff)
SELECT * FROM sql_cs_live.movies
WHERE star IN (SELECT star FROM sql_cs_live.movies
				WHERE votes > 25000
				GROUP BY star
				HAVING AVG(score) > 8.5) 
