DROP TABLE BOOKMARK;
DROP TABLE COMMENT_TB;
DROP TABLE POST;
DROP TABLE MOIM_COMMENT;
DROP TABLE MOIM_BOARD;
DROP TABLE REVIEW;
DROP TABLE BEER;
DROP TABLE USER_TB;
DROP TABLE CATEGORY;
DROP TABLE BEER_STORY;
DROP TABLE MAIN_BOARD;
DROP TABLE GRADE;
DROP TABLE TYPE;
DROP TABLE ORIGIN;
DROP TABLE BEER_CUP;
DROP TABLE TEST_BEER;

DROP SEQUENCE BEERSQ;
DROP SEQUENCE TESTSQ;
DROP SEQUENCE CUPSQ;
DROP SEQUENCE STORYSQ;
DROP SEQUENCE REVIEWSQ;
DROP SEQUENCE MOIMSQ;
DROP SEQUENCE MMSQ;
DROP SEQUENCE MMGROUPSQ;

DROP SEQUENCE CMTFREESEQ; --자유게시판 댓글
DROP SEQUENCE CMTFREEGROUPSEQ; -- 자유게시판 댓글그룹
DROP SEQUENCE CMTNOTICESEQ; -- 공지게시판 댓글
DROP SEQUENCE CMTNOTICEGROUPSEQ; -- 공지게시판 댓글그룹

DROP SEQUENCE CMTFREESEQ;
DROP SEQUENCE NOTICESQ;
DROP SEQUENCE NOTICEGROUPSQ;
DROP SEQUENCE FREESQ;
DROP SEQUENCE FREEGROUPSQ;

CREATE SEQUENCE BEERSQ NOCACHE;
CREATE SEQUENCE TESTSQ NOCACHE;
CREATE SEQUENCE CUPSQ NOCACHE;
CREATE SEQUENCE STORYSQ NOCACHE;
CREATE SEQUENCE REVIEWSQ NOCACHE;
CREATE SEQUENCE MOIMSQ NOCACHE;
CREATE SEQUENCE MMSQ NOCACHE;
CREATE SEQUENCE MMGROUPSQ NOCACHE;

CREATE SEQUENCE CMTFREESEQ NOCACHE; --자유게시판 댓글
CREATE SEQUENCE CMTFREEGROUPSEQ NOCACHE; -- 자유게시판 댓글그룹
CREATE SEQUENCE CMTNOTICESEQ NOCACHE; -- 공지게시판 댓글
CREATE SEQUENCE CMTNOTICEGROUPSEQ NOCACHE; -- 공지게시판 댓글그룹

CREATE SEQUENCE NOTICESQ NOCACHE;
CREATE SEQUENCE NOTICEGROUPSQ NOCACHE;
CREATE SEQUENCE FREESQ NOCACHE;
CREATE SEQUENCE FREEGROUPSQ NOCACHE;

CREATE TABLE TEST_BEER(
    TEST_NO NUMBER CONSTRAINT PK_TEST_NO PRIMARY KEY,
    TEST_CONTENT VARCHAR2(500) NOT NULL,
    TEST_BEER_NAME VARCHAR2(100) NOT NULL
);

CREATE TABLE BEER_CUP(
    Q_NO NUMBER CONSTRAINT PK_Q_NO PRIMARY KEY,
    Q_CONTENT VARCHAR2(300) NOT NULL,
    Q_BEER_NAME VARCHAR2(100) NOT NULL
);

CREATE TABLE ORIGIN(
    ORIGIN_CODE VARCHAR2(20) CONSTRAINT PK_ORIGIN_CODE PRIMARY KEY,
    ORIGIN_NAME VARCHAR2(30) NOT NULL
);

CREATE TABLE TYPE(
    TYPE_CODE VARCHAR2(20) CONSTRAINT PK_TYPE_CODE PRIMARY KEY,
    TYPE_NAME VARCHAR2(60) NOT NULL
);

CREATE TABLE GRADE(
    GRADE_CODE VARCHAR2(20) CONSTRAINT PK_GRADE_CODE PRIMARY KEY,
    GRADE_NAME VARCHAR2(20) NOT NULL
);

CREATE TABLE MAIN_BOARD(
    BOARD_CODE VARCHAR2(20) CONSTRAINT PK_BOARD_CODE PRIMARY KEY,
    BOARD_NAME VARCHAR2(30) NOT NULL
);

CREATE TABLE BEER_STORY(
    STORY_NO NUMBER CONSTRAINT PK_STORY_NO PRIMARY KEY,
    STORY_NAME VARCHAR2(100) NOT NULL,
    STORY_LINK VARCHAR2(1000) NOT NULL,
    STORY_IMG VARCHAR2(1000) NOT NULL
);

CREATE TABLE CATEGORY(
    CATEGORY_CODE VARCHAR2(20) CONSTRAINT PK_CATEGORY_CODE PRIMARY KEY,
    CATEGORY_NAME VARCHAR2(20) NOT NULL
);

CREATE TABLE USER_TB(
    USER_ID VARCHAR2(20) CONSTRAINT PK_USER_ID PRIMARY KEY,
    USER_PW VARCHAR2(30) NOT NULL,
    USER_NAME VARCHAR2(20) NOT NULL,
    USER_EMAIL VARCHAR2(50),
    USER_PHONE VARCHAR2(20),
    USER_PIC BLOB,
    GRADE_CODE VARCHAR2(20),
    CONSTRAINT FK_GRADE_CODE FOREIGN KEY(GRADE_CODE) REFERENCES GRADE(GRADE_CODE) ON DELETE CASCADE
);

CREATE TABLE BEER(
    BEER_NO NUMBER CONSTRAINT PK_BEER_NO PRIMARY KEY,
    BEER_KOR_NAME VARCHAR2(500) NOT NULL,
    BEER_ENG_NAME VARCHAR2(500) NOT NULL,
    ORIGIN_CODE VARCHAR2(100),
    TYPE_CODE VARCHAR2(100),
    BEER_ABV VARCHAR2(100) NOT NULL,
    BEER_DETAIL VARCHAR2(3500) NOT NULL,
    BEER_PIC VARCHAR2(1000),
    CONSTRAINT FK_TYPE_CODE FOREIGN KEY(TYPE_CODE) REFERENCES TYPE(TYPE_CODE) ON DELETE CASCADE,
    CONSTRAINT FK_ORIGIN_CODE FOREIGN KEY(ORIGIN_CODE) REFERENCES ORIGIN(ORIGIN_CODE) ON DELETE CASCADE
);

CREATE TABLE REVIEW(
    REVIEW_NO NUMBER CONSTRAINT PK_REVIEW_NO PRIMARY KEY,
    REVIEW_CONTENT VARCHAR2(2000) NOT NULL,
    REVIEW_DATE DATE NOT NULL,
    REVIEW_STAR NUMBER NOT NULL,
    USER_ID VARCHAR2(20),
    BEER_NO NUMBER,
    CONSTRAINT FK_REVIEW_USER_ID FOREIGN KEY(USER_ID) REFERENCES USER_TB(USER_ID) ON DELETE CASCADE,
    CONSTRAINT FK_REVIEW_BEER_NO FOREIGN KEY(BEER_NO) REFERENCES BEER(BEER_NO) ON DELETE CASCADE
);

CREATE TABLE MOIM_BOARD(
    MOIM_NO NUMBER CONSTRAINT PK_MOIM_NO PRIMARY KEY,
    MOIM_TITLE VARCHAR2(100) NOT NULL,
    MOIM_CONTENT VARCHAR2(2000) NOT NULL,
    MOIM_WRITEDATE DATE NOT NULL,
    MOIM_DATE DATE NOT NULL,
    MOIM_STATUS CHAR(1) CHECK(MOIM_STATUS IN('Y','N')),
    MOIM_PLACENAME VARCHAR2(100) NOT NULL,
    MOIM_PLACEADD VARCHAR2(500) NOT NULL,
    CATEGORY_CODE VARCHAR2(20),
    USER_ID VARCHAR2(20),
    CONSTRAINT FK_MOIM_CATEGORY_CODE FOREIGN KEY(CATEGORY_CODE) REFERENCES CATEGORY(CATEGORY_CODE) ON DELETE CASCADE,
    CONSTRAINT FK_MOIM_USER_ID FOREIGN KEY(USER_ID) REFERENCES USER_TB(USER_ID) ON DELETE CASCADE
);

CREATE TABLE MOIM_COMMENT(
    MM_NO NUMBER CONSTRAINT PK_MM_NO PRIMARY KEY,
    MM_CONTENT VARCHAR2(300) NOT NULL,
    MM_DATE DATE NOT NULL,
    GROUP_NO NUMBER NOT NULL,
    GROUP_SQ NUMBER NOT NULL,
    REPLY_ID VARCHAR2(20),
    USER_ID VARCHAR2(20),
    MOIM_NO NUMBER,
    CONSTRAINT FK_MM_USER_ID FOREIGN KEY(USER_ID) REFERENCES USER_TB(USER_ID) ON DELETE CASCADE,
    CONSTRAINT FK_MM_MOIM_NO FOREIGN KEY(MOIM_NO) REFERENCES MOIM_BOARD(MOIM_NO) ON DELETE CASCADE
);

CREATE TABLE POST(
    POST_NO NUMBER,
    BOARD_CODE VARCHAR2(20),
    GROUP_NO NUMBER NOT NULL,
    GROUP_SQ NUMBER NOT NULL,
    TITLE_TAB NUMBER NOT NULL,
    POST_TITLE VARCHAR2(1000) NOT NULL,
    POST_CONTENT VARCHAR2(4000) NOT NULL,
    POST_DATE DATE NOT NULL,
    POST_VIEWS NUMBER NOT NULL,
    USER_ID VARCHAR2(20),
    CONSTRAINT PK_POST PRIMARY KEY(POST_NO, BOARD_CODE),
    CONSTRAINT FK_POST_BOARD_CODE FOREIGN KEY(BOARD_CODE) REFERENCES MAIN_BOARD(BOARD_CODE) ON DELETE CASCADE,
    CONSTRAINT FK_POST_USER_ID FOREIGN KEY(USER_ID) REFERENCES USER_TB(USER_ID) ON DELETE CASCADE
);

CREATE TABLE COMMENT_TB(
    COMMENT_NO NUMBER,
    POST_NO NUMBER,
    BOARD_CODE VARCHAR2(20),
    GROUP_NO NUMBER NOT NULL,
    GROUP_SQ NUMBER NOT NULL,
    REPLY_ID VARCHAR2(20),
    COMMENT_CONTENT VARCHAR2(300) NOT NULL,
    COMMENT_DATE DATE NOT NULL,
    USER_ID VARCHAR2(20),
    CONSTRAINT PK_COMMENT PRIMARY KEY(COMMENT_NO, POST_NO, BOARD_CODE),
    CONSTRAINT FK_COMMENT_POST FOREIGN KEY(POST_NO, BOARD_CODE) REFERENCES POST(POST_NO, BOARD_CODE) ON DELETE CASCADE,
    CONSTRAINT FK_COMMENT_USER_ID FOREIGN KEY(USER_ID) REFERENCES USER_TB(USER_ID) ON DELETE CASCADE
);

CREATE TABLE BOOKMARK(
    BEER_NO NUMBER,
    USER_ID VARCHAR2(20),
    BOOKMARK_STATUS CHAR(1) CHECK(BOOKMARK_STATUS IN('Y','N')),
    CONSTRAINT PK_BOOKMARK PRIMARY KEY(BEER_NO, USER_ID),
    CONSTRAINT FK_BOOKMARK_BEER_NO FOREIGN KEY(BEER_NO) REFERENCES BEER(BEER_NO) ON DELETE CASCADE,
    CONSTRAINT FK_BOOKMARK_USER_ID FOREIGN KEY(USER_ID) REFERENCES USER_TB(USER_ID) ON DELETE CASCADE
);

-- GRADE(등급) TABLE에 DATA INSERT
INSERT INTO GRADE
VALUES('MGR', '관리자');

INSERT INTO GRADE
VALUES('USER', '회원');

-- MAIN_BOARD(게시판) TABLE에 DATA INSERT
INSERT INTO MAIN_BOARD
VALUES('NOTICE','공지사항');

INSERT INTO MAIN_BOARD
VALUES('FREE','자유게시판');

/*
나라: 벨기에, 독일, 러시아, 미국, 중국, 인도네시아, 이탈리아, 브라질, 영국,
	덴마크, 대한민국, 태국, 멕시코, 스페인, 터키, 호주, 체코, 네덜란드,
	아일랜드, 베트남, 일본, 프랑스, 스리랑카, 캐나다, 미얀마, 에스토니아,
	필리핀, 싱가포르, 케냐, 오스트리아  (30개국)
*/

INSERT INTO ORIGIN
VALUES('BELGIUM','벨기에');
INSERT INTO ORIGIN
VALUES('GERMANY','독일');
INSERT INTO ORIGIN
VALUES('RUSSIA','러시아');
INSERT INTO ORIGIN
VALUES('AMERICA','미국');
INSERT INTO ORIGIN
VALUES('CHINA','중국');
INSERT INTO ORIGIN
VALUES('INDONESIA','인도네시아');
INSERT INTO ORIGIN
VALUES('ITALY','이탈리아');
INSERT INTO ORIGIN
VALUES('BRAZIL','브라질');
INSERT INTO ORIGIN
VALUES('ENGLAND','영국');
INSERT INTO ORIGIN
VALUES('DENMARK','덴마크');
INSERT INTO ORIGIN
VALUES('KOREA','대한민국');
INSERT INTO ORIGIN
VALUES('THAILAND','태국');
INSERT INTO ORIGIN
VALUES('MEXICO','멕시코');
INSERT INTO ORIGIN
VALUES('SPAIN','스페인');
INSERT INTO ORIGIN
VALUES('TURKEY','터키');
INSERT INTO ORIGIN
VALUES('AUSTRALIA','호주');
INSERT INTO ORIGIN
VALUES('CZECH','체코');
INSERT INTO ORIGIN
VALUES('NETHERLANDS','네덜란드');
INSERT INTO ORIGIN
VALUES('IRELAND','아일랜드');
INSERT INTO ORIGIN
VALUES('VIETNAM','베트남');
INSERT INTO ORIGIN
VALUES('JAPAN','일본');
INSERT INTO ORIGIN
VALUES('FRANCE','프랑스');
INSERT INTO ORIGIN
VALUES('SRILANKA','스리랑카');
INSERT INTO ORIGIN
VALUES('CANADA','캐나다');
INSERT INTO ORIGIN
VALUES('MYANMAR','미얀마');
INSERT INTO ORIGIN
VALUES('ESTONIA','에스토니아');
INSERT INTO ORIGIN
VALUES('PHILIPPINES','필리핀');
INSERT INTO ORIGIN
VALUES('SINGAPORE','싱가포르');
INSERT INTO ORIGIN
VALUES('KENYA','케냐');
INSERT INTO ORIGIN
VALUES('AUSTRIA','오스트리아');

----------------------------------
-- TYPE(맥주타입) TABLE에 DATA INSERT

INSERT INTO TYPE
VALUES('LAMBIC', '람빅');

INSERT INTO TYPE
VALUES('LAGER', '라거');

INSERT INTO TYPE
VALUES('DARK', '라거/다크라거');

INSERT INTO TYPE
VALUES('DUNKEL', '라거/둔켈');

INSERT INTO TYPE
VALUES('RAUCH', '라거/라우흐비어');

INSERT INTO TYPE
VALUES('MAREZEN', '라거/메르첸비어');

INSERT INTO TYPE
VALUES('LIGHT', '라거/미국식 부가물 라거/라이트 라거');

INSERT INTO TYPE
VALUES('BOCK', '라거/복');

INSERT INTO TYPE
VALUES('DOPPEL', '라거/복/도펠복');

INSERT INTO TYPE
VALUES('ICEBOCK', '라거/복/아이스복');

INSERT INTO TYPE
VALUES('SCHWARZ', '라거/슈바르츠비어');

INSERT INTO TYPE
VALUES('STEIM', '라거/슈타인비어');

INSERT INTO TYPE
VALUES('ICELAGER', '라거/아이스 라거');

INSERT INTO TYPE
VALUES('EXPORT', '라거/엑스포트');

INSERT INTO TYPE
VALUES('EMBLAGER', '라거/엠버 라거');

INSERT INTO TYPE
VALUES('ZWICKL', '라거/츠비클비어');

INSERT INTO TYPE
VALUES('PALELAGER', '라거/페일 라거');

INSERT INTO TYPE
VALUES('PILSNER', '라거/필스너');

INSERT INTO TYPE
VALUES('HELLES', '라거/헬레스 라거');

INSERT INTO TYPE
VALUES('AICOFREI', '알콜프라이에스비어');

INSERT INTO TYPE
VALUES('ALE', '에일');

INSERT INTO TYPE
VALUES('GOSEALE', '에일/고제');

INSERT INTO TYPE
VALUES('GOLDENALE', '에일/골든 에일');

INSERT INTO TYPE
VALUES('DAMP', '에일/담프 비어');

INSERT INTO TYPE
VALUES('REDALE', '에일/레드 에일');

INSERT INTO TYPE
VALUES('MILDALE', '에일/마일드 에일');

INSERT INTO TYPE
VALUES('WHEAT', '에일/밀맥주');

INSERT INTO TYPE
VALUES('GOSEWHEAT', '에일/밀맥주/고제');

INSERT INTO TYPE
VALUES('WEIZEN', '에일/밀맥주/바이젠복');

INSERT INTO TYPE
VALUES('BELWIT', '에일/밀맥주/벨기에식 밀맥주');

INSERT INTO TYPE
VALUES('CRYSTAL', '에일/밀맥주/크리스탈 밀맥주');

INSERT INTO TYPE
VALUES('BLACK', '에일/밀맥주/흑밀맥주');

INSERT INTO TYPE
VALUES('BELGIAN', '에일/벨지안 에일');

INSERT INTO TYPE
VALUES('BELWHITE', '에일/벨지안 화이트 에일');

INSERT INTO TYPE
VALUES('BROWN', '에일/브라운 에일');

INSERT INTO TYPE
VALUES('SCOTCH', '에일/스카치 에일');

INSERT INTO TYPE
VALUES('STOUT', '에일/스타우트');

INSERT INTO TYPE
VALUES('STRONG', '에일/스트롱 에일');

INSERT INTO TYPE
VALUES('AMEALE', '에일/아메리칸 페일 에일');

INSERT INTO TYPE
VALUES('ALT', '에일/알트 비어');

INSERT INTO TYPE
VALUES('KOLSCH', '에일/쾰쉬');

INSERT INTO TYPE
VALUES('PALE', '에일/페일 에일');

INSERT INTO TYPE
VALUES('PALEMIL', '에일/페일 에일/밀맥주');

INSERT INTO TYPE
VALUES('BLONDE', '에일/페일 에일/블론드 에일');

INSERT INTO TYPE
VALUES('AMBER', '에일/페일 에일/엠버 에일');

INSERT INTO TYPE
VALUES('INDIA', '에일/페일 에일/인디아 페일 에일');

INSERT INTO TYPE
VALUES('ENGLISH', '에일/페일 에일/잉글리쉬 비터');

----------------------
--beerList



--1
INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,'드리 폰테이넨',
        '3 Fonteinen', 
        'BELGIUM',
        'LAMBIC',
        '4.5',
        '향은 마치 체리 주스를 연성시킬 만큼 과일 주스 같지만 자연발효에서 느껴지는 헛간의 쿰쿰한 향도 은은하게 느껴진다. 체리 주스를 연상케 하는 맥주이며 일반 맥주를 좋아하지 않는 사람들에게 제격인 맥주이다.',
        '1. 드리 폰테이넨');

--2
INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
        '아르코브로이 바이스비어 둔켈',
        'Arcobru Weissbier Dunkel',
        'GERMANY',
        'WHEAT',
        '5.3',
        '탄산은 강하진 않고 적당한 수준으로 거슬리지 않다. 무게감은 일반적인 헤페바이젠류 보다는 있는 편이지만 약간 더 있는 수준으로 여전히 마시기 쉬운건 맞다.',
        '2. 아르코브로이 바이스비어 둔켈');

--3
INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '아르코브로이 윈터비어',
    'Arcobru Winterbier',
    'GERMANY',
    'PILSNER',
    '5.5',
    '탄산은 어느정도 포화되었다. 적당한 청량함이 있다. 임페리얼 IPA 나 복(Bock)류에 비하면 당연히 가볍지만 헬레스(Helles)라거가 어느정도의 질감과 무게감을 갖춘다고 하면 아르코브로이의 윈터비어는 그 선을 잘 지키고 있는 편이다. 무게감은 일반적인 헤페바이젠류 보다는 있는 편이지만 약간 더 있는 수준으로 여전히 마시기 쉬운건 맞다.',
    '3. 아르코브로이 윈터비어');

--4

INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '아르코브로이 츠비클비어',
    'Arcobru Zwicklbier',
    'GERMANY',
    'DOPPEL',
    '5.2',
    '비여과 맥주이니 효모에 의한 탁함이 보이며 맥주의 색상은 금색에 가깝다. 효모에서 발생한 약간의 과일 에스테르가 있지만 바이젠마냥 노골적이지 않고 어렴풋하게 나오며, 미네랄이 포함된 물에서 나오는 향기와 함께 약간의 허브와 같은 독일 홉의 향도 느껴진다.',
    '4. 아르코브로이 츠비클비어');

-- 5

INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '아크 코니',
    'Ark Cony',
    'GERMANY',
    'WHEAT',
    '4.5',
    '라인 프렌즈와 아크의 컬래버레이션 맥주. 명랑한 파티 걸 ‘코니’의 이미지를 독창적인 독일식 밀맥주로 해석했다. 풍성한 거품, 바나나 이스트의 달콤한 향기, 청량감을 매력적으로 조화시켰다. 상쾌하고 부드러운 바나나향 맥주로 입 안을 가득 채우는 달콤한 맛과 톡톡 튀는 탄산의 느낌이 한 번 마시면 잊기 힘들다.',
    '5. 아크 코니');
 
 
 --6
 
 INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '아사히 슈퍼 드라이',
    'Asahi Super Dry',
    'JAPAN',
    'PALELAGER',
    '5.0',
    '이름 그대로 드라이한 맛으로 탄산이 적으며 옥수수에서 나는 단맛이 느껴져서 부드럽게 마실수 있다. 쓴맛도 끝에 살짝 나는 수준이라 부담이 없다. 수퍼 드라이라는 이름 때문인지 다른 페일 라거 종류의 맥주보다 더욱 가볍게 느껴지는 맛 이다.',
    '6. 아사히 슈퍼 드라이');

--7
INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '아잉거 알트바이리쉬 둔켈',
    'Ayinger Altbairisch Dunkel',
    'GERMANY',
    'DUNKEL',
    '5.0',
    '터지는 타입의 탄산은 아니어서 걸리는게 없고, 맥주의 분위기자체는 차분한 인상을 주지만 전체적으로는 가볍고 연해서 여러잔 마시기 좋다. 견과류의 맛과 카라멜의 단 맛이 합쳐진 형태라땅콩카라멜 같은 맛이 과하지 않게 분포되어있고, 갈색 곡물 빵과 같은 고소함과 텁텁함도 있다.',
    '7. 아잉거 알트바이리쉬 둔켈');

--8    
INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '바쿠스 체리 비어',
    'Bacchus Cherry Beer',
    'BELGIUM',
    'LAMBIC',
    '5.8',
    '바쿠스 올드 플레미쉬 브라운에 바탕을 두고 신맛과 단맛의 완벽한 조화는 핑크색 거품 폼으로 그 정점을 찍는다.',
    '8. 바쿠스 체리 비어');

--9    
INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '발티카 5',
    'Baltika 5',
    'RUSSIA',
    'PALELAGER',
    '5.3',
    '풀, 허브, 약간의 종이 냄새들이 나며 살짝 단 곡물내 옥수수 시럽 같은 향도 난다. 단 내가 살짝 있짐나 맛 자체가 단 편은 아니고 적당한 곡물과 곡물 시럽 느낌만 있다.',
    '9. 발티카 5');
 
 --10
 
INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '벨텐부르거 클로스터 바로크 헬',
    'Barock Hell',
    'GERMANY',
    'DOPPEL',
    '5.6',
    '독일 홉의 향기인 풀, 허브, 약한 수준의 레몬에 밝은 맥아에서 발생한 흰 빵 속살, 곡물 향이 있다. 탄산기는 있지만 터진다기 보단 얌전하게 나왔고 질감이나 무게감은 가벼움과 중간의 사이이다. 그래도 마시기 편한 대중 라거의 포지션은 유지해서 사시사철 마시기에 무리없는 특징이다.',
    '10. 벨텐부르거 클로스터 바로크 헬');

-- 11

INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '베이스캠프 로스트 메리디안 위트',
    'Base Camp Lost Meridian Wit',
    'AMERICA',
    'BELWIT',
    '5.6',
    '밀과 오트밀의 부드러움과 윌라멧 밸리에서 재배한 메리디안 홉에서 배어나는 경쾌한 시트러스 향, 미모사 같은 신선한 캐릭터가 나타나며 끝 맛에서 오렌지 과일의 맛과 샴페인 향을 느낄 수 있다.',
    '11. 베이스캠프 로스트 메리디안 위트');
  
-- 12

INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '벡 브로이 켈러비어',
    'Beck Bru Kellerbier',
    'GERMANY',
    'PILSNER',
    '5.3',
    '탄산감은 무시해도 좋을만큼 아주 무디게 포화되었으며 김 빠진 청량음료를 마시는 마냥, 약간의 부드러운 질감과 무겁지 않은 무게감(Body)이 크리미 소다와 비슷하게 느껴진다.',
    '12. 벡 브로이 켈러비어');
  
-- 13    
INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '비어라오 다크',
    'Beerlao Dark',
    'GERMANY',
    'DARK',
    '6.5',
    '고품질의 독일산 블랙 몰트로 만들어진 맥주',
    '13. 비어라오 다크');


-- 14

INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '베를리너 킨들 필스너',
    'Berliner Pilsner',
    'GERMANY',
    'PILSNER',
    '5.1',
    '독일 맥주 순수령에 따른 정통 독일 필스너로 독일의 수도 베를린을 상징하는 메트로 폴리탄 맥주이다. 투명한 황금빛의 경쾌한 탄산감. 홉의 쌉쌀함이 청량감을 부르는 클리색 베를린스타일 필스너로 베를린 수도 정도 750주년을 기념하는 맥주이다.',
    '14. 베를리너 킨들 필스너');

-- 15    
INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '빅웨이브 골든 에일',
    'Big Wave Golden Ale',
    'AMERICA',
    'GOLDENALE',
    '4.4',
    '황금색을 띠는 산뜻한 열대 과일향과 깔끔한 느낌의 몰트 맛으로 하와이를 연상시키는 부드러운 에일 맥주이다.',
    '15. 빅웨이브 골든 에일');

-- 16    
INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '빙천 맥주',
    'Bingchuan Beer',
    'CHINA',
    'LIGHT',
    '4.0',
    '탄산이 좀 있어 입속을 따끔거리게 만들며, 홉의 향은 구수하지만 맛은 강하지 않아서 끝에 살짝 느낄 수 있는 짠듯한 신맛, 그러나 그마저도 주의깊게 음미해야만 느낄 수 있을 맛이라 여겨진다.',
    '16. 빙천 맥주');

-- 17

INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '빈땅',
    'Bir Bintang',
    'INDONESIA',
    'PILSNER',
    '4.7',
    '탄산감이 풍부해 청량한 맛이 있고 필스너 특유의 목넘김이 특징인 깔끔한 맥주이다. 기존의 필스너와 달리 강하게 쓰기 보다는 끝에만 살짝 씁쓸하다.',
    '17. 빈땅');

-- 18

INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '비라 모레티',
    'Birra Moretti',
    'ITALY',
    'PALELAGER',
    '4.6',
    '엷은 황금색. 약간의 홉 맛이 느껴지며 청량감과 가벼운 맛을 지닌 맥주로 매운 멕시코 음식이나 향이 있는 이탈리아 음식과 잘 어울린다.',
    '18. 비라 모레티');

-- 19

INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '비숍스호프 알트바터 바이스비어복',
    'Bischofshof Altvater Weissbierbock',
    'GERMANY',
    'WEIZEN',
    '7.1',
    '달콤한 바나나, 시큼함은 서양식 풍선껌의 향과 유사하며, 곡물의 고소함과 바닐라, 시럽 등의 단 향도 상당하다. 탄산이 톡 쏘는게 어울리진 않겠지만 어느정도는 있었고, 그래도 Weizenbock 이라는 스타일을 채택한만큼 질감이나 무게감은 중간과 무거움의 사이를 오간다. 적당히 끈끈하고 걸쭉하지만 마시기 불편함은 전혀 없다.',
    '19. 비숍스호프 알트바터 바이스비어복');
    
    
-- 20    
INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '블랑쉐 드 브뤼헤',
    'Blanche de Bruges',
    'BELGIUM',
    'WHEAT',
    '5.0',
    '향긋한 코리엔더(고수)의 향이 올라오고 있었고 새코함 오렌지나 요거트류의 시큼함도 엿볼 수 있었다. 이상적인 벨기에식 밀맥주에 맞게 향은 예쁘게 나왔다.',
    '20. 블랑쉐 드 브뤼헤'); 

-- 21.

INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '블루문',
    'Blue Moon',
    'AMERICA',
    'WHEAT',
    '5.4',
    '밀러쿠어스 산하 Blue Moon Brewing Co.에서 제조하는 벨기에식 밀맥주. 고수(코리앤더)와 오렌지 껍질이 첨가되어 특유의 향이 특징이다.',
    '21. 블루문');
    
-- 22.

INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '브라마',
    'Brahma',
    'BRAZIL',
    'PALELAGER',
    '4.1',
    '브라질 1등 맥주, 향은 거의 없고 홉의 쓴 맛을 강조한 맥주라기 보다 단 맛이 살짝 올라오는 맥주이다.',
    '22. 브라마'); 

-- 23.

INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '브랙스피어 비터',
    'Brakspear Bitter',
    'ENGLAND',
    'ENGLISH',
    '3.4',
    '색상은 구리색에서 호박색으로 향하는 단계였으며 살짝 탁하고 거품은 아주 깊게 드리우진 않으나 유지력이 좋다. 향은 영국 에일 효모 고유의 과일스러운 에스테르로 농익은 붉은 과일을 떠올리게 만드는 향을 가졌다. 맛의 초중반을 효모의 과일스러움이 책임지고 있다면 후반부에서는 영국 홉 특유의 투박함이 은근히 길게 남는 쓴 맛과 함께 나타난다.',
    '23. 브랙스피어 비터 '); 
    
    
-- 24

INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '브라우하우스 고슬라르 고제 둔켈',
    'Brauhaus Goslar Gose Dunkel',
    'GERMANY',
    'GOSEWHEAT',
    '4.8',
    '탄산감은 누그러진 양상으로 쏘는 느낌을 선사하지는 않았고 당(Sugar)에서 오는 질감보다는 재료에서 오는 끈적함이 있었으며 그에 따라 무게감도 다소 느껴졌지만 그러나 분명한 것은 어디까지나 마시기 편한 맥주로서의 본성은 지니고있다.',
    '24. 브라우하우스 고슬라르 고제 둔켈');
    
 -- 25.
 
INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '부르고뉴 디 플랜더스',
    'Brourgogne Des Flanderes',
    'BELGIUM',
    'REDALE',
    '5.0',
    '새콤달콤한 와인 맥주의 느낌을 가지고 있으며 브뤼헤와 역사를 같이한 에일 맥주이다',
    '25. 부르고뉴 디 플랜더스'); 
    
-- 26.

INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '버드 아이스',
    'Bud Ice',
    'AMERICA',
    'ICELAGER',
    '5.5',
    '엷은 황금색. 약간 달콤한 플레이버와 부드러운 피니시가 특징이다. 차가운 온도에서 가볍게 마실 수 있는 맥주로 쌀이 함유돼 있다.',
    '26. 버드아이스');
    
    
-- 27
INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '버드라이트',
    'Bud Light',
    'AMERICA',
    'LIGHT',
    '4.7',
    '버드와이저의 라이트 비어. 부드러운 맛과 대중적인 가볍고 엷은 맛이 특징인 미국의 대표적인 라이트 비어.',
    '27. 버드라이트'); 

-- 28.

INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '버드와이저',
    'Budweiser',
    'AMERICA',
    'PALELAGER',
    '5.0',
    '적당한 바디를 가지며, 풍미가 있고, 상쾌한 아메리칸 스타일 라거. 최상의 몰트와 프리미엄홉들을 섞어 양조된다.',
    '28. 버드와이저'); 
    
    
-- 29.

INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '캔디카이저',
    'Candy Kaiser',
    'GERMANY',
    'PILSNER',
    '5.2',
    '풍부한 감칠맛이 나는 독일 북부 스타일의 복고풍 알트비어로 토피, 플로랄향과 강한 쌉쌀함, 풍부한 몰트와 알코올의 미묘한 온기와의 결합이 냉랭한 쌀쌀함을 기분좋은 훈훈함으로 채워줄 새로운 겨울 맞춤형 맥주.',
    '29. 캔디카이저'); 
    
-- 30.

INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '카나비아',
    'Cannabia',
    'GERMANY',
    'PILSNER',
    '5.2',
    '1996년 인류 최초의 합법적인 햄프맥주로 탄생한 독일의 카나비아는 전통적인 유기양조의 제조법과 최첨단 현대기술의 합작을 통해 독특한 향과 맛을 선보이며 전세계 맥주 애호가들로부터 큰 반향을 일으켰다. ',
    '30. 카나비아');


-- 31.

INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '칼스버스',
    'Carlsberg',
    'DENMARK',
    'PILSNER',
    '5.0',
    '외관은 맑은 황금색을 띄고 있으며 향은 고소하고 달짝지근한 보리의 향과 은은한 꽃, 허브의 향이 난다. 첫 맛은 고소하고 달콤한 맥아의 맛과 오렌지류의 프루티한 맛이 난다. 쓴 맛의 여운은 약간 있는 편이며 쓴 맛의 여운이 사라지면서 단맛의 여운또한 사라지는 깔끔함을 보인다.',
    '31. 칼스버그'); 
    
-- 32.

INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '카스',
    'Cass',
    'KOREA',
    'PALELAGER',
    '4.5',
    '카스맥주는 20대의 맥주의 맛과 품질을 중요시하는 소비자들을 위한 맥주로서 깨끗한 음용감과 톡쏘는 상쾌한 맛이 살아있는 100% 비열처리 맥주이다.',
    '32. 카스'); 
    

-- 33.

INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '창',
    'Chang',
    'THAILAND',
    'PALELAGER',
    '5.0',
    '상당히 부드러운 스타일의 맥주이며, 자극적이지 않은 탄산덕에 무리없이 목 넘길 수 있다. 홉의 맛은 거의 감지할 수 없으며, 쓴 것보다는 향긋함, 상큼함, 약간의 단맛등으로 대표되는 향과 맛으로 승부를 보는 맥주이다.',
    '33. 창'); 
    

-- 34.

INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '킴제어 브라우스토프',
    'Chiemseer Braustoff',
    'GERMANY',
    'HELLES',
    '5.6',
    '향은 레몬스럽던 새콤함과 함께 허브나 풀잎스러웠던 식물의 느낌이 있다. 쓴 맛은 별로 나지 않지만 후반부로 갈 수록 살짝 거칠게 와닿는 풀과 같은 맛이 있다.',
    '34. 킴제어 브라우스토프');
    
-- 35.

INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '클라우스탈러 무알콜 맥주',
    'Clausthaler CLASSIC Alkoholfrei',
    'GERMANY',
    'AICOFREI',
    '0.0',
    '클라우스탈러는 톡쏘는 상큼한 포도주와 비슷한 향기, 맛 또한 포도주와 흡사하며 탄산도 괜찮고 호프의 맛도 느껴져 맛있고 특색있는 맥주이다.',
    '35. 클라우스탈러 무알콜 맥주');
    
-- 36.

INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '쿠어스 라이트',
    'Coors Light',
    'AMERICA',
    'LIGHT',
    '4.1',
    '엷은 황금색. 미국에서 많이 팔리는 라이트 맥주들과 맛이 그리 크게 다르지 않다. 맛이 가볍고 탄산기가 높아 시원하게 마시면 청량감이 느껴진다.',
    '36. 쿠어스 라이트'); 

-- 37.

INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '코로나',
    'Corona',
    'MEXICO',
    'PALELAGER',
    '4.5',
    '상대적으로 홉의 맛이 약하고 비릿한 맛에 호불호가 제대로 갈린다는 평이 있으며,  부가물 첨가 맥주가 다 그렇지만 코로나는 특히나 맛보단 청량감+깔끔한 목넘김으로 마시는 맥주에 가깝다.',
    '37. 코로나'); 
    
-- 38
INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '크루 리퍼블릭 드렁큰 세일러',
    'Crew Republic Drunken Sailor',
    'GERMANY',
    'INDIA',
    '6.4',
    '돛을 달고 닻을 올려 거대한 파도와 엄청난 바람에 맞서는 선원들의 삶을 표현한 맥주로 넉넉한 양의 크리스탈 맥아를 사용하여 모험적이고 파워풀한 맛을 선사한다. 디콕션이라는 전통적인 독일 양조방식을 채택하여 미국 IPA와 당당히 겨룰 수 있는 맥주를 만들었다.',
    '38. 크루 리퍼블릭 드렁큰 세일러'); 
    

-- 39
INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '크루 리퍼블릭 파운데이션 11',
    'Crew Republic Foundation 11',
    'GERMANY',
    'PALE',
    '5.6',
    '탄산은 나름 있어서 은근한 청량함이 있고, 질감이나 무게감은 가벼움과 중간 수준의 중간 즉, 라이트 바디와 미디움 바디의 경계에 있다. 탄산 덕택에 체감되는 무게감은 좀 더 가볍다.',
    '39. 크루 리퍼블릭 파운데이션 11'); 
    
 
 -- 40.
 
INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '크루 리퍼블릭 라운드하우스 킥',
    'Crew Republic Roundhouse Kick',
    'GERMANY',
    'STOUT',
    '9.2',
    '짙은 검은색을 띠며 풍부한 홉향을 느낄 수 있다. 로스팅한 커피와 다크 초콜렛의 향과 달콤한 카라멜 향도 느껴진다. 입안에서는 강하지 않은 탄산감과 부드러운 질감을 가지고 있다. 커피와 볶은 맥아의 풍미가 쌉싸름함과 함께 느껴지며 달콤한 초콜릿 맛도 느껴지는 맥주이다.',
    '40. 크루 리퍼블릭 라운드하우스 킥'); 
    
-- 41.

INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '퀴베 클라리세',
    'Cuvee Clarisse',
    'BELGIUM',
    'BELGIAN',
    '9.2',
    'ABV 9.2%의 벨지안 다크스트롱 에일. 카라멜, 탄산, 단맛, 거품 등 어느 것도 지나치치 않게 정리된 맛이다.',
    '41. 퀴베 클라리세'); 
    
    
-- 42.

INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '카스틸 꾸베 드 샤또',
    'Cuvee du Chateau Kasteel',
    'BELGIUM',
    'BELGIAN',
    '11',
    '타의 추종을 불허하는 꾸베두샤또카스틸은 카스틸맥주 중 단연 첫번째 자리를 차지한다. 꾸베는 마치 카스틸동커를 10년 간 고성의 와인창고에서 숙성시킨듯 한 고급스럽고 강력한 향과 맛을 지니고 있다.',
    '42. 카스틸 꾸베 드 샤또'); 
 
 
-- 43.

INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '디에이비 엑스포트',
    'DAB Export',
    'GERMANY',
    'EXPORT',
    '5.0',
    '밋밋하지 않고 강한 쓴맛으로 어필되는 맥주도 아니지만, 적당한 풍미와 쓴 맛을 갖추고 홉의 맛에서 고귀한 향도 풍기면서 끝 맛에서는 쓴 맛을 중화 시켜주는 듯한 상큼한 맛 또한 함유하여 물리지 않게, 누구나 즐길수 있도록 만들어진 맥주이다.',
    '43. 디에이비 엑스포트'); 
    
    
    
-- 44.

INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '담 말퀘리다',
    'Damm Malquerida',
    'SPAIN',
    'PALELAGER',
    '5.0',
    '색상은 붉고 탁한 기운이 맴돌며 라임, 오렌지 등의 새콤함과 약간 알싸하거나 매운 향이 있고 희미하게 달짝지근한 꽃, 시럽류의 단 내도 난다. 탄산기는 눈에 띌 정도는 되기에 청량하게 마시기 좋고, 질감이나 무게감도 그에 어울리게 가볍게 설계되었다.',
    '44. 담 말퀘리다'); 
    

-- 45.

INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '듀퐁봉뵈',
    'Dupont Bonu Voex',
    'BELGIUM',
    'ALE',
    '10.0',
    '1970년 처음 만들어진 듀퐁 봉 뵈는 홉향이 뛰어나며 쓴맛, 프루티함, 부드러움을 느낄 수 있는 맥주이다. 엄선한 이스트와 드라이호핑으로 복잡한 향과 풍미를 만들어 냈으며 병입후 재발효가 지속적으로 이뤄짐으로 장기간 보관후 음용시 다른 차원의 복잡함을 느낄 수 있다.',
    '45. 듀퐁봉뵈'); 
    

-- 46.

INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '듀퐁 모네트 블론드',
    'Dupont Moinette Blonde',
    'BELGIUM',
    'BELGIAN',
    '8.5',
    '구리빛 생상과 홉의 풍성한 향으로 매우 청량하고 단 맛과 쓴 맛이 조화를 이루고 있다. 병입후 재발효가 지속적으로 이뤄짐으로 장기간 보관 후 음용시 다른 차원의 복잡함을 느낄 수 있다.',
    '46. 듀퐁 모네트 블론드'); 
    
-- 47   
INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '듀벨',
    'Duvel',
    'BELGIUM',
    'STRONG',
    '8.5',
    '처음 향은 달콤한 꽃향기가나며 곧이어 씁쓸한 맛과 오랜지 향이 난다. 오렌지 껍데기를 씹는 맛이랑 비슷한 느낌이다. 도수가 도수인 만큼 꽤나 알코올향이 느껴지는 맥주이다.',
    '47. 듀벨'); 
    
-- 48    
INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '에페스',
    'Efes',
    'TURKEY',
    'PALELAGER',
    '5.0',
    '페일라거의 정석. 입안에 넣으면 강한 탄산이 먼저 느껴지며 처음부터 홉의 맛이 느껴진다. 가벼운 바디감이 홉과 대비되면서 맛을 표현해준다. 향이나 외향이 특별하진 않지만 맥주에서 기대하는 기본이 잘 지켜져 있으며 신선한 느낌을 주는 맥주이다.',
    '48. 에페스'); 
    
    
-- 49
INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '아인지들러 바이스비어',
    'Einsiedler Weissbier',
    'GERMANY',
    'WEIZEN',
    '5.2',
    '향은 정향(Clove), 바나나, 버블껌, 밀 등등의 바이젠에서는 나와야할 요소들은 다 출현한다. 조악하거나 거친 향 없이 향긋함 위주로 풍긴다. 탄산은 그리 많은 편은 아니나 탄산감은 있다. 전반적으로 맥주는 가볍고 산뜻하다는 인상이나 점성이 살짝 질기고 기름진 느낌도 있다.',
    '49. 아인지들러 바이스비어 '); 
    

-- 50.

INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '이나므 트리펠',
    'Ename Tripel',
    'BELGIUM',
    'BELGIAN',
    '8.5',
    '풀바디감의 강렬한 수도원 맥주. 병입 재발효의 과일향과 몰트, 그리고 홉의 조화로움이 인상적인 맥주. 풀바디감의 부드럽게 느껴지는 파인애플, 복숭아 등의 과일향과 허브, 몰트, 마일드 홉, 그리고 벨기에 효모의 힌트가 매우 조화로운 풍미를 가지고 있다.',
    '50. 이나므 트리펠'); 
    
  
-- 51  
INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '엥겔 복 둔켈',
    'Engel Bock Dunkel',
    'GERMANY',
    'DOPPEL',
    '7.2',
    '탄산감은 뭉개진 듯 하여 청량감을 발휘하지는 못했고 복(Bock) 답게 맥아적인 끈적한 느낌이 전달되기는하나 무지막지함이라고는 찾아 볼 수 없는 매끄럽고 부드러움이 있다. 무게감은 중간(Medium Body) 정도로 은근히 뒤로 갈수록 묽어진다.',
    '51. 엥겔 복 둔켈'); 
    

-- 52

INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '에딩거 바이스비어',
    'Erdinger Weissbier',
    'GERMANY',
    'WHEAT',
    '5.3',
    '한 모금마다 더 마시고 싶은 여운을 남긴다. 에딩거 바이스 비어는 전통적인 바바리안 양조기술에 최상급 효모를 사용하여 만들어진다.',
    '52. 에딩거 바이스비어'); 
    

-- 53.
INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '파로',
    'Faro',
    'BELGIUM',
    'LAMBIC',
    '4.5',
    '완벽하게 균형잡힌 단맛의 시럽과 새콤한 마무리.',
    '53. 파로'); 
    
-- 54.    
INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '파이어스톤 워커 더블 배럴 에일',
    'Firestone Walker Double Barrel Ale',
    'AMERICA',
    'PALE',
    '5.0',
    '솔잎 또는 송진 향 같은것이 입안에 퍼지며 상당히 풍미깊은 맛과 향을 느끌 수 있다. 카라멜 향 같은 꽃 향기도 나지만 단맛을 느낄정도로 달지는 않다.',
    '54. 파이어스톤 워커 더블 배럴 에일'); 
    

--55

INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '피츠',
    'Fitz',
    'KOREA',
    'PALELAGER',
    '4.5',
    '자체개발한 고발효 효모 ‘수퍼 이스트’를 사용해 발효도를 끌어올려 잔당을 최소화한 깔끔한 맛이 특징이다.',
    '55. 피츠'); 
    
-- 56.    
INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '포스터스',
    'Forsters',
    'AUSTRALIA',
    'PALELAGER',
    '4.9',
    '밝은 황금색에 크림과 같은 거품이 특징이다. 가벼운 맥아 향에 깨끗한 홉의 끝마이 느껴진다.',
    '56. 포스터스'); 
    
 -- 57.
 
INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '프람부아즈 람빅',
    'Framboise Lambicus',
    'BELGIUM',
    'LAMBIC',
    '4.0',
    '람빅에 산딸기 생과일을 아낌없이 넣은 과일 람빅 산딸기의 풍부한 향미가 매력적인 맥주이다',
    '57. 프람부아즈 람빅'); 
    
 
 -- 58.
 
INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '프랑켄 브로이 우어헬',
    'Franken Bru Urhell',
    'GERMANY',
    'PILSNER',
    '4.7',
    '탄산감은 헬레스(Helles) 라거라면 용인되는 적당한 청량감이며 질감은 연하고 묽기보다는 살짝 부드럽고 순한 이미지이다. 무게감은 가볍지만 안정된 편으로 무난하게 마실 수 있다.',
    '58. 프랑켄 브로이 우어헬'); 
    
-- 59
INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '프랑켄하임',
    'Frankenheim',
    'GERMANY',
    'ALT',
    '4.8',
    '향이나 구수한 맛이나 둔켈비어들과 흡사하지만 둔켈비어보다는 탄산이 더 많으며 끝맛에 느낄 수 있는 약간의 쌉싸름함과 단맛도 나는 맥주이다.',
    '59. 프랑켄하임'); 
    
-- 60.

INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '가펠 쾰쉬',
    'Gaffel Kolsch',
    'GERMANY',
    'KOLSCH',
    '4.8',
    '오직 독일 쾰른 지방에서 만든 맥주에만 붙일 수 있는 이름 쾰시 에일효모를 사용해 발효시킨 후 라거처럼 저온숙성과 필터링을 거쳐 청량하고 깔끔한 맛이 특징이다.',
    '60. 가펠 쾰쉬'); 
 
-- 61.   
INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '가펠 소넨 호펜',
    'Gaffels Sonnen Hopfen',
    'GERMANY',
    'KOLSCH',
    '4.9',
    '소넨호펜은 독일 쾰른 지방의 맥주로 유명한 가펠의 여름용 맥주로 미국 유명 와인 산지인 야키마 벨리의 시트라(Citra)홉을 첨가해 만들었다.과하지 않은 탄산, 과일향, 가벼운 목넘김이 특징이다.',
    '61. 가펠 소넨 호펜'); 
    
-- 62.
INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '감브리너스 프리미엄',
    'Gambrinus Premium',
    'CZECH',
    'PILSNER',
    '5.0',
    '고소하고 꽃이 핀 풀밭같은 홉의 느낌이 있는 가볍게 마시기 좋은 깔끔한 체코 필스너',
    '62. 감브리너스 프리미엄'); 
    
-- 63.
INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '강서 마일드 에일',
    'GangSeo Mile Ale',
    'KOREA',
    'MILDALE',
    '4.6',
    'IBU 25로 가볍게 즐길 수 있는 마일드에일로 몰트의 고소함과 오렌지, 망고등에서 느껴지는 시트러스 향이 특징이다.',
    '63. 강서 마일드 에일'); 
    
-- 64.
INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '분 괴즈 마리아주 파르페',
    'Geuze Mariage Parfait',
    'BELGIUM',
    'LAMBIC',
    '8.0',
    '가장 훌륭한 3년 숙성을 선정하여 약간의 영 람빅과 블렌딩하여 생산한다. 라임과 귤같은 과일과 부드러운 바닐라, 약간의 타르트와 상쾌한 산미와 따뜻한 입안의 느낌이 조화를 이룬다.',
    '64. 분 괴즈 마리아주 파르페'); 
    
    
-- 65.
INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '구스 아일랜드 비어',
    'Goose Island Beer',
    'AMERICA',
    'INDIA',
    '5.9',
    '진한 홉향을 느낄 수 있으며 상큼한 과일 향과 오렌지 느낌(시트러스 계열)이입에서 달콤한 맛과 함께 잘 어우러져 마시기 편한 IPA 맥주이다.',
    '65. 구스 아일랜드 비어'); 
    
    
-- 66.
INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '고든 비어쉬 블론드 복',
    'Gordon Biersch Blonde Bock',
    'GERMANY',
    'BOCK',
    '7.0',
    '전체적으로 향과 맛이 풍부하고 질감이 크리미하며 몰티한 스타일이다. Hallertau 홉의 풍부하고 진한 맛과 부드러운 질감이 균형을 이룬다. 블론드 복 맥주는 1600년대 독일 수도사들이 엄격한 단식기간을 견뎌내기 위해 만들어 마셨던 역사적인 일화로 유명하다. 닭고기와 야채를 오래 끓여 만든 수프나 각종 해산물 요리와 잘 어울린다.',
    '66. 고든 비어쉬 블론드 복'); 
    
    
-- 67.

INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '그리셋 블론드 바이오',
    'Grisette Blondebio',
    'BELGIUM',
    'PALE',
    '5.5',
    '그리셋 블론드 바이오는 가볍고 상쾌한 페일 에일이다. 병주입 후 2차발효를 하였고 다른 맥주에서 볼 수 없는 풍부한 향기가 방출된다. 헤드는 부드럽고 흰색이며 바디는 짚색깔의 노란색이다.',
    '67. 그리셋 블론드 바이오'); 
    
-- 68
INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '그롤쉬 프리미엄 라거',
    'Grolsch Premium Lager',
    'NETHERLANDS',
    'PALELAGER',
    '5.0',
    '스윙톱이라 불리는 독특한 마개가 특징. 일반적으로 4주간 숙성하는 다른 맥주와 달리 8주간 숙성해 향이 풍부하고 오랜간다. 맥아향이 강하고 씁씁할 끝맛이 적당하다.',
    '68. 그롤쉬 프리미엄 라거'); 
    
    
 -- 69
 INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '그륀바허 알트바이스 둔켈',
    'Grnbacher Altweisse Dunkel',
    'GERMANY',
    'WHEAT',
    '5.3',
    '탄산 기운은 좀 있는 편으로 따끔거림이 있고, 그 영향인지 입에 닿는 느낌은 가볍고 청량하며 확실히 쉽게 마실 수 있는 특성을 갖추었다',
    '69. 그륀바허 알트바이스 둔켈'); 

-- 70
INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '귀즈',
    'Gueuze',
    'BELGIUM',
    'LAMBIC',
    '5.0',
    '탄산 기운은 좀 있는 편으로 따끔거림이 있고, 그 영향인지 입에 닿는 느낌은 가볍고 청량하며 확실히 쉽게 마실 수 있는 특성을 갖추었다',
    '70. 귀즈'); 
    
-- 71.
INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '귀즈 꾸베르네',
    'Gueuze Cuvee Rene',
    'BELGIUM',
    'LAMBIC',
    '5.5',
    '복잡하고 미묘한 신맛과 쌉쌀함의 밸런스에 담백한 마무리.',
    '71. 귀즈 꾸베르네'); 

-- 72.
INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '기네스 드래프트',
    'Guinness Draught',
    'IRELAND',
    'STOUT',
    '4.2',
    '씁쓸하면서도 달콤 쌉싸름한 맛을 가지고 있다. 만들 때 보리를 볶아서 쓰기 때문에 색이 까맣고, 흑맥주의 특성을 잘 간직하고 있다. 거품의 질감이 마치 크림같기에 라거를 크림으로 만든 듯한 느낌에, 홉맛이 뒷맛으로 살짝 나는 것이 특징이다.',
    '72. 기네스 드래프트'); 
    
-- 73.    
INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '하켄버그 필스 라거',
    'Hackenberg Pils Lager ',
    'BELGIUM',
    'PILSNER',
    '5.0',
    '기분좋은 쓴맛과 풍부한 홉향의 필스 라거 맥주 황금빛깔과 부드러운 거품, 필스 라거 맥주의 특징인 기분 좋은 쓴맛과 풍부한 호프 향. 단맛이 적은 맥주를 선호하는 사람에게 추천할 만하다.',
    '73. 하켄버그 필스 라거');     

-- 74.

INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '하얼빈 맥주',
    'Haerbin Beer',
    'CHINA',
    'LIGHT',
    '4.3',
    '순하고 부드러운 목 넘김으로 중국의 4대 맥주 중 하나로 자리 잡은 맥주. 옥수수 분말이 함유된 것이 특징이다.',
    '74. 하얼빈 맥주'); 
    
    
-- 75.
INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '하이네켄',
    'Heineken',
    'NETHERLANDS',
    'PALELAGER',
    '5.0',
    '탄산이 많아 상쾌하고 깔끔하며 부담드럽지 않은 맛을 가지고 있다. 호프의 맛이 강하지 않고 쓴 맛이 별로 없어서 남자, 여자 할 것 없이 누구나 즐겨 마실수 있는 맛이다.',
    '75. 하이네켄'); 
    
 -- 76.   
INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '헤벌리 위트',
    'Heverlee Witte',
    'BELGIUM',
    'WHEAT',
    '4.8',
    '헤벌리 화이트는 프리몽트레 수도사들의 모토인 LIFE IN BALANCE(삶의 균형)과 같이 적정수준의 천연 향신료(오렌지 껍질, 고수, 홉)를 사용하여 향이 과히지 않고 상쾌, 상큼하면서 청량감 좋은 균형잡힌 벨기에 스타일 밀맥주',
    '76. 헤벌리 위트'); 
    
    
    INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '히타치노네스트 바이젠',
    'Hitachino Nest Weizen',
    'GERMANY',
    'WHEAT',
    '5.5',
    '독일맥주순수령에 따라 맥아, 홉, 물, 효모 만을 이용해 브류잉하고 필터링하지 않은 정통 독일식 밀맥주 헤페바이젠이다. 바이젠 특유의 효모를 사용하여 바닐라향과 정향이 풍부하고, 입 안에서 느껴지는 부드럽고 풍부한 느낌이 즐거운 맥주이다.',
    '77. 히타치노네스트 바이젠'); 
    
    
-- 78
INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '호가든 오리지널',
    'Hoegaarden Original',
    'BELGIUM',
    'WHEAT',
    '4.9',
    '오리지널 벨지안 바이젠 호가든 1445년 벨기에 호가든 지역에서 처음 양조되었고, 맥주 저장 통의 윗부분에서 효모를 발효시키는 상면발효맥주로 제조된 벨기에의 대표적인 에일 맥주이다.',
    '78. 호가든 오리지널'); 
    
    
-- 79.
INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '호가든 로제',
    'Hoegaarden Rosee',
    'BELGIUM',
    'WHEAT',
    '3.0',
    '낮은 도수와 함께 굉장히 달콤함을 느낄 수 있는 분홍빛 맥주',
    '79. 호가든 로제'); 
    
    
-- 80.
INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '호프브로이 슈바르츠 바이스',
    'Hofbru Schwarze Weisse',
    'GERMANY',
    'WEIZEN',
    '5.1',
    '무게감이나 입에 닿는 감촉 등은 가볍고 연하며 산뜻하다. 바이스비어의 전형적 특성으로 어두운 버전이라고 변한 것이 없다. 향에서 보다는 맛에서 조금 더 어두워진 색상의 효과가 나타난다. 살짝 견과류나 빵과 같은 고소함이 있었고 카라멜 맛이 슬쩍 보인다.',
    '80. 호프브로이 슈바르츠 바이스'); 
    
    
-- 81.

INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '호프예거 필스너',
    'Hofjger pilsener',
    'GERMANY',
    'PILSNER',
    '4.9',
    '필스너 라거 치고는 약간 탁한 느낌은 있지만 그래도 맑은 축에 속하며 색상은 옅은 금색이다. 독일 홉에서 나오는 은은한 허브나 꽃이 있고 구수한 곡물과 같은 향이 더 비중있다. 탄산은 생각보다는 강하지 않아 청량하지 않았고, 살짝 보드라운 질감을 가졌다고 파악했지만 그래도 마시기 편한 상태는 쭉 유지하고 있다.',
    '81. 호프예거 필스너'); 
    
    
-- 82.

INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '후다',
    'Huda',
    'VIETNAM',
    'PALELAGER',
    '4.7',
    '격조 높은 색상을 지니고 있으며, 아시아 각국의 음식과 잘 조화를 이룬다. 맛과 향기가 조화롭다.',
    '82. 후다'); 
    
    
-- 83.
INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '아이피에이 리베리스 2+3',
    'IPA Liberis 2+3',
    'GERMANY',
    'INDIA',
    '0.0',
    '리겔의 특별한 효모와 아이리시 에일 효모를 통해 풍부한 향과 보디감을 느낄 수 있으며 아마릴로, 만다리나, 심코 홉을 사용하여 더욱 프루티한 열대과일 풍미를 느낄 수 있는 무알콜 IPA',
    '83. 아이피에이 리베리스 2+3'); 
    
-- 84.
INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '제스피',
    'Jespi',
    'KOREA',
    'LAGER',
    '4.5',
    '호프의 풍부한 향과 쌉쌀한 쓴맛의 깨끗한 맥주이다.',
    '84. 제스피'); 


-- 85.

INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '카스틸 루지',
    'Kasteel Rouge',
    'BELGIUM',
    'PALE',
    '8.0',
    '카스틸루지는 카스틸 동커와 체리리큐르의 만남으로 흑 맥주를 바탕으로 뛰어난 부드러운 맛을 만들어 낸다.',
    '85. 카스틸 루지'); 
    
    
-- 86.
INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '기린 이치방',
    'Kirin Ichiban',
    'JAPAN',
    'PALELAGER',
    '5.0',
    '기린 이치방은 물, 맥아, 호프, 이스트로만 제조한 정통 페일라거 스타일로 잔에 따랐을때 매우 투명하다. 홉의 쓴맛과 달콤한 맛이 적절한 조화를 이루는 수준급 맥주이다.',
    '86. 기린 이치방'); 
    
-- 87.    
INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '클라우드',
    'Kloud',
    'KOREA',
    'PALELAGER',
    '5.0',
    '클라우드 맥주는 풍부한 거품과 맛이 가장 큰 특징으로 꼽힌다. 향은 씁쓸하면서 달콤한 향, 고소한 향이 잘 올라온다. 입안에 머금으면 처음엔 굉장히 좋은 청량감이 느껴지며, 시원한 씁쓸한 맛과 향이 코로 올라온다.',
    '87. 클라우드');
    
-- 88.
INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '크릭람빅',
    'Kriek Lambic',
    'BELGIUM',
    'LAMBIC',
    '3.0',
    '오크통에 체리 500KG을 사용해 천연의 향과 맛을 느낄 수 있는 맥주로 생과일의 특징이 가득해 과일주스를 마시는 듯한 느낌을 준다.',
    '88. 크릭람빅');
    
    
-- 89
INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '크로넨버그 1664 블랑',
    'Kronenbourg 1664 Blanc',
    'FRANCE',
    'PALEMIL',
    '5.0',
    '코리안더 씨안과 씨트러스 향, 오렌지 껍질이 함유되어 있어 독특한 맛이 난다. 병도 예쁘고, 새콤달콤한 과일향으로 가볍게 즐길 수 있어 비교적 여성들이 좋아할만한 맥주이다.',
    '89. 크로넨버그 1664 블랑');

--90.

INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '쿨름바허 아이스복',
    'Kulmbacher Eisbock',
    'GERMANY',
    'ICEBOCK',
    '9.2',
    '어두운 갈색을 띄고 있는 쿨름바허 아이스복은 맥아적인 향이 강함이 아니라 쩔어있는 수준이다. 맛에서는 맨 먼저 당밀로 표현되는 맛을 필두로 초콜릿이나 건포도, 알코올 성 맛이 등이 뒤이어 찾아온다.',
    '90. 쿨름바허 아이스복'); 
    
-- 91.
INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '라 쇼페',
    'La Chouffe',
    'BELGIUM',
    'BELGIAN',
    '8.0',
    '벨지안 블론드 에일맥주로 오렌지향이 강한 에일 맥주',
    '91. 라 쇼페');

-- 92.

INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '레이크 프런트 필스',
    'Lakefront Pils',
    'GERMANY',
    'PILSNER',
    '5.0',
    '밝은 금빛 색상. 독일 스타일의 필스너. 후추, 풀, 곡물, 벌꿀 등의 풍미와 잔잔한 마무리가 특징이다.',
    '92. 레이크 프런트 필스'); 
    
 -- 93   
INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '람빅 블랑셰',
    'Lambic Blanche',
    'BELGIUM',
    'PALE',
    '4.5',
    '세계 유일한 밀맥주 람빅으로 벨기에식 밀맥주의 풍미와 람빅 특유의 시큼함이 잘 어울리는 맥주이다. 밀이 함유된 람빅으로 타르트, 레몬필, 약간의 달콤함을 느낄 수 있다.',
    '93. 람빅 블랑셰'); 

-- 94.
INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '라오샨 맥주',
    'Laoshan Beer',
    'CHINA',
    'LIGHT',
    '4.7',
    '옅은 홉맛, 적절한 탄산과 함께 청량청량해서 목넘김 역시 좋다. 끝맛은 살짝 비린맛이 느껴지만 깔끔한편인 무난무난한 가볍게 마시기 괜찮은 맥주이다.',
    '94. 라오샨 맥주'); 

-- 95

INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '라이카임 슈타인비어',
    'Leikeim Steinbier',
    'GERMANY',
    'STEIM',
    '5.8',
    '토스트와 살짝 그을려진 카라멜스러운 향기가 지배적이다. 탄산감은 적고 입자가 터지는 등의 자극은 거의 없었으며 과하지 않은 약간의 질척이는 듯한 느낌과 가라앉은 무게감은 있지만, 특별히 도수에 지나친 느낌은 없기 때문에 무난히 마실 수 있다.',
    '95. 라이카임 슈타인비어'); 

-- 96.
INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '리오',
    'Leo',
    'THAILAND',
    'PALELAGER',
    '5.0',
    '허브나 풀 등의 상쾌한 향기가 나며 밝은 색 맥아향기인 시럽+곡물 가루 등의 향이 난다. 탄산은 톡 쏘지 않으며 적당한 청량함을 준다.',
    '96. 리오'); 

-- 97.
INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '리혀 라거',
    'Licher Lager',
    'GERMANY',
    'PILSNER',
    '4.9',
    '탄산은 많은 편은 아니다. 생각보단 덜 청량하며, 입에 닿는 느낌은 평균적인 독일 필스너보다는 조금 더 진득하고 매끄러운 질감을 가졌다. 기본적으로 샤프하거나 깔끔하게 떨어지진 않으며, 밝은 맥아 단 맛이 대체로 느껴진다.',
    '97. 리혀 라거'); 

-- 98.

INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '라이언 라거',
    'Lion  Lager',
    'SRILANKA',
    'PALELAGER',
    '4.8',
    '거품과 탄산감은 즐기기에 적합한 수준이며, 묵은만큼 진한 질감을 가지고 무게감도 있다. 시큼하면서도 고소하며 딱히 씁쓸하지 않은 맛을 가지고 있다.',
    '98. 라이언 라거'); 

-- 99.

INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '라이언 스타우트',
    'Lion Stout',
    'SRILANKA',
    'STOUT',
    '8.8',
    '초콜릿 향을 가지고 있으며 탄산은 보통 이하 수준이다. 초콜릿이나 커피와 같은 맛이 풍부했으나 그 때문에 달지는 않다. 후반으로 가면서 탄맛이 점점 올라오며 쓴맛이 없는 검은녀석들의 향연이 펼쳐진다.',
    '99. 라이언 스타우트'); 

-- 100.
INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '리틀 크리쳐스 필스너',
    'Little Creatures Pilsner',
    'GERMANY',
    'PILSNER',
    '4.5',
    '오리지널 필스너는 리틀 크래쳐스 브루어리 설립 초창기부터 판매했던 대표 맥주 중 하나다. 최근 양조 레시피를 바꾼 후 독일 북부지방 라거 맥주의 맛에 가까워졌다. 일반적으로 독일 북부지방 맥주는 남부지방 맥주에 비해 홉의 맛이 더 진하고 쌉쌀하다. 약간의 플로럴 향과 스파이시한 홉의 향기, 가볍고 깔끔하며 마셨을 때 입안이 개운해지는 쌉쌀함이 매력적이다.',
    '100. 리틀 크리쳐스 필스너'); 

-- 101.

INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '롱보드 아일랜드 라거',
    'Longboard Island Lager',
    'AMERICA',
    'PALELAGER',
    '4.6',
    '기분 좋은 청량감과 목 넘김이 좋은 깔끔한 라거 맥주로 진한 맥아 향과 함께 기분 좋은 홉향을 즐길 수 있는 맥주이다.',
    '101. 롱보드 아일랜드 라거'); 
    
  
  -- 102.  
INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '마이젤  프랜드 마르크스 초콜릿 복',
    'Maisel  Friends Marc Chocolate Bock',
    'GERMANY',
    'DOPPEL',
    '7.5',
    '탄산감이 생각보다 강한 편이어서 식도를 은근히 때리며 질감이나 무게감은 복(Bock)이라는 명찰에 걸맞게 진득함과 육중함을 갖추기는했지만 탄산감에 의해 그 특성들이 감소하는 듯한 양상으로 나타난다.',
    '102. 마이젤  프랜드 마르크스 초콜릿 복'); 
    
-- 103.
INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '마이젤  프렌즈 페일 에일',
    'Maisel  Friends Pale Ale',
    'GERMANY',
    'PALE',
    '5.2',
    '탄산은 그리 많은 편은 아니고 적당한 청량감이다. 입에 닿는 느낌은 완전 묽거나 연하지는 않는다. 약간의 시럽같은 진득함이 있지만 가볍고 편하다. 기본적으로 과일 잼과 같은 단 맛이 받쳐주는 맥주였고, 홉의 오렌지, 자몽, 솔, 송진 등의 맛이 지나가면 곡물류의 고소한 맛이 뒤에 퍼지는게 느껴진다.',
    '103. 마이젤  프렌즈 페일 에일'); 

-- 104.
INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '마우리티우스 츠비카우어 복 둔켈',
    'Mauritius Zwickauer Bock Dunkel',
    'GERMANY',
    'DUNKEL',
    '7.1',
    '탄산감은 적기 때문에 청량한 터짐을 기대할 수 없고, 질감이나 무게감은 7.1%의 복(Bock)임을 감안했을 때, 좋게 말하면 순하고 마시기 편하다. 나쁘게 표현하자면 너무 평탄하고 밋밋하다는 느낌이 든다. 중간(Medium)수준의 무게감(Body)를 갖추었다.',
    '104. 마우리티우스 츠비카우어 복 둔켈'); 

-- 105.

INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '밀러',
    'Miller',
    'AMERICA',
    'PALELAGER',
    '4.7',
    '원료에 옥수수를 첨가한 미국 전체 판매량 2위의 맥주. 자극적이거나 부담스럽지 않은 맛이 특징이다.',
    '105. 밀러'); 

-- 106.

INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '밀러 라이트',
    'Miller Light',
    'AMERICA',
    'LIGHT',
    '4.2',
    '엷은 황금색. 가볍고 달콤한 몰트 맛이 느껴지나, 과일 향이나 홉의 쓴맛은 별로 없다. 탄산기가 높은 것이 특징이며 옥수수가 함유되었다.',
    '106. 밀러 라이트'); 
    
    
-- 107
INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '뫼네트 블론드',
    'Moinette Blonde',
    'BELGIUM',
    'BELGIAN',
    '8.5',
    '4종의 스페셜 몰트의 혼합으로 밝은 다크브라운에서 적갈색사이의 특이한 색깔을 나타낸다. 홉과 스페셜 몰트의 향이 뫼네트 브륀의 지배적인 풍미를 나타낸다. 뫼네트 브륀은 약간의 쓴맛과 프루티함을 드러낸다. 병입 후 진행되는 재발효과정이 뫼네트 브륀을 놀라운 맥주로 바꿔줄 것이다.',
    '107. 뫼네트 블론드'); 

-- 108.

INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '몰슨',
    'Molson Canadian',
    'CANADA',
    'PALELAGER',
    '4.0',
    '캐나다의 상징 단풍마크가 그려진 라벨이 첫 눈에 들어오는 몰슨 캐네디언은 캐나다의 대표적인 맥주 중 하나이다. 연한 갈색 빛을 띠며 풍미가 좋은 것이 특징이다.',
    '108. 몰슨'); 

-- 109.

INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '무스헤드 라거',
    'Moosehead Lager',
    'CANADA',
    'LAGER',
    '5.0',
    '맥아의 달콤함과 홉의 쓴맛이 조화를 이룬다. 묵은 효모를 사용하고 오랜 시간 양조를 거치는 것이 특징이다.',
    '109. 무스헤드 라거'); 

-- 110.

INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '미얀마 라거',
    'Myanmar Lager',
    'MYANMAR',
    'PALELAGER',
    '5.0',
    '색상은  홤금색을 띠며, 흰색 헤드가 형성된다. 향은 고소한 곡물, 달콤한 옥수수 통조림, 청사과의 레몬 그리고 상쾌한 풀 향이 후각으로 전해진다. 입안에 머금었을 때 고소한 곡물, 달콤한 옥수수 통조림과 꿀, 그리고 마일드 청사과가 느껴지는 맥주이다.',
    '110. 미얀마 라거'); 
    
    
  -- 111.  
INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '뮐렌 쾰슈',
    'Mhlen Klsch',
    'GERMANY',
    'KOLSCH',
    '4.8',
    '홉(Hop)의 허브나 약초 등의 향기는 필스너를 연상시키며 살짝 과일스러운(Fruity) 효모발 에스테르가 느껴진다. 꿀과 같은 단 내가 조금 풍기며, 곡물스런 고소함도 감지된다.',
    '111. 뮐렌 쾰슈');  
    
-- 112.

INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '노이마르크터 람스브로이 딩켈',
    'Neumarkter Lammsbrau Dinkel',
    'GERMANY',
    'DUNKEL',
    '5.2',
    '향은 바나나, 클로브, 바닐라들의 향이 주도적이며 탄산감은 아주 살짝 있다. 다양한 맛을 내표한 이 맥주는 달콤한 과일과 같은 맛과 바닐라 등의 맛이 난다. 더불어 끝으로 갈 수록 떫은 맛도 나타난다.',
    '112. 노이마르크터 람스브로이 딩켈');    
 
 -- 113   
INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '뉴 벨지움, 부두 레인저 IPA',
    'New Belgium, Voodoo Ranger IPA',
    'AMERICA',
    'INDIA',
    '7.0',
    '옅은 금색을 띠고 있으며 작고 자잘한 기포가 지속적으로 올라오면서 얇고 흰 헤드가 눈에 띤다. 솔, 시트러스의 캐릭터가 처음에 나타나고 열대과일, 장미향, 약간의 토스티한 몰트 향이 뒤따라 피어 오른다.',
    '113. 뉴 벨지움, 부두 레인저 IPA');    
    
-- 114.

INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '뉴 벨지움 팻 타이어',
    'New Belgium Fat Tire',
    'AMERICA',
    'AMBER',
    '5.2',
    '맑고 밝은 호박색을 띠고 있고 달콤한 비스킷, 카라멜 몰트의 향이 은은하게 풍긴다. 신선한 펜넬, 청사과의 향도 언뜻 느껴진다. 토스티한 몰트와 은은한 단맛이 입안에 퍼지고 신선한 홉의 쓴맛이 감돌며 완벽한 밸런스를 만들어 낸다. 탄산감이 강하지 않고 뒷맛이 깔끔해 부담 없이 즐기기 좋다.',
    '114. 뉴 벨지움 팻 타이어');    
    
-- 115.

INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '뉴 벨지움 팻 타이어 화이트',
    'New Belgium Fat Tire White',
    'AMERICA',
    'BELWHITE',
    '5.2',
    '세비야 오렌지와 인도의 코리앤더를 첨가해서 만들었다. 양조장에서 멀지 않을 곳에서 분쇄, 첨가해 부재료의 캐릭터가 선명하게 느껴지고 기분 좋은 단맛과 자연스러운 맛이 인상적인 맥주다.',
    '115. 뉴 벨지움 팻 타이어 화이트');    
    
-- 116.

INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '뉴 벨지움 부두레인저 쥬시 헤이즈 IPA',
    'New Belgium Voodoo Ranger Juicy Haze IPA',
    'AMERICA',
    'INDIA',
    '7.0',
    '불투명한 옅은 오렌지색을 띠고 있으며 홉의 시트러스 캐릭터가 강하게 나타난다. 구아바, 파인애플 같은 열대과일의 향도 느껴지며 풋풋한 향과 카라멜 몰트향이 어우러져 코를 자극한다. 약간의 단맛과 부드러운 쓴맛이 잘 어울리며 입안에서 깔끔하게 정리된다.',
    '116. 뉴 벨지움 부두레인저 쥬시 헤이즈 IPA');    
  
  
-- 117.
  
INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '뉴캐슬 브라운 에일',
    'Newcastle Brown Ale',
    'ENGLAND',
    'BROWN',
    '4.7',
    '전체적으로 쓰지 않고, 탄산이 많지 않아 목넘김이 부드러우며 호두, 땅콩, 잣과 같은 견과류의 향이 특징이다.',
    '117. 뉴캐슬 브라운 에일');    
    
 -- 118.
 
 INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '니테나우어 아만다 츠비클 필스',
    'Nittenauer Amanda Zwickl Pils',
    'GERMANY',
    'PILSNER',
    '5.1',
    '모자익 홉이라고 생각되는 열대 과일 향이 있으나, 오롯히 나오진 않고 약간의 광물이 섞인 물이나 미끄덩한 효모의 향이 동반하여 나타났다.',
    '118. 니테나우어 아만다 츠비클 필스');    
    
-- 119.

INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '녹투스 100',
    'Noctus 100',
    'GERMANY',
    'STOUT',
    '10.0',
    '리겔 브루어리의 오래된 양조기술력을 바탕으로 만들어진 맥주로, 초콜릿과 같은 검은 맥아와 강하게 볶은 맥아 3가지를 블랜딩하여 만들어진 임페리얼 스타우트이다. 묵직한 바디감과 크리미한 거품, 초콜릿 같은 짙은 풍미가 특징.',
    '119. 녹투스 100');    
    
-- 120.

INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '노스 코스트 베를리너 바이쎄 페션 프룻 피치',
    'North coast berliner weisse passion fruit peach',
    'GERMANY',
    'WEIZEN',
    '4.1',
    '캘리포니아 산 복숭아 에콰도르산 패션 프루츠로 독일 전통의 베를리너 바이쎄를 구현한 노스코스트의 시즈널 맥주',
    '120. 노스 코스트 베를리너 바이쎄 페션 프룻 피치');    
    
-- 121.


INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '웨팅어 페스트비어',
    'Oettinger Festbier',
    'GERMANY',
    'STOUT',
    '5.8',
    '옥토버축제 기간에만 한정 생산되는 시즈널 맥주로 깔끔한 호프의 향취가 독특한 정통 바이에른 스타일 라거이다. 전 세계 저온저장 하면발효라거 중 가장 고급재료인 독일 바이에른산 보리몰트와 할러타우 호프의 쌉쌀한 풍미와 조화로움을 느낄 수 있다.',
    '121. 웨팅어 페스트비어');    
  
  -- 122.
  
INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '오드 괴즈 분 블랙라벨',
    'Oude Gueuze Boon Black Label',
    'BELGIUM',
    'LAMBIC',
    '7.0',
    '발효도를 100%에 가깝게 끌어올려 잔당을 최소화하여 브라우어리 분 라인업 중 가장 드라이하다. 바디감이 있는 편이고, 탄산도 풍부하다. 청사과와 포도의 맛, 산미의 균형감이 아주 좋은 훌륭한 맥주.',
    '122. 오드 괴즈 분 블랙라벨');    
    
-- 123.

INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '오드 크릭 분',
    'Oude Kriek Boon',
    'BELGIUM',
    'LAMBIC',
    '6.5',
    '오드 크릭 분은 전통적인 100% 자연발효 과일 람빅으로, 1년된 영 람빅에 리터당 400g의 야생 체리를 넣고 오크 배럴에서 숙성 과정을 거친다. 무가당, 무여과, 비살균처리하여 자연스러운 풍미를 느낄 수 있으며, 출시 전 수 개월의 바틀 컨디셔닝을 거친다.',
    '123. 오드 크릭 분');    
    
-- 124.

INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '우드 크릭 비에유',
    'Oude Kriek Vieille',
    'BELGIUM',
    'LAMBIC',
    '6.0',
    '람빅에 체리(크릭)을 넣어 발효시킨 전통 벨기에 람빅입니다. 달지 않으며 펑키하고 새콤한 체리의 향이 매력적입니다. 리터당 400g이 넘는 체리를 씨앗째 사용하며 설탕이나 인공감미료, 보존제를 전혀 넣지 않고 100% 전통방식으로 만들고 있습니다.',
    '124. 우드 크릭 비에유');    
    
-- 125

INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '팔야스 블론드',
    'Paljas Blond',
    'BELGIUM',
    'INDIA',
    '6.0',
    '팔야스 블론드는 알콜 함량 6퍼센트의 언필터드 블론드 비어이다. 병입 후 재발효가 진행되며 달콤하면서도 상큼한 맛을 가지고 있다.',
    '125. 팔야스 블론드');    
    
-- 126

INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '팔야스 브륀',
    'Paljas Bruin',
    'BELGIUM',
    'INDIA',
    '6.0',
    '팔야스 브륀은 다크 몰트와 4가지 홉을 사용해 특별한 맛과 향을 더한 전통적인 벨기에 브라운 비어이다.',
    '126. 팔야스 브륀');    

-- 127

INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '팔야스 IPA',
    'Paljas IPA',
    'BELGIUM',
    'INDIA',
    '6.0',
    '팔야스 IPA는 페일몰트와 4가지 홉을 사용해 균형잡힌 향과 풍미를 드러낸다. 넬슨 소빈 홉을 드라이호핑하여 소비뇽블랑과 같은 풍미도 지니고 있다.',
    '127. 팔야스IPA');    
    

-- 128.

INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '파울라너 헤페 바이스비어',
    'Paulaner Hefe-Weissbier',
    'GERMANY',
    'WHEAT',
    '5.5',
    '쓴맛과 신맛이 없이 마일드하면서도 밍밍하지 않은 걸쭉, 담백, 구수함을 갖춘 밀맥주이다. 상기한 두 회사의 헤페바이스와 비교하면 특유의 맛과 향이 진한 편이다.',
    '128. 파울라너 헤페 바이스비어');    
    
-- 129.

INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '풍슈태터 바이젠 둔켈',
    'Pfungstadter Weizen Dunkel',
    'GERMANY',
    'BLACK',
    '5.3',
    '탄산감은 과하지 않게 적당하게 나온다. 질감이나 무게감은 가벼움과 중간 사이 있고, 어렴풋한 진득함도 느껴지나 성향은 가볍다. 맥아에서 나오는 단 맛은 많지 않는다. 질척이는 카라멜 단 맛 등은 찾기 어렵다.',
    '129. 풍슈태터 바이젠 둔켈');    
    
-- 130.

INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '필스너 우르켈',
    'Pilsner Urquell',
    'CZECH',
    'PILSNER',
    '4.4',
    '흑맥주 일색이던 시절 은은한 황금빛으로 사랑을 받기 시작했다. 황금색 맥주의 원조라 할 수 있다. 체코산 사츠 홉의 씁씁할 맛이 잘 조화되어 있다.',
    '130. 필스너 우르켈');    
    
--131.

INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '뽀햘라 토름',
    'Pohjala Torm',
    'ESTONIA',
    'GOSEWHEAT',
    '8.0',
    '소금, 레몬, 코리엔더 등의 산미와 짠 내 향긋함이 고제스타일임을 밝히면서도 베리류의 달콤함과 약간의 눅진한 풀 내음 등이 향에서 다채로움을 더한다. 베리류 시럽과 같은 단 맛이 처음에 등장하지만 물리는 단 맛으로 남는게 아니고 되려 깔끔하게 떨어진다.',
    '131. 뽀햘라 토름');    
    
-- 132.

INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '레드독',
    'Red Dog',
    'AMERICA',
    'PALELAGER',
    '5.0',
    '엷은 황금색. 옥수수, 약간의 몰트, 소량의 홉의 맛이 느껴진다. 부재료를 함유한 전형적인 미국 페일 라거의 맛으로, 맛이 가볍고 청량감이 있어 시원하게 마시기 좋은 맥주이다. 옥수수가 함유됐다.',
    '132. 레드독');    
    
-- 133.

INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '레드 홀스비어',
    'Red Horse',
    'PHILIPPINES',
    'PALELAGER',
    '6.9',
    '원료에 설탕이 함류되어 달달한 맛과 향이 나며 탄산이 많고 깔끔한 스타일의 가벼운 맥주라 높은 알콜 도수에 비해서 부담감은 없다.',
    '133. 레드 홀스비어');    

 -- 134.
 
INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '리덴버거 돌덴 주드 IPA',
    'Riedenburger Dolden Sud IPA',
    'GERMANY',
    'INDIA',
    '6.5',
    '효모일 수도, 홉 일수도 있는 가루가 상당히 많아 따를 때 조심하지 않으면 매우 탁한 구리색을 띈다. 레몬이나 귤 쪽에서 나오는 과일 향이 우선시되며, 의외로 거친 풀이나 허브, 잔디 등등은 나오지 않는다.',
    '134. 리덴버거 돌덴 주드 IPA');    
    

-- 135.

INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '리덴부르거 아인코른 에델비어',
    'Riedenburger Einkorn Edelbier',
    'GERMANY',
    'WHEAT',
    '5.0',
    '식빵의 속 하얀 부분의 같은 고소함, 다듬어지지 않은 곡물향에 바닐라스러움도 있으면서 미세한 레몬과 같은 시큼함이 있다. 레몬 캔디 같은 느낌이기도 한데 홉의 영향도 조금 있다.',
    '135. 리덴부르거 아인코른 에델비어');    
    
    
-- 136.

INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '리덴부르거 엠머비어',
    'Riedenburger Emmerbier',
    'GERMANY',
    'WHEAT',
    '5.1',
    '무지하게 탁하고 뿌연 가운데 색상은 짙은 구리색을 띄며 헤드의 생성력은 좋은편에 두껍지는 않은 거품층이맥주 상층에 드러워져 꺼지지 않는 유지력을 보여준다.',
    '136. 리덴부르거 엠머비어');    
    

-- 137.
INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '리덴부르거 우어 바이젠',
    'Riedenburger Ur-Weizen',
    'GERMANY',
    'WEIZEN',
    '5.2',
    '탄산감은 많은 편. 청량하게 마시는데 무리없고 질감이나 무게감은 가벼움과 중간 사이의 어딘가 같다. 연하고 묽은 느낌은 아니며 살짝 매끄러운 면모가 있다. 그래도 탄산기가 많기 때문에 가볍게 마실 수 있다.',
    '137. 리덴부르거 우어 바이젠');    
    
 
 -- 138   
INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '리겔레스 바이세',
    'Riegeles Weisse',
    'GERMANY',
    'PILSNER',
    '5.0',
    '색상은 바이스비어(Weissbier)스럽게 탁한 상아색, 노란색을 띈다. 바이스비어에서 주로 나타나는 향들인 바나나, 바닐라, 버블껌, 정향, 후추 등에서 바나나와 같은 과일의 단 내도 있긴 했지만 버블껌이나, 정향 등의 향이 좀 더 우세하다. 향에 익숙해지면 숨겨졌던 곡물 향도 포착된다.',
    '138. 리겔레스 바이세');    
    
    
-- 139

INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '리겔 아우구스투스 바이젠 도펠복',
    'Riegele Augustus Weizen Doppelbock',
    'GERMANY',
    'DOPPEL',
    '8.0',
    '붉은 색 빛깔은 자줏빛의 병 라벨의 디자인과 잘 어울리며 고급진 이미지를 풍긴다. 맛을 보면 쿰쿰함이 느껴지고 살짝 드라이하게 떨어진다. 산미가 느껴지는 듯한데 마치 산딸기를 먹었을 때의 느낌과 같다.',
    '139. 리겔 아우구스투스 바이젠 도펠복');    
    
    
-- 140.
INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '리겔 헤페 바이스',
    'Riegele Hefe Weisse',
    'GERMANY',
    'WEIZEN',
    '5.0',
    '2017, 2018년 2년 연속 독일 내 최고의 브루어리로 선정된 리겔 브루어리의 전통적인 방식으로 만들어진 헤페 바이젠이다. 금빛 외관에 매우 풍성한 거품이 특징이며 상쾌한 맛과 향을 지니고 목넘김이 매우 부드럽다.',
    '140. 리겔 헤페 바이스');    
    
    
-- 141.
INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '리터굿츠 베렌퇴터',
    'Ritterguts Brentter',
    'GERMANY',
    'GOSEALE',
    '6.6',
    '코리엔더, 계피 등이 짭짤함과 시큼한 고제 향과 겹치며, 희미하게 고소한 맥아 냄새와 살짝 단 내도 있다. 탄산기는 많은 편은 아니라 마시는데 무리가 없고 질감이나 무게감은 중 (Medium)수준이라 보아, 복(Bock)이라는 타이틀을 갖고 있어도 무겁거나 부담을 주는 맥주와는 거리가 있다.',
    '141. 리터굿츠 베렌퇴터');    
    
    
-- 142.

INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '리터굿츠 스페찌알 고제',
    'Ritterguts Spezial Gose',
    'GERMANY',
    'GOSEALE',
    '5.1',
    '살짝 어두운 탁한 짙은 금색, 주황색에 가깝다.고제 특유의 레몬과 같은 시큼한 향이 코를 찌르고향긋한 오렌지, 고수 등이 뒤를 이어 찾아온다.',
    '142. 리터굿츠 스페찌알 고제');    

-- 143.    
INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '리트마이어 라이테를라 라우흐비어',
    'Rittmayer Raiterla Rauchbier',
    'GERMANY',
    'WHEAT',
    '5.0',
    '맥아적인 단 맛(Malty Sweet)은 찾아보기 힘든 깔끔함을 중추로 나무스럽고(Woody) 다듬어지지 않은 듯한 훈연의 맛이 주인공으로 맥주를 들이키는 순간부터 목으로 넘긴뒤 입에 남는 시간까지 맥주를 마시는 행위 전 과정에 걸쳐서 나타난 맛의 주역이다.',
    '143. 리트마이어 라이테를라 라우흐비어');     

-- 144.

INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '로덴바흐 알렉산더',
    'Rodenbach Alexander',
    'BELGIUM',
    'ALE',
    '5.6',
    '오크통에서 숙성된 한정판 체리 첨가 맥주',
    '144. 로덴바흐 알렉산더');
    
-- 145.

INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '롤링락',
    'Rolling Rock',
    'AMERICA',
    'PALELAGER',
    '4.5',
    '페일 라거라고 불리우는 형식의 맥주로, 이 페일 라거는 색이 밝고 효모향이 적은 대신 보리향이 강한 것이 특징이다. 맹맹하고 청량감이 강해 맥주라기보단 탄산음료를 마시는 느낌이 드는 맥주다. ',
    '145. 롤링락');  


-- 146.
INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '에스 프리미엄 라이트비어',
    'S Premium Light Beer',
    'KOREA',
    'LIGHT',
    '3.8',
    '무알콜 맥주의 단내가 심하게 난다. 일반적인 거품생성이며 유지력이나 헤드는 그다지 좋은편은 아니다. 투명하고 밝은 금빛라거의 전형적인 색상을 보여준다. 마실 때에는 적당한 탄산과 부드러움이 느껴지지만 올리고당이나 물엿에서 느껴지는 단내가 심하게 난다.',
    '146. 에스 프리미엄 라이트비어');  


-- 147
INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '사이공 익스포트',
    'Saigon Export',
    'VIETNAM',
    'PALELAGER',
    '4.9',
    '고소한 향이 나며 첫 맛은 약간 시큼하지만 이내 쌀과 홉의 고소한 맛과 쓴맛이 조화를 이루며 피어오르는 느낌의 맥주이다.',
    '147. 사이공 익스포트');  
    
    
-- 148

INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '사무엘 아담스 보스턴 라거',
    'Samuel Adams Boston Lager',
    'AMERICA',
    'EMBLAGER',
    '4.8',
    '진한 앰버(호박색) 색깔의 라거. 4가지의 맥주 주재료와 전통적인 양조 방식으로 만들어지며, 독특한 꽃의 향과 소나무 향, 중간에 캐러멜 맛이 드러난다. 홉의 맛이 강하며, 드라이한 피니시로 마무리된다. ',
    '148. 사무엘 아담스 보스턴 라거');  
    
-- 149
INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '산 미구엘 페일 필젠',
    'San Miguel Pale Pilsen',
    'PHILIPPINES',
    'PILSNER',
    '5.0',
    '산미구엘 페일 필센은 짙은 갈색의 맥주병 색깔과 특이하게 생긴 맥주병 모양이 특징이며, 균형 잡힌 중간 사이즈 병 속에 상쾌하고 짜릿한 뒷맛을 선사한다. 입안에 부드럽게 미끄러지는 독특한 홉의 향이 일품인 맥주이다.',
    '149. 산 미구엘 페일 필젠');  
    
    
-- 150.
INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '삿포로',
    'Sapporo',
    'JAPAN',
    'PALELAGER',
    '5.0',
    '보통삿포로 맥주는 아사히와 비슷한 드라이맥주에 속하며, 원래 레시피에 쌀과 옥수수를 다량 첨가하여 일반적인 필스너에 비해 옅은맛이다. 부드러운 식감이 일품이다.',
    '150. 삿포로');  
 
 -- 151.
 
INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '슈렝케를라 메르첸',
    'Schlenkerla Marzen',
    'GERMANY',
    'MAREZEN',
    '5.1',
    '슈렝케를라 메르첸은 너도밤나무를 태운 불 위에 맥아를 건조하는데, 연기에 그을린 맥아는 독특한 풍미가 나타난다. 풍성한 훈연향과 특유의 베이컨과 소시지 향이 나는 독특한 맥주.',
    '151. 슈렝케를라 메르첸'); 
    
-- 152.
INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '슈무커 로즈 복',
    'Schmucker Ros Bock',
    'GERMANY',
    'DOPPEL',
    '8.0',
    '생각보다 가벼운 무게감만큼 맥아 단 맛도 적은 편이다. 진득하게 깔리는 단 맛은 적지만 곡물 비스킷이라던가 구워진 식빵 테두리와 같은 맛 등이 더 드러난다.',
    '152. 슈무커 로즈 복');  
    
-- 153.
INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '슈무커 슈바르츠비어',
    'Schmucker Schwarzbier',
    'GERMANY',
    'SCHWARZ',
    '4.8',
    '탄산은 많지 않은 편이며 입에 들어가는 느낌은 꽉차는 느낌보다는 묽고 연하다. 특별히 입에 걸리는 진득함이나 육중함은 없이 빠르고 간결하며 깨끗한 쪽에 치중되었다 그래서인지 아주 마시기는 편한 맥주이다.',
    '153. 슈무커 슈바르츠비어');  
    

-- 154.

INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '슈나이더 바이세 탭1 헬레 바이세',
    'Schneider TAP1 Helle Weisse',
    'GERMANY',
    'WHEAT',
    '5.2',
    '밝은 꿀색의 풀바디, 풍성한 거품, 전형적인 슈나이더 바이세 아로마를 지녔다. 프레시한 레몬, 바닐라, 클로브 아로마가 조화를 이루는 가벼운 밀맥주.',
    '154. 슈나이더 바이세 탭1 헬레 바이세');  
    
-- 155.

INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '슈나이더 바이스 퀴베 바리크',
    'Schneider Weisse Cuve Barrique',
    'GERMANY',
    'WEIZEN',
    '9.5',
    '탄산기는 많지 않아서 샴페인 같지는 않았으며, 질감-무게감은 중간에서 무거움을 향하는 아주 진득하거나 육중하진 않으면서도 적당히 안정감을 주는 느낌이다.',
    '155. 슈나이더 바이스 퀴베 바리크');  
    
-- 156.
INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '슈나이더 바이스 탭 X 마틸다 솔레일',
    'Schneider Weisse Tap X Mathilde Soleil',
    'GERMANY',
    'WEIZEN',
    '7.0',
    '탄산은 바이젠복(Weizenbock)이라는 스타일 쪽에서는 그래도 상당량 포함된 맥주로 청량함을 선사해 준다. 여름 컨셉으로 잡은 맥주이지만 페일 라거 수준으로 가볍고 묽은 라이트 바디(Light Body)는 아니었고, 중간 수준의 미디엄 바디(Medium Body)는 된다.',
    '156. 슈나이더 바이스 탭 X 마틸다 솔레일');  
    
-- 157

INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '슈나이더 바이세 탭2 메인 크리스탈',
    'Schneider Weisse Tap2 Mein Kristall',
    'GERMANY',
    'CRYSTAL',
    '3.0',
    '효모를 필터링하여 맑고 식전주로 마시기 좋은 밀맥주. 페일 라거를 대체할 수 있을 정도로 투명하고 밝은 외관을 자랑한다. 기분좋은 탄산감이 매력적인 탭2 크리스탈 밀맥주는 엘더베리 시럽을 넣어서 마시면 스파클링 와인의 훌륭한 대체재가 된다.',
    '157. 슈나이더 바이세 탭2 메인 크리스탈');  
    

--158.
INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '슈나이더 바이세 탭5 마이네 호펜바이세',
    'Schneider Weisse Tap5 Meine Hopfenweisse',
    'GERMANY',
    'WEIZEN',
    '8.2',
    '홉향이 강렬하면서도 부드러운 최고 인기 밀맥주. 미국 브루클린 브루어리와 공동으로 개발하여 홉의 풍미가 강한 미국식 IPA와 독일식 바이젠이 합쳐진 매우 독특한 맛으로 전 세계 맥주 팬을 사로잡고 있다.',
    '158. 슈나이더 바이세 탭5 마이네 호펜바이세');  

-- 159

INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '시에라 네바다 페일 에일',
    'Sierra Nevada Pale Ale',
    'AMERICA',
    'AMEALE',
    '5.6',
    '시에라 네바다 시리즈 중 가장 인기 있는 맥주이다. 탁한 갈색을 띠며 자몽과 꽃향이 잘 드러나며 홉 향을 느낄 수 있다. 입안에서는 탄산감이 잘 드러나고 감귤류의 맛과 캐러멜 몰트, 쌉싸름함 등 복합적인 맛과 향을 가지고 있다.',
    '159. 시에라 네바다 페일 에일');  
    
-- 160.

INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '싱하',
    'Singha',
    'THAILAND',
    'PALELAGER',
    '5.0',
    '1933년도에 출시된 이 맥주는 태국에서 최초로 만들어진 맥주로 알려져 있다. 깨끗하고 상쾌한 맛을 가지고 있으니 양념이 강한 전통 음식과 잘 어울려 커리와 함께 마셔보는 것을 추천한다.',
    '160. 싱하');  
    
-- 161.

INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '스콜',
    'Skol',
    'BRAZIL',
    'PILSNER',
    '4.7',
    '가볍고 청량한 느낌을 지녔다. 향은 전체적으로 시큼한 향이 코를 건드리는데, 이는 맛으로도 귀결되어 약간의 신 맛을 선사한다.',
    '161. 스콜');  
    
-- 162.

INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '설화 맥주',
    'Snow Beer',
    'CHINA',
    'PALELAGER',
    '5.5',
    '순하고 깨끗한 맛이 특징으로, 칭타오에 비해 톡 쏘는 맛이 있고 탄산이 많아서 미국 맥주인 밀러와 비슷한 느낌을 가지고 있다. ',
    '162. 설화 맥주');  
    
-- 163.

INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '슈페치알 라우흐비어 라거',
    'Spezial Rauchbier Lager',
    'GERMANY',
    'RAUCH',
    '4.7',
    '색상은 붉은 빛이 감도는 황토색을 발하고 있다. 향에서는 마치 참나무에 훈연시킨 바비큐를 마주한 기분의 향이다.',
    '163. 슈페치알 라우흐비어 라거');  
    
    
-- 164.

INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '세인트 버나두스 파터6',
    'St.bernardus Pater 6 ',
    'BELGIUM',
    'STOUT',
    '6.7',
    '버나두스 양조장에서 나온 수도원 방식의 듀벨 에일로 도수에 비해 깊은 향을 가지고 있으며 부드럽고 깔끔한 맛을 느낄 수 있다. 밸런스가 좋아 편하게 즐길 수 있는 맥주.',
    '164. 세인트 버나두스 파터6');  
    
-- 165.

INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '세인트루이스 크렉 람빅',
    'St Louis Kriek Lambic',
    'BELGIUM',
    'LAMBIC',
    '4.0',
    '체리를 담궈 6개월동안 숙성시킨 람빅 맥주에 진한 체리의 풍미와 아몬드 향을 만들어 낸다.',
    '165. 세인트루이스 크렉 람빅');  
    
-- 166.

INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '세인트루이스 프리미엄 크릭',
    'St Louis Premium Kreiek',
    'BELGIUM',
    'LAMBIC',
    '3.2',
    '투명하고 산뜻한 붉은 빛의 세인트 루이스 프리미엄 크렉은 6개월간 숙성을 거쳐 오블라신스카체리의 달콤함과 아몬드향을 자랑한다.',
    '166. 세인트루이스 프리미엄 크릭');  
    
-- 167

INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '세인트 마틴 블론드',
    'St Martin Blond',
    'BELGIUM',
    'BLONDE',
    '7.0',
    '벨기에 블론드 에일에서 기대할 수 있는 단 향은 바나나, 배, 캔디, 시럽 등으로 나와주었다. 알싸한 정향, 후추 쪽은 살짝 있는 정도였고 아주 조금의 식물스러운 향기도 맡을 수 있다.',
    '167. 세인트 마틴 블론드');  
    
-- 168.

INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '스티뉴이크',
    'Steenuil',
    'BELGIUM',
    'ENGLISH',
    '6.5',
    '"작은 부엉이"라는 뜻의 부엉이 맥주로 특별한 세가지 허브가 사용된 친환경 웰빙 에일맥주',
    '168. 스티뉴이크');  

-- 169
INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '스텔라 아르투아',
    'Stella Artois',
    'BELGIUM',
    'PALELAGER',
    '5.0',
    '어둡지도 옅지도 않은 적당한 황금빛 색상이면서 거품의 양도 적당하다. 치우치지 않은 보리의 향과 홉의 풍미의 조화가 좋으며 부담 없는 알코올 도수이다.',
    '169. 스텔라 아르투아');  
    
-- 170.
INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '스타우트 블랙비어',
    'Stella Artois',
    'BELGIUM',
    'PALELAGER',
    '5.0',
    '어둡지도 옅지도 않은 적당한 황금빛 색상이면서 거품의 양도 적당하다. 치우치지 않은 보리의 향과 홉의 풍미의 조화가 좋으며 부담 없는 알코올 도수이다.',
    '170. 스타우트 블랙비어');  
    
-- 171.

INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '슈퇴르테베커 한제-포터',
    'St rtebeker Hanse-Porter',
    'GERMANY',
    'KOLSCH',
    '4.0',
    '탄산은 비중없는 역할로 청량감을 부여하지는 못했고 부드럽고 매끄러우며 살짝 기름진(Oily) 질감이 입을 감싼다. 무게감은 중간(Medium)수준으로 당의 무거운 느낌이 중심이 된다.',
    '171. 슈퇴르테베커 한제-포터');  
    
-- 172.

INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '테넌츠 스카치 에일',
    'Tennents Scotch Ale',
    'ENGLAND',
    'SCOTCH',
    '9.0',
    '색상은 구리색에서 호박색에 가까우며 맥아즙, 설탕, 카라멜 등의 맥아 향이 난다. 향은 우직하고 단순한 편이다. 맛은 약간의 구워진 식빵 테두리의 같은 맛도 있고, 맥아의 단 맛도 캔디나 카라멜과 유사하게 나타난다.',
    '172. 테넌츠 스카치 에일');  
    
-- 173

INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '테라',
    'Terra',
    'KOREA',
    'PALELAGER',
    '4.6',
    '세계 공기질 부문 1위인 호주에서도 청정하기로 유명한 땅, 골든 트라이앵글에서 자란 청정 맥아를 사용했다. 오직 발효공정에서 나오는 100% 리얼 탄산으로 거품은 조밀하고 탄산은 오래 지속 된다.',
    '173. 테라');  
 
 -- 174.
 INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '타이거',
    'Tiger',
    'SINGAPORE',
    'PALELAGER',
    '5.0',
    '동남아 맥주답게 청량하고 향이 진하지 않은 맛을 가지고 있으며 매우 차갑게 하여 마시는 것을 추천한다.',
    '174. 타이거');  


-- 175.

INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '팀머만스 오드 괴즈',
    'Timmermans Oude Geuzue',
    'BELGIUM',
    'LAMBIC',
    '5.5',
    '세계에서 가장 오래된 람빅 양조장에서 만들어진 Sour Ale 시큼, 꿉꿉하며 청사과, 청포도와 같은 향미가 일품이다.',
    '175. 팀머만스 오드 괴즈');  
  
  -- 176.
  
INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '트리포터 프롬 헬',
    'Triporteur From Hell',
    'BELGIUM',
    'BELGIAN',
    '6.6',
    '트리포터 프롬 헬은 봄브루어리에서 만든 맥아를 사용한 어두운 맥주. 초콜릿, 카라멜, 커피, 신선한 빵을 떠올리게 한다. 밀맥아를 사용하여 외관이 약간 탁하다. 병에서 숙성되며 계속 맛이 변화한다.',
    '176. 트리포터 프롬 헬');  


-- 177.

INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '칭따오 맥주',
    'Tsingtao Beer',
    'CHINA',
    'LIGHT',
    '4.7',
    '칭타오는 호프의 고소한 향과, 지나치지 않은 탄산이 마음에 들며 고소하게 쓰며 깔끔하게 터치하는 끝맛이 제대로 된 맥주를 마신것 같다는 느낌을 들게 해준다.',
    '177. 칭따오 맥주');  

-- 178.

INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '터스커',
    'Tusker',
    'KENYA',
    'PALELAGER',
    '4.2',
    '가볍고 산뜻한 스타일의 맥주이다. 쓰지 않고, 약하며 시원하며, 톡 쏘고 깔끔한 다른시각에서 보면 좀 깊이가 없는 맥주이나, 가벼운 맥주를 좋아하는 취향의 분들께서 좋아하실 맥주이다.',
    '178. 터스커');  
  
  -- 179.
  
INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '위어리게 알트비어',
    'Uerige Altbier',
    'GERMANY',
    'ALT',
    '4.7',
    '맥아들에서 찾을 수 있는 속성인 카라멜, 비스킷, 자두 등의 깊은 맥아의 맛들이 중점적으로 드러난다. 이와 동시에 약간 풀뿌리와 흙을 삼킨듯한 거친 맛과 짜릿하게 다가오는 스파이시가 아닌 약초나 야생초에서 전달되는 알싸한 스파이시가 동반하여 찾아온다.',
    '179. 위어리게 알트비어');  
  
  -- 180.
  
INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '펠덴슈타이너 츠비클',
    'Veldensteiner Zwickl',
    'GERMANY',
    'ZWICKL',
    '5.4',
    '탄산은 거의 없으므로, 김빠진 맥주스러움의 정석이다. 약간 묽게 다가오긴했지만 어느정도는 크리미하고 부드러운 성질로 무게감은 가벼움-중간(Light-Medium)에 속한다. 쉽게 표현해서 식혜마시는 수준의 질감-무게감이다.',
    '180. 펠덴슈타이너 츠비클');  
   
 -- 181.
 
INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '빅토리아 빅터',
    'Victoria Bitter',
    'AUSTRALIA',
    'PALELAGER',
    '4.9',
    '호주 천혜의 자연 환경이 키워낸 최상급 페일 몰트와 링우드 홉 그리고 가장 활성화된 효모를 사용해서 높은 온도에서 빠르게 발효 시키는 방법으로 상쾌하면서도 쌉싸름한 맛을 살린 맥주이다.',
    '181. 빅토리아 빅터');  
    
-- 182.

INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '바그너 메르켄도르프 메르첸',
    'Wagner Merkendorf Mrzen',
    'GERMANY',
    'MAREZEN',
    '5.5',
    '탄산은 알맞은 정도로서 적당한 청량감을 느낄 수 있고, 탄산감을 제외한 입에 닿는 감촉은 약간 질긴감이 들며, 크리미함과 기름진(Oily) 질감의 중간상태이다. 무게감은 가벼움-중간(Light-Medium)으로 마시기에는 편하다.',
    '182. 바그너 메르켄도르프 메르첸');  
    
    
-- 183.

INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '바르슈타이너 프리미엄 필스너',
    'Warsteiner Premium Pilsner',
    'GERMANY',
    'PILSNER',
    '4.8',
    '독일 필스너 맥주를 대표하는 바르슈타이너 프리미엄 베룸은 부드러운 맛과 풍부한 호프의 향, 크리미한 헤드, 쌉쌀한 여운을 지녔다. 고품질의 재료만을 사용해 양조했으며 우아하고 깨끗한 맛으로 “맥주의 여왕” 혹은 “미스 독일”이라는 별칭을 갖고 있다.',
    '183. 바르슈타이너 프리미엄 필스너');  
    
    
-- 184.

INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '바이헨슈테파너 브라우팍트',
    'Weihenstephaner Braupakt',
    'GERMANY',
    'WHEAT',
    '6.0',
    '향은 상쾌한 풀, 솔, 상큼한 감귤계 홉의 향이 있고, 바이젠 고유의 바나나와 바닐라, 후추 등도 나온다. 대체로 새콤달콤한 편이라 약간 풍선껌 같다. 탄산감은 요즘 계절에 마시기 좋게 터짐이 있었고 무게감은 가벼움과 중간 사이에 놓여있다고 보았으며 질감자체는 매끄러운 편이라 안정감을 준다.',
    '184. 바이헨슈테파너 브라우팍트');  
    
    
-- 185.

INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '바이엔슈테판 필스너',
    'weihenstephaner pilsner',
    'GERMANY',
    'PILSNER',
    '5.1',
    '
진한 할러타우 호프의 쌉쌀한 맛과 향이 조화록게 어우러져 신선한 청량감을 부르는 독일 전통 필스너이다. 크리스피한 호프의 맛과 부드러운 꽃 향기가 피니쉬에서 깔끔하게 느껴저 갈증해소와 기분전환에 좋은 전형적인 필스너 스타일의 맥주이다.',
    '185. 바이엔슈테판 필스너');  
    
  
  -- 186.  
INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '바엔슈테판 비투스',
    'Weihenstephaner Vitus',
    'GERMANY',
    'BOCK',
    '7.7',
    '향은 선명하게 꿀로 시작되서 꿀에서 절인 오렌지 풍미로 이어진다. 입안에서 산뜻한 산도와 함께 꿀에 절인 오렌지 풍미가 입안 한가득 차오르고 뒤쪽으로 바나나 정향의 풍미가 따라온다.',
    '186. 바엔슈테판 비투스');  
    
-- 187.

INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '바이헤어러 복',
    'Weiherer Bock',
    'GERMANY',
    'DOPPEL',
    '6.6',
    '시럽이나 꿀, 밝은 색 맥즙스런 단 내가 먼저 감지되며, 은근히 가마에 구워진듯한 연한 훈연 향도 나타난다. 버터스러운 느끼한 냄새도 적지 않게 드러났으며, 홉(Hop)의 향기는 뚜렷하게 찾아내기 어렵다.',
    '187. 바이헤어러 복');  
    
-- 188.

INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '벨텐부르거 클로스터 빈터-트라움',
    'Weltenburger Kloster Winter-Traum',
    'GERMANY',
    'PILSNER',
    '5.4',
    '향은 꽤나 온화하고 마일드한 느낌으로 다가온다. 잘 구워진 빵과 비스킷 느낌에 카라멜도 약하게 난다.  홉에서 나오는 차분한 풀내음과 꽃이 있다. 탄산감은 팡팡터지긴 보단 다소곳한 편이었고, 질감이나 무게감은 연하면서도 안정적이다.',
    '188. 벨텐부르거 클로스터 빈터-트라움');  
    
-- 189.

INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '웨스트 코스트 IPA',
    'West Coast IPA',
    'BELGIUM',
    'INDIA',
    '8.1',
    'SIMCOE홉에서는 열대포도의 맛과 향기를, COLUMBUS에서는 톡쏘 는강렬함을, CENTENNIAL에서는 소나무향이, 그리고 CITRA와 CASCADE를 추가함으로써 오묘한 향과 맛이 스며 나온다.',
    '189. 웨스트 코스트 IPA');  
    
-- 190.

INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '베스트말레 두벨',
    'Westmalle Dubbel',
    'BELGIUM',
    'BELGIAN',
    '7.0',
    ' 검붉은 색을 띄는 에일로 보기와 다르게 부드러운 느낌이 강함. 맛의 과일향, 홉의 쌉싸름한 맛, 풍성한 거품의 부드러움. 진한 질감 등 밸런스가 아주 좋은 맥주',
    '190. 베스트말레 두벨');  
    
-- 191.

INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '쉬에화 맥주',
    'Xuehwa Beer',
    'CHINA',
    'LIGHT',
    '2.5',
    '탄산이 많아 청령감이 많이 느껴지는 맥주로 여름에 마시면 좋은 맥주.',
    '191. 쉬에화 맥주');  
    
 --192.
 INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '옌징 맥주',
    'Yanjing Beer',
    'CHINA',
    'LIGHT',
    '3.6',
    '북경의 연경맥주는 짭짤한 감이 돈다. 독하다는 느낌은 전혀 없는 라거형태의 맥주이며 탄산기가 좀 있으며, 가벼운 스타일의 맥주이다.',
    '192. 옌징 맥주');  
    
-- 193.

INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '잉링 트레디셔널 라거',
    'Yuengling Traditional Lager',
    'AMERICA',
    'EMBLAGER',
    '4.5',
    '미국에서 가장 오래된 양조장인 펜실베니아 포츠빌에서 만들어진 맥주. 어두운 빛깔의 맥주이며 탄산은 약한 편이다.',
    '193. 잉링 트레디셔널 라거');  
    
 -- 194.
 
 INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '치퍼',
    'Zipfer',
    'AUSTRIA',
    'MAREZEN',
    '5.4',
    '치퍼 메르젠비어이지만 필스너 맥주 수준의 쓴맛을 가졌다. 탄산의 항량은 적당하며 전체적인 무게감은 중간과 가벼운 사이에 위치해있다. 고소한 쓴맛이 강하고 약하게 피어오르는 알코올의 맛이 나타나며 그 뒤에 잔잔한 쓴맛이 남는다.',
    '194. 치퍼');  
    
    INSERT INTO BEER
VALUES(BEERSQ.NEXTVAL,
    '츠비젤 담프비어',
    'Zwiesel Dampfbier',
    'GERMANY',
    'DAMP',
    '5.0',
    '마일드한 꽃향기를 풍기는 홉의 존재감과 전형적인 바이젠 효모의 바나나/클로브 콤비, 더불어 약간은 그을린듯한 나무, 건초 같은 거친향을 동반한다. 살짝 느껴지는 스모키함과 옅은 카라멜의 단 맛, 건포도 스러운 맛이 바이스비어 효모가 뿜어내는 콤비들의 맛들가 어울어진다.',
    '195. 츠비젤 담프비어');  
    

------------------------

-- BEER_STORY(관련뉴스) DATA INSERT
INSERT INTO BEER_STORY
VALUES(STORYSQ.NEXTVAL,'진화한 혼술족 위한 편의점 맥주, 안주 궁합', 'http://www.donga.com/news/article/all/20200416/100690209/1', 'story1.jpg');

INSERT INTO BEER_STORY
VALUES(STORYSQ.NEXTVAL, '멕시코 코로나 맥주도 생산 중단', 'http://news.kbs.co.kr/news/view.do ncd=4416971&ref=A', 'story2.jpg');

INSERT INTO BEER_STORY
VALUES(STORYSQ.NEXTVAL, '수입맥주 배달 4캔 만원시대 개막', 'http://cnews.beyondpost.co.kr/view.php ud=20200410084840348546a9e4dd7f_30', 'story3.jpg');

INSERT INTO BEER_STORY
VALUES(STORYSQ.NEXTVAL, '효모로 맥주 대신 수소 만든다', 'http://amenews.kr/news/view.php idx=42049', 'story4.jpg');

INSERT INTO BEER_STORY
VALUES(STORYSQ.NEXTVAL, '칼로리가 낮은 맥주 TOP10', 'http://www.sommeliertimes.com/news/articleView.html idxno=16210', 'story5.jpg');

INSERT INTO BEER_STORY
VALUES(STORYSQ.NEXTVAL, '나인밀라 맥주효모 천연샴푸 선보여', 'http://www.dailygrid.net/news/articleView.html idxno=361687', 'story6.jpg');

INSERT INTO BEER_STORY
VALUES(STORYSQ.NEXTVAL, '무알코올 맥주, 알코올 정말 안 들었을까 ', 'http://health.chosun.com/site/data/html_dir/2020/02/25/2020022501431.html', 'story7.jpg');

INSERT INTO BEER_STORY
VALUES(STORYSQ.NEXTVAL, '수입맥주 40종, 수입와인 1종 모두 농약 성분 불검출', 'https://newsis.com/view/ id=NISX20190427_0000634177&cID=10201&pID=10200', 'story8.jpg');

-- CATEGORY(말머리) DATA INSERT
INSERT INTO CATEGORY
VALUES('TALK', '강연');

INSERT INTO CATEGORY
VALUES('CLASS', '클래스');

INSERT INTO CATEGORY
VALUES('MOIM', '번개');

INSERT INTO CATEGORY
VALUES('ETC', '기타');

COMMIT;

SELECT BEER_DETAIL FROM BEER;


--INSERT INTO USER_TB VALUES('USER01','1111','최지혜','jihye@love.com','01011112222',null,'USER');
--INSERT INTO USER_TB VALUES('ADMIN','1234','관리자','jihye@love.com','01011112222',null,'MGR');

--COMMIT;