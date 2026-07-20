SELECT
    loan_grade,
    loan_amnt,
    SUM(loan_amnt) OVER (PARTITION BY loan_grade ORDER BY loan_amnt DESC) AS running_total
FROM loans;
