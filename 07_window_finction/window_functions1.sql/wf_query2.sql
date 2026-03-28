-- Find the branch last topper
SELECT name,branch,marks FROM(SELECT *,
								LAST_VALUE(name) OVER (PARTITION BY branch ORDER BY marks DESC
					    ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS "topper_name",
								LAST_VALUE(marks) OVER (PARTITION BY branch ORDER BY marks DESC
					    ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS "topper_marks"
								FROM campusx.marks) t
                                WHERE t.marks = t.topper_marks AND t.name = t.topper_name

                            
