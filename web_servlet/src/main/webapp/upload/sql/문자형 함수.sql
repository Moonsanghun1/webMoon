-- ������ �Լ�

select * from board;
-- �빮��.
select upper(title) from board;
-- �ҹ���
SELECT lower('TEST') from board;

-- ���ڿ��� ����
SELECT title, length(title) from board where no < 30;
-- DISTINCT : �ߺ��� �����͸� ������Ų��.
SELECT DISTINCT writer from board;

-- �ѱ��� ���� 
Update board set writer = '�̿�ȯ' where no = 83;
commit;

SELECT * from board where no = 83;
--�Ϲ� �Խ��� 83(�ѱ� �ۼ��ڸ� ���� ������)�� ���� ��ȣ, ����, �ۼ���, �ۼ����� ����
--�ۼ����� ���̸� �˾� �� �� 1)length(writer) 2)lengthb(writer)
SELECT no, title, writer, length(writer) length, lengthb(writer)lengthb from board where no = 83;

SELECT '[' || '   �ڹ�    ' || ']' from dual;

-- trim(���ڿ�) - ���ڿ��� �յ� ������ ����.
SELECT '[' || trim('   ��  ��    ') || ']' from dual;
-- ltrim(���ڿ�) - ���ڿ��� �� ������ ����.
SELECT '[' || ltrim('   ��  ��    ') || ']' from dual;
-- rtrim(���ڿ�) - ���ڿ��� �� ������ ����.
SELECT '[' || rtrim('   ��  ��    ') || ']' from dual;

-- �������� ������� �ʰ� �����͸� �Է��ϴ� ��ȣ ���ϱ�
select max(no) +  1 nextNo from board;

-- sub ������ �̿��ؼ� �Ϲ� �Խ��� ������ �߰��ϱ�(insert)
insert into board(no, title, content, writer, pw)
values((select max(no) + 1 nextNo from board), 'Ű����ũ', '�����ֹ�' , '������' , '1111');
commit;

--80�� ����
DELETE from board where no = 80;

Update board set no = no - 1 where no > 80;
commit;

select * from board order by no desc;

-- ���� �Լ� 
-- round(�Ǽ�) - �Ҽ��� ����, round(�Ǽ�, �ڸ���) - �Ҽ��� ���� �ڸ��� ���� ǥ�� 
select 1234.567 num, round(1234.567, 2) round from dual;
-- trunc(�Ǽ�) - �Ҽ��� ����, 
-- floor(�Ǽ�, �ڸ���) - �Ҽ��� ���� �Ǽ� ���� ���� �ʴ� ���� �ִ밪 = �Ҽ������� : trunc
-- ceil(�Ǽ�) - �ø�,
select 1234.567 num, trunc(1234.567, 2) trunc, floor(1234.567) floor, ceil(1234.567 * 100) ceil from dual;

