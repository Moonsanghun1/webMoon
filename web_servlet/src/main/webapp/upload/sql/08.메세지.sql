--�޼��� ��Ű��
-- 1. ����
drop TABLE message cascade constraints purge;
drop SEQUENCE message_seq;

-- 2. ����
create table message(

    no number primary key,
    content VARCHAR2(2000),
    senderID VARCHAR2(20) references member(id) not null,
    sendDate date default sysdate not null,
    accepterID VARCHAR2(20) references member(id),
    acceptDate date DEFAULT null,
    allUser number(1) default 0
);

create SEQUENCE message_seq;

insert into message(no, content, senderID, accepterID)
values(message_seq.nextval, '�ȳ�', 'test', 'admin');
commit;

SELECT * from message; 