-- 모든 데이터를 가져오자. s
select no, title, writer, writedate, hit from board
order by no desc;

-- 데이터가 많은 경우 사용자가 데이터를 보기가 불편하다. -> 페이지 처리를 한다.
-- 1 페이지 : 10개의 데이터 - 전체  데이터 앞에  순서번호를 붙여서 : "1 ~ 10" 가져오기
-- 1) 원본 데이터 가져오기
select no, title, writer, writedate, hit from board
order by no desc;

-- 2) 순서 번호 붙이기 - rownum 
select rownum rnum, no, title, writer, writedate, hit
from(
    select no, title, writer, writedate, hit from board
    order by no desc 
);

-- 3) 페이지 정보에 맞는 데이터 가져오기 
select no, title, writer, writedate, hit
from(
    select rownum rnum, no, title, writer, writedate, hit
    from(
        select no, title, writer, writedate, hit from board
        order by no desc 
    )
)
where rnum between 1 and 10;

