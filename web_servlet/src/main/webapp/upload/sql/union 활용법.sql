--
select null + 1 from dual;

-- null인 경우 0으로 처리해라 -> nvl
SELECT nvl(null, 0) + 1 from dual;

-- 게시판 
select 'board' Categorie, no, title, writer , writedate, hit
from board;

-- 공지사항
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

-- 회원 정보보기 - 아이디, 이름, 연락처, 등급번호, 등급명
select m.id, m.name, m.tel, m.gradeNo, g.gradeName
from grade g, member m
--where g.gradeNo = m.gradeNo -- inner join :null 이면 데이터가 안나온다.
--where g.gradeNo = m.gradeNo (+) -- outter join : null인 경우 null로 표시
--where (id= 'test1') and (g.gradeNo = m.gradeNo) -- 일반 조건과 조인 조건이 있으면 일반 조건을 앞에 둔다
;




