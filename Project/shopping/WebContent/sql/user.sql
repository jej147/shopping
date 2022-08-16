CREATE TABLE IF NOT EXISTS user(
   userId VARCHAR(20) NOT NULL PRIMARY KEY,
   userPassword  VARCHAR(20) NOT NULL,
   userName VARCHAR(20) NOT NULL,
   userPhone1 char(3) NOT NULL,
   userPhone2 char(8) NOT NULL
);

select * from user;


