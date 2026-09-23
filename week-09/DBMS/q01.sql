-- Instructor(instructor_id, name, dept_id, salary, hire_date)
-- , Course(course_id, course_name, dept_id, credits, instructor_id)
-- , Student(student_id, name, dept_id, admission_year, email)
-- , Enrollment(enroll_id, student_id, course_id, semester, grade) 
-- , Department(dept_id, dept_name, building, budget)
-- , Course_Schedule(schedule_id, course_id, room_id, day_of_week, start_time)
-- , Book(book_id, title, author, dept_id, price)
-- , Book_Issue(issue_id, book_id, student_id, issue_date, return_date)
-- , Fee_Payment(payment_id, student_id, amount, payment_date, semester)
    
-- Q1. Enrolled Courses and Grades by Semester
-- List the name of every student along with their department name, the courses they are enrolled in, and the grade obtained — for Fall2023 only. Sort by department, then student name.

SELECT 
    s.name,d.dept_name, c.course_name, e.grade
FROM Student s 
JOIN Department d 
    ON d.dept_id = s.dept_id 
JOIN Enrollment e 
    ON s.student_id = e.student_id 
JOIN Course c 
    ON e.course_id = c.course_id
WHERE semester = 'Fall2023'
ORDER BY d.dept_name, s.name

