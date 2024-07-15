-- ��� �����͸� ��������. s
select no, title, writer, writedate, hit from board
order by no desc;

-- �����Ͱ� ���� ��� ����ڰ� �����͸� ���Ⱑ �����ϴ�. -> ������ ó���� �Ѵ�.
-- 1 ������ : 10���� ������ - ��ü  ������ �տ�  ������ȣ�� �ٿ��� : "1 ~ 10" ��������
-- 1) ���� ������ ��������
select no, title, writer, writedate, hit from board
order by no desc;

-- 2) ���� ��ȣ ���̱� - rownum 
select rownum rnum, no, title, writer, writedate, hit
from(
    select no, title, writer, writedate, hit from board
    order by no desc 
);

-- 3) ������ ������ �´� ������ �������� 
select no, title, writer, writedate, hit
from(
    select rownum rnum, no, title, writer, writedate, hit
    from(
        select no, title, writer, writedate, hit from board
        order by no desc 
    )
)
where rnum between 1 and 10;

