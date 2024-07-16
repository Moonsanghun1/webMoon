package com.web.member.service;

import com.web.main.dao.DAO;
import com.web.main.service.Service;
import com.web.member.dao.MemberDAO;

public class MemberCondateUpdateService implements Service {
	
private MemberDAO dao;
	
	// dao setter
	public void setDAO(DAO dao) {
		this.dao = (MemberDAO) dao;
	}

	@Override
	public Integer service(Object obj) throws Exception {
		// DB 처리는 DAO에서 처리 - MemberDAO.updateConDate() : obj == id
		// MemberController - (Execute) - [MemberListService] - MemberDAO.view()
		return dao.condateupdate((String)obj);
	}


}
