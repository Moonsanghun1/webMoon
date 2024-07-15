select o.oNo,m.id, to_char(o.orderdate, 'yyyy-mm-dd') orderdate, o.status 
from orders o, member m 
 where o.id = 'test1' and (o.id = m.id);
 

-- 1. 리스트 만들기
select o.ono, p.product_name,  od.productcnt, to_char(o.orderdate, 'yyyy-mm-dd') orderdate, o.status from order_detail od, orders o , product p, member m 
where o.id = 'test1' and (o.id = m.id) and (od.product_No = p.product_no);



-- 2. 주문 상세보기 - 주문 번호가 4번인 데이터
--   2-1. 주문 번호에 따른 데이터 1개
select oNO from orders where oNo = 1;
--   2-2. 주문 번호에 따른 주문 상세 리스트
select od.odno, o.ono, p.PRODUCT_NAME, p.price, od.PRODUCTCNT, c.QUANTITY, to_char(o.orderdate, 'yyyy-mm-dd') orderdate,o.Addr,o.request,o.Payment,o.status,o.reason  
from order_detail od,Product p ,cart c,orders o
where (oNo = 1) and (od.PRODUCT_NO = p.PRODUCT_NO) and (c.PRODUCTNO = p.PRODUCT_NO) and (o.cartno = c.no);

select o.ono, p.product_name, c.productcnt, c.QUANTITY, to_char(o.orderdate, 'yyyy-mm-dd') orderdate, o.Addr, o.request, o.Payment ,o.status,o.reason  
from cart c, orders o , product p 
where ono = 1 and (o.PRODUCT_NO = p.PRODUCT_NO) and (o.PRODUCT_NO = c.PRODUCTNO) and (o.cartno = c.no);

SELECT od.odno, od.ono, p.PRODUCT_NAME, p.price, od.PRODUCTCNT, 
       TO_CHAR(o.orderdate, 'yyyy-mm-dd') AS orderdate, o.name , o.Addr, o.request, o.Payment, o.status, o.reason 
FROM order_detail od , product p, orders o
WHERE od.ono = 1 and (od.PRODUCT_NO = p.PRODUCT_NO) and (o.oNO = od.oNO );


-- 3. 주문 등록
-- 3-1. 주문 정보
insert into orders (oNo, id,  name, tel, payment, addr ,Request)
values (orders_seq.nextval, 'test1', '김인직', '010-1234-4321', '카드 결제', '경기도 용현로 143', '배송부탁');



commit;

select * from cart where id = 'test1';
select * from orders;

-- 3-2 장바구니의 내용을 상세로 등록

 INSERT INTO order_detail(odNo, ono, Product_no, PRODUCTCNT) 
(SELECT order_detail_seq.nextval, '1',  c.Productno, c.PRODUCTCNT FROM cart c);

INSERT INTO order_detail (odNo, oNo, PRODUCT_NO, PRODUCTCNT,QUANTITY)
SELECT order_detail_seq.nextval,
       (SELECT MAX(oNo) FROM orders WHERE id = 'test1'),
       c.Productno,
       c.PRODUCTCNT,
       c.QUANTITY
FROM cart c
WHERE c.id = 'test1';

INSERT INTO order_detail (odNo, oNo, PRODUCT_NO, PRODUCTCNT)
SELECT order_detail_seq.nextval,
       (SELECT MAX(oNo) FROM orders WHERE id = 'test1'),
       c.Productno,
       c.PRODUCTCNT
FROM cart c
WHERE c.id = 'test1';



COMMIT;

INSERT INTO cart (id, no, PRODUCTCNT,PRODUCTNO)
VALUES ('test1', '2', '3', '4');

SELECT * 
FROM order_detail;

SELECT * 
FROM cart;

select max(ono) from orders where id = 'test1';

-- 3-3. 장바구니는 삭제
delete from cart where id= 'test1';


COMMIT;

INSERT INTO order_detail(odNo, ono, Product_no, PRODUCTCNT) 
			(SELECT order_detail_seq.nextval, (SELECT MAX(ono) FROM orders where id = 'test'), c.Productno, c.PRODUCTCNT 
			 FROM cart c);


commit;

select o.ono, p.product_name, c.productcnt, c.QUANTITY, to_char(o.orderdate, 'yyyy-mm-dd') orderdate, o.Addr, o.request, o.Payment ,o.status,o.reason  from cart c, orders o , product p
			 where ono = 2 and (o.PRODUCT_NO = p.PRODUCT_NO) and (o.PRODUCT_NO = c.PRODUCTNO) and (o.cartno = c.no);
             
SELECT DISTINCT c.no, c.productNo, p.product_name , c.productCnt, c.quantity, c.totalPrice 
            FROM cart c 
            JOIN product p ON c.productNo = p.product_no 
            WHERE c.id = ? order by no desc ;
            
select o.ono, p.product_name, od.productcnt,  to_char(o.orderdate, 'yyyy-mm-dd') orderdate, o.status from order_detail od, orders o , product p, member m 
			where o.id = 'test1'  order by ono;
            
select o.oNo, m.id, to_char(o.orderdate, 'yyyy-mm-dd') orderdate, o.status , (select sum (p.price * od.productcnt + p.delivery_charge) from orders o,  order_detail od, product p where o.ono = 1) totalprice
 from orders o, member m
 where o.id = 'test1' and (o.id = m.id)   ;
        
SELECT c.no, c.productNo, p.product_name , c.productCnt, p.price, p.delivery_charge  
			FROM cart c  JOIN product p ON c.productNo = p.product_no WHERE c.id = 'test1' order by no desc;

select o.oNo, m.id, to_char(o.orderdate, 'yyyy-mm-dd') orderdate, o.status 
 from orders o, member m where o.id = 'test1' and (o.id = m.id);
