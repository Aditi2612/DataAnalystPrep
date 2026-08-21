-- Day 11

-- 1. Top 5 customers by total order amount
SELECT customer_id, SUM(amount) AS tot
FROM orders
GROUP BY customer_id
ORDER BY tot DESC
LIMIT 5;

-- 2. Each employee's salary + their department's average salary
SELECT name, department, salary,
       AVG(salary) OVER (PARTITION BY department) AS avg_salary
FROM employees;
