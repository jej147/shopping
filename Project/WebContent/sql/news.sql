CREATE TABLE IF NOT EXISTS news(
  nId int,
  nTitle varchar(50),
  userId VARCHAR(20),
  nDate DATETIME,
  nContent varchar(2048),
  nAvailable int,
  PRIMARY KEY(nId)
);
select * from news;