-- Funnel analysis
SELECT
    event_name,
    COUNT(DISTINCT user_id) AS users
FROM fact_events
GROUP BY event_name
ORDER BY users DESC;
'''
    event_name     | users 
-------------------+-------
 signup            | 18506
 app_open          | 18465
 payment_completed | 18434
 kyc_started       | 18411
 payment_started   | 18392

'''



