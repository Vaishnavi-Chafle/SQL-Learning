-- Find all the students who have marks higher than the avg marks of their respective branch

SELECT * FROM (SELECT *,
AVG(marks) OVER(PARTITION BY branch) AS "avg_marks_branch" 
FROM campusx.marks ) t
WHERE t.marks > t.avg_marks_branch

