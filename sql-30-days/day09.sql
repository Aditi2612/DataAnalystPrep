-- Day 9

-- 1. Customers with total order amount above 3000
SELECT c.name, SUM(o.amount) AS total_amount
FROM customers c
INNER JOIN orders o ON c.id = o.customer_id
GROUP BY c.name
HAVING SUM(o.amount) > 3000;

-- 2. Each month's revenue + previous month's revenue
SELECT month, revenue,
       LAG(revenue) OVER (ORDER BY month) AS prev_month_revenue
FROM sales;
