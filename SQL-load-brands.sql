DROP TABLE `Fetch`.`brands`;
CREATE TABLE `Fetch`.`brands`(
	i INT NOT NULL
	, barcode INT
	, category VARCHAR(50)
	, categoryCode VARCHAR(50)
	, name VARCHAR(50)
	, topBrand INT
	, brandCode VARCHAR(50)
	, _id VARCHAR(50)
	, `cpg.id` VARCHAR(50)
	, `cpg.ref` VARCHAR(10)
	, PRIMARY KEY (i)
);

LOAD DATA LOCAL INFILE '/data/cleaned_brands.csv'
INTO TABLE brands
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES;
