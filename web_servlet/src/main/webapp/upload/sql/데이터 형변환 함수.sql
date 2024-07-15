-- 데이터 형변환 함수

-- to_char() - 문자열로 변환. 날짜형 -> 문자열. 숫자 -> 문자열 : 사용자가 보기 편한 형태로 변화
-- 날짜 -> 문자열로 : 날짜 계산이 안됨.
select sysdate from dual;
select to_char(sysdate, 'yyyy-mm-dd') today from dual;

select current_timestamp from dual;
select to_char(current_timestamp, 'yyyy-mm-dd') from dual;
select 
    to_char(current_timestamp, 'yyyy') || '년 '
    ||to_char(current_timestamp, 'mm') || '월 '
    ||to_char(current_timestamp, 'dd') || '일 '
    today
from dual;

-- 숫자 -> 문자열 
select '[' || to_char(1234.1234, 's09999,999.999999') || ']' from dual;