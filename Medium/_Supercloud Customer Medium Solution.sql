SELECT c.customer_id
--,count(distinct(p.product_category))
FROM customer_contracts as c
INNER JOIN
products p
ON c.product_id = p.product_id
GROUP BY customer_id
HAVING count(distinct(p.product_category)) = 
(SELECT count(distinct(product_category))
FROM
products)