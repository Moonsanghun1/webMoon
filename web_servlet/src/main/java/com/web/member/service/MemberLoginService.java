package com.web.member.service;


import com.web.main.service.Service;
import com.web.member.dao.MemberDAO;
import com.web.member.vo.LoginVO;

public class MemberLoginService implements Service {
	
	@Override
	public LoginVO service(Object obj) throws Exception {

		// DB 처리는 DAO에서 처리 - NoticeDAO.view() : obj == no 
		// MemberController - (Execute) - [MemberViewService] - [MemberDAO.login()]
		return new MemberDAO().login((LoginVO) obj);
	}

}
