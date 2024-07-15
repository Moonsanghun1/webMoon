SELECT od.odno, od.ono, p.PRODUCT_NAME, p.price, od.PRODUCTCNT, TO_CHAR(o.orderdate, 'yyyy-mm-dd') AS orderdate, o.name , o.Addr, o.request, o.Payment, o.status, o.reason
		FROM order_detail od , product p, orders o WHERE od.ono = 1 and (od.PRODUCT_NO = p.PRODUCT_NO) and (o.oNO = od.oNO );

select sum( p.price * od.productcnt + p.delivery_charge) from orders o, order_detail od , product p 
where (p.product_no= od.product_no) and (o.oNO = od.oNO) and o.ono = 3;

SELECT od.odno, od.ono, p.PRODUCT_NAME, p.price, od.PRODUCTCNT, TO_CHAR(o.orderdate, 'yyyy-mm-dd') AS orderdate, o.name , o.Addr, o.request, o.Payment, o.status, o.reason
	FROM order_detail od , product p, orders o 
		WHERE od.ono = 1 and (od.PRODUCT_NO = p.PRODUCT_NO) and (o.oNO = od.oNO );
        
        
select o.oNo, m.id, to_char(o.orderdate, 'yyyy-mm-dd') as orderdate, o.status,
p.price, od.productcnt, p.delivery_charge
from orders o 
join order_detail od on o.oNo = od.oNo
join member m on o.id = m.id 
join product p on p.product_no = od.product_no
where o.id = 'test1' ;

select o.oNo, m.id, to_char(o.orderdate, 'yyyy-mm-dd') as orderdate, o.status , sum( p.price * od.productcnt + p.delivery_charge)
		from orders o , member m, order_detail od, product p
where o.id = 'test1' and (o.id = m.id ) and (p.product_no = od.product_no ) and (o.oNo = od.oNo );

 select o.oNo, m.id, to_char(o.orderdate, 'yyyy-mm-dd') as orderdate, o.status, 
(select sum( p.price * od.productcnt + p.delivery_charge) 
 from order_detail od , product p 
 where (p.product_no= od.product_no) and (o.oNO = od.oNO)) totalPrice
 from orders o, member m  
 where (o.id = m.id) ;

select sum( p.price * od.productcnt + p.delivery_charge) 
 from orders o, order_detail od , product p 
 where (p.product_no= od.product_no) and (o.oNO = od.oNO) and o.ono = 3;

commit;