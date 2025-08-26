“Find employees ranked by salary within each department”

SELECT 
    e.employee_id,
    d.dept_name,
    e.salary,
    DENSE_RANK() OVER(PARTITION BY d.dept_name ORDER BY e.salary DESC) AS rnk
FROM Employees e
JOIN Departments d
    ON e.dept_id = d.dept_id;