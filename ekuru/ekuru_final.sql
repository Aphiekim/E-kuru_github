/*유저 테이블*/
create table e_user_tb(
    userId  varchar2(50)    primary key
    ,userPw varchar2(50)    not null
    ,userNm varchar2(50)    not null
    ,userAddr varchar2(50)  
    ,userZip varchar2(50)  
    ,userPhone  varchar2(50)
    ,userConfirm    char(1) default '0'
    ,userType   char(1) default '0'
    ,userPoint  number  default '0'
    ,userProfile varchar2(200) default 'person1.png'
    ,authKey varchar2(4000)
);

/*포인트 테이블*/
create sequence point_seq;
create table e_point_tb(
    pointChargeNum  number  primary key
    ,userId varchar2(50)
    ,pointProdNum   number
    ,pointChargedIndate date    default sysdate
    ,constraint e_point_fk1 foreign key(userId) references e_user_tb(userId) on delete cascade
    ,constraint e_point_fk2 foreign key(pointProdNum) references e_pointProduct_tb(pointProdNum) on delete cascade
);

/*포인트 상품 테이블*/
create sequence pointProdNum_seq;
create table e_pointProduct_tb(
    pointProdNum    number  primary key
    ,pointProdName number   unique not null
    ,priceUsd   number  not null
    ,priceYen   number  not null
);
commit;
/*사용한 포인트 내역 테이블*/
create sequence pointUsedNum_seq;
create table e_pointUsed_tb(
    pointUsedNum    number  primary key
    ,userId varchar2(50)
    ,pointUsed  number  default '0'
    ,pointUsedIndate date default sysdate
    ,constraint e_pointUsed_fk1 foreign key(userId) references e_user_tb(userId) on delete cascade
);

/*요청 테이블*/
create SEQUENCE reqNum_seq;
create table e_request_tb(
    reqNum  number  primary key
    ,userId varchar2(50)
    ,categoryCode  number 
    ,reqTitle   varchar2(100)   not null
    ,reqContent varchar2(200)   not null
    ,reqOriginalPic1    varchar2(200)
    ,reqOriginalPic2    varchar2(200)
    ,reqOriginalPic3    varchar2(200)
    ,reqIndate  date   default sysdate
    ,CONSTRAINT e_request_fk1 FOREIGN key(userId) REFERENCES e_user_tb(userId) on delete cascade
    ,CONSTRAINT e_request_fk2 FOREIGN key(categoryCode) REFERENCES e_category_tb(categoryCode) on delete cascade
);

/*카테고리 테이블*/
create table e_category_tb(
  categoryCode  number  primary key
  ,categoryName varchar2(50)    not null
);

/*요청글 코멘트 테이블*/
create sequence reqCommentNum_seq;
create table e_requestComment_tb(
    reqCommentNum   number  primary key
    ,userId varchar2(50)    not null
    ,reqNum number  not null
    ,reqComment varchar2(200)
    ,CONSTRAINT e_requestComment_fk1 FOREIGN key(userId) REFERENCES e_user_tb(userId) on delete cascade
    ,constraint e_requestComment_fk2 foreign key(reqNum) REFERENCES e_request_tb(reqNum) on delete cascade
);

/*채널 테이블*/
create sequence channel_seq;
create table e_channel_tb(
    chNum number PRIMARY KEY,
    chId VARCHAR2(50),
    chName VARCHAR2(50) default '0',
    chProfile VARCHAR2(200) default 'person1.png',
    chFollower number default '0',
    chIntro VARCHAR2(200) default '0',
    chIndate date default sysdate,
    CONSTRAINT e_chanel_tb_fk1 FOREIGN key(chId) REFERENCES e_user_tb(userId) on delete cascade
);
ALTER TABLE E_CHANNEL_TB MODIFY (CHNAME DEFAULT '0');

ALTER TABLE E_CHANNEL_TB MODIFY (CHPROFILE DEFAULT 'person1.png');

ALTER TABLE E_CHANNEL_TB MODIFY (CHFOLLOWER DEFAULT 0);

ALTER TABLE E_CHANNEL_TB MODIFY (CHINTRO DEFAULT '0');
commit;
/*상품 테이블*/
create sequence prodNum_sq;
CREATE TABLE E_PRODUCT_TB (
	PRODNUM NUMBER primary key,
	USERID VARCHAR2(50),
	CHNUM NUMBER,
	PRODCATEGORY NUMBER,
	PRODTITLE VARCHAR2(100) NOT NULL,
	PRODSTOCK NUMBER NOT NULL,
	PRODPRICE NUMBER NOT NULL,
	PRODCONTENT VARCHAR2(200),
	PRODORIGINALPIC1 VARCHAR2(200),
	PRODORIGINALPIC2 VARCHAR2(200),
	PRODORIGINALPIC3 VARCHAR2(200),
	PRODINDATE DATE DEFAULT sysdate,
    CONSTRAINT FK_E_USERR_TB FOREIGN KEY (USERID) REFERENCES E_USER_TB(USERID) on delete cascade,
	CONSTRAINT FK_E_CHANNEL_TB FOREIGN KEY (CHNUM) REFERENCES E_CHANNEL_TB(CHNUM) on delete cascade,
	CONSTRAINT FK_E_CATEGORY_TB FOREIGN KEY (PRODCATEGORY) REFERENCES E_CATEGORY_TB(CATEGORYCODE) on delete cascade
);

/*상품 코멘트 테이블*/
create sequence prodCommentNum_seq;
CREATE TABLE E_PRODUCTCOMMENT_TB (
	PRODCOMMENTNUM NUMBER primary key,
	USERID VARCHAR2(50),
	PRODNUM NUMBER,
	PRODCOMMENT VARCHAR2(200),
	CONSTRAINT FK_E_USER_TB FOREIGN KEY (USERID) REFERENCES E_USER_TB(USERID) on delete cascade
);
commit;
/*카트 테이블*/
create sequence cart_seq;
CREATE TABLE E_CART_TB (
	CARTPRODNUM NUMBER,
	USERID VARCHAR2(50),
	PRODNUM NUMBER,
	CARTPRODEA NUMBER,
	CONSTRAINT E_CART_TB_PK PRIMARY KEY (CARTPRODNUM),
	CONSTRAINT FK_E_USERRR_TB FOREIGN KEY (USERID) REFERENCES HR.E_USER_TB(USERID) on delete cascade,
	CONSTRAINT FK_E_PRODUCT_TB FOREIGN KEY (PRODNUM) REFERENCES HR.E_PRODUCT_TB(PRODNUM) on delete cascade
);

/*채팅방 테이블*/
create sequence chattingroom_seq;
create table e_chattingRoom_tb(
    chatNum NUMBER PRIMARY Key,
    userId VARCHAR2(50),
    chNum NUMBER,
    reqOriginalPic1 varchar2(200),
    CONSTRAINT e_chattingRoom_tb_fk1 FOREIGN key(userId)
    REFERENCES e_user_tb(userId) on delete cascade,
    CONSTRAINT e_chattingRoom_tb_fk2 FOREIGN key(chNum)
    REFERENCES e_channel_tb(chNum) on delete cascade
);

/*채팅 테이블*/
create sequence chat_seq;
create table e_chat_tb(
    roomNum NUMBER PRIMARY Key,
    content VARCHAR2(4000),
    CONSTRAINT e_chat_tb_fk1 FOREIGN key(roomNum)
    REFERENCES e_chattingRoom_tb(chatNum) on delete cascade
);

/*명세표 테이블*/
create table e_spec_tb(
    specNum NUMBER PRIMARY Key,
    userId VARCHAR2(50),
    chNum NUMBER,
    productName VARCHAR2(100) not null,
    productEa NUMBER not null,
    productPrice NUMBER not null,
    customerAddr VARCHAR2(100) not null,
    status varchar2(200) default '0',
    originalPic1 varchar2(200),
    CONSTRAINT e_spec_tb_fk1 FOREIGN key(userId)
    REFERENCES e_user_tb(userId) on delete cascade,
    CONSTRAINT e_spec_tb_fk2 FOREIGN key(chNum)
    REFERENCES e_channel_tb(chNum) on delete cascade
);
/*거래내역 테이블*/
create table e_dealHistory_tb(
    dealCode VARCHAR2(100) PRIMARY Key,
    specNum number,
    dealState char(1) default '1',
    dealIndate date DEFAULT sysdate,
    CONSTRAINT e_dealHistory_fk1 FOREIGN key(specNum)
    REFERENCES e_spec_tb(specNum) on delete cascade
);
ALTER TABLE e_dealHistory_tb MODIFY (dealState DEFAULT '1');
commit;
/*팔로잉 테이블*/
create sequence following_seq;
create table e_following_tb(
    followingNum number PRIMARY KEY,
    userId VARCHAR2(50),
    chNum NUMBER,
    CONSTRAINT e_following_tb_fk1 FOREIGN key(userId)
    REFERENCES e_user_tb(userId) on delete cascade,
    CONSTRAINT e_following_tb_fk2 FOREIGN key(chNum)
    REFERENCES e_channel_tb(chNum) on delete cascade
);

/*광고 테이블*/
create sequence adNum_seq;
create table e_ad_tb(
    adNum   number  primary key
    ,userId varchar2(50)
    ,prodNum number
    ,reqNum number
    ,adTotal  number  
    ,adChCharge number
    ,adProdCharge number
    ,adReqCharge number
    ,CONSTRAINT FK_E_ad_1 FOREIGN KEY (userId) REFERENCES e_user_tb(userId) on delete cascade
	,CONSTRAINT FK_E_ad_2 FOREIGN KEY (prodNum) REFERENCES e_product_tb(prodNum) on delete cascade
    ,CONSTRAINT FK_E_ad_3 FOREIGN KEY (reqNum) REFERENCES e_request_tb(reqNum) on delete cascade
);

insert into e_category_tb(
    categoryCode
    ,categoryName
)values(
    1
    ,'fashion_acc'
);
insert into e_category_tb(
    categoryCode
    ,categoryName
)values(
    2
    ,'Beauty'
);
insert into e_category_tb(
    categoryCode
    ,categoryName
)values(
    3
    ,'Food'
);
insert into e_category_tb(
    categoryCode
    ,categoryName
)values(
    4
    ,'Book_cd'
);
insert into e_category_tb(
    categoryCode
    ,categoryName
)values(
    5
    ,'Ect'
);

insert into e_pointproduct_tb(pointProdNum, pointprodName, priceUsd, priceYen) VALUES(pointProdNum_seq.nextval, 5000, 5, 500);
insert into e_pointproduct_tb(pointProdNum, pointprodName, priceUsd, priceYen) VALUES(pointProdNum_seq.nextval, 10000, 10, 1000);
insert into e_pointproduct_tb(pointProdNum, pointprodName, priceUsd, priceYen) VALUES(pointProdNum_seq.nextval, 50000, 50, 5000);

commit;
drop table e_user_tb;
drop table e_ad_tb;

drop table e_cart_tb;
drop table e_category_tb;
drop table e_channel_tb;
drop table e_chat_tb;
drop table e_chattingroom_tb;

drop table e_dealhistory_tb;
drop table e_following_tb;
drop table e_point_tb;
drop table e_pointproduct_tb;
drop table e_pointused_tb;

drop table e_product_tb;
drop table e_productcomment_tb;
drop table e_request_tb;
drop table e_requestcomment_tb;
drop table e_spec_tb;

drop sequence chat_seq;
drop sequence chattingroom_seq;
drop sequence channel_seq;
drop sequence point_seq;
drop sequence pointProdNum_seq;
drop sequence pointusednum_seq;
drop sequence prodnum_sq;
drop sequence reqnum_seq;
drop sequence spec_seq;
drop sequence reqcommentnum_seq;
drop sequence adNum_seq;
drop sequence cart_seq;
drop sequence prodCommentNum_seq;
drop sequence following_seq;

commit;