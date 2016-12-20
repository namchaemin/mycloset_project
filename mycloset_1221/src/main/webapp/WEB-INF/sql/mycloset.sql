﻿/* 내옷장정보 */
DROP TABLE MYCLOSET 
    CASCADE CONSTRAINTS;

/* 회원정보 */
DROP TABLE USER_INFO 
    CASCADE CONSTRAINTS;

/* 스타일정보 */
DROP TABLE STYLE 
    CASCADE CONSTRAINTS;

/* 옷장에담은스타일 */
DROP TABLE INTO_CLS 
    CASCADE CONSTRAINTS;

/* 태그정보 */
DROP TABLE TAG 
    CASCADE CONSTRAINTS;

/* 팔로우한정보 */
DROP TABLE FOLLOW 
    CASCADE CONSTRAINTS;

/* 채팅메시지정보 */
DROP TABLE CHAT 
    CASCADE CONSTRAINTS;

/* 댓글정보 */
DROP TABLE CMT_INFO 
    CASCADE CONSTRAINTS;

/* 스타일좋아요 */
DROP TABLE STYLE_LIKE 
    CASCADE CONSTRAINTS;

/* 내옷장정보 */
CREATE TABLE MYCLOSET (
    CLS_NO INTEGER NOT NULL, /* 옷장일련번호 */
    USER_NO INTEGER NOT NULL, /* 회원일련번호 */
    CLS_NAME VARCHAR2(50) NOT NULL /* 내옷장이름 */
);

CREATE UNIQUE INDEX PK_MYCLOSET
    ON MYCLOSET (
        CLS_NO ASC
    );

ALTER TABLE MYCLOSET
    ADD
        CONSTRAINT PK_MYCLOSET
        PRIMARY KEY (
            CLS_NO
        );

/* 회원정보 */
CREATE TABLE USER_INFO (
    USER_NO INTEGER NOT NULL, /* 회원일련번호 */
    EMAIL VARCHAR2(40) NOT NULL, /* 회원이메일 */
    NICK VARCHAR2(50) NOT NULL, /* 회원닉네임 */
    PWD VARCHAR2(255) NOT NULL, /* 비밀번호 */
    PHOT_PATH VARCHAR2(255) /* 회원프로필사진 */
);

CREATE UNIQUE INDEX PK_USER_INFO
    ON USER_INFO (
        USER_NO ASC
    );

CREATE UNIQUE INDEX UIX_USER_INFO
    ON USER_INFO (
        EMAIL ASC,
        NICK ASC,
        PWD ASC
    );

ALTER TABLE USER_INFO
    ADD
        CONSTRAINT PK_USER_INFO
        PRIMARY KEY (
            USER_NO
        );

ALTER TABLE USER_INFO
    ADD
        CONSTRAINT UK_USER_INFO
        UNIQUE (
            EMAIL,
            NICK,
            PWD
        );

/* 스타일정보 */
CREATE TABLE STYLE (
    STYLE_NO INTEGER NOT NULL, /* 스타일련번호 */
    USER_NO INTEGER NOT NULL, /* 회원일련번호 */
    CLS_TYPE VARCHAR2(255) NOT NULL, /* 의류분류 */
    CLS_PATH VARCHAR2(255) NOT NULL, /* 스타일사진경로 */
    CLS_BUY VARCHAR2(50), /* 구매처 */
    CLS_CMT VARCHAR2(50), /* 스타일 내용 */
    CLS_LIKE INTEGER /* 좋아요토탈 */
);

CREATE UNIQUE INDEX PK_STYLE
    ON STYLE (
        STYLE_NO ASC
    );

ALTER TABLE STYLE
    ADD
        CONSTRAINT PK_STYLE
        PRIMARY KEY (
            STYLE_NO
        );

/* 옷장에담은스타일 */
CREATE TABLE INTO_CLS (
    STYLE_NO INTEGER NOT NULL, /* 스타일련번호 */
    CLS_NO INTEGER NOT NULL /* 옷장일련번호 */
);

CREATE UNIQUE INDEX PK_INTO_CLS
    ON INTO_CLS (
        STYLE_NO ASC,
        CLS_NO ASC
    );

ALTER TABLE INTO_CLS
    ADD
        CONSTRAINT PK_INTO_CLS
        PRIMARY KEY (
            STYLE_NO,
            CLS_NO
        );

/* 태그정보 */
CREATE TABLE TAG (
    TAG_NO INTEGER NOT NULL, /* 태그일련번호 */
    STYLE_NO INTEGER NOT NULL, /* 스타일련번호 */
    XY VARCHAR2(255), /* 옷X,Y좌표 */
    BRAND VARCHAR2(50), /* 옷브랜드이름 */
    PRICE INTEGER /* 옷가격 */
);

CREATE UNIQUE INDEX PK_TAG
    ON TAG (
        TAG_NO ASC
    );

ALTER TABLE TAG
    ADD
        CONSTRAINT PK_TAG
        PRIMARY KEY (
            TAG_NO
        );

/* 팔로우한정보 */
CREATE TABLE FOLLOW (
    FLW_NO INTEGER NOT NULL, /* 팔로우일련번호 */
    USER_NO2 INTEGER NOT NULL, /* 팔로우회원일련번호 */
    USER_NO INTEGER NOT NULL /* 회원일련번호 */
);

CREATE UNIQUE INDEX PK_FOLLOW
    ON FOLLOW (
        FLW_NO ASC
    );

ALTER TABLE FOLLOW
    ADD
        CONSTRAINT PK_FOLLOW
        PRIMARY KEY (
            FLW_NO
        );

/* 채팅메시지정보 */
CREATE TABLE CHAT (
    CHAT_NO INTEGER NOT NULL, /* 채팅방일련번호 */
    USER_NO2 INTEGER NOT NULL, /* 보내는회원일련번호 */
    USER_NO INTEGER NOT NULL, /* 받는회원일련번호 */
    MSG VARCHAR2(255), /* 메시지내용 */
    HRS VARCHAR2(50) /* 시간 */
);

CREATE UNIQUE INDEX PK_CHAT
    ON CHAT (
        CHAT_NO ASC
    );

ALTER TABLE CHAT
    ADD
        CONSTRAINT PK_CHAT
        PRIMARY KEY (
            CHAT_NO
        );

/* 댓글정보 */
CREATE TABLE CMT_INFO (
    CMT_NO INTEGER NOT NULL, /* 댓글일련번호 */
    STYLE_NO INTEGER NOT NULL, /* 스타일련번호 */
    USER_NO INTEGER NOT NULL, /* 회원일련번호 */
    CONTENT VARCHAR2(50) NOT NULL, /* 글내용 */
    HRS VARCHAR2(50) /* 시간 */
);

CREATE UNIQUE INDEX PK_CMT_INFO
    ON CMT_INFO (
        CMT_NO ASC
    );

ALTER TABLE CMT_INFO
    ADD
        CONSTRAINT PK_CMT_INFO
        PRIMARY KEY (
            CMT_NO
        );

/* 스타일좋아요 */
CREATE TABLE STYLE_LIKE (
    STYLE_NO INTEGER NOT NULL, /* 스타일련번호 */
    USER_NO INTEGER NOT NULL /* 회원일련번호 */
);

CREATE UNIQUE INDEX PK_STYLE_LIKE
    ON STYLE_LIKE (
        STYLE_NO ASC,
        USER_NO ASC
    );

ALTER TABLE STYLE_LIKE
    ADD
        CONSTRAINT PK_STYLE_LIKE
        PRIMARY KEY (
            STYLE_NO,
            USER_NO
        );

ALTER TABLE MYCLOSET
    ADD
        CONSTRAINT FK_USER_INFO_TO_MYCLOSET
        FOREIGN KEY (
            USER_NO
        )
        REFERENCES USER_INFO (
            USER_NO
        );

ALTER TABLE STYLE
    ADD
        CONSTRAINT FK_USER_INFO_TO_STYLE
        FOREIGN KEY (
            USER_NO
        )
        REFERENCES USER_INFO (
            USER_NO
        );

ALTER TABLE INTO_CLS
    ADD
        CONSTRAINT FK_STYLE_TO_INTO_CLS
        FOREIGN KEY (
            STYLE_NO
        )
        REFERENCES STYLE (
            STYLE_NO
        );

ALTER TABLE INTO_CLS
    ADD
        CONSTRAINT FK_MYCLOSET_TO_INTO_CLS
        FOREIGN KEY (
            CLS_NO
        )
        REFERENCES MYCLOSET (
            CLS_NO
        );

ALTER TABLE TAG
    ADD
        CONSTRAINT FK_STYLE_TO_TAG
        FOREIGN KEY (
            STYLE_NO
        )
        REFERENCES STYLE (
            STYLE_NO
        );

ALTER TABLE FOLLOW
    ADD
        CONSTRAINT FK_USER_INFO_TO_FOLLOW2
        FOREIGN KEY (
            USER_NO2
        )
        REFERENCES USER_INFO (
            USER_NO
        );

ALTER TABLE FOLLOW
    ADD
        CONSTRAINT FK_USER_INFO_TO_FOLLOW
        FOREIGN KEY (
            USER_NO
        )
        REFERENCES USER_INFO (
            USER_NO
        );

ALTER TABLE CHAT
    ADD
        CONSTRAINT FK_USER_INFO_TO_CHAT2
        FOREIGN KEY (
            USER_NO2
        )
        REFERENCES USER_INFO (
            USER_NO
        );

ALTER TABLE CHAT
    ADD
        CONSTRAINT FK_USER_INFO_TO_CHAT
        FOREIGN KEY (
            USER_NO
        )
        REFERENCES USER_INFO (
            USER_NO
        );

ALTER TABLE CMT_INFO
    ADD
        CONSTRAINT FK_STYLE_TO_CMT_INFO
        FOREIGN KEY (
            STYLE_NO
        )
        REFERENCES STYLE (
            STYLE_NO
        );

ALTER TABLE CMT_INFO
    ADD
        CONSTRAINT FK_USER_INFO_TO_CMT_INFO
        FOREIGN KEY (
            USER_NO
        )
        REFERENCES USER_INFO (
            USER_NO
        );

ALTER TABLE STYLE_LIKE
    ADD
        CONSTRAINT FK_STYLE_TO_STYLE_LIKE
        FOREIGN KEY (
            STYLE_NO
        )
        REFERENCES STYLE (
            STYLE_NO
        );

ALTER TABLE STYLE_LIKE
    ADD
        CONSTRAINT FK_USER_INFO_TO_STYLE_LIKE
        FOREIGN KEY (
            USER_NO
        )
        REFERENCES USER_INFO (
            USER_NO
        );
drop sequence UNO;
create sequence UNO
  start with 1
  increment BY 1
  maxvalue 100;