-- Cohort Retention Query

SELECT
    DATE_TRUNC('month', signup_date) AS signup_month,
    COUNT(*) AS users
FROM dim_users
GROUP BY 1
ORDER BY 1;

'''
### User Signups by Month

#### Key Insights
- User acquisition remained stable throughout the year, with monthly signups ranging between ~985 and ~1,086 users.
- January recorded the highest number of signups (1,086), while February had the lowest (985).
- The consistent signup trend indicates steady user growth without significant seasonal fluctuations.

#### Business Takeaway
A stable flow of new users suggests that acquisition channels are performing consistently. Further analysis can identify which channels contribute most to user growth and optimization opportunities.
'''

-- Monthly Retention 

WITH user_cohorts AS (
    SELECT
        user_id,
        DATE_TRUNC('month', signup_date) AS cohort_month
    FROM dim_users
),

user_activity AS (
    SELECT DISTINCT
        user_id,
        DATE_TRUNC('month', transaction_date) AS activity_month
    FROM fact_transactions
)

SELECT
    uc.cohort_month,
    ua.activity_month,
    COUNT(DISTINCT uc.user_id) AS active_users
FROM user_cohorts uc
JOIN user_activity ua
    ON uc.user_id = ua.user_id
GROUP BY 1,2
ORDER BY 1,2;
'''
 ### Cohort Retention Analysis

#### Key Insights
- The January 2024 cohort started with **376 active users** in the signup month.
- User activity remained relatively stable across subsequent months, with **339–375 active users** returning each month.
- The small decline in active users over time suggests strong retention and continued engagement among existing users.

#### Business Takeaway
The platform demonstrates healthy user retention, indicating that users continue to transact after onboarding. Tracking cohort behavior helps identify whether newer cohorts retain users as effectively as older ones and highlights opportunities to improve long-term engagement.

#### Why This Matters
- Measures how well the platform retains users over time.
- Helps evaluate product stickiness and customer loyalty.
- Identifies cohorts with higher or lower engagement for targeted retention strategies.
'''