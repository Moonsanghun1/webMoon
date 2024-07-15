select * from notice
where (1=1)
-- 검색조건
and ( 1= 0 or title like '%키오스크%' or content like '%키오스크%' );
-- 기간 조건(pre , old, res, all)
-- 현재 공지
-- and ( 1 = 1 and trunc(sysdate) between trunc(startDate) and trunc(endDate))
-- 과거 공지
-- and ( 1 = 1 and trunc(sysdate) > trunc(endDate))
-- 예정 공지
-- and ( 1 = 1 and trunc(sysdate) < trunc(startDate) )
-- 전체 공지
-- and ( 1 = 1);
drop table album;

create table album(
albumNo number PRIMARY key, -- 앨범 번호
musicNo number REFERENCES music(music_No) not null, -- 음원 번호
title varchar2(100) not null, -- 앨범 제목
release_date date DEFAULT sysdate, --  발매일
artist varchar2(100) not null, -- 아티스트명
genre varchar2(30) not null, -- 장르
price number(20) not null, -- 가격
info varchar2(2000), -- 앨범 정보
image  varchar2(300)  -- 앨범 커버
);