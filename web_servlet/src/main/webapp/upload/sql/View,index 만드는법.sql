select no, title, startdate, enddate, updatedate 
from notice
where startdate <= sysdate and trunc(sysdate) <= enddate
order by updateDate desc, no desc;

--view table을 이용한 처리를 위한 view 생성
create OR REPLACE view notice_pre
as 
select no, title,content, startdate, enddate, updatedate writedate
from notice
where startdate <= sysdate and trunc(sysdate) <= enddate
order by updateDate desc, no desc;

--현재 공지 보기
-- view 테이블은 1. 쿼리가 길고 복잡하면, 2. 사용제한을 주려면 뷰를 만든다.
select no, title, startdate, enddate, writedate
from notice_pre;

-- index -속도 빠르게
CREATE index board_no_idx
on board(no desc);
CREATE index member_name_idx
on member(name desc);
CREATE index member_birth_idx
on member(birth desc);

create index name_birth_idx
on member(name, birth desc);


