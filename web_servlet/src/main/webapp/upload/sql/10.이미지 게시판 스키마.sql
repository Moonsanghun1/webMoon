-- << �̹��� �Խ��� >> --

-- ����
drop table image CASCADE CONSTRAINTS;
drop SEQUENCE image_seq;

-- ����
create table image(
    no number primary key, -- �۹�ȣ - ������ ���
    title VARCHAR2(300) not null, -- ����
    content VARCHAR2(2000) not null, -- ����
    -- ȸ�����̵� - ��� �� ȸ���� ����. ������ ������ �� ȸ������ ���� �ü� �ִ�. �������� ��� on delete �ɼ� ����
    id  VARCHAR2(20) references member(id) not null, 
    writeDate date default sysdate, -- �ۼ���¥�� �ð�
    fileName VARCHAR2(100) not null -- ������ ��ġ�� �̸� ����
);

create SEQUENCE image_seq;

-- ���� ������
insert into image(no, title, content, id, fileName)
values(image_seq.nextval, '�̹����Դϴ�.', '�̹����Դϴ�.', 'test', '/upload/image/image.jpg');
commit;

select i.no, i.title, i.id, m.name, i.writeDate, i.fileName

FROM image i, member m

WHERE i.id = m.id

ORDER BY no desc;

select no, title, content, writer, writeDate, hit from board where no = 1;
Update board set hit = hit + 1 where no = 1;