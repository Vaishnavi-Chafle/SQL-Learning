-- CUMULATIVE AVERAGE

SELECT * FROM (SELECT CONCAT("Match-",ROW_NUMBER() OVER(ORDER BY ID )) AS "match_no",
				SUM(batsman_run),
				SUM(SUM(batsman_run)) OVER W  AS "career_score",
				AVG(SUM(batsman_run)) OVER W AS "career_avg"
				FROM campusx.ipl
				WHERE batter = "V kohli"
				GROUP BY ID
                WINDOW W AS (ORDER BY ID ROWS BETWEEN UNBOUNDED PRECEDING  AND CURRENT ROW )) t 

