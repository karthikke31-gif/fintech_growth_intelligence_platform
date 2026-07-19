-- ARPU (Average Revenue Per User).
SELECT
    ROUND(
        SUM(amount)
        /
        COUNT(DISTINCT user_id)
    ,2) AS arpu
FROM fact_transactions
WHERE transaction_status='Success';

 -- ARPU is 27,554.87