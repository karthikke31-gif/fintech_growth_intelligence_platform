SELECT
    MIN(signup_date),
    MAX(signup_date)
FROM dim_users;

'''
    min     |    max     
------------+------------
 2024-01-01 | 2025-12-30
 '''

 SELECT
    MIN(transaction_date),
    MAX(transaction_date)
FROM fact_transactions;

'''
   min     |    max     
------------+------------
 2024-01-01 | 2025-12-30
 '''

 