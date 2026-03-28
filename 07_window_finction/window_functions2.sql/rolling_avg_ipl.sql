SELECT CONCAT("Match-",ROW_NUMBER() OVER(ORDER BY ID)) AS "Match_num",
SUM(batsman_run),
AVG(SUM(batsman_run)) OVER(ROWS BETWEEN 9 PRECEDING AND CURRENT ROW) AS "rolling_avg_of_window_10"
FROM campusx.ipl
WHERE batter = "V kohli"
GROUP BY ID