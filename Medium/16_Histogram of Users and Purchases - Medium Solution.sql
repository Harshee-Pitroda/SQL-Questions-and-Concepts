WITH rd_cte AS (SELECT *,
MAX(transaction_date) OVER (
PARTITION BY user_id
) AS most_recent_transaction_date
FROM user_transactions)

SELECT transaction_date,user_id,COUNT(product_id) AS purchase_count
FROM rd_cte
WHERE transaction_date = most_recent_transaction_date
GROUP BY user_id,transaction_date
ORDER BY transaction_date;