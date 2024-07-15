--
select null + 1 from dual;

-- null�� ��� 0���� ó���ض� -> nvl
SELECT nvl(null, 0) + 1 from dual;

-- �Խ��� 
select 'board' Categorie, no, title, writer , writedate, hit
from board;

-- ��������
select 'notice' Categorie, no, title , enddate, startdate
from notice;

select categorie, no, title, writedate
from(
        select 'board' Categorie, no, title , writedate
        from board 
        union
        select 'notice' Categorie, no, title , updatedate writedate
        from notice
);

-- ȸ�� �������� - ���̵�, �̸�, ����ó, ��޹�ȣ, ��޸�
select m.id, m.name, m.tel, m.gradeNo, g.gradeName
from grade g, member m
--where g.gradeNo = m.gradeNo -- inner join :null �̸� �����Ͱ� �ȳ��´�.
--where g.gradeNo = m.gradeNo (+) -- outter join : null�� ��� null�� ǥ��
--where (id= 'test1') and (g.gradeNo = m.gradeNo) -- �Ϲ� ���ǰ� ���� ������ ������ �Ϲ� ������ �տ� �д�
;




