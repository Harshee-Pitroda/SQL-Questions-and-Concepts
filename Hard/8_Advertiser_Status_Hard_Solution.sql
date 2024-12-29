SELECT COALESCE(a.user_id,d.user_id) AS user_id,
CASE
WHEN d.paid IS NULL THEN 'CHURN'
WHEN d.paid IS NOT NULL AND a.status IN ('NEW','EXISTING','RESURRECT') THEN 'EXISTING'
WHEN d.paid IS NOT NULL AND a.status ='CHURN' THEN 'RESURRECT'
ELSE 'NEW'
END AS new_status
FROM advertiser AS a
FULL OUTER JOIN
daily_pay as d
ON a.user_id = d.user_id
ORDER BY user_id