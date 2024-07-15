-- �ϹݰԽ��� ���̺� ��Ű��
-- ��ü ���� 
-- CASCADE : ���ﹰ - ������� �Ͱ� ����Ǿ� �ִ� ���� ������
-- PURGE : ����� �����뿡 ���� �Ǵµ� �����뿡 ���� �ʰ� ����� �ȴ�. (����X)
drop TABLE board CASCADE CONSTRAINTS PURGE;

Drop SEQUENCE board_seq;

-- 2. ��ü ����

CREATE TABLE board(
    no number primary key , -- null�� �ƴϰ� �ߺ��� ���� �ʴ� �׸�
    title VARCHAR2(300) not null, -- �ѱ��� 3����Ʈ (100��)
   content VARCHAR2(2000) not null,
    writer VARCHAR2(30) not null,  -- �ѱ۷� 10��
    writeDate date default sysdate, 
    hit number,
    pw varchar2 (20) not null
    
);

CREATE SEQUENCE board_seq;

-- 3. ���� ������ �ֱ�
INSERT into board(no, title,content, writer, pw)
values(board_seq.nextval,'java', 'program','moon', '1111');
commit;

SELECT * from board


