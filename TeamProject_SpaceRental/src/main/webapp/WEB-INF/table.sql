CREATE TABLE space_users(
   code NUMBER NOT NULL,
   users_num NUMBER NOT NULL,
   id VARCHAR2(100) PRIMARY KEY,
   pwd VARCHAR2(100) NOT NULL,
   email VARCHAR2(100) NOT NULL,
   profile VARCHAR2(100),
   regdate DATE
);

CREATE TABLE reserv_list(
    users_num NUMBER PRIMARY KEY,
    space_num NUMBER NOT NULL,
    seller_num NOT NULL,
    reserv_num NUMBER NOT NULL,
    reserv_date VARHAR2(100) NOT NULL
);

CREATE TABLE dibson_list(
    user_num NUMBER PRIMARY KEY,
    dibson_num NUMBER NOT NULL,
    space_num NUMBER NOT NULL
);

CREATE TABLE review(
    review_num NUMBER PRIMARY KEY,
    users_num NUMBER PRIMARY KEY,
    space_num NUMBER NOT NULL,
    review_title NOT NULL,
    review_content NOT NULL,
    review_rating NOT NULL
);

CREATE TABLE qna(
    qna_num NUMBER PRIMARY KEY,
    users_num NUMBER PRIMARY KEY,
    space_num NUMBER NOT NULL,
    qna_title VARCHAR2(100) NOT NULL,
    qna_content VARCHAR2(100) NOT NULL
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
);

CREATE SEQUENCE space_category_seq

CREATE TABLE seller_space(
    space_num NUMBER PRIMARY KEY, --번호
    space_name VARCHAR2(50) NOT NULL, --공간이름
    users_num NUMBER,
    oneliner VARCHAR2(60) NOT NULL, --한줄소개
    intro VARCHAR2(1000) NOT NULL, --소개
    mainImagePath VARCHAR2(100) NOT NULL, --대표이미지 경로
    addr VARCHAR2(50) --주소
);

CREATE TABLE review_comment(
    review_num NUMBER NOT NULL,
    users_num NUMBER NOT NULL,
    space_num NUMBER NOT NULL,
    review_comment VARCHAR2(200) NOT NULL
);

CREATE TABLE qna_comment(
    qna_num NUMBER NOT NULL,
    users_num NUMBER NOT NULL,
    space_num NUMBER NOT NULL,
    qna_comment VARCHAR2(200) NOT NULL
);
