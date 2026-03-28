-- LEAD / LAG

SELECT *,
LAG(marks) OVER(PARTITION BY branch ORDER BY student_id ASC) AS "lag",
LEAD(marks) OVER(ORDER BY student_id ASC) AS "lead"
FROM  campusx.marks;

-- monthly increase in revenue
SELECT MONTHNAME(date), YEAR(date), SUM(amount),
( (SUM(amount) - LAG(SUM(amount)) OVER()) / LAG(SUM(amount)) OVER()) *100 AS "growth"
FROM subquery.orders
GROUP BY MONTHNAME(date),YEAR(date)
