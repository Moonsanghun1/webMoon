-- 일반게시판 테이블 스키마
-- 객체 제거 
-- CASCADE : 개울물 - 지우려는 것과 연결되어 있는 것을 지우자
-- PURGE : 지우면 휴지통에 담기게 되는데 휴지통에 담지 않고 지우게 된다. (복원X)
drop TABLE board CASCADE CONSTRAINTS PURGE;

Drop SEQUENCE board_seq;

-- 2. 객체 생성

CREATE TABLE board(
    no number primary key , -- null이 아니고 중복이 되지 않는 항목
    title VARCHAR2(300) not null, -- 한글은 3바이트 (100자)
   content VARCHAR2(2000) not null,
    writer VARCHAR2(30) not null,  -- 한글로 10자
    writeDate date default sysdate, 
    hit number,
    pw varchar2 (20) not null
    
);

CREATE SEQUENCE board_seq;

-- 3. 샘플 데이터 넣기
INSERT into board(no, title,content, writer, pw)
values(board_seq.nextval,'java', 'program','moon', '1111');
commit;

SELECT * from board


