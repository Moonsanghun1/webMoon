drop table orders cascade CONSTRAINTS purge;
drop SEQUENCE orders_seq;

create table orders (
    ono number(10) primary key, --주문번호
    id varchar2(20) REFERENCES member(id), --회원id 
    --product_No number(10) REFERENCES Product(Product_NO) on delete cascade, --상품번호
    --CartNo number(10) REFERENCES cart(NO) on delete cascade, --장바구니번호
    Name varchar2(30) not null, --수령인
    Tel varchar2(15) not null, --수령인 연락처
    OrderDate date default sysdate, --주문일자
    payment varchar2(30) Default '무통장 입금' check (payment in ('무통장 입금', '카드 결제', '휴대폰 결제')) not null ,--결제수단
    Status varchar2(20) Default '결제완료' check (status in ('결제완료', '배송중', '배송완료', '구매확정', '환불신청')) not null , --주문상태
    Addr varchar2(300) not null, --배송주소
    Request varchar2(1000), --요청사항
    reason varchar2(1000) --환불사유
    
);
create sequence orders_seq;

SELECT DISTINCT id FROM cart;

insert into orders(ono, id ,product_No ,name,tel,addr, payment, cartNo)
values(orders_seq.nextval,'test1', '1', '문상훈', '010-1233-5678','의정부', '무통장 입금', '3');
commit;

insert into orders(ono,id,product_No,name,tel,addr, payment, cartNo)
values(orders_seq.nextval, 'test2','3', '황문성', '010-1234-5678','파주', '카드 결제',23);
commit;

select * from orders;

select o.ono, p.product_name, c.productcnt, c.totalprice, o.orderdate, o.status from cart c, orders o , product p  
where (o.PRODUCT_NO = p.PRODUCT_NO) and (o.PRODUCT_NO = c.PRODUCTNO) ;
select o.ono,p.product_No, p.product_name, c.productcnt, c.totalprice, o.orderdate, o.status from cart c, orders o , product p  ;
select o.ono, p.product_No, p.product_name, o.orderdate, o.status from orders o , product p;
select o.ono, p.product_name, c.productcnt, c.totalprice, o.orderdate, o.status from cart c, orders o , product p
			where (o.PRODUCT_NO = p.PRODUCT_NO) and (o.PRODUCT_NO = c.PRODUCTNO);
commit;

select o.ono, p.product_name, c.productcnt, c.totalprice, to_char(o.orderdate, 'yyyy-mm-dd') orderdate, o.Addr, o.request,o.Payment ,o.status  from cart c, orders o , product p 
			where ono = 1 and (o.PRODUCT_NO = p.PRODUCT_NO) and (o.PRODUCT_NO = c.PRODUCTNO);
            

 select o.ono, o.id, o.product_NO,c.no, p.product_name, c.productcnt, c.totalprice, to_char(o.orderdate, 'yyyy-mm-dd') orderdate, o.status from cart c, orders o , product p 
	where c.id = 'test2' and (o.PRODUCT_NO = p.PRODUCT_NO) and (p.PRODUCT_NO = c.PRODUCTNO) and (o.id = c.id) and (o.cartno = c.no);
    
    SELECT o.ono, o.id, o.product_NO, c.no, p.product_name, c.productcnt, c.totalprice, to_char(o.orderdate, 'yyyy-mm-dd') orderdate, o.status 
FROM cart c, orders o, product p 
WHERE c.id IN (SELECT DISTINCT id FROM cart) AND (o.PRODUCT_NO = p.PRODUCT_NO) AND (p.PRODUCT_NO = c.PRODUCTNO) AND (o.id = c.id) and (o.cartno = c.no);

select o.ono, m.id ,p.product_name, c.productcnt, c.totalprice, to_char(o.orderdate, 'yyyy-mm-dd') orderdate, o.status from cart c, orders o , product p, member m
		where o.PRODUCT_NO = p.PRODUCT_NO and (o.PRODUCT_NO = c.PRODUCTNO) and (o.id = c.id) and (m.id = o.id );
        
 select o.ono, p.product_name, c.productcnt, c.totalprice, to_char(o.orderdate, 'yyyy-mm-dd') orderdate, o.status from cart c, orders o , product p, member m 
		 where o.id = 'test1'  and (o.id = m.id) and (o.cartno = c.no) order by ono;       
        
create table order_detail(
    odno number primary key, --주문상세번호
    ono number REFERENCES orders(ono), --주문번호
    itemNo number REFERENCES Product(Product_NO), --상품번호
    quantity number(10) not null --주문수량

);
create sequence order_detail_seq;        
        
        
        
        
        