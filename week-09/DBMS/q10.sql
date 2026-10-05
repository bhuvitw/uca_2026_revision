-- , Student(student_id, name, dept_id, admission_year, email)
-- , Book_Issue(issue_id, book_id, student_id, issue_date, return_date)
-- , Fee_Payment(payment_id, student_id, amount, payment_date, semester)


-- students who have issued a book but never made a Spring2024 fee payment. Show student name, department, and how many books they've issued.

SELECT
    s.name, s.dept_id, COUNT(b.book_id)
FROM Student s
JOIN Book_Issue b ON s.student_id = b.student_id
WHERE NOT EXISTS (
    SELECT 
        semester
    FROM Fee_Payment f
    where semester = "Spring2024" AND f.student_id = s.student_id
)
GROUP BY s.student_id, s.name, s.dept_id;