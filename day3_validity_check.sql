-- Validity check: find rows with impossible ages
SELECT *
FROM loans
WHERE person_age > 100;
