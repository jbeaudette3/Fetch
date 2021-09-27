DROP TABLE `Fetch`.`receipts`;
CREATE TABLE `Fetch`.`receipts`(
	i INT NOT NULL
	, bonusPointsEarned INT
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
        , `createDate.$date2` FLOAT
        , `dateScanned.$date2` FLOAT
	, `finishDate.$date2` FLOAT
	, `modifyDate.$date2` FLOAT
	, `pointsAwardedDate.$date2` FLOAT
	, `purchaseDate.$date2` FLOAT
	, PRIMARY KEY(i)
);

LOAD DATA LOCAL INFILE '/data/cleaned_receipts.tsv'
INTO TABLE receipts
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;
