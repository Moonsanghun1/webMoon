-- �������� � ����
-- 1.����Ʈ 
-- 1-0) ��� ���� - �����ڸ�
select no, title,
         to_char(startdate, 'yyyy-mm-dd') startdate, 
         to_char(enddate, 'yyyy-mm-dd') enddate, 
         to_char(updatedate, 'yyyy-mm-dd') updatedate 
from notice
order by updateDate desc, no desc;

-- 1-1) ���� ���� - �Ϲ�ȸ�� �̻�
select no, title, startdate, enddate, updatedate 
from notice
where startdate <= sysdate and trunc(sysdate) <= enddate
order by updateDate desc, no desc;

-- 1-2) ���� ���� - �����ڸ�
select no, title, startdate, enddate, updatedate 
from notice 
-- �������� ���纸�� �۴� - �������� ��������
where enddate < sysdate 
order by updateDate desc, no desc;

-- 1-3) ���� ���� - �����ڸ�
select no, title, startdate, enddate, updatedate 
from notice 
-- �������� ���纸�� ũ�� - �������� ������.
where startdate > sysdate 
order by updateDate desc, no desc;

update notice set enddate = '2024-04-30'
where no = 2;

update notice set startdate = '2024-04-30'
where no = 3;

ROLLBACK;


