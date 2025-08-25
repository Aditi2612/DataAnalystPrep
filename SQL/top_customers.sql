-- Top 3 customers by purchase amount in 2024 (with ties)
SELECT customer_id
FROM orders
WHERE YEAR(order_date) = 2024
GROUP BY customer_id
ORDER BY SUM(amount) DESC, customer_id ASC
LIMIT 3;
