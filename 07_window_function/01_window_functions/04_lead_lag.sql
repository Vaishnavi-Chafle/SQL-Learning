SELECT *,
LAG(marks) OVER(),
LEAD(marks) OVER()
FROM campusx.marks;

SELECT *,
LEAD(marks) OVER(PARTITION BY branch) AS "lead",
LAG(marks) OVER(PARTITION BY branch) AS "lag"
FROM campusx.marks;

-- 1) Find the MoM revenue growth of zomato

SELECT MONTHNAME(date) AS "month", YEAR(date) AS "year",SUM(amount),
((SUM(amount) - (LAG(SUM(amount)) OVER()))/ (LAG(sum(amount)) OVER()))*100 AS "growth"
FROM subquery.orders
GROUP BY MONTHNAME(date) , YEAR(date)