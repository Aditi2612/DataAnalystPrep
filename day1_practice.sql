SELECT * FROM loans WHERE loan_status="DEFAULT";

SELECT loan_grade, COUNT(loan_id) as No_of_loans
FROM loans
GROUP BY loan_grade
HAVING No_of_loans > 100;
