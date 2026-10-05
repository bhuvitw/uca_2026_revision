-- , Instructor(instructor_id, name, dept_id, salary, hire_date)
-- , Student(student_id, name, dept_id, admission_year, email)
-- , Department(dept_id, dept_name, building, budget)

-- Using `UNION`, produce a single combined list of all people (students and instructors) affiliated with the CS department, with columns `person_name`, `role` ('Student' or 'Instructor'), and `dept_name`.

SELECT
    s.name AS person_name,
    'Student' AS role,
    d.dept_name
FROM Student s
JOIN Department d ON d.dept_id = s.dept_id
WHERE d.dept_name = 'CS'

UNION 

SELECT 
    i.name as person_name, 
    'Instructor' AS role, 
    d.dept_name
FROM Instructor i
JOIN Department d ON d.dept_id = i.dept_id
WHERE d.dept_name = 'CS';


