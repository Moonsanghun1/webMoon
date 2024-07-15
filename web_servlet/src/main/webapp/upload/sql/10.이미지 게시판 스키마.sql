-- << 이미지 게시판 >> --

-- 제거
drop table image CASCADE CONSTRAINTS;
drop SEQUENCE image_seq;

-- 생성
create table image(
    no number primary key, -- 글번호 - 시퀀스 사용
    title VARCHAR2(300) not null, -- 제목
    content VARCHAR2(2000) not null, -- 내용
    -- 회원아이디 - 등록 시 회원만 가능. 데이터 가져올 때 회원정보 가져 올수 있다. 참조형인 경우 on delete 옵션 설정
    id  VARCHAR2(20) references member(id) not null, 
    writeDate date default sysdate, -- 작성날짜과 시간
    fileName VARCHAR2(100) not null -- 파일의 위치와 이름 정보
);

create SEQUENCE image_seq;

-- 샘플 데이터
insert into image(no, title, content, id, fileName)
values(image_seq.nextval, '이미지입니다.', '이미지입니다.', 'test', '/upload/image/image.jpg');
commit;

select i.no, i.title, i.id, m.name, i.writeDate, i.fileName

FROM image i, member m

WHERE i.id = m.id

ORDER BY no desc;

select no, title, content, writer, writeDate, hit from board where no = 1;
Update board set hit = hit + 1 where no = 1;