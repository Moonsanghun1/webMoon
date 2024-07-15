-- 일반 게시판 운영 쿼리 
-- 1. 리스트
select no, title, writer, writedate, hit from board order by no desc;
-- 2. 조회수 1 증가 - 상세보기
update board set hit = hit + 1 WHERE NO = 11;
select no, title,content, writer, writedate, hit from board where no = 141;
commit;
-- 3. 등록
insert into board(no,content,title, writer,pw)
values(board_seq.nextval, '공격', '수비하는법', '유비', '1111');
commit;
-- 4. 수정
update board set title = '공격하는법' ,content = '수비', writer = '조조' where no = 141 and pw = '1111';
commit;
-- 5. 삭제
delete from board where no = 141 and pw = '1111';
commit;

-- 1. 원본 리스트
select no, title, writer, writedate, hit
from board
order by no desc;

--2. 순서 번호 : rownum
select rownum rnum, no, title, writer, writedate, hit
from( 
    select no, title, writer, writedate, hit
    from board
    order by no desc
);
select no, title, writer, writedate, hit
from(
    select rownum rnum, no, title, writer, writedate, hit
    from( 
        select no, title, writer, writedate, hit
        from board
        order by no desc
    )
)
-- where rnum between 1 and 10
where rnum >= 1 and rnum <= 10;

-- 데이터 개수 가져오기
select count(*) from board;
-- 중복 배제
select DISTINCT writer from board;

-- 합계, 평균 
select sum(hit), round(avg(hit), 3) from board;
