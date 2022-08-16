CREATE TABLE IF NOT EXISTS product(
    num VARCHAR(10) NOT NULL,
	pId VARCHAR(20),
	pName VARCHAR(30),
	pPrice  INTEGER,
	pContent TEXT,
	pFile  VARCHAR(20),
    pAvailable int,
	PRIMARY KEY (num)
);