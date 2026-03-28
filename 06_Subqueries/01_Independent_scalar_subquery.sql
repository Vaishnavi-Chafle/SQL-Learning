-- ---------- SCALAR SUBQUERY ----------

-- 1) find the movie with highest profit(vs order by)

SELECT * FROM sql_cs_live.movies
ORDER BY (gross-budget) DESC LIMIT 1;
-- OR
 
SELECT * FROM sql_cs_live.movies
WHERE (gross - budget) = (SELECT MAX(gross - budget) FROM sql_cs_live.movies);

-- 2) Find how many movies have a rating > the avg of all the movie ratings (find the count of above avg movies)

SELECT COUNT(*) FROM sql_cs_live.movies
WHERE score > (SELECT AVG(score) FROM sql_cs_live.movies);

-- 3) find the highest rated movie of 2000

SELECT * FROM sql_cs_live.movies
WHERE score = (SELECT MAX(score) FROM sql_cs_live.movies
				WHERE year = 2000) AND year = 2000;
                
-- 4) find the highest rated movie among all movies whose number of votes are > the dataset avg votes

SELECT * FROM sql_cs_live.movies
WHERE score = (SELECT MAX(score) FROM sql_cs_live.movies
				WHERE votes > (SELECT AVG(votes) 
								FROM sql_cs_live.movies));


 