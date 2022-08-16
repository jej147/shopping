CREATE TABLE IF NOT EXISTS board(
  tId int,
  tTitle varchar(50),
  userId VARCHAR(20),
  tDate DATETIME,
  tContent varchar(2048),
  tAvailable int,
  PRIMARY KEY(tId)
);

select * from board;
