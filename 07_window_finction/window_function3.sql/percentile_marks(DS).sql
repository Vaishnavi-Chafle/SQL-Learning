-- FIND THE MEDIAN (50th percentile)
SELECT *,
PERCENTILE_DISC(0.5) WITHIN GROUP(ORDER BY marks) OVER() AS "madian_marks_disc",
PERCENTILE_CONT(0.5) WITHIN GROUP(ORDER BY marks) OVER() AS "madian_marks_cont"
FROM campusx.marks