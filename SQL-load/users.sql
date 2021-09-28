SET GLOBAL local_infile=1;

DROP TABLE `Fetch`.`users`;
CREATE TABLE `Fetch`.`users` (
	i INT NOT NULL
	, active VARCHAR(10)
	, role VARCHAR(50)
	, signUpSource VARCHAR(50)
	, state VARCHAR(5)
	, _id VARCHAR(50) NOT NULL
	, createDate FLOAT
	, lastLoginDate FLOAT
	, lastLogin FLOAT
	, PRIMARY KEY (i)
);

LOAD DATA LOCAL INFILE '/data/cleaned_users.csv'
INTO TABLE users
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES;
