-- =========================================
-- Day 1: Find the Second Highest Salary
-- Table: Employee (id, name, salary)
-- =========================================

------------------------------------------------
-- Approach 1: Subquery with MAX()
-- Works in all SQL engines
------------------------------------------------
SELECT MAX(salary) AS SecondHighestSalary
FROM Employee
WHERE salary < (SELECT MAX(salary) FROM Employee);
GO


------------------------------------------------
-- Approach 2: ORDER BY with LIMIT + OFFSET
-- Works in MySQL/Postgres
------------------------------------------------
SELECT DISTINCT salary AS SecondHighestSalary
FROM Employee
ORDER BY salary DESC
LIMIT 1 OFFSET 1;
-- (In SQL Server use: OFFSET 1 ROWS FETCH NEXT 1 ROWS ONLY)
GO


------------------------------------------------
-- Approach 3: Window Function (DENSE_RANK)
-- Works in SQL Server, Postgres, Oracle, MySQL 8+
------------------------------------------------
SELECT salary AS SecondHighestSalary
FROM (
    SELECT salary,
           DENSE_RANK() OVER (ORDER BY salary DESC) AS rnk
    FROM Employee
) t
WHERE rnk = 2;
GO
