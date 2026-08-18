-- Day 8 — GROUP BY/HAVING + Window RANK

-- 1. Departments with average salary above 50000
SELECT department, AVG(salary) AS avg_salary
FROM employees
GROUP BY department
HAVING AVG(salary) > 50000;

-- 2. Salary rank within each department (highest = 1)
SELECT name, department, salary,
       RANK() OVER (PARTITION BY department ORDER BY salary DESC) AS dept_rank
FROM employees;
