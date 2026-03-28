-- Cumulative sum --> The cumulative sum calculates the sum of a set of values up to a give point in time
-- and includes all the previous values in the calculation

SELECT * FROM (SELECT CONCAT("MATCH-", ROW_NUMBER() OVER(ORDER BY ID DESC)) AS "match_num",
				SUM(batsman_run) AS "runs_scored",
				SUM(SUM(batsman_run)) OVER(ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) "career_runs"
				FROM campusx.ipl
				WHERE batter = "V kohli"
				GROUP BY ID) t
                WHERE match_num IN('MATCH-50','MATCH-100','MATCH-140')
