-- Instructor(instructor_id, name, dept_id, salary, hire_date)
-- , Course(course_id, course_name, dept_id, credits, instructor_id)
-- , Student(student_id, name, dept_id, admission_year, email)
-- , Enrollment(enroll_id, student_id, course_id, semester, grade)
-- , Department(dept_id, dept_name, building, budget)
-- , Course_Schedule(schedule_id, course_id, room_no, day_of_week, start_time)
-- , Book(book_id, title, author, dept_id, price)
-- , Book_Issue(issue_id, book_id, student_id, issue_date, return_date)
-- , Fee_Payment(payment_id, student_id, amount, payment_date, semester)

-- For each course, compute the "average grade point" of students enrolled in it, using this mapping: $A = 4, B = 3, C = 2$. Then list only the courses whose average grade point is higher than the overall average grade point across all enrollments in the university.

SELECT 
    course_id,
    AVG(
        CASE
            WHEN grade = 'A' THEN 4
            WHEN grade = 'B' THEN 3
            When grade = 'C' THEN 2
        END
    ) as avg_course_grade
FROM Enrollment 
GROUP BY course_id
HAVING AVG(
    CASE
        WHEN grade = 'A' THEN 4
        WHEN grade = 'B' THEN 3
        When grade = 'C' THEN 2
    END
) > (
    SELECT AVG(
        CASE
            WHEN grade = 'A' THEN 4
            WHEN grade = 'B' THEN 3
            When grade = 'C' THEN 2
        END
    )
    FROM Enrollment
);