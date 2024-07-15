drop table notice;
drop SEQUENCE notice_seq;

CREATE table notice(
    no number primary key ,
    title varchar2(300) not null,
    content VARCHAR2(2000) not null,
    startDate date,
    endDate date,
    writeDate date default sysdate,
    updateDate date default sysdate
    
);

CREATE SEQUENCE notice_seq;

INSERT into notice(no,title ,content, startDate,endDate)
values(notice_seq.nextval, '자바란', '자바', '2024-04-24',
‘9999-12-30'
 )