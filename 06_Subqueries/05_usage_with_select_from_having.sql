-- ------ USAGE WITH SELECT --------------------------------

-- 1) get the percentage of votes for each movie compared to the total number of votes

USE sql_cs_live;

SELECT name,(votes*100/(SELECT SUM(votes) FROM movies)) AS "vote_percent" FROM movies;

-- 2) display all movie names, genre, score and avg(score) of genre

SELECT name, genre, score, 
(SELECT AVG(score) FROM movies t1 WHERE t1.genre = t2.genre) AS avg_score_genre
FROM movies t2;

-- -------- USAGE WITH FROM ---------------------
-- 1) display the avg rating of all the restaurants

USE subquery;

SELECT t1.r_id, r_name, t1.avg_rating FROM (SELECT r_id, AVG(restaurant_rating) AS "avg_rating"
											FROM orders
											GROUP BY r_id) t1 JOIN restaurants t2
											ON t1.r_id = t2.r_id;


-- ---------USAGE WITH HAVING ------------

-- 1) Find genres having avg score > avg score of all the movies
USE sql_cs_live;

SELECT genre,AVG(score) FROM movies
GROUP BY genre
HAVING AVG(score) > (SELECT AVG(score) FROM movies);





