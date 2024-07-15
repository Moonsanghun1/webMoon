drop table orders cascade CONSTRAINTS purge;
drop SEQUENCE orders_seq;

create table orders (
    ono number(10) primary key, --�ֹ���ȣ
    id varchar2(20) REFERENCES member(id), --ȸ��id 
    --product_No number(10) REFERENCES Product(Product_NO) on delete cascade, --��ǰ��ȣ
    --CartNo number(10) REFERENCES cart(NO) on delete cascade, --��ٱ��Ϲ�ȣ
    Name varchar2(30) not null, --������
    Tel varchar2(15) not null, --������ ����ó
    OrderDate date default sysdate, --�ֹ�����
    payment varchar2(30) Default '������ �Ա�' check (payment in ('������ �Ա�', 'ī�� ����', '�޴��� ����')) not null ,--��������
    Status varchar2(20) Default '�����Ϸ�' check (status in ('�����Ϸ�', '�����', '��ۿϷ�', '����Ȯ��', 'ȯ�ҽ�û')) not null , --�ֹ�����
    Addr varchar2(300) not null, --����ּ�
    Request varchar2(1000), --��û����
    reason varchar2(1000) --ȯ�һ���
    
);
create sequence orders_seq;

SELECT DISTINCT id FROM cart;

insert into orders(ono, id ,product_No ,name,tel,addr, payment, cartNo)
values(orders_seq.nextval,'test1', '1', '������', '010-1233-5678','������', '������ �Ա�', '3');
commit;

insert into orders(ono,id,product_No,name,tel,addr, payment, cartNo)
values(orders_seq.nextval, 'test2','3', 'Ȳ����', '010-1234-5678','����', 'ī�� ����',23);
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
    odno number primary key, --�ֹ��󼼹�ȣ
    ono number REFERENCES orders(ono), --�ֹ���ȣ
    itemNo number REFERENCES Product(Product_NO), --��ǰ��ȣ
    quantity number(10) not null --�ֹ�����

);
create sequence order_detail_seq;        
        
        
        
        
        