-- Instructor(instructor_id, name, dept_id, salary, hire_date)
-- , Course(course_id, course_name, dept_id, credits, instructor_id)
-- , Student(student_id, name, dept_id, admission_year, email)
-- , Enrollment(enroll_id, student_id, course_id, semester, grade) 
-- , Department(dept_id, dept_name, building, budget)
-- , Course_Schedule(schedule_id, course_id, room_id, day_of_week, start_time)
-- , Book(book_id, title, author, dept_id, price)
-- , Book_Issue(issue_id, book_id, student_id, issue_date, return_date)
-- , Fee_Payment(payment_id, student_id, amount, payment_date, semester)

-- Find the names of all instructors, their department, and the total number of distinct students who have ever taken any course they teach. Instructors with zero students should still appear, with a count of 0.

SELECT
    i.name,
    d.dept_name,
    COUNT(DISTINCT student_id) AS student_count
FROM Instructor i
LEFT JOIN Department d
    ON d.dept_id = i.dept_id
LEFT JOIN Course c 
    ON c.instructor_id = i.instructor_id
LEFT JOIN Enrollment e
    ON e.course_id = c.course_id
GROUP BY i.name, i.instructor_id, d.dept_id,d.dept_name ; 

