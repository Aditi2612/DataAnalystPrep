-- Day 23

-- 1. Sales team, highest paid first
SELECT name, salary
FROM employees
WHERE department = 'Sales'
ORDER BY salary DESC;

-- 2. Count and average price of all products
SELECT COUNT(id) AS num_products, AVG(price) AS avg_price
FROM products;

-- KEY: "highest FIRST" = ORDER BY ... DESC (sort rows).
--      "the highest" = MAX() (one value). Different things.
