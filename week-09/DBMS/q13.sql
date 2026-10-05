-- , Book_Issue(issue_id, book_id, student_id, issue_date, return_date)
-- , Course_Schedule(schedule_id, course_id, room_no, day_of_week, start_time)
-- , Student(student_id, name, dept_id, admission_year, email)
-- , Book(book_id, title, author, dept_id, price)


--   Find students who currently have an outstanding (unreturned) book (`return_date IS NULL`) and are also enrolled in a course scheduled in a room that some other course also uses (a room shared by 2+ courses). Show student name, book title, and the shared room number.

SELECT
    s.name, b.title, cs.room_no
FROM Student s
JOIN Book_Issue bi ON bi.student_id = s.student_id
JOIN Book b ON b.book_id = bi.book_id
JOIN Enrollment e ON e.student_id = s.student_id
JOIN Course_Schedule cs ON cs.course_id = e.course_id
WHERE bi.return_date IS NULL 
AND EXISTS (
    SELECT
        1
    FROM Course_Schedule cs2
    WHERE cs2.room_no = cs.room_no
    GROUP BY cs2.room_no
    HAVING COUNT(DISTINCT cs2.course_id) >= 2
);

