
DROP SEQUENCE board_reply_seq;



CREATE SEQUENCE board_reply_seq;



DROP SEQUENCE board_seq;



CREATE SEQUENCE board_seq;



DROP TABLE board_reply CASCADE CONSTRAINTS;



DROP TABLE board CASCADE CONSTRAINTS;



CREATE TABLE board
(
	no                    NUMBER  NOT NULL ,
	title                 VARCHAR2()  NOT NULL ,
	content               VARCHAR2()  NOT NULL ,
	writer                VARCHAR2()  NOT NULL ,
	writeDate             DATE   DEFAULT  sysdate NOT NULL ,
	pw                    VARCHAR2()  NOT NULL ,
	hit                   NUMBER   DEFAULT  0 NULL ,
CONSTRAINT  XPK일반게시판 PRIMARY KEY (no)
);



CREATE TABLE board_reply
(
	rno                   NUMBER  NOT NULL ,
	no                    NUMBER  NOT NULL ,
	contente              VARCHAR2()  NOT NULL ,
	writer                VARCHAR2()  NOT NULL ,
	writeDate             DATE   DEFAULT  sysdate NOT NULL ,
	pw                    VARCHAR2()  NOT NULL ,
CONSTRAINT  XPK일반게시판_댓글 PRIMARY KEY (rno)
);



ALTER TABLE board_reply
	ADD (CONSTRAINT  R_1 FOREIGN KEY (no) REFERENCES board(no) ON DELETE CASCADE);


