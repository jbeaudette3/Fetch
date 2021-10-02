DROP TABLE `Fetch`.`receipt_item`;
CREATE TABLE `Fetch`.`receipt_item`(
	recpt_item TEXT (50) NOT NULL
	, `_id.$oid` TEXT (50) NOT NULL
	, item_no INT(5) NOT NULL
	, barcode INT
	, description TEXT
	, finalPrice FLOAT
	, itemPrice FLOAT
	, needsFetchReview TEXT
	, partnerItemId INT (10)
	, preventTargetGapPoints TEXT
	, quantityPurchased TEXT
	, userFlaggedBarcode INT
	, userFlaggedNewItem TEXT
	, userFlaggedPrice FLOAT
	, userFlaggedQuantity TEXT
	, needsFetchReviewReason TEXT
	, pointsNotAwardedReason TEXT
	, pointsPayerId VARCHAR(50)
	, rewardsGroup TEXT
	, rewardsProductPartnerId VARCHAR(50)
	, userFlaggedDescription TEXT
	, originalMetaBriteBarcode INT
	, originalMetaBriteDescription TEXT 
	, brandCode TEXT
	, competitorRewardsGroup TEXT
	, discountedItemPrice FLOAT
	, originalReceiptItemText TEXT
	, itemNumber INT
	, originalMetaBriteQuantityPurchased INT
	, pointsEarned FLOAT
	, targetPrice INT
	, competitiveProduct TEXT
	, originalFinalPrice FLOAT
	, originalMetaBriteItemPrice FLOAT
	, deleted TEXT
	, priceAfterCoupon FLOAT
	, metabriteCampaignId TEXT
);

LOAD DATA LOCAL INFILE '/data/cleaned_receipt_items.tsv'
INTO TABLE receipt_item
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;
