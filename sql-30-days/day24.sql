-- Day 24

-- 1. Count of employees earning >50000, per department
SELECT department, COUNT(id) AS high_earners
FROM employees
WHERE salary > 50000
GROUP BY department;

-- 2. Total sales for products sold more than 5 times
SELECT product, SUM(amount) AS total_sales, COUNT(id) AS times_sold
FROM sales
GROUP BY product
HAVING COUNT(id) > 5;
