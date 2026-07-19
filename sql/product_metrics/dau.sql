-- Daily Active Users (DAU)
SELECT
    transaction_date,
    COUNT(DISTINCT user_id) AS dau
FROM fact_transactions
GROUP BY transaction_date
ORDER BY transaction_date;

'''
 transaction_date | dau 
------------------+-----
 2024-01-01       | 351
 2024-01-02       | 380
 2024-01-03       | 371
 2024-01-04       | 343
 2024-01-05       | 348
 '''
 