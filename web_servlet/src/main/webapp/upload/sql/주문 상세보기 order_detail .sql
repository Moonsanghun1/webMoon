drop table order_detail cascade CONSTRAINTS purge;
drop SEQUENCE order_detail_seq ;

create table order_detail(
   
    odno number primary key, --�ֹ��󼼹�ȣ
    ono number REFERENCES orders(ono) not null, --�ֹ���ȣ
    Product_NO number REFERENCES Product(Product_NO), --��ǰ��ȣ
    PRODUCTCNT number(10)--�ֹ�����
);
create sequence order_detail_seq;
commit;


