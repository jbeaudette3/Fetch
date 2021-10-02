SET GLOBAL local_infile=1;

DROP TABLE `Fetch`.`users`;
CREATE TABLE `Fetch`.`users` (
	active VARCHAR(10)
	, role VARCHAR(50)
	, signUpSource VARCHAR(50)
	, state VARCHAR(5)
	, `_id.$oid` VARCHAR(50) NOT NULL
	, `createDate.$date` FLOAT
	, `lastLoginDate.$date` FLOAT
	, `createDate2.$date` TEXT
	, `lastLoginDate2.$date` TEXT
);

LOAD DATA LOCAL INFILE '/data/cleaned_users.tsv'
INTO TABLE users
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;
