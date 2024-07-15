-- �������� ��Ű��
-- 1. ����
drop table notice cascade CONSTRAINTS purge;
drop SEQUENCE notice_seq;

-- 2. ����
create table notice( 
    no number primary key,
    title VARCHAR2(300) not null,
    content VARCHAR2(2000) not null,
    startdate date default sysdate,
    enddate date default '9999-12-30',
    writedate date default sysdate,
    updatedate date default sysdate
);
create SEQUENCE notice_seq;

-- 3. ���õ�����
-- 3-1) ���� ����
insert into notice(no, title, content, startdate, enddate)
values(notice_seq.nextval, 'Ű����ũ ���� ����', 'Ű����ũ' , '2024-04-11', '2024-09-27');

-- 3-2) ���� ����
insert into notice(no, title, content, startdate, enddate)
values(notice_seq.nextval, 'Ű����ũ ���� ����', 'Ű����ũ ����' , '2024-04-11', '2024-04-17');

-- 3-3) ���� ����
insert into notice(no, title, content, startdate, enddate)
values(notice_seq.nextval, 'Ű����ũ ���� ����', 'Ű����ũ ����' , '2024-09-21', '2024-09-27');
commit;

SELECT * from notice;
