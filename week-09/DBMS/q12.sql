-- ,Instructor(instructor_id, name, dept_id, salary, hire_date)
-- , Course(course_id, course_name, dept_id, credits, instructor_id)
-- , Enrollment(enroll_id, student_id, course_id, semester, grade) 


--  Find instructor(s) for whom every student who has ever taken one of their courses received a grade of A or B only — i.e., no student of theirs has ever gotten a C or lower. Show instructor name and department.


SELECT
    i.name, i.dept_id
FROM Instructor i
WHERE NOT EXISTS (
    SELECT
        1
    FROM Course c
    WHERE c.instructor_id = i.instructor_id AND
    NOT EXISTS (
        SELECT
            1
        FROM Enrollment e
        WHERE e.course_id = c.course_id AND e.grade NOT IN ('A', 'B')
    )
);