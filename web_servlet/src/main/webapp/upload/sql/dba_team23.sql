drop table album CASCADE CONSTRAINTS purge;
drop SEQUENCE album_seq;

create table album(
Ano number PRIMARY key, -- �ٹ� ��ȣ
Mno number REFERENCES music(music_no), -- ���� ��ȣ
title varchar2(100) not null, -- �ٹ� ����
release_date date DEFAULT sysdate, --  �߸���
artist varchar2(100) not null, --��Ƽ��Ʈ��
genre varchar2(30) not null, -- �帣
price number(20) not null, -- ����
info varchar2(2000), -- �ٹ� ����
image  varchar2(300)  -- �ٹ� Ŀ��
);

create SEQUENCE album_seq;

CREATE TABLE music (
    music_no NUMBER PRIMARY KEY,
    status VARCHAR2(9)  DEFAULT '����' CHECK (status IN ('����', '�����')) NOT NULL,
    duration NUMBER NOT NULL, -- duration�� �� ������ ����
    songwriter VARCHAR2(30) NOT NULL,
    lyricist VARCHAR2(30) NOT NULL,
    singer VARCHAR2(300) NOT NULL,
    lyric VARCHAR2(300) NOT NULL
);

CREATE SEQUENCE music_seq;