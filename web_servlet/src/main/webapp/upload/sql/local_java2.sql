select * from notice
where (1=1)
-- �˻�����
and ( 1= 0 or title like '%Ű����ũ%' or content like '%Ű����ũ%' );
-- �Ⱓ ����(pre , old, res, all)
-- ���� ����
-- and ( 1 = 1 and trunc(sysdate) between trunc(startDate) and trunc(endDate))
-- ���� ����
-- and ( 1 = 1 and trunc(sysdate) > trunc(endDate))
-- ���� ����
-- and ( 1 = 1 and trunc(sysdate) < trunc(startDate) )
-- ��ü ����
-- and ( 1 = 1);
drop table album;

create table album(
albumNo number PRIMARY key, -- �ٹ� ��ȣ
musicNo number REFERENCES music(music_No) not null, -- ���� ��ȣ
title varchar2(100) not null, -- �ٹ� ����
release_date date DEFAULT sysdate, --  �߸���
artist varchar2(100) not null, -- ��Ƽ��Ʈ��
genre varchar2(30) not null, -- �帣
price number(20) not null, -- ����
info varchar2(2000), -- �ٹ� ����
image  varchar2(300)  -- �ٹ� Ŀ��
);