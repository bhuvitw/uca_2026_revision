-- Instructor(instructor_id, name, dept_id, salary, hire_date)
-- , Course(course_id, course_name, dept_id, credits, instructor_id)
-- , Student(student_id, name, dept_id, admission_year, email)
-- , Enrollment(enroll_id, student_id, course_id, semester, grade) 
-- , Department(dept_id, dept_name, building, budget)
-- , Course_Schedule(schedule_id, course_id, room_no, day_of_week, start_time)
-- , Book(book_id, title, author, dept_id, price)
-- , Book_Issue(issue_id, book_id, student_id, issue_date, return_date)
-- , Fee_Payment(payment_id, student_id, amount, payment_date, semester)

-- List the names of students who are enrolled in at least one course offered by a different department than their own home department. Show student name, home department, course name, and the course's department.


SELECT
    s.name, d_home.dept_name, c.course_name, d_course.dept_name
FROM Student s
JOIN Enrollment e
    ON s.student_id = e.student_id
JOIN Course c
    ON c.course_id = e.course_id
JOIN Department d_home
    ON d_home.dept_id = s.dept_id
JOIN Department d_course
    ON d_course.dept_id = c.dept_id
WHERE s.dept_id <> c.dept_id;
