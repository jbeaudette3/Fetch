DROP TABLE `Fetch`.`receipts`;
CREATE TABLE `Fetch`.`receipts`(
	bonusPointsEarned INT
	, bonusPointsEarnedReason TEXT
	, pointsEarned INT
	, purchasedItemCount INT
	, rewardsReceiptStatus TEXT
	, totalSpent FLOAT
	, userId VARCHAR(50)
	, `_id.$oid` VARCHAR(50)
	, `createDate.$date` FLOAT
	, `dateScanned.$date` FLOAT
	, `finishDate.$date` FLOAT
	, `modifyDate.$date` FLOAT
	, `pointsAwardedDate.$date` FLOAT
	, `purchaseDate.$date` FLOAT
	, `createDate.$date2` TEXT
	, `dateScanned.$date2` TEXT
	, `finishDate.$date2` TEXT
	, `modifyDate.$date2` TEXT
	, `pointsAwardedDate.$date2` TEXT
	, `purchaseDate.$date2` TEXT
);

LOAD DATA LOCAL INFILE '/data/cleaned_receipts.tsv'
INTO TABLE receipts
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;
