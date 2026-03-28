-- RANK / DENSE_RANK / ROW_NUMBER
SELECT *,
RANK() OVER(PARTITION BY branch ORDER BY marks DESC ) AS " rank",
DENSE_RANK() OVER(PARTITION BY branch ORDER BY marks DESC )  AS "dense_rank",
ROW_NUMBER() OVER(PARTITION BY branch) AS "row_num_with_partition",
ROW_NUMBER() OVER() AS "row_num"
FROM campusx.marks;

SELECT *,
CONCAT(branch,"_", ROW_NUMBER() OVER(PARTITION BY branch) ) AS "row_num"
FROM campusx.marks;





-- creating the row number using ROW_NUMBER function
SELECT *,
CONCAT(branch,"-", ROW_NUMBER() OVER ()) AS "roll_num",
CONCAT(branch,"-", ROW_NUMBER() OVER(PARTITION BY branch)) AS "roll_num_with_partition"
FROM campusx.marks
ORDER BY student_id	




