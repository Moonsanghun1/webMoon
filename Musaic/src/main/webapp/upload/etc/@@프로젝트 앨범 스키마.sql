-- 테이블과 시퀀스가 존재하면 삭제
DROP TABLE album CASCADE CONSTRAINTS PURGE;
DROP SEQUENCE album_seq;

create table album(
albumNo number PRIMARY key, -- 앨범 번호
title varchar2(100) not null, -- 앨범 제목
release_date date DEFAULT sysdate, -- 발매일
artist varchar2(100) not null, -- 아티스트명
price number(20) not null, -- 가격
genre varchar2(50) not null, -- 장르
info varchar2(2000) not null , -- 앨범 정보
image varchar2(300) not null, -- 앨범 커버
status varchar2(30) not null -- 앨범 상태
);
create SEQUENCE album_seq;

-- album 테이블에 샘플 데이터 삽입
INSERT INTO album (albumNo, title, artist, price, genre, info, image, status)
VALUES (album_seq.nextval, '앨범 제목 1', '가수1', 10000, '팝', 'A Night at the Opera.jfif', '앨범커버1.jpg', '발매');

INSERT INTO album (albumNo, title, artist, price, genre, info, image, status)
VALUES (album_seq.nextval, '앨범 제목 2', '가수2', 12000, '락', '앨범 정보 2', 'back in black.webp', '발매');

INSERT INTO album (albumNo, title, artist, price, genre, info, image, status)
VALUES (album_seq.nextval, '앨범 제목 3', '가수3', 15000, '힙합', '앨범 정보 3', '2426.webp', '발매');

INSERT INTO album (albumNo, title, artist, price, genre, info, image, status)
VALUES (album_seq.nextval, '앨범 제목 4', '가수4', 9000, '재즈', '앨범 정보 4', 'Whiplash.jfif', '발매');

INSERT INTO album (albumNo, title, artist, price, genre, info, image, status)
VALUES (album_seq.nextval, '앨범 제목 5', '가수5', 11000, '힙합', '앨범 정보 5', '킁.jfif', '발매');

-- 상태가 '비공개'인 앨범 샘플 데이터 삽입
INSERT INTO album (albumNo, title, artist, price, genre, info, image, status)
VALUES (album_seq.nextval, '앨범 제목 6', '가수6', 13000, '발라드', '앨범 정보 6', 'pathos.png', '비공개');

INSERT INTO album (albumNo, title, artist, price, genre, info, image, status)
VALUES (album_seq.nextval,'앨범 제목 7', '가수7', 14000, '댄스', '앨범 정보 7', 'Supernatural.png', '비공개');

commit;