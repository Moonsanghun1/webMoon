
-- 1. °´Ã¼ Á¦°Å
drop table board_reply cascade constraints purge;
drop SEQUENCE board_reply_seq;

-- 2. °´Ã¼ »ý¼º
create table board_reply(
rno NUMBER PRIMARY KEY,
no NUMBER REFERENCES board(no),
content  VARCHAR2(1500) not null,
writer VARCHAR2(1500) not null,
pw VARCHAR2(20) not null,
writeDate date DEFAULT sysdate

);

create SEQUENCE board_reply_seq;

select max(no) from board;
-- 3. »ùÇÃµ¥ÀÌÅÍ
insert into board_reply(rno, no, content,writer,pw)
values(board_reply_seq.nextval,61,'¾È³çÇÏ¼¼¿ä' , '±ò³¢', '1111');

insert into board_reply(rno, no, content,writer,pw)
values(board_reply_seq.nextval,61,'¹Ý°¡¿ö¿ä' , '¹ÙÄí½Ô²Ü¸¶', '1111');

commit;