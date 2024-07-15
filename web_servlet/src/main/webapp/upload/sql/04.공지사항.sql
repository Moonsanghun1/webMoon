drop table notice CASCADE CONSTRAINTS purge;
drop SEQUENCE notice_seq;

create table notice(
no NUMBER primary key,
title varchar2(300) not null,
content varchar2(2000) not null,
startDate date default sysdate,
endDate date default '9999-12-31',
writeDate date default sysdate,
updateDate date default sysdate
);
create SEQUENCE notice_seq;

insert into notice(no, title, content)
values(notice_seq.nextval, '공지', '공지사항');


commit;
select * from notice;


