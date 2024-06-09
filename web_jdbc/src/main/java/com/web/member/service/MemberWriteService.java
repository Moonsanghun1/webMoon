package com.web.member.service;


import com.web.main.service.Service;
import com.web.member.dao.MemberDAO;
import com.web.member.vo.LoginVO;
import com.web.member.vo.MemberVO;

public class MemberWriteService implements Service {
	
	@Override
	public Integer service(Object obj) throws Exception {

		// DB 처리는 DAO에서 처리 - NoticeDAO.view() : obj == no 
		// MemberController - (Execute) - [MemberViewService] - [MemberDAO.login()]
		return new MemberDAO().write((MemberVO) obj);
	}

}
