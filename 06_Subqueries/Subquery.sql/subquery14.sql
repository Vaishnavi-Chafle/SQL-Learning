-- ---Usage with SELECT 
-- 1. Get the percentage of votes for each movie compared to the total number of votes 

SELECT name, (votes/(SELECT SUM(votes) 
              FROM sql_cs_live.movies ) *100) AS "per_votes" FROM sql_cs_live.movies
    

