-- Independent Subquery ---> Table Subquery(Multi Col Multi Row)
-- 1. Find the most profitable movie of each year
SELECT * FROM sql_cs_live.movies 
WHERE (year,gross - budget ) IN (SELECT year, MAX(gross - budget ) 
								FROM sql_cs_live.movies
								GROUP BY year)

