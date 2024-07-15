create table order_detail(
    odno number primary key, --�ֹ��󼼹�ȣ
    ono number, --�ֹ���ȣ
    itemNo number, --��ǰ��ȣ
    quantity number(10) not null --�ֹ�����
   -- constraint fk_order_detail_ono foreign key(ono) references orders(ono),
   -- constraint fk_order_detail_itemNo foreign key(itemNo) references item(itemNo)
);
create sequence order_detail_seq start with 1 increment by 1;