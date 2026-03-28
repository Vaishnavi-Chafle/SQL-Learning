-- -----------Correlated Subquery ------------------
-- 1. Find all the movies that have a rating of higher than the avg rating of movies in the same genre

SELECT * FROM sql_cs_live.movies m1
WHERE score >  (SELECT AVG(score) FROM sql_cs_live.movies m2 WHERE m2.genre = m1.genre)

