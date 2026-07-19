WITH latest_transaction AS (
    SELECT
        user_id,
        MAX(transaction_date) AS last_transaction_date
    FROM fact_transactions
    GROUP BY user_id
)

SELECT
    user_id,
    last_transaction_date,
    CASE
        WHEN last_transaction_date < DATE '2025-10-01'
        THEN 1
        ELSE 0
    END AS churn_flag
FROM latest_transaction;

-- churn distribution query
WITH latest_transaction AS (
    SELECT
        user_id,
        MAX(transaction_date) AS last_transaction_date
    FROM fact_transactions
    GROUP BY user_id
)

SELECT
    churn_flag,
    COUNT(*) AS users
FROM (
    SELECT
        user_id,
        CASE
            WHEN last_transaction_date < DATE '2025-10-01'
            THEN 1
            ELSE 0
        END AS churn_flag
    FROM latest_transaction
) t
GROUP BY churn_flag
ORDER BY churn_flag;