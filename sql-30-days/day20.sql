-- Day 20

-- 1. Departments whose avg salary beats the company average
SELECT d.dept_name, AVG(e.salary) AS dept_avg
FROM employees e
INNER JOIN departments d ON e.department_id = d.id
GROUP BY d.dept_name
HAVING AVG(e.salary) > (SELECT AVG(salary) FROM employees);

-- 2. Each salesperson's month-over-month revenue change (own sequence)
SELECT salesperson, month, revenue,
       revenue - LAG(revenue) OVER (PARTITION BY salesperson ORDER BY month) AS change_from_prev
FROM sales;

-- KEY: PARTITION BY salesperson keeps each person's timeline separate.
-- "change" = subtract the LAG; "previous" = just the LAG. Read the verb.
