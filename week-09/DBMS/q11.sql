-- , Student(student_id, name, dept_id, admission_year, email)
-- , Course(course_id, course_name, dept_id, credits, instructor_id)
-- , Enrollment(enroll_id, student_id, course_id, semester, grade) 


--  Find the student(s) who have enrolled in every single course offered by their own home department (double-`NOT EXISTS` pattern).

SELECT
    s.name
FROM Student s
WHERE NOT EXISTS (
    SELECT
        1
    FROM Course c
    WHERE c.dept_id = s.dept_id
    AND NOT EXISTS (
        SELECT
            1
        FROM Enrollment e
        WHERE s.student_id = e.student_id AND e.course_id = c.course_id
    ) 
);