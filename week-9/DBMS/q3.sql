-- Instructor(instructor_id, name, dept_id, salary, hire_date)
-- , Course(course_id, course_name, dept_id, credits, instructor_id)
-- , Student(student_id, name, dept_id, admission_year, email)
-- , Enrollment(enroll_id, student_id, course_id, semester, grade) 
-- , Department(dept_id, dept_name, building, budget)
-- , Course_Schedule(schedule_id, course_id, room_no, day_of_week, start_time)
-- , Book(book_id, title, author, dept_id, price)
-- , Book_Issue(issue_id, book_id, student_id, issue_date, return_date)
-- , Fee_Payment(payment_id, student_id, amount, payment_date, semester)

--   List every course along with its instructor's name, the room and day it is scheduled, and the total number of students enrolled in it (any semester).

SELECT 
    c.course_name,
    i.name, 
    cs.room_no, 
    cs.day_of_week, 
    count(e.student_id) AS student_count
FROM Course c
LEFT JOIN Instructor i 
    ON c.instructor_id = i.instructor_id
LEFT JOIN Course_Schedule cs
    ON cs.course_id = c.course_id
LEFT JOIN Enrollment e
    ON e.course_id = c.course_id
GROUP BY 
    c.course_id, 
    c.course_name, 
    i.instructor_id, 
    i.name, 
    cs.schedule_id
    cs.room_no, 
    cs.day_of_week;
