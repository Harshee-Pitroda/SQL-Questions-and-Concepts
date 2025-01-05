WITH reference_table AS (
SELECT *,
MIN(issue_month) OVER(
PARTITION BY card_name,issue_year
) AS min_month,
MIN(issue_year) OVER(
PARTITION BY card_name
) AS min_issue_year
FROM monthly_cards_issued
)

SELECT card_name,issued_amount
FROM reference_table
WHERE issue_month = min_month AND issue_year = min_issue_year
ORDER BY issued_amount DESC