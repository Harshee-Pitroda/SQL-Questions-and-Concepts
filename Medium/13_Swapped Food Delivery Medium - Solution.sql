WITH  
length_of_data AS (SELECT count(order_id) as l FROM orders), 
last_record AS (SELECT MAX(order_id) as lr FROM orders)

SELECT
(CASE
WHEN (order_id) % 2 = 0 THEN order_id-1
WHEN (order_id) % 2 = 1 AND (SELECT l FROM length_of_data)%2 = 0 THEN order_id+1
WHEN (order_id) % 2 = 1 AND (SELECT l FROM length_of_data)%2 = 1 AND order_id!= (SELECT lr from last_record) THEN order_id+1
ELSE order_id
END) 
AS "corrected_order_id",item
FROM orders
ORDER BY corrected_order_id;