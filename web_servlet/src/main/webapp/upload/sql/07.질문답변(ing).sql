drop TABLE qna CASCADE CONSTRAINTS purge;
drop SEQUENCE qna_seq;

create table qna(

no number primary key,
title varchar2(300) not null,
content varchar2(2000) not null,
id varchar2(20) not null,
writeDate date default sysdate,
hit number default 0,
refNo number references qna(no), 
ordNo number,
levNo number,
parentNo number 
);

create SEQUENCE qna_seq;

insert

