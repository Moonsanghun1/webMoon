package com.web.member.service;

import java.util.List;

import com.web.board.dao.BoardDAO;
import com.web.board.vo.BoardVO;
import com.web.main.service.Service;
import com.web.member.dao.MemberDAO;
import com.web.member.vo.MemberVO;

public class MemberListService implements Service {
	
	@Override
	public List<MemberVO> service(Object obj) throws Exception {
		//넘어오는 데이터의 구조 obj - Long[] : obj[0] - no, obj[1] - inc
		
		// DB 처리는 DAO에서 처리 - BoardDAO.list()
		// BoardController - (Execute) - [BoardListService] - [BoardDAO.list()]
		return new MemberDAO().list();
	}

}
