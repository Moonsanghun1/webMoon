Drop table qna cascade constraints;

drop sequence qna_seq;

create table qna(
no number not null,
title varChar2(300) not null,
content varChar2(300) not null,
id varChar2(300) not null,
writedate date  default sysdate,
refNo number not null,
ordNo number default  1 null,
levNo number default  0 null,
parentNo number null,
constraint XPK�����亯 Primary key (no),
constraint R_7 Foreign key (id) references member(id) on delete cascade,
constraint R_8 Foreign key (refNo) references qna(no),
constraint R_9 Foreign key (parentNo) references qna(no) on delete cascade
);

create sequence qna_seq;

-- 3. ���õ�����

-- 3-1. �ּ� ����
insert into qna (no, title, content, id, refNo, ordNo, levNo, parentNo)
values(qna_seq.nextval, '�ڹٶ�?', '�ڹٶ� �����ΰ�', 'test', qna_seq.nextval, 1, 0 ,null);
-- 3-2. �亯 
update qna set ordNo = ordNo + 1 where refNo = 1 and ordNo >= 2;
insert into qna (no, title, content, id, refNo, ordNo, levNo, parentNo)
values(qna_seq.nextval, '[�亯]�ڹٶ�?', '���α׷��־�� / �ڹٶ� �����ΰ� ', 'admin',1, 2, 1 ,1);

insert into qna (no, title, content, id, refNo, ordNo, levNo, parentNo)
values(qna_seq.nextval, '[�亯]����Ŭ�̶�?', '���α׷��־�� / �ڹٶ� �����ΰ� ', 'admin',qna_seq.nextval, 1, 0 ,null);

commit;

select * from qna order by refNo, ordNo;


select no, title, 
    (select count(*) from qna iq where iq.refno = oq.refno) - 1 answerNo, 
    id, writeDate 
from qna oq 
where no = refNo
order by refNo, ordNo;

select count(*) from qna;
-- delete from qna where no = 1;
 
--rollback;