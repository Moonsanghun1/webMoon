drop table order_detail cascade CONSTRAINTS purge;
drop SEQUENCE order_detail_seq;

create table order_detail(
   
    odno number primary key, --�ֹ��󼼹�ȣ
    ono number REFERENCES orders(ono), --�ֹ���ȣ
    itemNo number REFERENCES Product(Product_NO), --��ǰ��ȣ
    quantity number(10) not null --�ֹ�����
    
);
create sequence order_detail_seq;