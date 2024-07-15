-- 현재공지, 과거공지, 미래공지

-- 현재공지
insert into notice(no, title, content, startDate, endDate, updateDate)
values(notice_seq.nextval, '현재 공지', '현재 공지 내용', '2024-03-11',  '2024-05-11',  '2024-02-11');

insert into notice(no, title, content, startDate, endDate, updateDate)
values(notice_seq.nextval, '현재 공지1', '현재 공지 내용2', '2024-03-21',  '2024-05-21',  '2024-02-21');

select no, title, content, startDate, endDate, updateDate from notice
where startDate <= sysdate and TRUNC(sysdate) <= endDate
order by no desc;

-- 과거공지
insert into notice(no, title, content, startDate, endDate, updateDate)
values(notice_seq.nextval, '과거 공지', '과거 공지 내용', '2024-03-11',  '2024-04-11',  '2024-02-11');

insert into notice(no, title, content, startDate, endDate, updateDate)
values(notice_seq.nextval, '과거 공지1', '과거 공지 내용2', '2024-03-21',  '2024-04-21',  '2024-02-21');

select no, title, content, startDate, endDate, updateDate from notice
where sysdate > endDate
order by no desc;

--미래공지 
insert into notice(no, title, content, startDate, endDate, updateDate)
values(notice_seq.nextval, '미래 공지', '미래 공지 내용', '2024-05-11',  '2024-06-11',  '2024-02-11');

insert into notice(no, title, content, startDate, endDate, updateDate)
values(notice_seq.nextval, '미래 공지1', '미래 공지 내용2', '2024-05-21',  '2024-06-21',  '2024-02-21');

select no, title, content, startDate, endDate, updateDate from notice
where sysdate < startDate
order by no desc;

-- 모든 공지
select * from notice;

commit;
