-- Day 3 — Subqueries
-- employees: id, name, department, salary

-- 1. Employees earning above the company average
SELECT id, name
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);

-- 2. Employees in the same department(s) as 'Aditi'
SELECT id, name
FROM employees
WHERE department IN (SELECT department FROM employees WHERE name = 'Aditi');

-- 3. Employees in departments that have at least one high earner (>100000)
SELECT id, name
FROM employees
WHERE department IN (SELECT department FROM employees WHERE salary > 100000);

-- KEY:
-- Subquery returns ONE value → use =
-- Subquery returns MANY values → use IN (safer default)
-- Always ask: "can I trust this subquery returns exactly one row?"
