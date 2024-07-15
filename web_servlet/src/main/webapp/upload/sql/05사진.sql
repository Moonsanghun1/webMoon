drop TABLE image CASCADE CONSTRAINTS purge;
drop SEQUENCE image_seq;

create TABLE image(

no NUMBER primary KEY,
title varchar2(300) not null,
content varchar2(2000) not null ,
id varchar2(20) DEFAULT 'test' REFERENCES member(id),
writeDate date DEFAULT sysdate,
fileName varchar2(100) not null
);
create SEQUENCE image_seq;

insert into image(no, title, content, id, fileName)
values(image_seq.nextval, '제목', '사진내용', 'admin', '파일이름');

commit;
select * from image;
