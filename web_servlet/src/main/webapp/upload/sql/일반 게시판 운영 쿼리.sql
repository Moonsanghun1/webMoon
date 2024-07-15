-- �Ϲ� �Խ��� � ���� 
-- 1. ����Ʈ
select no, title, writer, writedate, hit from board order by no desc;
-- 2. ��ȸ�� 1 ���� - �󼼺���
update board set hit = hit + 1 WHERE NO = 11;
select no, title,content, writer, writedate, hit from board where no = 141;
commit;
-- 3. ���
insert into board(no,content,title, writer,pw)
values(board_seq.nextval, '����', '�����ϴ¹�', '����', '1111');
commit;
-- 4. ����
update board set title = '�����ϴ¹�' ,content = '����', writer = '����' where no = 141 and pw = '1111';
commit;
-- 5. ����
delete from board where no = 141 and pw = '1111';
commit;

-- 1. ���� ����Ʈ
select no, title, writer, writedate, hit
from board
order by no desc;

--2. ���� ��ȣ : rownum
select rownum rnum, no, title, writer, writedate, hit
from( 
    select no, title, writer, writedate, hit
    from board
    order by no desc
);
select no, title, writer, writedate, hit
from(
    select rownum rnum, no, title, writer, writedate, hit
    from( 
        select no, title, writer, writedate, hit
        from board
        order by no desc
    )
)
-- where rnum between 1 and 10
where rnum >= 1 and rnum <= 10;

-- ������ ���� ��������
select count(*) from board;
-- �ߺ� ����
select DISTINCT writer from board;

-- �հ�, ��� 
select sum(hit), round(avg(hit), 3) from board;
