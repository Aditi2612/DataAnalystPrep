-- Accuracy check: loan_percent_income outside valid range (0 to 1)
SELECT *
FROM loans
WHERE loan_percent_income > 1 OR loan_percent_income < 0;
