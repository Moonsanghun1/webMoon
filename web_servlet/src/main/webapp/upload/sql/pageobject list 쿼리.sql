SELECT * 
FROM (
    SELECT rownum rnum, no, title, writer, writeDate, hit 
    FROM (
        SELECT no, title, writer, TO_CHAR(writeDate, 'yyyy-mm-dd') writeDate, hit 
        FROM board 
        ORDER BY no DESC
    ) 
    WHERE rownum <= 5
) 
WHERE rnum >= 1;

select rownum rnum, no, title, writer, writeDate, hit  from 
(  select rownum rnum, no, title, writer, writeDate, hit  from 
(  select no, title, writer,  to_char(writeDate, 'yyyy-mm-dd') 
writeDate, hit  from board  where 1 = 0  or title like ?  order by no desc  );