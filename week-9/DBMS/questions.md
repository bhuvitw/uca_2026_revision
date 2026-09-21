# University Database Queries — Question Set

This document compiles the problem statements and task requirements categorized by topic from the University Database assessment.

---

## 1. Setup & Overview

### Scenario
A university requires a relational database tracking departments, instructors, students, courses, enrollments, course scheduling, library book inventory/issues, and fee payments.

### Database Schema Overview
* **Department** (`dept_id`, `dept_name`, `building`, `budget`)
* **Instructor** (`instructor_id`, `name`, `dept_id`, `salary`, `hire_date`)
* **Student** (`student_id`, `name`, `dept_id`, `admission_year`, `email`)
* **Course** (`course_id`, `course_name`, `dept_id`, `credits`, `instructor_id`)
* **Enrollment** (`enroll_id`, `student_id`, `course_id`, `semester`, `grade`)
* **Course_Schedule** (`schedule_id`, `course_id`, `room_no`, `day_of_week`, `start_time`)
* **Book** (`book_id`, `title`, `author`, `dept_id`, `price`)
* **Book_Issue** (`issue_id`, `book_id`, `student_id`, `issue_date`, `return_date`)
* **Fee_Payment** (`payment_id`, `student_id`, `amount`, `payment_date`, `semester`)

---

## 2. Multi-Table Joins (Warm-Up)

* **Q1. Enrolled Courses and Grades by Semester**
  List the name of every student along with their department name, the courses they are enrolled in, and the grade obtained — for `Fall2023` only. Sort by department, then student name.

* **Q2. Instructor Student Reach (Outer Joins)**
  Find the names of all instructors, their department, and the total number of distinct students who have ever taken any course they teach. Instructors with zero students should still appear, with a count of 0.

* **Q3. Course Schedule and Aggregate Enrollment**
  List every course along with its instructor's name, the room and day it is scheduled, and the total number of students enrolled in it (any semester).

---

## 3. Cross-Department & Self-Referential Logic

* **Q4. Inter-Departmental Course Enrollment**
  List the names of students who are enrolled in at least one course offered by a different department than their own home department. Show student name, home department, course name, and the course's department.

* **Q5. Student Pairs with Grade Discrepancies (Self Join)**
  Find pairs of students who are enrolled in the same course in the same semester but received different grades. Show both student names, the course name, the semester, and both grades. Avoid showing duplicate mirror pairs (e.g., show "A–B" but not "B–A").

* **Q6. Cross-Department Catalogued Authors**
  List the titles of books whose author has written books catalogued under more than one department. (Use self-joins or `GROUP BY author HAVING COUNT(DISTINCT dept_id) > 1` joined back to fetch qualifying titles).

---

## 4. Aggregations, HAVING & Subqueries

* **Q7. Instructors Teaching Above Average Course Load**
  Find the names of instructors who teach more courses than the average number of courses taught per instructor (computed across all instructors who teach at least one course).

* **Q8. Course Grade Point Average vs. University Baseline**
  For each course, compute the "average grade point" of students enrolled in it, using this mapping: $A = 4, B = 3, C = 2$. Then list only the courses whose average grade point is higher than the overall average grade point across all enrollments in the university.

* **Q9. Department Budget vs. Fee Collection Threshold**
  Find the department(s) where the total fees collected (summing `Fee_Payment.amount` from students who belong to that department) is more than 20% of the department's budget. Show department name, total collected, budget, and the percentage.

---

## 5. NOT EXISTS & Relational Division

* **Q10. Library Users with Unpaid Term Fees**
  Find students who have issued a book but never made a `Spring2024` fee payment. Show student name, department, and how many books they've issued.

* **Q11. Relational Division: Complete Home Department Course Enrollment**
  Find the student(s) who have enrolled in every single course offered by their own home department (double-`NOT EXISTS` pattern).

* **Q12. Pure High-Performance Instructors**
  Find instructor(s) for whom every student who has ever taken one of their courses received a grade of A or B only — i.e., no student of theirs has ever gotten a C or lower. Show instructor name and department.

* **Q13. Outstanding Book Holds and Shared Classroom Scheduling**
  Find students who currently have an outstanding (unreturned) book (`return_date IS NULL`) and are also enrolled in a course scheduled in a room that some other course also uses (a room shared by 2+ courses). Show student name, book title, and the shared room number.

---

## 6. Comparison Operators, Window Functions & Set Operations

* **Q14. Universal Salary Comparison (`ALL`)**
  Using `ALL`, find the instructor(s) whose salary is greater than the salary of every instructor in the CS department (`dept_id = 1`), excluding CS instructors themselves from the result.

* **Q15. Departmental Ranking via Window Functions**
  Using a window function (`RANK()` or `DENSE_RANK()`), find the top 2 students per department ranked by the number of distinct courses they've enrolled in. Show department name, student name, distinct course count, and rank. Handle ties sensibly.

* **Q16. Nth Highest Salary per Group (No `LIMIT`)**
  Find the second-highest paid instructor in each department (per department, not overall), without using `LIMIT`. Show department name, instructor name, and salary.

* **Q17. Unified Department Directory (`UNION`)**
  Using `UNION`, produce a single combined list of all people (students and instructors) affiliated with the CS department, with columns `person_name`, `role` ('Student' or 'Instructor'), and `dept_name`.

---

## 7. Complex Aggregation & Fan-Out Prevention

* **Q18. Comprehensive Departmental Performance & Revenue Summary**
  Produce a single summary report, one row per department, with the following columns:
  * Department name
  * Number of students in that department
  * Number of instructors in that department
  * Total number of enrollments generated by students of that department (across any course, any department)
  * Total fees collected from students of that department (all semesters combined)

  *Constraint:* Prevent Cartesian fan-out from joining one-to-many relationship branches (`Department → Student → Enrollment` and `Department → Student → Fee_Payment`) simultaneously, ensuring counts and fee sums remain un-inflated.