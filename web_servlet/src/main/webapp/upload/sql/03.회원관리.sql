-- ȸ����� & ȸ���̸�
-- 1. ��ü ����
-- FK ���̺��� ���� ����� PK�� ���߿� �����.
drop table member CASCADE CONSTRAINTS PURGE;
drop table grade CASCADE CONSTRAINTS PURGE;

-- 2. ��ü ����
-- FK ���̺��� ���� ����� PK�� ���߿� �����.
create table grade (
    gradeNo number(2) primary key,
    gradeName VARCHAR2(30) not null
);

create table member(
    id varchar2(20) primary key,
    pw varchar2 (20) not null,
    name varchar2(30)not null,
    gender varchar2(6)not null Check(gender in ('����', '����')), --(gender = '����' or gender = '����'),
    birth date not null,
    tel varchar2(13),
    email varchar2(50)not null UNIQUE,
    regDate date default sysdate,
    conDate date default sysdate,
    status varchar2(6) Default '����' check (status in ('����','����', 'Ż��','�޸�')),
    photo varchar2(200),
    newMsgCnt NUMBER default 0,
    gradeNo NUMBER(2) default 1 REFERENCES grade(gradeNo) 
    -- on delete cascade 
    on delete set null
);

-- 3. ���� ������
-- 1) pk �����͸� ���� �ִ´�.
insert into grade -- ���̺� �̸��� ���� ���� ��� �÷����� ������� �����͸� �Է��� �� ��������
values(1, '�Ϲ�ȸ��');
insert into grade 
values(9, '������');
commit;
-- 2) FK�����͸� PK�ڿ� �ִ´�. - member 
--�Ϲ� ȸ������
insert into member(id, pw, name,gender, birth, tel, email, photo)
values('test','1111' ,'hong', '����', '2002-01-12', '010-1234-1234', 'abc@naver.com', '/upload/member/hong.jpg');

insert into member(id, pw, name,gender, birth, tel, email, photo)
values('woman','1111' ,'Ĳ', '����', '2002-01-12', '010-1234-1235', 'abc2@naver.com', '/upload/member/hong.jpg');

--������ ���
insert into member(id, pw, name, gender, birth, tel, email, photo,gradeNo)
values('admin','1111' ,'Moon', '����', '2002-01-12', '010-1234-1111', 'abc1@naver.com', '/upload/member/admin.jpg','9');
commit;

select * from grade;
select * from member;
