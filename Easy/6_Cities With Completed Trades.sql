SELECT u.city, COUNT(t.order_id) AS total_orders
FROM trades AS t 
JOIN users as U
ON t.user_id = u.user_id
WHERE t.status='Completed'
GROUP BY u.city
ORDER BY total_orders DESC
LIMIT 3;