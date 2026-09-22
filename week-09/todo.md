# 📊 Progress Tracker
- **Database Setup:** 1/1
- **SQL Queries (DBMS):** 3/18 
- **JS & Promises:** 0/10

---

## 🗄️ Part 1: MySQL Questions (No Hints)

### Database Setup
- [x] **Setup:** Execute schema creation and data insertion for `university_db`.

### Section A — Warm-up Multi-table Joins
- [x] **Q1:** List student name, department, enrolled courses, and grade for Fall2023 (sort by dept, then student).
- [x] **Q2:** Find all instructors, their department, and total distinct students taught (including those with 0).
- [x] **Q3:** List every course, instructor name, scheduled room/day, and total enrolled students.

### Section B — Cross-department & Self-referential Logic
- [ ] **Q4:** Find students enrolled in at least one course outside their home department.
- [ ] **Q5:** Find pairs of students in the same course/semester with different grades (no mirrored duplicates).
- [ ] **Q6:** List titles of books whose author has books catalogued under more than one department.

### Section C — Aggregation with HAVING & Subqueries
- [ ] **Q7:** Find instructors teaching more courses than the average number of courses per instructor.
- [ ] **Q8:** Find courses with an average grade point > overall university average (A=4, B=3, C=2).
- [ ] **Q9:** Find departments where total fees collected > 20% of the department's budget.

### Section D — NOT EXISTS / Relational Division
- [ ] **Q10:** Find students who issued a book but never made a Spring2024 fee payment.
- [ ] **Q11:** Find students who have enrolled in every single course offered by their home department.
- [ ] **Q12:** Find instructors where every student they have ever taught received only an A or B.
- [ ] **Q13:** Find students with unreturned books who are enrolled in a course sharing a room with another course.

### Section E — Comparison Operators, Ranking, & Set Operations
- [ ] **Q14:** Find non-CS instructors whose salary is > the salary of *every* CS instructor.
- [ ] **Q15:** Find the top 2 students per department ranked by distinct courses enrolled.
- [ ] **Q16:** Find the second-highest paid instructor in each department (without using LIMIT).
- [ ] **Q17:** Create a single combined list of all students and instructors in the CS department with their role.

### Section F — Full Combination
- [ ] **Q18:** Create a summary per department: student count, instructor count, total enrollments, and total fees (ensure totals are not artificially inflated by joins).

---

## ⚡ Part 2: What to Learn in JS & Promises

- [ ] **Promise States:** Learn which functions actually change a promise's state (`resolve` and `reject`).
- [ ] **Promise Immutability:** Understand that a promise can only resolve or reject *once* (subsequent calls are ignored).
- [ ] **Executor Execution:** Learn the difference between synchronous code inside a promise executor vs. asynchronous `.then()` handlers.
- [ ] **Fetch API Basics:** Understand the data type of the `fetch` response body (`ReadableStream`).
- [ ] **When to avoid Promises:** Identify synchronous operations (like standard `for` loops) that do not need promises.
- [ ] **Canceling Fetch:** Learn how to use `AbortController` and `controller.abort()` to cancel network requests.
- [ ] **AbortController Internals:** Understand what AbortController actually does (and what it doesn't do, like kill TCP connections).
- [ ] **Promise Combinators:** Learn when to use `Promise.all()` for handling multiple independent operations.
- [ ] **Event Loop & Microtasks:** Master the execution order of synchronous logs, promises (microtasks), and fetch calls.
- [ ] **Custom Promise Implementation:** Learn how to build a Promise from scratch (handling state, executors, `.then()` chaining, and returning new promises).