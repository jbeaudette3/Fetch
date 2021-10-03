-- top 5 brands for receipts scanned for most recent month

-- most recent month
SET @mostRecentDate = 
(        	
SELECT FROM_UNIXTIME(`dateScanned.$date`/1000, '%Y-%c-%d') AS date_scanned
FROM receipts
ORDER BY date_scanned DESC
LIMIT 1
);

-- previous month
SET @1MonthPrevious = (SELECT @mostRecentDate - INTERVAL 1 MONTH);

-- get ids scanned from most recent month
WITH idTable AS
(
SELECT `_id.$oid` FROM receipts
WHERE FROM_UNIXTIME(`dateScanned.$date`/1000, '%c') >= EXTRACT(MONTH FROM @mostRecentDate)
)

-- get unique rewards group and count them if their id matches timeframe
SELECT
	DISTINCT(rewardsGroup)
	, COUNT(rewardsGroup) AS count
FROM receipt_item
WHERE `_id.$oid` IN (SELECT `_id.$oid` FROM idTable)
	AND rewardsGroup != ' '
GROUP BY rewardsGroup
ORDER BY count DESC
LIMIT 5;
