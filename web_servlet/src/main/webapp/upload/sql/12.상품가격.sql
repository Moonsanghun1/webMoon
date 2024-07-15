drop table price cascade CONSTRAINTS purge;
drop SEQUENCE price_seq;

create table price( 
    pno number primary key,
    gno number REFERENCES goods(gno) not null,
    std_price number not null,
    discount number,
    rate number,
    startDate date DEFAULT sysdate,
    endDate date DEFAULT '9999-12-31'
);
create SEQUENCE price_seq;
commit;