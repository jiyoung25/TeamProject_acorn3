CREATE TABLE space_users(
   code NUMBER NOT NULL,
   users_num NUMBER NOT NULL,
   id VARCHAR2(100) PRIMARY KEY,
   pwd VARCHAR2(100) NOT NULL,
   email VARCHAR2(100),
   profile VARCHAR2(100),
   regdate DATE
);

CREATE TABLE chatbot(
    num NUMBER PRIMARY KEY,
    category VARCHAR2(100) NOT NULL,
    question VARCHAR2(500) NOT NULL,
    answer VARCHAR2(500) NOT NULL
)

CREATE SEQUENCE chatbot_seq
-- sample data
-- INSERT INTO CHATBOT
-- (num, category, question, answer)
-- VALUES(chatbot_seq.NEXTVAL, '예약', '예약은 어떻게 하나요?', '이렇게 예약하시면 됩니다.')
-- VALUES(chatbot_seq.NEXTVAL, '예약', '일정을 변경하고 싶어요.', '판매자와 상의하세요.')
-- VALUES(chatbot_seq.NEXTVAL, '예약', '예약했는데 확정이 안나요..', '판매자에게 연락하세요.')

CREATE TABLE space_category(
cate_name VARCHAR2(100) NOT NULL,
cate_num NUMBER PRIMARY KEY
)

CREATE SEQUENCE space_category_seq
