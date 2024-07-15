
CREATE TABLE board
(
	no                    NUMBER  NOT NULL ,
	title                 VARCHAR2()  NOT NULL ,
	content               VARCHAR2()  NOT NULL ,
	writer                VARCHAR2()  NOT NULL ,
	writeDate             DATE   DEFAULT  sysdate NOT NULL ,
	pw                    VARCHAR2()  NOT NULL ,
	hit                   NUMBER   DEFAULT  0 NULL 
);



CREATE UNIQUE INDEX XPK일반게시판 ON board
(no  ASC);



ALTER TABLE board
	ADD CONSTRAINT  XPK일반게시판 PRIMARY KEY (no);



CREATE TABLE board_reply
(
	rno                   NUMBER  NOT NULL ,
	no                    NUMBER  NOT NULL ,
	content               VARCHAR2()  NOT NULL ,
	writer                VARCHAR2()  NOT NULL ,
	writeDate             DATE   DEFAULT  sysdate NOT NULL ,
	pw                    VARCHAR2()  NOT NULL 
);



CREATE UNIQUE INDEX XPK일반게시판_댓글 ON board_reply
(rno  ASC);



ALTER TABLE board_reply
	ADD CONSTRAINT  XPK일반게시판_댓글 PRIMARY KEY (rno);



CREATE TABLE grade
(
	gradeNo               NUMBER  NOT NULL ,
	gradeName             VARCHAR2()  NOT NULL 
);



CREATE UNIQUE INDEX XPK회원등급 ON grade
(gradeNo  ASC);



ALTER TABLE grade
	ADD CONSTRAINT  XPK회원등급 PRIMARY KEY (gradeNo);



CREATE TABLE member
(
	pw                    VARCHAR2()  NOT NULL ,
	name                  VARCHAR2()  NOT NULL ,
	gender                VARCHAR2()  NOT NULL  CONSTRAINT  member_gender_ck CHECK (gender in ('남자', '여자')),
	birth                 DATE  NOT NULL ,
	tel                   VARCHAR2()  NULL ,
	email                 VARCHAR2()  NOT NULL ,
	writeDate             DATE   DEFAULT  sysdate NULL ,
	conDate               DATE   DEFAULT  sysdate NULL ,
	photo                 VARCHAR2()  NOT NULL ,
	status                VARCHAR2()   DEFAULT  "정상" NOT NULL  CONSTRAINT  member_status_ck CHECK (status in ('정상','강퇴', '탈퇴','휴면')),
	gradeNo               NUMBER   DEFAULT  1 NOT NULL ,
	newMsg                CHAR(18)  NULL ,
	id                    VARCHAR2()  NOT NULL 
);



CREATE UNIQUE INDEX XPK회원 ON member
(id  ASC);



ALTER TABLE member
	ADD CONSTRAINT  XPK회원 PRIMARY KEY (id);



CREATE TABLE message
(
	no                    NUMBER  NOT NULL ,
	acceptDate            DATE   DEFAULT  sysdate NULL ,
	content               VARCHAR2()  NULL ,
	sendDate              DATE   DEFAULT  sysdate NULL ,
	accepterId            VARCHAR2()  NULL ,
	senderId              VARCHAR2()  NULL 
);



CREATE UNIQUE INDEX XPK메시지 ON message
(no  ASC);



ALTER TABLE message
	ADD CONSTRAINT  XPK메시지 PRIMARY KEY (no);



CREATE TABLE qna
(
	no                    NUMBER  NOT NULL ,
	parentNo              NUMBER  NULL ,
	refNo                 NUMBER  NULL ,
	title                 VARCHAR2()  NULL ,
	content               VARCHAR2()  NULL ,
	writeDate             DATE  NULL ,
	ordNo                 NUMBER  NULL ,
	levNo                 NUMBER  NULL ,
	id                    VARCHAR2()  NULL 
);



CREATE UNIQUE INDEX XPK질문답변 ON qna
(no  ASC);



ALTER TABLE qna
	ADD CONSTRAINT  XPK질문답변 PRIMARY KEY (no);



ALTER TABLE board_reply
	ADD (CONSTRAINT  R_1 FOREIGN KEY (no) REFERENCES board(no) ON DELETE CASCADE);



ALTER TABLE member
	ADD (CONSTRAINT  R_4 FOREIGN KEY (gradeNo) REFERENCES grade(gradeNo) ON DELETE SET NULL);



ALTER TABLE message
	ADD (CONSTRAINT  R_9 FOREIGN KEY (accepterId) REFERENCES member(id) ON DELETE SET NULL);



ALTER TABLE message
	ADD (CONSTRAINT  R_11 FOREIGN KEY (senderId) REFERENCES member(id) ON DELETE SET NULL);



ALTER TABLE qna
	ADD (CONSTRAINT  R_20 FOREIGN KEY (refNo) REFERENCES qna(no) ON DELETE SET NULL);



ALTER TABLE qna
	ADD (CONSTRAINT  R_21 FOREIGN KEY (id) REFERENCES member(id) ON DELETE SET NULL);



ALTER TABLE qna
	ADD (CONSTRAINT  R_22 FOREIGN KEY (parentNo) REFERENCES qna(no) ON DELETE SET NULL);



CREATE  TRIGGER tD_board AFTER DELETE ON board for each row
-- ERwin Builtin 2024년 7월 15일 월요일 오전 10:42:03
-- DELETE trigger on board 
DECLARE NUMROWS INTEGER;
BEGIN
    /* ERwin Builtin 2024년 7월 15일 월요일 오전 10:42:03 */
    /* board  board_reply on parent delete cascade */
    /* ERWIN_RELATION:CHECKSUM="0000a836", PARENT_OWNER="", PARENT_TABLE="board"
    CHILD_OWNER="", CHILD_TABLE="board_reply"
    P2C_VERB_PHRASE="R/3", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_1", FK_COLUMNS="no" */
    DELETE FROM board_reply
      WHERE
        /*  %JoinFKPK(board_reply,:%Old," = "," AND") */
        board_reply.no = :old.no;


-- ERwin Builtin 2024년 7월 15일 월요일 오전 10:42:03
END;
/

CREATE  TRIGGER tU_board AFTER UPDATE ON board for each row
-- ERwin Builtin 2024년 7월 15일 월요일 오전 10:42:03
-- UPDATE trigger on board 
DECLARE NUMROWS INTEGER;
BEGIN
  /* board  board_reply on parent update set null */
  /* ERWIN_RELATION:CHECKSUM="0000d868", PARENT_OWNER="", PARENT_TABLE="board"
    CHILD_OWNER="", CHILD_TABLE="board_reply"
    P2C_VERB_PHRASE="R/3", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_1", FK_COLUMNS="no" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.no <> :new.no
  THEN
    UPDATE board_reply
      SET
        /* %SetFK(board_reply,NULL) */
        board_reply.no = NULL
      WHERE
        /* %JoinFKPK(board_reply,:%Old," = ",",") */
        board_reply.no = :old.no;
  END IF;


-- ERwin Builtin 2024년 7월 15일 월요일 오전 10:42:03
END;
/


CREATE  TRIGGER tI_board_reply BEFORE INSERT ON board_reply for each row
-- ERwin Builtin 2024년 7월 15일 월요일 오전 10:42:03
-- INSERT trigger on board_reply 
DECLARE NUMROWS INTEGER;
BEGIN
    /* ERwin Builtin 2024년 7월 15일 월요일 오전 10:42:03 */
    /* board  board_reply on child insert set null */
    /* ERWIN_RELATION:CHECKSUM="0000e468", PARENT_OWNER="", PARENT_TABLE="board"
    CHILD_OWNER="", CHILD_TABLE="board_reply"
    P2C_VERB_PHRASE="R/3", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_1", FK_COLUMNS="no" */
    UPDATE board_reply
      SET
        /* %SetFK(board_reply,NULL) */
        board_reply.no = NULL
      WHERE
        NOT EXISTS (
          SELECT * FROM board
            WHERE
              /* %JoinFKPK(:%New,board," = "," AND") */
              :new.no = board.no
        ) 
        /* %JoinPKPK(board_reply,:%New," = "," AND") */
         and board_reply.rno = :new.rno;


-- ERwin Builtin 2024년 7월 15일 월요일 오전 10:42:03
END;
/

CREATE  TRIGGER tU_board_reply AFTER UPDATE ON board_reply for each row
-- ERwin Builtin 2024년 7월 15일 월요일 오전 10:42:03
-- UPDATE trigger on board_reply 
DECLARE NUMROWS INTEGER;
BEGIN
  /* ERwin Builtin 2024년 7월 15일 월요일 오전 10:42:03 */
  /* board  board_reply on child update no action */
  /* ERWIN_RELATION:CHECKSUM="0000fa26", PARENT_OWNER="", PARENT_TABLE="board"
    CHILD_OWNER="", CHILD_TABLE="board_reply"
    P2C_VERB_PHRASE="R/3", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_1", FK_COLUMNS="no" */
  SELECT count(*) INTO NUMROWS
    FROM board
    WHERE
      /* %JoinFKPK(:%New,board," = "," AND") */
      :new.no = board.no;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    :new.no IS NOT NULL AND
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update board_reply because board does not exist.'
    );
  END IF;


-- ERwin Builtin 2024년 7월 15일 월요일 오전 10:42:03
END;
/


CREATE  TRIGGER tD_grade AFTER DELETE ON grade for each row
-- ERwin Builtin 2024년 7월 15일 월요일 오전 10:42:03
-- DELETE trigger on grade 
DECLARE NUMROWS INTEGER;
BEGIN
    /* ERwin Builtin 2024년 7월 15일 월요일 오전 10:42:03 */
    /* grade  member on parent delete set null */
    /* ERWIN_RELATION:CHECKSUM="0000b703", PARENT_OWNER="", PARENT_TABLE="grade"
    CHILD_OWNER="", CHILD_TABLE="member"
    P2C_VERB_PHRASE="R/4", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_4", FK_COLUMNS="gradeNo" */
    UPDATE member
      SET
        /* %SetFK(member,NULL) */
        member.gradeNo = NULL
      WHERE
        /* %JoinFKPK(member,:%Old," = "," AND") */
        member.gradeNo = :old.gradeNo;


-- ERwin Builtin 2024년 7월 15일 월요일 오전 10:42:03
END;
/

CREATE  TRIGGER tU_grade AFTER UPDATE ON grade for each row
-- ERwin Builtin 2024년 7월 15일 월요일 오전 10:42:03
-- UPDATE trigger on grade 
DECLARE NUMROWS INTEGER;
BEGIN
  /* grade  member on parent update set null */
  /* ERWIN_RELATION:CHECKSUM="0000dd1c", PARENT_OWNER="", PARENT_TABLE="grade"
    CHILD_OWNER="", CHILD_TABLE="member"
    P2C_VERB_PHRASE="R/4", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_4", FK_COLUMNS="gradeNo" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.gradeNo <> :new.gradeNo
  THEN
    UPDATE member
      SET
        /* %SetFK(member,NULL) */
        member.gradeNo = NULL
      WHERE
        /* %JoinFKPK(member,:%Old," = ",",") */
        member.gradeNo = :old.gradeNo;
  END IF;


-- ERwin Builtin 2024년 7월 15일 월요일 오전 10:42:03
END;
/


CREATE  TRIGGER tI_member BEFORE INSERT ON member for each row
-- ERwin Builtin 2024년 7월 15일 월요일 오전 10:42:03
-- INSERT trigger on member 
DECLARE NUMROWS INTEGER;
BEGIN
    /* ERwin Builtin 2024년 7월 15일 월요일 오전 10:42:03 */
    /* grade  member on child insert set null */
    /* ERWIN_RELATION:CHECKSUM="0000e1c0", PARENT_OWNER="", PARENT_TABLE="grade"
    CHILD_OWNER="", CHILD_TABLE="member"
    P2C_VERB_PHRASE="R/4", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_4", FK_COLUMNS="gradeNo" */
    UPDATE member
      SET
        /* %SetFK(member,NULL) */
        member.gradeNo = NULL
      WHERE
        NOT EXISTS (
          SELECT * FROM grade
            WHERE
              /* %JoinFKPK(:%New,grade," = "," AND") */
              :new.gradeNo = grade.gradeNo
        ) 
        /* %JoinPKPK(member,:%New," = "," AND") */
         and member.id = :new.id;


-- ERwin Builtin 2024년 7월 15일 월요일 오전 10:42:03
END;
/

CREATE  TRIGGER tD_member AFTER DELETE ON member for each row
-- ERwin Builtin 2024년 7월 15일 월요일 오전 10:42:03
-- DELETE trigger on member 
DECLARE NUMROWS INTEGER;
BEGIN
    /* ERwin Builtin 2024년 7월 15일 월요일 오전 10:42:03 */
    /* member  message on parent delete set null */
    /* ERWIN_RELATION:CHECKSUM="00023b87", PARENT_OWNER="", PARENT_TABLE="member"
    CHILD_OWNER="", CHILD_TABLE="message"
    P2C_VERB_PHRASE="R/9", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_9", FK_COLUMNS="accepterId" */
    UPDATE message
      SET
        /* %SetFK(message,NULL) */
        message.accepterId = NULL
      WHERE
        /* %JoinFKPK(message,:%Old," = "," AND") */
        message.accepterId = :old.id;

    /* ERwin Builtin 2024년 7월 15일 월요일 오전 10:42:03 */
    /* member  message on parent delete set null */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="member"
    CHILD_OWNER="", CHILD_TABLE="message"
    P2C_VERB_PHRASE="R/11", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_11", FK_COLUMNS="senderId" */
    UPDATE message
      SET
        /* %SetFK(message,NULL) */
        message.senderId = NULL
      WHERE
        /* %JoinFKPK(message,:%Old," = "," AND") */
        message.senderId = :old.id;

    /* ERwin Builtin 2024년 7월 15일 월요일 오전 10:42:03 */
    /* member  qna on parent delete set null */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="member"
    CHILD_OWNER="", CHILD_TABLE="qna"
    P2C_VERB_PHRASE="R/21", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_21", FK_COLUMNS="id" */
    UPDATE qna
      SET
        /* %SetFK(qna,NULL) */
        qna.id = NULL
      WHERE
        /* %JoinFKPK(qna,:%Old," = "," AND") */
        qna.id = :old.id;


-- ERwin Builtin 2024년 7월 15일 월요일 오전 10:42:03
END;
/

CREATE  TRIGGER tU_member AFTER UPDATE ON member for each row
-- ERwin Builtin 2024년 7월 15일 월요일 오전 10:42:03
-- UPDATE trigger on member 
DECLARE NUMROWS INTEGER;
BEGIN
  /* member  message on parent update set null */
  /* ERWIN_RELATION:CHECKSUM="00036424", PARENT_OWNER="", PARENT_TABLE="member"
    CHILD_OWNER="", CHILD_TABLE="message"
    P2C_VERB_PHRASE="R/9", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_9", FK_COLUMNS="accepterId" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.id <> :new.id
  THEN
    UPDATE message
      SET
        /* %SetFK(message,NULL) */
        message.accepterId = NULL
      WHERE
        /* %JoinFKPK(message,:%Old," = ",",") */
        message.accepterId = :old.id;
  END IF;

  /* member  message on parent update set null */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="member"
    CHILD_OWNER="", CHILD_TABLE="message"
    P2C_VERB_PHRASE="R/11", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_11", FK_COLUMNS="senderId" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.id <> :new.id
  THEN
    UPDATE message
      SET
        /* %SetFK(message,NULL) */
        message.senderId = NULL
      WHERE
        /* %JoinFKPK(message,:%Old," = ",",") */
        message.senderId = :old.id;
  END IF;

  /* member  qna on parent update set null */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="member"
    CHILD_OWNER="", CHILD_TABLE="qna"
    P2C_VERB_PHRASE="R/21", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_21", FK_COLUMNS="id" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.id <> :new.id
  THEN
    UPDATE qna
      SET
        /* %SetFK(qna,NULL) */
        qna.id = NULL
      WHERE
        /* %JoinFKPK(qna,:%Old," = ",",") */
        qna.id = :old.id;
  END IF;

  /* ERwin Builtin 2024년 7월 15일 월요일 오전 10:42:03 */
  /* grade  member on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="grade"
    CHILD_OWNER="", CHILD_TABLE="member"
    P2C_VERB_PHRASE="R/4", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_4", FK_COLUMNS="gradeNo" */
  SELECT count(*) INTO NUMROWS
    FROM grade
    WHERE
      /* %JoinFKPK(:%New,grade," = "," AND") */
      :new.gradeNo = grade.gradeNo;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    :new.gradeNo IS NOT NULL AND
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update member because grade does not exist.'
    );
  END IF;


-- ERwin Builtin 2024년 7월 15일 월요일 오전 10:42:03
END;
/


CREATE  TRIGGER tI_message BEFORE INSERT ON message for each row
-- ERwin Builtin 2024년 7월 15일 월요일 오전 10:42:03
-- INSERT trigger on message 
DECLARE NUMROWS INTEGER;
BEGIN
    /* ERwin Builtin 2024년 7월 15일 월요일 오전 10:42:03 */
    /* member  message on child insert set null */
    /* ERWIN_RELATION:CHECKSUM="0001eac7", PARENT_OWNER="", PARENT_TABLE="member"
    CHILD_OWNER="", CHILD_TABLE="message"
    P2C_VERB_PHRASE="R/9", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_9", FK_COLUMNS="accepterId" */
    UPDATE message
      SET
        /* %SetFK(message,NULL) */
        message.accepterId = NULL
      WHERE
        NOT EXISTS (
          SELECT * FROM member
            WHERE
              /* %JoinFKPK(:%New,member," = "," AND") */
              :new.accepterId = member.id
        ) 
        /* %JoinPKPK(message,:%New," = "," AND") */
         and message.no = :new.no;

    /* ERwin Builtin 2024년 7월 15일 월요일 오전 10:42:03 */
    /* member  message on child insert set null */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="member"
    CHILD_OWNER="", CHILD_TABLE="message"
    P2C_VERB_PHRASE="R/11", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_11", FK_COLUMNS="senderId" */
    UPDATE message
      SET
        /* %SetFK(message,NULL) */
        message.senderId = NULL
      WHERE
        NOT EXISTS (
          SELECT * FROM member
            WHERE
              /* %JoinFKPK(:%New,member," = "," AND") */
              :new.senderId = member.id
        ) 
        /* %JoinPKPK(message,:%New," = "," AND") */
         and message.no = :new.no;


-- ERwin Builtin 2024년 7월 15일 월요일 오전 10:42:03
END;
/

CREATE  TRIGGER tU_message AFTER UPDATE ON message for each row
-- ERwin Builtin 2024년 7월 15일 월요일 오전 10:42:03
-- UPDATE trigger on message 
DECLARE NUMROWS INTEGER;
BEGIN
  /* ERwin Builtin 2024년 7월 15일 월요일 오전 10:42:03 */
  /* member  message on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00020c4b", PARENT_OWNER="", PARENT_TABLE="member"
    CHILD_OWNER="", CHILD_TABLE="message"
    P2C_VERB_PHRASE="R/9", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_9", FK_COLUMNS="accepterId" */
  SELECT count(*) INTO NUMROWS
    FROM member
    WHERE
      /* %JoinFKPK(:%New,member," = "," AND") */
      :new.accepterId = member.id;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    :new.accepterId IS NOT NULL AND
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update message because member does not exist.'
    );
  END IF;

  /* ERwin Builtin 2024년 7월 15일 월요일 오전 10:42:03 */
  /* member  message on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="member"
    CHILD_OWNER="", CHILD_TABLE="message"
    P2C_VERB_PHRASE="R/11", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_11", FK_COLUMNS="senderId" */
  SELECT count(*) INTO NUMROWS
    FROM member
    WHERE
      /* %JoinFKPK(:%New,member," = "," AND") */
      :new.senderId = member.id;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    :new.senderId IS NOT NULL AND
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update message because member does not exist.'
    );
  END IF;


-- ERwin Builtin 2024년 7월 15일 월요일 오전 10:42:03
END;
/


CREATE  TRIGGER tI_qna BEFORE INSERT ON qna for each row
-- ERwin Builtin 2024년 7월 15일 월요일 오전 10:42:03
-- INSERT trigger on qna 
DECLARE NUMROWS INTEGER;
BEGIN
    /* ERwin Builtin 2024년 7월 15일 월요일 오전 10:42:03 */
    /* qna  qna on child insert set null */
    /* ERWIN_RELATION:CHECKSUM="00029ba6", PARENT_OWNER="", PARENT_TABLE="qna"
    CHILD_OWNER="", CHILD_TABLE="qna"
    P2C_VERB_PHRASE="R/20", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_20", FK_COLUMNS="refNo" */
    UPDATE qna
      SET
        /* %SetFK(qna,NULL) */
        qna.refNo = NULL
      WHERE
        NOT EXISTS (
          SELECT * FROM qna
            WHERE
              /* %JoinFKPK(:%New,qna," = "," AND") */
              :new.refNo = qna.no
        ) 
        /* %JoinPKPK(qna,:%New," = "," AND") */
         and qna.no = :new.no;

    /* ERwin Builtin 2024년 7월 15일 월요일 오전 10:42:03 */
    /* member  qna on child insert set null */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="member"
    CHILD_OWNER="", CHILD_TABLE="qna"
    P2C_VERB_PHRASE="R/21", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_21", FK_COLUMNS="id" */
    UPDATE qna
      SET
        /* %SetFK(qna,NULL) */
        qna.id = NULL
      WHERE
        NOT EXISTS (
          SELECT * FROM member
            WHERE
              /* %JoinFKPK(:%New,member," = "," AND") */
              :new.id = member.id
        ) 
        /* %JoinPKPK(qna,:%New," = "," AND") */
         and qna.no = :new.no;

    /* ERwin Builtin 2024년 7월 15일 월요일 오전 10:42:03 */
    /* qna  qna on child insert set null */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="qna"
    CHILD_OWNER="", CHILD_TABLE="qna"
    P2C_VERB_PHRASE="R/22", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_22", FK_COLUMNS="parentNo" */
    UPDATE qna
      SET
        /* %SetFK(qna,NULL) */
        qna.parentNo = NULL
      WHERE
        NOT EXISTS (
          SELECT * FROM qna
            WHERE
              /* %JoinFKPK(:%New,qna," = "," AND") */
              :new.parentNo = qna.no
        ) 
        /* %JoinPKPK(qna,:%New," = "," AND") */
         and qna.no = :new.no;


-- ERwin Builtin 2024년 7월 15일 월요일 오전 10:42:03
END;
/

CREATE  TRIGGER tD_qna AFTER DELETE ON qna for each row
-- ERwin Builtin 2024년 7월 15일 월요일 오전 10:42:03
-- DELETE trigger on qna 
DECLARE NUMROWS INTEGER;
BEGIN
    /* ERwin Builtin 2024년 7월 15일 월요일 오전 10:42:03 */
    /* qna  qna on parent delete set null */
    /* ERWIN_RELATION:CHECKSUM="00016b11", PARENT_OWNER="", PARENT_TABLE="qna"
    CHILD_OWNER="", CHILD_TABLE="qna"
    P2C_VERB_PHRASE="R/20", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_20", FK_COLUMNS="refNo" */
    UPDATE qna
      SET
        /* %SetFK(qna,NULL) */
        qna.refNo = NULL
      WHERE
        /* %JoinFKPK(qna,:%Old," = "," AND") */
        qna.refNo = :old.no;

    /* ERwin Builtin 2024년 7월 15일 월요일 오전 10:42:03 */
    /* qna  qna on parent delete set null */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="qna"
    CHILD_OWNER="", CHILD_TABLE="qna"
    P2C_VERB_PHRASE="R/22", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_22", FK_COLUMNS="parentNo" */
    UPDATE qna
      SET
        /* %SetFK(qna,NULL) */
        qna.parentNo = NULL
      WHERE
        /* %JoinFKPK(qna,:%Old," = "," AND") */
        qna.parentNo = :old.no;


-- ERwin Builtin 2024년 7월 15일 월요일 오전 10:42:03
END;
/

CREATE  TRIGGER tU_qna AFTER UPDATE ON qna for each row
-- ERwin Builtin 2024년 7월 15일 월요일 오전 10:42:03
-- UPDATE trigger on qna 
DECLARE NUMROWS INTEGER;
BEGIN
  /* qna  qna on parent update set null */
  /* ERWIN_RELATION:CHECKSUM="00049139", PARENT_OWNER="", PARENT_TABLE="qna"
    CHILD_OWNER="", CHILD_TABLE="qna"
    P2C_VERB_PHRASE="R/20", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_20", FK_COLUMNS="refNo" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.no <> :new.no
  THEN
    UPDATE qna
      SET
        /* %SetFK(qna,NULL) */
        qna.refNo = NULL
      WHERE
        /* %JoinFKPK(qna,:%Old," = ",",") */
        qna.refNo = :old.no;
  END IF;

  /* qna  qna on parent update set null */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="qna"
    CHILD_OWNER="", CHILD_TABLE="qna"
    P2C_VERB_PHRASE="R/22", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_22", FK_COLUMNS="parentNo" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.no <> :new.no
  THEN
    UPDATE qna
      SET
        /* %SetFK(qna,NULL) */
        qna.parentNo = NULL
      WHERE
        /* %JoinFKPK(qna,:%Old," = ",",") */
        qna.parentNo = :old.no;
  END IF;

  /* ERwin Builtin 2024년 7월 15일 월요일 오전 10:42:03 */
  /* qna  qna on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="qna"
    CHILD_OWNER="", CHILD_TABLE="qna"
    P2C_VERB_PHRASE="R/20", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_20", FK_COLUMNS="refNo" */
  SELECT count(*) INTO NUMROWS
    FROM qna
    WHERE
      /* %JoinFKPK(:%New,qna," = "," AND") */
      :new.refNo = qna.no;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    :new.refNo IS NOT NULL AND
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update qna because qna does not exist.'
    );
  END IF;

  /* ERwin Builtin 2024년 7월 15일 월요일 오전 10:42:03 */
  /* member  qna on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="member"
    CHILD_OWNER="", CHILD_TABLE="qna"
    P2C_VERB_PHRASE="R/21", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_21", FK_COLUMNS="id" */
  SELECT count(*) INTO NUMROWS
    FROM member
    WHERE
      /* %JoinFKPK(:%New,member," = "," AND") */
      :new.id = member.id;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    :new.id IS NOT NULL AND
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update qna because member does not exist.'
    );
  END IF;

  /* ERwin Builtin 2024년 7월 15일 월요일 오전 10:42:03 */
  /* qna  qna on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="qna"
    CHILD_OWNER="", CHILD_TABLE="qna"
    P2C_VERB_PHRASE="R/22", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_22", FK_COLUMNS="parentNo" */
  SELECT count(*) INTO NUMROWS
    FROM qna
    WHERE
      /* %JoinFKPK(:%New,qna," = "," AND") */
      :new.parentNo = qna.no;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    :new.parentNo IS NOT NULL AND
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update qna because qna does not exist.'
    );
  END IF;


-- ERwin Builtin 2024년 7월 15일 월요일 오전 10:42:03
END;
/

