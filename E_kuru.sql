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
);

create table e_category_tb(
  categoryCode  number  primary key
  ,categoryName varchar2(50)    not null
);

create table e_request_tb(
    reqNum  number  primary key
    ,userId varchar2(50)
    ,categoryCode  number 
    ,reqTitle   varchar2(100)   not null
    ,reqContent varchar2(200)   not null
    ,reqOriginalPic1    varchar2(200)
    ,reqOriginalPic2    varchar2(200)
    ,reqOriginalPic3    varchar2(200)
    ,reqSavedPic1   varchar2(200)
    ,reqSavedPic2   varchar2(200)
    ,reqSavedPic3   varchar2(200)
    ,reqIndate  date   default sysdate
    ,CONSTRAINT e_request_fk1 FOREIGN key(userId) REFERENCES e_user_tb(userId)
    ,CONSTRAINT e_request_fk2 FOREIGN key(categoryCode) REFERENCES e_category_tb(categoryCode)
);

create SEQUENCE reqNum_seq;

create table e_requestComment_tb(
    reqCommentNum   number  primary key
    ,userId varchar2(50)    not null
    ,reqNum number  not null
    ,reqComment varchar2(200)
    ,CONSTRAINT e_requestComment_fk1 FOREIGN key(userId) REFERENCES e_user_tb(userId)
    ,constraint e_requestComment_fk2 foreign key(reqNum) REFERENCES e_request_tb(reqNum)
);

create sequence reqCommentNum_seq;

create SEQUENCE chattingRoom_seq;

create table e_channel_tb(
    chNum number PRIMARY KEY,
    chId VARCHAR2(50),
    chName VARCHAR2(50) not null,
    chProfile VARCHAR2(200) not null,
    chFollower number not null,
    chIntro VARCHAR2(200) not null,
    chIndate date default sysdate,
    CONSTRAINT e_chanel_tb_fk1 FOREIGN key(chId)
    REFERENCES e_user_tb(userId)
);

create table e_following_tb(
    followingNum number PRIMARY KEY,
    userId VARCHAR2(50),
    chNum NUMBER,
    CONSTRAINT e_following_tb_fk1 FOREIGN key(userId)
    REFERENCES e_user_tb(userId),
    CONSTRAINT e_following_tb_fk2 FOREIGN key(chNum)
    REFERENCES e_channel_tb(chNum)
);

create table e_chattingRoom_tb(
    chatNum NUMBER PRIMARY Key,
    userId VARCHAR2(50),
    chNum NUMBER,
    CONSTRAINT e_chattingRoom_tb_fk1 FOREIGN key(userId)
    REFERENCES e_user_tb(userId),
    CONSTRAINT e_chattingRoom_tb_fk2 FOREIGN key(chNum)
    REFERENCES e_channel_tb(chNum)
);

create table e_pointProduct_tb(
    pointProdNum    number  primary key
    ,pointProdName number   unique not null
    ,priceWon   number  not null
    ,priceYen   number  not null
);

create sequence pointProdNum_seq;

create table e_point_tb(
    pointChargeNum  number  primary key
    ,userId varchar2(50)
    ,pointProdNum   number
    ,pointChargedIndate date    default sysdate
    ,constraint e_point_fk1 foreign key(userId) references e_user_tb(userId)
    ,constraint e_point_fk2 foreign key(pointProdNum) references e_pointProduct_tb(pointProdNum)
);

create table e_pointUsed_tb(
    pointUsedNum    number  primary key
    ,userId varchar2(50)
    ,pointUsed  number  default '0'
    ,pointUsedIndate date default sysdate
    ,constraint e_pointUsed_fk1 foreign key(userId) references e_user_tb(userId)
);

create sequence pointUsedNum_seq;

drop table e_product_tb;

CREATE TABLE E_PRODUCT_TB (
	PRODNUM NUMBER,
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
	PRODSAVEDPIC1 VARCHAR2(200),
	PRODSAVEDPIC2 VARCHAR2(200),
	PRODSAVEDPIC3 VARCHAR2(200),
	PRODINDATE DATE DEFAULT sysdate,
	CONSTRAINT E_PRODUCT_TB_PK PRIMARY KEY (PRODNUM),
	CONSTRAINT FK_E_USERR_TB FOREIGN KEY (USERID) REFERENCES E_USER_TB(USERID),
	CONSTRAINT FK_E_CHANNEL_TB FOREIGN KEY (CHNUM) REFERENCES E_CHANNEL_TB(CHNUM),
	CONSTRAINT FK_E_CATEGORY_TB FOREIGN KEY (PRODCATEGORY) REFERENCES E_CATEGORY_TB(CATEGORYCODE)
);

create SEQUENCE chattingRoom_seq;
create SEQUENCE spec_seq;
create SEQUENCE channel_seq;

create table e_spec_tb(
    specNum NUMBER PRIMARY Key,
    userId VARCHAR2(50),
    chNum NUMBER,
    productName VARCHAR2(100) not null,
    productEa NUMBER not null,
    productPrice NUMBER not null,
    customerAddr VARCHAR2(50) not null,
    CONSTRAINT e_spec_tb_fk1 FOREIGN key(userId)
    REFERENCES e_user_tb(userId),
    CONSTRAINT e_spec_tb_fk2 FOREIGN key(chNum)
    REFERENCES e_channel_tb(chNum)
);

create table e_dealHistory_tb(
    dealCode VARCHAR2(100) PRIMARY Key,
    specNum number,
    dealState char(1) not null,
    dealIndate date DEFAULT sysdate,
    CONSTRAINT e_dealHistory_fk1 FOREIGN key(specNum)
    REFERENCES e_spec_tb(specNum)
);

create table e_ad_tb(
    adNum   number  primary key
    ,userId varchar2(50)
    ,prodNum number
    ,reqNum number
    ,adTotal  number  
    ,adChCharge number
    ,adProdCharge number
    ,adReqCharge number
    ,CONSTRAINT FK_E_ad_1 FOREIGN KEY (userId) REFERENCES e_user_tb(userId)
	,CONSTRAINT FK_E_ad_2 FOREIGN KEY (prodNum) REFERENCES e_product_tb(prodNum)
    ,CONSTRAINT FK_E_ad_3 FOREIGN KEY (reqNum) REFERENCES e_request_tb(reqNum)
);

create sequence adNum_seq;

CREATE TABLE E_CART_TB (
	CARTPRODNUM NUMBER,
	USERID VARCHAR2(50),
	PRODNUM NUMBER,
	CARTPRODEA NUMBER,
	CONSTRAINT E_CART_TB_PK PRIMARY KEY (CARTPRODNUM),
	CONSTRAINT FK_E_USERRR_TB FOREIGN KEY (USERID) REFERENCES HR.E_USER_TB(USERID),
	CONSTRAINT FK_E_PRODUCT_TB FOREIGN KEY (PRODNUM) REFERENCES HR.E_PRODUCT_TB(PRODNUM)
);

CREATE TABLE E_PRODUCTCOMMENT_TB (
	PRODCOMMENTNUM NUMBER,
	USERID VARCHAR2(50),
	PRODNUM NUMBER,
	PRODCOMMENT VARCHAR2(200),
	CONSTRAINT E_PRODUCTCOMMENT_TB_PK PRIMARY KEY (PRODCOMMENTNUM),
	CONSTRAINT FK_E_USER_TB FOREIGN KEY (USERID) REFERENCES E_USER_TB(USERID)
);