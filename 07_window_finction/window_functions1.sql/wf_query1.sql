-- find the branch toppers
SELECT * FROM (SELECT *,
				FIRST_VALUE(name) OVER(PARTITION BY branch ORDER BY marks DESC) AS "topper_name",
                FIRST_VALUE(marks) OVER(PARTITION BY branch ORDER BY marks DESC) AS "topper_marks"
				FROM campusx.marks) t
                WHERE t.name = t.topper_name AND t.marks = t.topper_marks;
                

SELECT * FROM (SELECT *,
				LAST_VALUE(name) OVER(PARTITION BY branch ORDER BY marks DESC
                                      ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS "last_topper_name",
                LAST_VALUE(marks) OVER(PARTITION BY branch ORDER BY marks DESC
                                       ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS "last_topper_marks"
				FROM campusx.marks) t
                WHERE t.name = t.last_topper_name AND t.marks = t.last_topper_marks;
                
                
SELECT * FROM (SELECT *,
				LAST_VALUE(name) OVER W AS "last_topper_name",
                LAST_VALUE(marks) OVER W AS "last_topper_marks"
				FROM campusx.marks
                
                WINDOW W AS (PARTITION BY branch ORDER BY marks DESC
							ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) ) t
                WHERE t.name = t.last_topper_name AND t.marks = t.last_topper_marks;
                                

                            