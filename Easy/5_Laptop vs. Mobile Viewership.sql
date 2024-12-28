SELECT 
COUNT(CASE 
WHEN device_type='laptop' THEN user_id
END) AS laptop_views,
COUNT(CASE 
WHEN device_type IN ('phone','tablet') THEN user_id
END) AS mobile_views
FROM viewership;