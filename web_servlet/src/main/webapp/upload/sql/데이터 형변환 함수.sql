-- ������ ����ȯ �Լ�

-- to_char() - ���ڿ��� ��ȯ. ��¥�� -> ���ڿ�. ���� -> ���ڿ� : ����ڰ� ���� ���� ���·� ��ȭ
-- ��¥ -> ���ڿ��� : ��¥ ����� �ȵ�.
select sysdate from dual;
select to_char(sysdate, 'yyyy-mm-dd') today from dual;

select current_timestamp from dual;
select to_char(current_timestamp, 'yyyy-mm-dd') from dual;
select 
    to_char(current_timestamp, 'yyyy') || '�� '
    ||to_char(current_timestamp, 'mm') || '�� '
    ||to_char(current_timestamp, 'dd') || '�� '
    today
from dual;

-- ���� -> ���ڿ� 
select '[' || to_char(1234.1234, 's09999,999.999999') || ']' from dual;