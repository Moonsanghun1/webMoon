-- 1. list
select no, title, writer, writeDate, hit from board order by no desc;
-- 2. view(with increase)
update board set hit = hit + 1 where no = 1;
commit;
select no, title, content, writer, writeDate, hit from board 
where no = 1;
-- 3. write 
insert into board(no,title,content,writer, pw )
values(board_seq.nextval, '����', '���α׷�', 'lee', '1111');
commit;

-- 4. update
update board set title = '����Ŭ', content ='���α׷�', writer = 'moon' where no = 1
and pw = '1111';
commit;


-- 5. delete
delete from board where no = 1 and pw = '1111';
rollback;

