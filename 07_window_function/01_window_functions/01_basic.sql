-- -----------AGGREGATE FUNCTION WITH OVER ---------------

SELECT *, 
AVG(marks) OVER() AS "overall_avg",
MIN(marks) OVER(),
MAX(marks) OVER(),
MIN(marks) OVER(PARTITION BY branch),
MAX(marks) OVER(PARTITION BY branch)
FROM campusx.marks;

-- find all the students who have marks higher than the avg marks of their respective branch

SELECT * FROM (SELECT *,
				AVG(marks) OVER(PARTITION BY branch) AS "avg_marks"
				FROM campusx.marks) t
                WHERE t.marks > t.avg_marks



