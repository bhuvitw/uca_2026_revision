-- , Instructor(instructor_id, name, dept_id, salary, hire_date)
-- , Department(dept_id, dept_name, building, budget)

-- Find the second-highest paid instructor in each department (per department, not overall), without using `LIMIT`. Show department name, instructor name, and salary.

SELECT dept_name, name, salary
FROM (
SELECT
    d.dept_name, i.name, i.salary, RANK() OVER (
        PARTITION BY i.dept_id
        ORDER BY i.salary DESC
    ) as rnk
FROM Instructor i
JOIN Department d ON i.dept_id = d.dept_id
) x
WHERE rnk = 2; 
