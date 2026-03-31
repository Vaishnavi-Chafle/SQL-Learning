-- -------RANK / DENSE_RANK/ ROW_NUMBER -------------------------
 
SELECT * ,
RANK() OVER(PARTITION BY branch ORDER BY marks DESC) AS "rank",
DENSE_RANK() OVER(PARTITION BY branch ORDER BY marks DESC) AS "dense_rank",
ROW_NUMBER() OVER(PARTITION BY branch ORDER BY marks DESC) AS "row_number"
FROM campusx.marks;

SELECT *,
ROW_NUMBER() OVER()
FROM campusx.marks;

SELECT *,
CONCAT(branch,"-",ROW_NUMBER() OVER(PARTITION BY branch)) AS "roll_number"
FROM campusx.marks;

-- this sorting is not happen bcz of row_number. this is bcz of enoDB, the database engine that we are useing
-- mySQL ka database engine it is not bcz of the window function

-- 1) Find top 2 most paying customers of each month

SELECT * FROM (SELECT user_id, MONTHNAME(date) AS "month",
				SUM(amount) AS "month_expense",
				RANK() OVER(PARTITION BY MONTHNAME(date) ORDER BY SUM(amount) DESC) AS "rank"
				FROM subquery.orders
				GROUP BY user_id,MONTHNAME(date)
				ORDER BY MONTHNAME(date) DESC) t
                WHERE t.rank < 3



