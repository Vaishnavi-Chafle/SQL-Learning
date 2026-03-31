SELECT *,
FIRST_VALUE(name) OVER(ORDER BY marks DESC)
FROM campusx.marks 
ORDER BY student_id   ;


SELECT *,
LAST_VALUE(name) OVER(PARTITION BY branch
					  ORDER BY marks DESC 
					  ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS "last_value"
FROM campusx.marks;
 
 -- Nth  VALUE -----------------
 
SELECT *,
NTH_VALUE(name,2) OVER(PARTITION BY branch 
						ORDER BY marks DESC
                        ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS "nth_value"
FROM campusx.marks;

-- --------------- QUESTIONS ---------------------

-- 1) Find the branch toppers

SELECT branch, topper_name,topper_marks FROM (SELECT * ,
							FIRST_VALUE(name) OVER(PARTITION BY branch ORDER BY marks DESC) AS "topper_name",
                            FIRST_VALUE(marks) OVER(PARTITION BY branch ORDER BY marks DESC) AS "topper_marks"
							FROM campusx.marks ) t
                            WHERE t.name = t.topper_name AND t.marks =t.topper_marks;

-- 2) Find the last topper from each branch

SELECT name,branch,marks FROM (SELECT *,
								LAST_VALUE(name) OVER w AS "topper_name",
								LAST_VALUE(marks) OVER w AS "topper_marks"
								FROM campusx.marks
                                WINDOW w AS (PARTITION BY branch ORDER BY marks DESC
											ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING)
								) t
								WHERE t.name = t.topper_name AND t.marks = t.topper_marks

