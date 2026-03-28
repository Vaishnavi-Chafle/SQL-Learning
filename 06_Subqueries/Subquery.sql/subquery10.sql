-- 2. Find the highest rated movie of each genre votes cut off of 25000

SELECT * FROM sql_cs_live.movies
WHERE (genre,score) IN (SELECT genre,MAX(score) FROM sql_cs_live.movies
						WHERE votes > 25000
						GROUP BY genre)