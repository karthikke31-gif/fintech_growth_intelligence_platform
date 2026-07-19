-- Monthly Active Users (MAU)
SELECT
    DATE_TRUNC('month', transaction_date) AS month,
    COUNT(DISTINCT user_id) AS mau
FROM fact_transactions
GROUP BY 1
ORDER BY 1;


