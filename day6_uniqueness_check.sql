-- Uniqueness check: find duplicate loan_ids
SELECT loan_id, COUNT(*) AS cnt
FROM loans
GROUP BY loan_id
HAVING cnt > 1;
