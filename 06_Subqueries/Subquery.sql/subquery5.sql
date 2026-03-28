-- 4.Find the highest rated movie among all movies whose number of votes are  > than the dataset avg votes

SELECT * FROM sql_cs_live.movies
WHERE score = (SELECT MAX(score)
			   FROM sql_cs_live.movies
               WHERE votes > (SELECT AVG(votes) 
                              FROM sql_cs_live.movies ))


