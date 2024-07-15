
-- 1. ��ü ����
drop table board_reply cascade constraints purge;
drop SEQUENCE board_reply_seq;

-- 2. ��ü ����
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
-- 3. ���õ�����
insert into board_reply(rno, no, content,writer,pw)
values(board_reply_seq.nextval,61,'�ȳ��ϼ���' , '��', '1111');

insert into board_reply(rno, no, content,writer,pw)
values(board_reply_seq.nextval,61,'�ݰ�����' , '����Բܸ�', '1111');

commit;