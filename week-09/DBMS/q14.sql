-- , Instructor(instructor_id, name, dept_id, salary, hire_date)


--  Using `ALL`, find the instructor(s) whose salary is greater than the salary of every instructor in the CS department (`dept_id = 1`), excluding CS instructors themselves from the result.

SELECT
    i.name
FROM Instructor i
WHERE i.dept_id <> 1 AND 
salary > ALL (
    SELECT
        salary
    FROM Instructor
    WHERE dept_id = 1
);