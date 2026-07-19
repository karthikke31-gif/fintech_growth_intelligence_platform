-- successful_transaction_value

SELECT
    SUM(amount) AS revenue
FROM fact_transactions
WHERE transaction_status = 'Success';

-- 688,871,747.68 -successful Transactions

-- Revenue

SELECT
    ROUND(
        SUM(amount) * 0.02
    ,2) AS revenue
FROM fact_transactions
WHERE transaction_status='Success';

-- 13,777,434.95 is Revenue (2% Commission)
