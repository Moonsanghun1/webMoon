--카운트 세기
-- 1. 전체 테이블의 카운트
select  count(*) from board;
-- 작성자가 lee인 데이터의 개수
select count(*) from board where writer = 'KIM';
select distinct writer from board;
-- 작성자별 데이터 개수 
select writer, count(*) cnt
from board
GROUP by writer
having  count(*) >= 20
order by cnt desc ;

-- 회원 성비 
select gender, count(*) cnt
from member
-- where status = '정상' -- 원본값을 가지고 들어오는 조건
GROUP by gender;
-- having 
