-- 일반 게시판 운영 쿼리 - CRUD 처리 (
-- 1. 리스트 
-- 2. 상세보기 + 조회수 1 증가 - read 
-- 3. 등록 - create
-- 4. 수정 - update
-- 5. 삭제 - delete

drop table board cascade CONSTRAINTS purge;
drop SEQUENCE board_seq;

create table board(
    no number primary key,
    title VARCHAR2(200) not null,
    content VARCHAR2(2000) not null,
    writer VARCHAR2(30) not null,
    writedate date default sysdate,
    hit number default 0,
    pw VARCHAR2(20) not null
);

create SEQUENCE board_seq;

--insert into board(no, title, content, writer, pw)
--values(board_seq.nextval, '자바' , '프로그램' , '테스터', '1111');

-- 1. 리스트 
-- to_char(data, '날짜형 데이터로 문자형 데이터로 변경한다. as 별칭(alias)
select no, title, writer,to_char(writeDate, 'yyyy-mm-dd') as writedate, hit from board 
order by no desc;

-- 2. 상세보기
-- where 조건 - select, update, delete 에서 사용된다.
UPDATE board set hit = hit + 1 where no = 242;
commit;
select no, title, writer, to_char(writeDate, 'yyyy-mm-dd hh:mi:ss') writedate, content, hit from board 
where no = '242';
-- trunc() - 숫자인 경우 소수점이하 잘라내기, 날짜형인 경우는 시간 정보 잘라내기
-- where trunc(writedate) = '2024-04-25';


-- 3. 등록
insert into board(no, title, content, writer, pw)
values(board_seq.nextval, '자바' , '프로그램' , '테스터2', '1111');
commit;
insert into board(no, title, content, writer, pw)
values(board_seq.nextval, '바자' , '바자회' , '감나무', '1111');
commit;
insert into board(no, title, content, writer, pw)
values(board_seq.nextval, '파자마' , '잠옷' , '고무인간', '1111');
commit;
-- 4. 수정
update board set title = ' 오라클 ', content = ' DB' , writer = 'KIM'
where no = 1 and pw = '1111';
commit;
-- 5. 삭제
delete from board where no = 1 and pw = '1111';
rollback;

select * from board where writer = null;
select * from board where writer != null;
select * from board where writer is null;
select * from board where writer is not null;

select no, title from board order by no desc;
-- 문자열을 이어 붙이는 연산자 : || - 다른 형식의 데이터를 연결해도 문자열이 된다. - 여러개의 문자열에 사용
-- 문자열 이어 붙이는 함수 : concat(문자열, 문자열) - 2개의 문자열에 사용
select (no || '.' || title) data from board order by no desc;
select concat(no, concat('.', title)) data from board order by no ;


select * from board where title = '자바';
select * from board where title = '자';
-- 문자열이 포함되어 있는 데이터 찾기의 like 연산자 - % 와 함께 사용한다. - %는 모든 문자를 대신한다.
-- like 연산자라도 %가 없으면  = 과 같다.
select * from board where title like '%자%';
select * from board where title like '%테스터%' or content like '%테스터%' or writer like '%테%';
 
-- 데이터를 늘리는 쿼리
-- 여러개의 데이터를 한꺼번에 등록시킨다. values를 사용하지않음(values는 데이터가 1개일 때 사용)
-- select 문을 이용해서 데이터를 꺼내와서 다시 넣는다. X2씩 증가. 데이터가 한개라도 있어야 한다.
-- 쿼리 안에 select 쿼리가 존재한다. -> sub 쿼리라고 한다.
insert into board(no, title, content, writer, pw)
(select board_seq.nextval, title,content, writer, pw from board);
commit;

-- 전체 데이터의 개수를 가져오는 쿼리 - count()
select count(no) cnt from board;

-- 번호 : 40, 45, 50
-- 조건에서  or 연산자를 이용하여 한개의 항목에서 여러개의 데이터를 검색할 때 or 연산자를 사용한다. -> in 연산자를 대신 사용가능
select * from board where  no =40 or no = 45 or no = 50 order by no desc;
select * from board where  no in(40, 45, 200)  order by no desc;

-- 번호가 10보다 크거나 같고 35보다 작거나 같은 범위의 데이터를 가져오자 - and 연산자 
-- 숫자나 날짜 범위인 경우 between 연산자 사용가능
select * from board where no >=10 and no <= 35;
select * from board where no between 10 and 35;