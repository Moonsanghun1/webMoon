-- 공지사항 스키마
-- 1. 제거
drop table notice cascade CONSTRAINTS purge;
drop SEQUENCE notice_seq;

-- 2. 생성
create table notice( 
    no number primary key,
    title VARCHAR2(300) not null,
    content VARCHAR2(2000) not null,
    startdate date default sysdate,
    enddate date default '9999-12-30',
    writedate date default sysdate,
    updatedate date default sysdate
);
create SEQUENCE notice_seq;

-- 3. 샘플데이터
-- 3-1) 현재 공지
insert into notice(no, title, content, startdate, enddate)
values(notice_seq.nextval, '키오스크 과정 진행', '키오스크' , '2024-04-11', '2024-09-27');

-- 3-2) 지난 공지
insert into notice(no, title, content, startdate, enddate)
values(notice_seq.nextval, '키오스크 과정 개강', '키오스크 개강' , '2024-04-11', '2024-04-17');

-- 3-3) 예약 공지
insert into notice(no, title, content, startdate, enddate)
values(notice_seq.nextval, '키오스크 과정 수료', '키오스크 수료' , '2024-09-21', '2024-09-27');
commit;

SELECT * from notice;
