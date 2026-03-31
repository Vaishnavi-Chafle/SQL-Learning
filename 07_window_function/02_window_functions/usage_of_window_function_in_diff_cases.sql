-- ----------- RANKING PROBLEM -------------

-- 1) Find top 5 batsman within team

SELECT * FROM (SELECT BattingTeam,batter, 
				SUM(batsman_run) AS "total_run",
				DENSE_RANK() OVER(PARTITION BY BattingTeam ORDER BY SUM(batsman_run) DESC) AS "rank_within_team"
				FROM campusx.ipl
				GROUP BY BattingTeam,batter) t
                WHERE t.rank_within_team < 6;

-- ------------- CUMULATIVE SUM ------------------
-- Find the kohli runs in 50th mathch, 100th mathc, 150th mathch

SELECT * FROM (SELECT 
				CONCAT("match-", CAST(ROW_NUMBER() OVER(ORDER BY ID ASC) AS CHAR)) AS "match_num",
				SUM(batsman_run) AS "total_run",
				SUM(SUM(batsman_run)) OVER(ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS career_runs
				FROM campusx.ipl
				WHERE batter = "V Kohli"
				GROUP BY ID) t
                WHERE t.match_num = "match-50" OR t.match_num = "match-100" OR t.match_num = "match-145";

--  ---------- CUMULATIVE AVERAGE ---------------

SELECT  * FROM (SELECT 
				CONCAT("match-",ROW_NUMBER() OVER(ORDER BY ID ASC)) AS "match_num",
				SUM(batsman_run) AS "total_run",
				AVG(SUM(batsman_run)) OVER(ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS "career_avg"
				FROM campusx.ipl
				WHERE batter = "V Kohli"
				GROUP BY ID
				) t
                WHERE t.match_num = "match-50" OR t.match_num = "match-100" OR t.match_num = "match-150";
                
-- ----------------------RUNNING AVG----------------------

SELECT * FROM (SELECT 
				CONCAT("match-", ROW_NUMBER() OVER(ORDER BY ID)) AS "match_num",
				SUM(batsman_run) AS "total_run",
                AVG(SUM(batsman_run)) OVER(ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS "career_avg",
				AVG(SUM(batsman_run)) OVER w AS "career_runing_avg"
				FROM campusx.ipl
				WHERE batter = "V Kohli"
				GROUP BY ID
				WINDOW W AS (ORDER BY ID ASC ROWS BETWEEN 9 PRECEDING AND CURRENT ROW)) t
                WHERE t.match_num = "match-50" OR t.match_num = "match-100" OR t.match_num = "match-150";


-- NOTE :
-- ✅ 1. Working Query  :  AVG(SUM(batsman_run)) OVER (ROWS BETWEEN 9 PRECEDING AND CURRENT ROW)
-- 💡 What SQL does internally:
-- You already used: ROW_NUMBER() OVER(ORDER BY ID)
-- And your grouped result is implicitly ordered by ID (because of GROUP BY + engine behavior)

-- 👉 So window frame works relative to row order

-- ❌ 2. Non-working Query : WINDOW W AS (ROWS BETWEEN 9 PRECEDING AND CURRENT ROW)
-- 🚨 Problem: There is NO ORDER BY inside window W

-- 👉 SQL does NOT know:
-- "9 PRECEDING based on WHAT order?"


-- ----------------------PERCENT OF TOTAL -------------------------

-- 1) find the most profitable item in r_id 1 and also the name of this reastaurant
USE subquery;

SELECT f_name,
(total_amount/SUM(total_amount) OVER())*100 AS "percent_of_total",
 type FROM (

					SELECT t2.f_id, SUM(amount) AS "total_amount"
					FROM orders t1
					JOIN order_details t2
					ON t1.order_id = t2.order_id
					WHERE r_id = 1
					GROUP BY f_id
) t
JOIN food t1
ON t.f_id = t1.f_id
ORDER BY percent_of_total DESC
		

