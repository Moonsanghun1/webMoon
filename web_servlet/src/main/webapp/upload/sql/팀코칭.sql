create or replace view notice_old
as 
select no, title, content, startDate, endDate, updateDate from notice
where sysdate > endDate
order by no desc;

select no, title, content, startDate, endDate, updateDate from notice_old;

create index notice_no_idx
on notice(no desc);

select m.id, m.name, m.tel, m.gradeNo, g.gradeName
from grade g, member m
where g.gradeNo = m.gradeNo;


SELECT * FROM notice WHERE no = '1';

select no, title,content, writeDate from board
union
select no, title, content, updateDate writeDate from notice;