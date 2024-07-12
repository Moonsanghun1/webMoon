package com.web.member.service;

import com.web.main.dao.DAO;
import com.web.main.service.Service;
import com.web.member.dao.MemberDAO;

public class MemberCheckIdService implements Service {
	
	private MemberDAO dao;
	
	// dao setter
	public void setDAO(DAO dao) {
		
		this.dao = (MemberDAO) dao;
		
	}
	@Override
	public String service(Object obj) throws Exception {
		//넘어오는 데이터의 구조 obj - Long[] : obj[0] - no, obj[1] - inc

	
		// DB 처리는 DAO에서 처리 - BoardDAO.list()
		// [MemberController] - (Execute) - [MemberListService] - [MemberDAO.login(vo)]
		return dao.checkId((String)obj);
	}

}
