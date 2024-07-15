create table order_detail(
    odno number primary key, --주문상세번호
    ono number, --주문번호
    itemNo number, --상품번호
    quantity number(10) not null --주문수량
   -- constraint fk_order_detail_ono foreign key(ono) references orders(ono),
   -- constraint fk_order_detail_itemNo foreign key(itemNo) references item(itemNo)
);
create sequence order_detail_seq start with 1 increment by 1;