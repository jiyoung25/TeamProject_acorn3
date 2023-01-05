CREATE TABLE space_users(
   code NUMBER NOT NULL,
   id VARCHAR2(100) PRIMARY KEY,
   pwd VARCHAR2(100) NOT NULL,
   email VARCHAR2(100),
   profile VARCHAR2(100),
   regdate DATE
);
