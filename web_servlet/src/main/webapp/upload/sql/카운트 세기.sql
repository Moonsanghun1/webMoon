--ī��Ʈ ����
-- 1. ��ü ���̺��� ī��Ʈ
select  count(*) from board;
-- �ۼ��ڰ� lee�� �������� ����
select count(*) from board where writer = 'KIM';
select distinct writer from board;
-- �ۼ��ں� ������ ���� 
select writer, count(*) cnt
from board
GROUP by writer
having  count(*) >= 20
order by cnt desc ;

-- ȸ�� ���� 
select gender, count(*) cnt
from member
-- where status = '����' -- �������� ������ ������ ����
GROUP by gender;
-- having 
