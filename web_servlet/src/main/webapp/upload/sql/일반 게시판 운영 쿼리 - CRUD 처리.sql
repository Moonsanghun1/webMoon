-- �Ϲ� �Խ��� � ���� - CRUD ó�� (
-- 1. ����Ʈ 
-- 2. �󼼺��� + ��ȸ�� 1 ���� - read 
-- 3. ��� - create
-- 4. ���� - update
-- 5. ���� - delete

drop table board cascade CONSTRAINTS purge;
drop SEQUENCE board_seq;

create table board(
    no number primary key,
    title VARCHAR2(200) not null,
    content VARCHAR2(2000) not null,
    writer VARCHAR2(30) not null,
    writedate date default sysdate,
    hit number default 0,
    pw VARCHAR2(20) not null
);

create SEQUENCE board_seq;

--insert into board(no, title, content, writer, pw)
--values(board_seq.nextval, '�ڹ�' , '���α׷�' , '�׽���', '1111');

-- 1. ����Ʈ 
-- to_char(data, '��¥�� �����ͷ� ������ �����ͷ� �����Ѵ�. as ��Ī(alias)
select no, title, writer,to_char(writeDate, 'yyyy-mm-dd') as writedate, hit from board 
order by no desc;

-- 2. �󼼺���
-- where ���� - select, update, delete ���� ���ȴ�.
UPDATE board set hit = hit + 1 where no = 242;
commit;
select no, title, writer, to_char(writeDate, 'yyyy-mm-dd hh:mi:ss') writedate, content, hit from board 
where no = '242';
-- trunc() - ������ ��� �Ҽ������� �߶󳻱�, ��¥���� ���� �ð� ���� �߶󳻱�
-- where trunc(writedate) = '2024-04-25';


-- 3. ���
insert into board(no, title, content, writer, pw)
values(board_seq.nextval, '�ڹ�' , '���α׷�' , '�׽���2', '1111');
commit;
insert into board(no, title, content, writer, pw)
values(board_seq.nextval, '����' , '����ȸ' , '������', '1111');
commit;
insert into board(no, title, content, writer, pw)
values(board_seq.nextval, '���ڸ�' , '���' , '���ΰ�', '1111');
commit;
-- 4. ����
update board set title = ' ����Ŭ ', content = ' DB' , writer = 'KIM'
where no = 1 and pw = '1111';
commit;
-- 5. ����
delete from board where no = 1 and pw = '1111';
rollback;

select * from board where writer = null;
select * from board where writer != null;
select * from board where writer is null;
select * from board where writer is not null;

select no, title from board order by no desc;
-- ���ڿ��� �̾� ���̴� ������ : || - �ٸ� ������ �����͸� �����ص� ���ڿ��� �ȴ�. - �������� ���ڿ��� ���
-- ���ڿ� �̾� ���̴� �Լ� : concat(���ڿ�, ���ڿ�) - 2���� ���ڿ��� ���
select (no || '.' || title) data from board order by no desc;
select concat(no, concat('.', title)) data from board order by no ;


select * from board where title = '�ڹ�';
select * from board where title = '��';
-- ���ڿ��� ���ԵǾ� �ִ� ������ ã���� like ������ - % �� �Բ� ����Ѵ�. - %�� ��� ���ڸ� ����Ѵ�.
-- like �����ڶ� %�� ������  = �� ����.
select * from board where title like '%��%';
select * from board where title like '%�׽���%' or content like '%�׽���%' or writer like '%��%';
 
-- �����͸� �ø��� ����
-- �������� �����͸� �Ѳ����� ��Ͻ�Ų��. values�� �����������(values�� �����Ͱ� 1���� �� ���)
-- select ���� �̿��ؼ� �����͸� �����ͼ� �ٽ� �ִ´�. X2�� ����. �����Ͱ� �Ѱ��� �־�� �Ѵ�.
-- ���� �ȿ� select ������ �����Ѵ�. -> sub ������� �Ѵ�.
insert into board(no, title, content, writer, pw)
(select board_seq.nextval, title,content, writer, pw from board);
commit;

-- ��ü �������� ������ �������� ���� - count()
select count(no) cnt from board;

-- ��ȣ : 40, 45, 50
-- ���ǿ���  or �����ڸ� �̿��Ͽ� �Ѱ��� �׸񿡼� �������� �����͸� �˻��� �� or �����ڸ� ����Ѵ�. -> in �����ڸ� ��� ��밡��
select * from board where  no =40 or no = 45 or no = 50 order by no desc;
select * from board where  no in(40, 45, 200)  order by no desc;

-- ��ȣ�� 10���� ũ�ų� ���� 35���� �۰ų� ���� ������ �����͸� �������� - and ������ 
-- ���ڳ� ��¥ ������ ��� between ������ ��밡��
select * from board where no >=10 and no <= 35;
select * from board where no between 10 and 35;