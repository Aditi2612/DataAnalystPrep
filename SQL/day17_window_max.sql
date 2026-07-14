SELECT
    loan_grade,
    loan_amnt,
    MAX(loan_amnt) OVER (PARTITION BY loan_grade) AS max_amnt
FROM loans;
