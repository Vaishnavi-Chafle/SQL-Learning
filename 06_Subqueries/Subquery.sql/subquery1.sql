-- find the movie with highest rating
SELECT * FROM sql_cs_live.movies
WHERE score = ( SELECT MAX(score) FROM sql_cs_live.movies);

SELECT * FROM sql_cs_live.movies
ORDER BY score DESC limit 1