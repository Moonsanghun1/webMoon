drop table album CASCADE CONSTRAINTS purge;
drop SEQUENCE album_seq;

create table album(
Ano number PRIMARY key, -- 앨범 번호
Mno number REFERENCES music(music_no), -- 음원 번호
title varchar2(100) not null, -- 앨범 제목
release_date date DEFAULT sysdate, --  발매일
artist varchar2(100) not null, --아티스트명
genre varchar2(30) not null, -- 장르
price number(20) not null, -- 가격
info varchar2(2000), -- 앨범 정보
image  varchar2(300)  -- 앨범 커버
);

create SEQUENCE album_seq;

CREATE TABLE music (
    music_no NUMBER PRIMARY KEY,
    status VARCHAR2(9)  DEFAULT '공개' CHECK (status IN ('공개', '비공개')) NOT NULL,
    duration NUMBER NOT NULL, -- duration을 초 단위로 저장
    songwriter VARCHAR2(30) NOT NULL,
    lyricist VARCHAR2(30) NOT NULL,
    singer VARCHAR2(300) NOT NULL,
    lyric VARCHAR2(300) NOT NULL
);

CREATE SEQUENCE music_seq;