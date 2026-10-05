-- Department(dept_id, dept_name)
-- Instructor(instructor)


-- Using a correlated subquery that compares each instructor's salary to the average salary of instructors in every OTHER department (excluding their own), how many instructors qualify as earning above that value?

SELECT 
    count(*)
FROM Instructor i
WHERE i.salary > (
    SELECT 
        AVG(ii.salary)
    FROM Instructor ii
    WHERE ii.dept_id <> i.dept_id
);