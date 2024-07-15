--메세지 스키마
-- 1. 제거
drop TABLE message cascade constraints purge;
drop SEQUENCE message_seq;

-- 2. 생성
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
values(message_seq.nextval, '안녕', 'test', 'admin');
commit;

SELECT * from message; 