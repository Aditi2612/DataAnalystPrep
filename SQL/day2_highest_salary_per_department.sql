Find the employee(s) with the highest salary in each department.

SELECT d.dept_name,
       e.emp_name,
       e.salary
FROM Employees e
JOIN Departments d
  ON e.dept_id = d.dept_id
WHERE e.salary = (
    SELECT MAX(salary)
    FROM Employees
    WHERE dept_id = e.dept_id
);
