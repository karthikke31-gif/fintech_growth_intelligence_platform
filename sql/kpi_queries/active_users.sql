-- Active Users

SELECT
    COUNT(DISTINCT user_id) AS active_users
FROM fact_transactions;
--   25,000 are the Active user 