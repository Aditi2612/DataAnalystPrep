-- Day 1 — Level 1: SELECT, WHERE, ORDER BY, GROUP BY

-- 1. Name and salary of Sales employees, highest first
SELECT name, salary
FROM employees
WHERE department = 'Sales'
ORDER BY salary DESC;

-- 2. Average salary per department, highest average first
SELECT department, AVG(salary) AS avg_salary
FROM employees
GROUP BY department
ORDER BY avg_salary DESC;
