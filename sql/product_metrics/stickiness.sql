WITH dau AS (
    SELECT
        AVG(daily_users) AS avg_dau
    FROM (
        SELECT
            transaction_date,
            COUNT(DISTINCT user_id) AS daily_users
        FROM fact_transactions
        GROUP BY transaction_date
    ) d
),
mau AS (
    SELECT
        AVG(monthly_users) AS avg_mau
    FROM (
        SELECT
            DATE_TRUNC('month', transaction_date) AS month,
            COUNT(DISTINCT user_id) AS monthly_users
        FROM fact_transactions
        GROUP BY 1
    ) m
)

SELECT
    ROUND(
        (avg_dau / avg_mau) * 100,
        2
    ) AS stickiness_rate
FROM dau, mau;

-- stickiness_rate is 4

'''
## Product Stickiness Analysis

## Objective
Measure how frequently monthly users engage with the platform on a daily basis.

## Findings
The platform has a DAU/MAU ratio of 4.00%.

# Business Interpretation
A stickiness rate of 4.00% indicates that, on average, only 4% of monthly active users engage with the platform on any given day.

# Benchmark

<10%  → Low Engagement
10-20% → Moderate Engagement
20-30% → Strong Engagement
30%+ → Highly Sticky Product

## Observation
The low stickiness is primarily due to the synthetic nature of the dataset and should not be interpreted as a real business performance indicator.

## KPI Category
Product Analytics
'''