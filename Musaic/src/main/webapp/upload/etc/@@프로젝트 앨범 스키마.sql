-- ���̺�� �������� �����ϸ� ����
DROP TABLE album CASCADE CONSTRAINTS PURGE;
DROP SEQUENCE album_seq;

create table album(
albumNo number PRIMARY key, -- �ٹ� ��ȣ
title varchar2(100) not null, -- �ٹ� ����
release_date date DEFAULT sysdate, -- �߸���
artist varchar2(100) not null, -- ��Ƽ��Ʈ��
price number(20) not null, -- ����
genre varchar2(50) not null, -- �帣
info varchar2(2000) not null , -- �ٹ� ����
image varchar2(300) not null, -- �ٹ� Ŀ��
status varchar2(30) not null -- �ٹ� ����
);
create SEQUENCE album_seq;

-- album ���̺� ���� ������ ����
INSERT INTO album (albumNo, title, artist, price, genre, info, image, status)
VALUES (album_seq.nextval, '�ٹ� ���� 1', '����1', 10000, '��', 'A Night at the Opera.jfif', '�ٹ�Ŀ��1.jpg', '�߸�');

INSERT INTO album (albumNo, title, artist, price, genre, info, image, status)
VALUES (album_seq.nextval, '�ٹ� ���� 2', '����2', 12000, '��', '�ٹ� ���� 2', 'back in black.webp', '�߸�');

INSERT INTO album (albumNo, title, artist, price, genre, info, image, status)
VALUES (album_seq.nextval, '�ٹ� ���� 3', '����3', 15000, '����', '�ٹ� ���� 3', '2426.webp', '�߸�');

INSERT INTO album (albumNo, title, artist, price, genre, info, image, status)
VALUES (album_seq.nextval, '�ٹ� ���� 4', '����4', 9000, '����', '�ٹ� ���� 4', 'Whiplash.jfif', '�߸�');

INSERT INTO album (albumNo, title, artist, price, genre, info, image, status)
VALUES (album_seq.nextval, '�ٹ� ���� 5', '����5', 11000, '����', '�ٹ� ���� 5', 'ů.jfif', '�߸�');

-- ���°� '�����'�� �ٹ� ���� ������ ����
INSERT INTO album (albumNo, title, artist, price, genre, info, image, status)
VALUES (album_seq.nextval, '�ٹ� ���� 6', '����6', 13000, '�߶��', '�ٹ� ���� 6', 'pathos.png', '�����');

INSERT INTO album (albumNo, title, artist, price, genre, info, image, status)
VALUES (album_seq.nextval,'�ٹ� ���� 7', '����7', 14000, '��', '�ٹ� ���� 7', 'Supernatural.png', '�����');

commit;