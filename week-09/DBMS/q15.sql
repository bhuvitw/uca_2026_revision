--   Using a window function (`RANK()` or `DENSE_RANK()`), find the top 2 students per department ranked by the number of distinct courses they've enrolled in. Show department name, student name, distinct course count, and rank. Handle ties sensibly.

SELECT dept_name, student_name, course_count, rnk
FROM (
    SELECT
        d.dept_name, 
        s.name as student_name,
        COUNT(DISTINCT e.course_id) as course_count,
        RANK() OVER (
            PARTITION BY d.dept_id
            ORDER BY COUNT(DISTINCT e.course_id) DESC
        ) AS rnk
    FROM Student s
    JOIN Department d ON d.dept_id = s.dept_id
    JOIN Enrollment e ON e.student_id = s.student_id
    GROUP BY d.dept_id, d.dept_name, s.student_id, s.name
) x
WHERE rnk <= 2;