-- Validity check: impossible employment lengths
SELECT *
FROM loans
WHERE person_emp_length > 60;
