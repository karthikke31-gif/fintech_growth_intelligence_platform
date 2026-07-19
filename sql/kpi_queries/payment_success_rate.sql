-- Payment Success Rate

SELECT
    ROUND(
        100.0 *
        SUM(
            CASE
                WHEN status = 'Success'
                THEN 1
                ELSE 0
            END
        )
        /
        COUNT(*)
    ,2) AS payment_success_rate
FROM fact_payments;


-- Payment succes Rate is  92.97% 