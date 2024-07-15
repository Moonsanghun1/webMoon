--스키마 - 테이블, 시퀀스, 
-- 1. 제거
drop table board cascade CONSTRAINTS purge;
drop SEQUENCE board_seq;
-- 2. 생성
CREATE table board (
    no number CONSTRAINT board_no_pk primary key,
    title varchar2(300) constraint board_title_nn not null,
    content varchar2(2000)not null,
    writer varchar2(30)not null,
    writeDate date default sysdate,
    pw VARCHAR2(20) not null,
    hit number default 0
);
CREATE sequence board_seq;
-- 3. 샘플
insert into board(no, title, content, writer, pw)
values(board_seq.nextval, '자바란?', 'program', 'moon','1111');
insert into board(no, title, content, writer, pw)
values(board_seq.nextval, 'java?', '프로그램', '문','1111');
commit;
select * from board;
