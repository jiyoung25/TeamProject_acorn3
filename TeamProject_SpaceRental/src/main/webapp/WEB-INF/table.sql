CREATE TABLE space_users(
   code NUMBER NOT NULL, -- 회원 코드 관리자/판매자/구매자
   users_num NUMBER NOT NULL, -- 회원 번호
   id VARCHAR2(100) PRIMARY KEY, -- 회원 아이디
   pwd VARCHAR2(100) NOT NULL, -- 회원 비밀번호
   email VARCHAR2(100) NOT NULL, -- 회원 이메일
   profile VARCHAR2(100), -- 회원 프로필 이미지 경로
   regdate DATE -- 가입일
);

CREATE SEQUENCE space_users_seq

CREATE TABLE reserv_list(
    reserv_num NUMBER PRIMARY KEY, -- 예약 번호
    users_num NUMBER NOT NULL, -- 예약자(구매자) 번호
    users_id VARCHAR2(100) NOT NULL, -- 예약자(구매자) 아이디
    space_num NUMBER NOT NULL, -- 공간 글 번호
    reserv_date VARHAR2(100) NOT NULL -- 예약 날짜와 시간
);

CREATE TABLE dibson_list(
    dibson_num NUMBER PRIMARY KEY, -- 찜 번호
    users_num NUMBER NOT NULL, -- 찜한 회원 (구매자) 번호
    users_id VARCHAR2(100) NOT NULL, -- 찜한 회원(구매자) 아이디
    space_num NUMBER NOT NULL, -- 찜한 공간 번호
    dib_regdate DATE
);

CREATE TABLE review(
    review_num NUMBER PRIMARY KEY, -- 리뷰 번호
    users_num NUMBER NOT NULL, -- 리뷰글 올린 회원(구매자) 번호
    space_num NUMBER NOT NULL, -- 리뷰 공간(상품) 번호
    review_writer VARCHAR2(100) NOT NULL, -- 리뷰 작성자
    review_title VARCHAR2(100) NOT NULL, -- 리뷰 제목
    review_content VARCHAR2(1000) NOT NULL, -- 리뷰 내용
    review_regdate DATE NOT NULL, -- 리뷰 작성일
    -- review_rating, -- 리뷰 평가는 나중에 여유될 때 할 것
    viewcount NUMBER -- 리뷰 조회수
);

CREATE TABLE qna(
   num NUMBER PRIMARY KEY,
   users_num NUMBER,
   space_num NUMBER,
   writer VARCHAR2(100),
   title VARCHAR2(100),
   content VARCHAR2(1000),
   viewcount NUMBER,
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
);

CREATE SEQUENCE space_category_seq

CREATE TABLE seller_space(
    space_num NUMBER PRIMARY KEY, --번호
    space_name VARCHAR2(50) NOT NULL, --공간이름
    users_num NUMBER, --판매자 번호
    oneliner VARCHAR2(60) NOT NULL, --한줄소개
    intro VARCHAR2(1000) NOT NULL, --소개
    mainImagePath VARCHAR2(100) NOT NULL, --대표이미지 경로
    addr VARCHAR2(50), --주소
    cate_name VARCHAR2(100) NOT NULL --카테고리 이름
);

CREATE SEQUENCE seller_space_seq

CREATE TABLE review_comment(
    review_num NUMBER NOT NULL, --리뷰 번호
    users_num NUMBER NOT NULL, --리뷰 등록한 사람 번호
    space_num NUMBER NOT NULL,  --공간 글 번호
    review_comment VARCHAR2(200) NOT NULL,  --리뷰 답변
    review_regdate VARCHAR2(100) NOT NULL -- 리뷰 답변 등록일
);

CREATE TABLE qna_comment(
    num NUMBER PRIMARY KEY, --댓글의 글번호
    writer VARCHAR2(100), --댓글 작성자의 아이디
    content VARCHAR2(500), --댓글 내용
    target_id VARCHAR2(100), --댓글의 대상자 아이디
    ref_group NUMBER,
    comment_group NUMBER,
    deleted CHAR(3) DEFAULT 'no',
    regdate DATE
);
CREATE SEQUENCE qnacomment_seq;


CREATE TABLE space_users(
   code NUMBER NOT NULL, -- 회원 코드 관리자/판매자/구매자
   users_num NUMBER NOT NULL, -- 회원 번호
   id VARCHAR2(100) PRIMARY KEY, -- 회원 아이디
   pwd VARCHAR2(100) NOT NULL, -- 회원 비밀번호
   email VARCHAR2(100) NOT NULL, -- 회원 이메일
   profile VARCHAR2(100), -- 회원 프로필 이미지 경로
   regdate DATE -- 가입일
);

CREATE SEQUENCE space_users_seq

CREATE TABLE reserv_list(
    reserv_num NUMBER PRIMARY KEY, -- 예약 번호
    users_num NUMBER NOT NULL, -- 예약자(구매자) 번호
    users_id VARCHAR2 NOT NULL, -- 예약자(구매자) 아이디
    space_num NUMBER NOT NULL, -- 공간 글 번호
    reserv_date VARHAR2(100) NOT NULL -- 예약 날짜와 시간
);

CREATE TABLE dibson_list(
    dibson_num NUMBER PRIMARY KEY, -- 찜 번호
    users_num NUMBER NOT NULL, -- 찜한 회원 (구매자) 번호
    users_id VARCHAR2(100) NOT NULL, -- 찜한 회원(구매자) 아이디
    space_num NUMBER NOT NULL, -- 찜한 공간 번호
);

CREATE TABLE review(
    review_num NUMBER PRIMARY KEY, -- 리뷰 번호
    users_num NUMBER NOT NULL, -- 리뷰글 올린 회원(구매자) 번호
    space_num NUMBER NOT NULL, -- 리뷰 공간(상품) 번호
    review_writer VARCHAR2(100) NOT NULL, -- 리뷰 작성자
    review_title NOT NULL, -- 리뷰 제목
    review_content NOT NULL, -- 리뷰 내용
    review_regdate NOT NULL, -- 리뷰 작성일
    -- review_rating, -- 리뷰 평가는 나중에 여유될 때 할 것
    viewcount NUMBER -- 리뷰 조회수
);

CREATE TABLE qna(
    qna_num NUMBER PRIMARY KEY, -- qna번호
    users_num NUMBER NOT NULL, -- qna 작성자(구매자) 번호
    space_num NUMBER NOT NULL, -- 공간 글 번호
    qna_title VARCHAR2(100) NOT NULL, -- qna 제목
    qna_content VARCHAR2(100) NOT NULL, -- qna 내용
    qna_writer VARCHAR2(100) NOT NULL, -- qna 작성자 아이디
    qna_regdate DATE NOT NULL, -- 리뷰 작성일
    viewcount NUMBER -- 조회수
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
    users_num NUMBER, --판매자 번호
    oneliner VARCHAR2(60) NOT NULL, --한줄소개
    intro VARCHAR2(1000) NOT NULL, --소개
    imagePath VARCHAR2(100) NOT NULL, --대표이미지 경로
    addr VARCHAR2(50), --주소
    cate_name VARCHAR2(100) NOT NULL --카테고리 이름
);

CREATE SEQUENCE seller_space_seq

CREATE TABLE review_comment(
    review_num NUMBER NOT NULL, --리뷰 번호
    users_num NUMBER NOT NULL, --리뷰 등록한 사람 번호
    space_num NUMBER NOT NULL,  --공간 글 번호
    review_comment VARCHAR2(200) NOT NULL,  --리뷰 답변
    review_regdate VARCHAR2(100) NOT NULL -- 리뷰 답변 등록일
);

CREATE TABLE qna_comment(
    qna_num NUMBER NOT NULL,
    users_num NUMBER NOT NULL,
    space_num NUMBER NOT NULL,
    qna_comment VARCHAR2(200) NOT NULL,
    qna_regdate VARCHAR2(100) NOT NULL -- qna 답변 등록일
);

CREATE TABLE space_users(
   code NUMBER NOT NULL, -- 회원 코드 관리자/판매자/구매자
   users_num NUMBER NOT NULL, -- 회원 번호
   id VARCHAR2(100) PRIMARY KEY, -- 회원 아이디
   pwd VARCHAR2(100) NOT NULL, -- 회원 비밀번호
   email VARCHAR2(100) NOT NULL, -- 회원 이메일
   profile VARCHAR2(100), -- 회원 프로필 이미지 경로
   regdate DATE -- 가입일
);

CREATE SEQUENCE space_users_seq

CREATE TABLE reservationform(
    reserv_num NUMBER PRIMARY KEY, -- 예약 번호
    users_id VARCHAR2(100) NOT NULL, -- 예약자(구매자) 아이디
    space_num NUMBER NOT NULL, -- 공간 글 번호
    reserv_date VARCHAR2(100) NOT NULL, -- 예약 날짜와 시간 --DATE타입 아닌 것 주의하기
    reserv_time VARCHAR2(50) NOT NULL,
    reserv_comment VARCHAR2(500), --예약시 판매자에게 남길 말 (요청사항)
    reserv_count NUMBER NOT NULL, --예약하는 사람 수
    totalMoney NUMBER NOT NULL, -- 총 액수
    reserv_reg DATE NOT NULL -- 예약 신청일
);
CREATE SEQUENCE reservationform_seq

CREATE TABLE dibson_list(
    dibson_num NUMBER PRIMARY KEY, -- 찜 번호
    users_num NUMBER NOT NULL, -- 찜한 회원 (구매자) 번호
    users_id VARCHAR2(100) NOT NULL, -- 찜한 회원(구매자) 아이디
    space_num NUMBER NOT NULL, -- 찜한 공간 번호
    dib_regdate DATE
);

CREATE TABLE review(
    review_num NUMBER PRIMARY KEY, -- 리뷰 번호
    users_num NUMBER NOT NULL, -- 리뷰글 올린 회원(구매자) 번호
    space_num NUMBER NOT NULL, -- 리뷰 공간(상품) 번호
    review_writer VARCHAR2(100) NOT NULL, -- 리뷰 작성자
    review_title VARCHAR2(100) NOT NULL, -- 리뷰 제목
    review_content VARCHAR2(1000) NOT NULL, -- 리뷰 내용
    review_regdate DATE NOT NULL, -- 리뷰 작성일
    -- review_rating, -- 리뷰 평가는 나중에 여유될 때 할 것
    viewcount NUMBER -- 리뷰 조회수
);

CREATE TABLE qna(
   num NUMBER PRIMARY KEY,
   users_num NUMBER,
   space_num NUMBER,
   writer VARCHAR2(100),
   title VARCHAR2(100),
   content VARCHAR2(1000),
   viewcount NUMBER,
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
);

CREATE SEQUENCE space_category_seq

CREATE TABLE seller_space(
    space_num NUMBER PRIMARY KEY, --번호
    space_name VARCHAR2(50) NOT NULL, --공간이름
    users_num NUMBER, --판매자 번호
    oneliner VARCHAR2(60) NOT NULL, --한줄소개
    intro VARCHAR2(1000) NOT NULL, --소개

CREATE TABLE space_users(
   code NUMBER NOT NULL, -- 회원 코드 관리자/판매자/구매자
   users_num NUMBER NOT NULL, -- 회원 번호
   id VARCHAR2(100) PRIMARY KEY, -- 회원 아이디
   pwd VARCHAR2(100) NOT NULL, -- 회원 비밀번호
   email VARCHAR2(100) NOT NULL, -- 회원 이메일
   profile VARCHAR2(100), -- 회원 프로필 이미지 경로
   regdate DATE -- 가입일
);

CREATE SEQUENCE space_users_seq

CREATE TABLE reserv_list(
    reserv_num NUMBER PRIMARY KEY, -- 예약 번호
    users_num NUMBER NOT NULL, -- 예약자(구매자) 번호
    users_id VARCHAR2 NOT NULL, -- 예약자(구매자) 아이디
    space_num NUMBER NOT NULL, -- 공간 글 번호
    reserv_date VARHAR2(100) NOT NULL -- 예약 날짜와 시간
);

CREATE TABLE dibson_list(
    dibson_num NUMBER PRIMARY KEY, -- 찜 번호
    users_num NUMBER NOT NULL, -- 찜한 회원 (구매자) 번호
    users_id VARCHAR2(100) NOT NULL, -- 찜한 회원(구매자) 아이디
    space_num NUMBER NOT NULL, -- 찜한 공간 번호
);

CREATE TABLE review(
    review_num NUMBER PRIMARY KEY, -- 리뷰 번호
    users_num NUMBER NOT NULL, -- 리뷰글 올린 회원(구매자) 번호
    space_num NUMBER NOT NULL, -- 리뷰 공간(상품) 번호
    review_writer VARCHAR2(100) NOT NULL, -- 리뷰 작성자
    review_title NOT NULL, -- 리뷰 제목
    review_content NOT NULL, -- 리뷰 내용
    review_regdate NOT NULL, -- 리뷰 작성일
    -- review_rating, -- 리뷰 평가는 나중에 여유될 때 할 것
    viewcount NUMBER -- 리뷰 조회수
);

CREATE TABLE qna(
    qna_num NUMBER PRIMARY KEY, -- qna번호
    users_num NUMBER NOT NULL, -- qna 작성자(구매자) 번호
    space_num NUMBER NOT NULL, -- 공간 글 번호
    qna_title VARCHAR2(100) NOT NULL, -- qna 제목
    qna_content VARCHAR2(100) NOT NULL, -- qna 내용
    qna_writer VARCHAR2(100) NOT NULL, -- qna 작성자 아이디
    qna_regdate NOT NULL, -- 리뷰 작성일
    viewcount NUMBER -- 조회수
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
    users_num NUMBER, --판매자 번호
    oneliner VARCHAR2(60) NOT NULL, --한줄소개
    intro VARCHAR2(1000) NOT NULL, --소개
    imagePath VARCHAR2(100) NOT NULL, --대표이미지 경로
    addr VARCHAR2(50), --주소
    cate_name VARCHAR2(100) NOT NULL --카테고리 이름
);

CREATE SEQUENCE seller_space_seq

CREATE TABLE review_comment(
    review_num NUMBER NOT NULL, --리뷰 번호
    users_num NUMBER NOT NULL, --리뷰 등록한 사람 번호
    space_num NUMBER NOT NULL,  --공간 글 번호
    review_comment VARCHAR2(200) NOT NULL,  --리뷰 답변
    review_regdate VARCHAR2(100) NOT NULL -- 리뷰 답변 등록일
);

CREATE TABLE qna_comment(
    qna_num NUMBER NOT NULL,
    users_num NUMBER NOT NULL,
    space_num NUMBER NOT NULL,
    qna_comment VARCHAR2(200) NOT NULL,
    qna_regdate VARCHAR2(100) NOT NULL -- qna 답변 등록일
);
>>>>>>> refs/remotes/origin/daheen
