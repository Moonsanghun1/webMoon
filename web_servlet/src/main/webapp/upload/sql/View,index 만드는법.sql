select no, title, startdate, enddate, updatedate 
from notice
where startdate <= sysdate and trunc(sysdate) <= enddate
order by updateDate desc, no desc;

--view table�� �̿��� ó���� ���� view ����
create OR REPLACE view notice_pre
as 
select no, title,content, startdate, enddate, updatedate writedate
from notice
where startdate <= sysdate and trunc(sysdate) <= enddate
order by updateDate desc, no desc;

--���� ���� ����
-- view ���̺��� 1. ������ ��� �����ϸ�, 2. ��������� �ַ��� �並 �����.
select no, title, startdate, enddate, writedate
from notice_pre;

-- index -�ӵ� ������
CREATE index board_no_idx
on board(no desc);
CREATE index member_name_idx
on member(name desc);
CREATE index member_birth_idx
on member(birth desc);

create index name_birth_idx
on member(name, birth desc);


