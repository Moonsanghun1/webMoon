-- �������, ���Ű���, �̷�����

-- �������
insert into notice(no, title, content, startDate, endDate, updateDate)
values(notice_seq.nextval, '���� ����', '���� ���� ����', '2024-03-11',  '2024-05-11',  '2024-02-11');

insert into notice(no, title, content, startDate, endDate, updateDate)
values(notice_seq.nextval, '���� ����1', '���� ���� ����2', '2024-03-21',  '2024-05-21',  '2024-02-21');

select no, title, content, startDate, endDate, updateDate from notice
where startDate <= sysdate and TRUNC(sysdate) <= endDate
order by no desc;

-- ���Ű���
insert into notice(no, title, content, startDate, endDate, updateDate)
values(notice_seq.nextval, '���� ����', '���� ���� ����', '2024-03-11',  '2024-04-11',  '2024-02-11');

insert into notice(no, title, content, startDate, endDate, updateDate)
values(notice_seq.nextval, '���� ����1', '���� ���� ����2', '2024-03-21',  '2024-04-21',  '2024-02-21');

select no, title, content, startDate, endDate, updateDate from notice
where sysdate > endDate
order by no desc;

--�̷����� 
insert into notice(no, title, content, startDate, endDate, updateDate)
values(notice_seq.nextval, '�̷� ����', '�̷� ���� ����', '2024-05-11',  '2024-06-11',  '2024-02-11');

insert into notice(no, title, content, startDate, endDate, updateDate)
values(notice_seq.nextval, '�̷� ����1', '�̷� ���� ����2', '2024-05-21',  '2024-06-21',  '2024-02-21');

select no, title, content, startDate, endDate, updateDate from notice
where sysdate < startDate
order by no desc;

-- ��� ����
select * from notice;

commit;
