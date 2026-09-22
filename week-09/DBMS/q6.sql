-- Instructor(instructor_id, name, dept_id, salary, hire_date)
-- , Course(course_id, course_name, dept_id, credits, instructor_id)
-- , Student(student_id, name, dept_id, admission_year, email)
-- , Enrollment(enroll_id, student_id, course_id, semester, grade)
-- , Department(dept_id, dept_name, building, budget)
-- , Course_Schedule(schedule_id, course_id, room_no, day_of_week, start_time)
-- , Book(book_id, title, author, dept_id, price)
-- , Book_Issue(issue_id, book_id, student_id, issue_date, return_date)
-- , Fee_Payment(payment_id, student_id, amount, payment_date, semester)

-- List the titles of books whose author has written books catalogued under more than one department. (Use self-joins or `GROUP BY author HAVING COUNT(DISTINCT dept_id) > 1` joined back to fetch qualifying titles).

SELECT
    s1.name,
    s2.name,
    c.course_name,
    e1.semester,
    e1.grade,
    e2.grade
FROM Enrollment e1
JOIN Enrollment e2
    ON e2.semester = e1.semester AND e2.course_id = e1.course_id
JOIN Course c
    ON e1.course_id = c.course_id
JOIN Student s1
    ON e1.student_id = s1.student_id
JOIN Student s2
    ON e2.student_id = s2.student_id
WHERE s1.student_id < s2.student_id AND e1.grade <> e2.grade;
