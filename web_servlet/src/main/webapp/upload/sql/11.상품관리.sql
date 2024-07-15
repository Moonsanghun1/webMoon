drop table goods cascade CONSTRAINTS purge;
drop SEQUENCE goods_seq;

create TABLE goods(

gno number primary KEY,
name varchar2(300) not null,
content varchar2(300) not null,
writeDate date default sysdate,
productDate date,
modelNo varchar2(300) not null,
company varchar2(300) not null,
imageName varchar2(300) not null,
delivery_cost number not null
);

create SEQUENCE goods_seq;



