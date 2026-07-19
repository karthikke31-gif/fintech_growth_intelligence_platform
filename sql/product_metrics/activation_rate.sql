-- Activation Rate 
SELECT
ROUND(
    100.0 *
    COUNT(CASE WHEN kyc_status='Completed' THEN 1 END)
    /
    COUNT(*)
,2) AS activation_rate
FROM dim_users;

-- Activation Rate percentage is 84.94%
