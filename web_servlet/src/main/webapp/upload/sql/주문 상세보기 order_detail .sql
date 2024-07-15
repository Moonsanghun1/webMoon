drop table order_detail cascade CONSTRAINTS purge;
drop SEQUENCE order_detail_seq ;

create table order_detail(
   
    odno number primary key, --주문상세번호
    ono number REFERENCES orders(ono) not null, --주문번호
    Product_NO number REFERENCES Product(Product_NO), --상품번호
    PRODUCTCNT number(10)--주문수량
);
create sequence order_detail_seq;
commit;


