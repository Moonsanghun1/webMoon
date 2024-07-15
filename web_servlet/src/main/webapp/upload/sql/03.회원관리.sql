-- 회원등급 & 회원이름
-- 1. 객체 제거
-- FK 테이블은 먼저 지우고 PK는 나중에 지운다.
drop table member CASCADE CONSTRAINTS PURGE;
drop table grade CASCADE CONSTRAINTS PURGE;

-- 2. 객체 생성
-- FK 테이블은 먼저 만들고 PK는 나중에 만든다.
create table grade (
    gradeNo number(2) primary key,
    gradeName VARCHAR2(30) not null
);

create table member(
    id varchar2(20) primary key,
    pw varchar2 (20) not null,
    name varchar2(30)not null,
    gender varchar2(6)not null Check(gender in ('남자', '여자')), --(gender = '남자' or gender = '여자'),
    birth date not null,
    tel varchar2(13),
    email varchar2(50)not null UNIQUE,
    regDate date default sysdate,
    conDate date default sysdate,
    status varchar2(6) Default '정상' check (status in ('정상','강퇴', '탈퇴','휴면')),
    photo varchar2(200),
    newMsgCnt NUMBER default 0,
    gradeNo NUMBER(2) default 1 REFERENCES grade(gradeNo) 
    -- on delete cascade 
    on delete set null
);

-- 3. 샘플 데이터
-- 1) pk 데이터를 먼저 넣는다.
insert into grade -- 테이블 이름만 쓰는 경우는 모든 컬럼에서 순서대로 데이터를 입력할 때 생략가능
values(1, '일반회원');
insert into grade 
values(9, '관리자');
commit;
-- 2) FK데이터를 PK뒤에 넣는다. - member 
--일반 회원가입
insert into member(id, pw, name,gender, birth, tel, email, photo)
values('test','1111' ,'hong', '남자', '2002-01-12', '010-1234-1234', 'abc@naver.com', '/upload/member/hong.jpg');

insert into member(id, pw, name,gender, birth, tel, email, photo)
values('woman','1111' ,'캉', '여자', '2002-01-12', '010-1234-1235', 'abc2@naver.com', '/upload/member/hong.jpg');

--관리자 등록
insert into member(id, pw, name, gender, birth, tel, email, photo,gradeNo)
values('admin','1111' ,'Moon', '남자', '2002-01-12', '010-1234-1111', 'abc1@naver.com', '/upload/member/admin.jpg','9');
commit;

select * from grade;
select * from member;
