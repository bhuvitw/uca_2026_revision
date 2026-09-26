-- , Student(student_id, name, dept_id, admission_year, email)
-- , Department(dept_id, dept_name, building, budget)
-- , Fee_Payment(payment_id, student_id, amount, payment_date, semester)


-- Find the department(s) where the total fees collected (summing Fee_Payment.amount from students who belong to that department) is more than 20% of the department's budget. Show department name, total collected, budget, and the percentage.

SELECT
d.dept_name,SUM(f.amount)as total_collected, d.budget, SUM(f.amount) * 100 / d.budget as percentage 
FROM Department d
JOIN Student s ON s.dept_id = d.dept_id
JOIN Fee_Payment f ON f.student_id = s.student_id
GROUP BY d.dept_id, d.dept_name, d.budget
HAVING SUM(amount) > .20 * d.budget


