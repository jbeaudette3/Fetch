-- Average spend and total items purchased
-- Rewards accepted ('FINISHED') or rejected ('REJECTED')

SELECT
	rewardsReceiptStatus
	, ROUND(AVG(totalSpent),2) AS AvgSpend
	, SUM(purchasedItemCount) AS totalItemsPurchased
FROM
	receipts
WHERE
	rewardsReceiptStatus = 'FINISHED'
	OR rewardsReceiptStatus = 'REJECTED'
GROUP BY
	rewardsReceiptStatus
ORDER BY
	AvgSpend DESC;
