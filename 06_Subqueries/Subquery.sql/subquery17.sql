-- Usage with HAVING
-- 1. Find genres having avg score > avg score of all the movies

SELECT genre,AVG(score)
FROM sql_cs_live.movies
GROUP BY genre 
HAVING AVG(score) > (SELECT AVG(score) FROM  sql_cs_live.movies)