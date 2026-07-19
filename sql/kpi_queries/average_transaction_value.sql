-- Average Transaction Value

SELECT
    ROUND(
        AVG(amount)
    ,2) AS average_transaction_value
FROM fact_transactions;

-- ATU is   2997.28
