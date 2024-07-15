select m.id, m.name, m.birth, m.tel , g.gradeName, m.Status from member m , grade g where (status = 'Á¤»ó') and (g.gradeNo = m.gradeNo);
select m.id, m.name, m.gender, to_char(m.birth, 'yyyy-mm-dd') birth, m.email, m.tel, m.email, m.regDate, m.conDate , m.gradeNo 
			from member m , grade g  where id = 'admin' and (g.gradeNo = m.gradeNo)