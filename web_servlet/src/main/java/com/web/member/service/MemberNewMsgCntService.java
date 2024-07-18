package com.web.member.service;

import com.web.main.dao.DAO;
import com.web.main.service.Service;
import com.web.member.dao.MemberDAO;

public class MemberNewMsgCntService implements Service {
	
	private MemberDAO dao;
	
	// dao setter
	public void setDAO(DAO dao) {
		
		this.dao = (MemberDAO) dao;
		
	}
	@Override
	public Long service(Object obj) throws Exception {
		//넘어오는 데이터의 구조 obj - Long[] : obj[0] - no, obj[1] - inc

	
		// DB 처리는 DAO에서 처리 - BoardDAO.list()
		// [AjaxController] - (Execute) - [MemberNewMsgCntService] - [MemberDAO.getNewMsgCnt(vo)]
		return dao.getNewMsgCnt((String)obj);
	}

}
