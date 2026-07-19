-- Inspect Experiment Data
SELECT
    variant,
    COUNT(*) AS users,
    SUM(conversion_flag) AS conversions,
    ROUND(
        100.0 * SUM(conversion_flag) / COUNT(*),
        2
    ) AS conversion_rate
FROM fact_experiments
GROUP BY variant;

### A/B Test Conversion Analysis

#### Key Insights
- The **Control group** had 12,537 users and achieved a **10.06% conversion rate**.
- The **Treatment group** had 12,463 users and achieved a **9.85% conversion rate**.
- The experiment groups are well-balanced in size, making the comparison reliable.

# Step1 : Calculate Lift

WITH ab_results AS (
    SELECT
        variant,
        COUNT(*) AS users,
        SUM(conversion_flag) AS conversions,
        100.0 * SUM(conversion_flag) / COUNT(*) AS conversion_rate
    FROM fact_experiments
    GROUP BY variant
)

SELECT
ROUND(
(
    MAX(CASE WHEN variant='Treatment' THEN conversion_rate END)
    -
    MAX(CASE WHEN variant='Control' THEN conversion_rate END)
)
/
MAX(CASE WHEN variant='Control' THEN conversion_rate END)
*100
,2) AS lift_percentage
FROM ab_results;

'''
Treatment performed worse than Control.
The new feature reduced conversion by ~2%.
'''