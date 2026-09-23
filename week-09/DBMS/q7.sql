-- Instructor(instructor_id, name, dept_id, salary, hire_date)
-- , Course(course_id, course_name, dept_id, credits, instructor_id)
-- , Student(student_id, name, dept_id, admission_year, email)
-- , Enrollment(enroll_id, student_id, course_id, semester, grade)
-- , Department(dept_id, dept_name, building, budget)
-- , Course_Schedule(schedule_id, course_id, room_no, day_of_week, start_time)
-- , Book(book_id, title, author, dept_id, price)
-- , Book_Issue(issue_id, book_id, student_id, issue_date, return_date)
-- , Fee_Payment(payment_id, student_id, amount, payment_date, semester)

-- Find the names of instructors who teach more courses than the average number of courses taught per instructor (computed across all instructors who teach at least one course).

SELECT
i.instructor_id
FROM Instructor i
JOIN Course c ON c.instructor_id = i.instructor_id
GROUP BY i.instructor_id
HAVING COUNT(course_id) >
(
SELECT
AVG(course_count)
FROM
(
SELECT
i.instructor_id, 
COUNT(c.course_id) as course_count
FROM Instructor i
JOIN Course c on c.instructor_id = i.instructor_id
GROUP BY i.instructor_id
) x
)