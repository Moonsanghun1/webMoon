package com.web.member.service;

import com.web.main.dao.DAO;
import com.web.main.service.Service;
import com.web.member.dao.MemberDAO;
import com.web.member.vo.MemberVO;

public class MemberWriteService implements Service {

	private MemberDAO dao;
	
	// dao setter
	public void setDAO(DAO dao) {
		
		this.dao = (MemberDAO) dao;
		
	}
	public Integer service(Object obj) throws Exception {
		// DB board에서 리스트 쿼리 실행해서 데이터 가져오기 - 리턴 
		// DB 처리는 DAO에서 처리 - BoardDAO.list()
		// BoardController - (Execute) - [BoardListService] - [BoardDAO.list()]
		return dao.write((MemberVO)obj);
		
		
	}

}
