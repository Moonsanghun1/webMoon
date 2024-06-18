package com.web.member.service;


import com.web.main.service.Service;
import com.web.member.dao.MemberDAO;
import com.web.member.vo.MemberVO;

public class MemberCondateUpdateService implements Service {
	
	@Override
	public Integer service(Object obj) throws Exception {

		
		// DB 처리는 DAO에서 처리 - MemberDAO.list()
		// BoardController - (Execute) - [BoardListService] - [BoardDAO.list()]
		return new MemberDAO().condateupdate((String) obj);
	}

}
