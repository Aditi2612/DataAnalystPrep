-- Day 12

-- 1. Each employee's name and department name (JOIN)
SELECT e.name, d.dept_name
FROM employees e
INNER JOIN departments d ON e.department_id = d.id;

-- 2. Employees earning more than their OWN department's average
--    (correlated subquery — inner query linked to outer row)
SELECT id, name
FROM employees e
WHERE salary > (SELECT AVG(salary)
                FROM employees
                WHERE department = e.department);

-- KEY: a subquery returning many rows can't be compared with >.
-- To compare each row to ITS group's value, correlate the subquery
-- (link with WHERE department = e.department) or use a window function.
