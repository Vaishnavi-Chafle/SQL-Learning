--   ----------------------------Independent Subquery----> Scaler Subquery
-- 1. find the movie with highest profit
SELECT * FROM sql_cs_live.movies
WHERE (gross - budget) = ( SELECT MAX(gross - budget) FROM sql_cs_live.movies)