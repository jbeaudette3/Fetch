DROP TABLE `Fetch`.`brands`;
CREATE TABLE `Fetch`.`brands`(
	barcode INT
	, category VARCHAR(50)
	, categoryCode VARCHAR(50)
	, name VARCHAR(50)
	, topBrand INT
	, brandCode VARCHAR(50)
	, `_id.$oid` VARCHAR(50)
	, `cpg.$id.$oid` VARCHAR(50)
	, `cpg.$ref` VARCHAR(10)
);

LOAD DATA LOCAL INFILE '/data/cleaned_brands.csv'
INTO TABLE brands
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES;
