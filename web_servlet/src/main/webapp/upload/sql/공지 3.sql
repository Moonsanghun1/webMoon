-- 공지사항 운영 쿼리
-- 1.리스트 
-- 1-0) 모든 공지 - 관리자만
select no, title,
         to_char(startdate, 'yyyy-mm-dd') startdate, 
         to_char(enddate, 'yyyy-mm-dd') enddate, 
         to_char(updatedate, 'yyyy-mm-dd') updatedate 
from notice
order by updateDate desc, no desc;

-- 1-1) 현재 공지 - 일반회원 이상
select no, title, startdate, enddate, updatedate 
from notice
where startdate <= sysdate and trunc(sysdate) <= enddate
order by updateDate desc, no desc;

-- 1-2) 지난 공지 - 관리자만
select no, title, startdate, enddate, updatedate 
from notice 
-- 종료일이 현재보다 작다 - 종료일이 지나갔음
where enddate < sysdate 
order by updateDate desc, no desc;

-- 1-3) 예약 공지 - 관리자만
select no, title, startdate, enddate, updatedate 
from notice 
-- 시작일이 현재보다 크다 - 시작일이 나중임.
where startdate > sysdate 
order by updateDate desc, no desc;

update notice set enddate = '2024-04-30'
where no = 2;

update notice set startdate = '2024-04-30'
where no = 3;

ROLLBACK;


