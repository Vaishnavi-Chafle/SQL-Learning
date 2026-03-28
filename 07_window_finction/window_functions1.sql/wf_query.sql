-- 1. Find top 2 most paying customers of each month
USE subquery;
SELECT * FROM(SELECT MONTHNAME(date) AS "month", user_id, SUM(amount) AS "total", MONTH(date),
				RANK() over(PARTITION BY MONTHNAME(date) ORDER BY SUM(amount) DESC ) AS "rank"
				FROM orders
				GROUP BY MONTHNAME(date),user_id,MONTH(date)
				ORDER BY MONTH(date)) t
                WHERE t.rank < 3
                ORDER BY month DESC