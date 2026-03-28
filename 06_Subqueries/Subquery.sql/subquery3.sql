-- 2.Find the how many movies have a rating > the avg of all the movie rating (find the count of above 
-- avg movies)
SELECT COUNT(*) FROM sql_cs_live.movies
WHERE score > (SELECT AVG(score) FROM sql_cs_live.movies)
