package com.web.member.service;

import java.util.List;

import javax.management.loading.PrivateClassLoader;

import com.web.board.dao.BoardDAO;
import com.web.board.vo.BoardVO;
import com.web.main.dao.DAO;
import com.web.main.service.Service;
import com.web.member.dao.MemberDAO;
import com.web.member.vo.MemberVO;
import com.webjjang.util.page.PageObject;

public class MemberListService implements Service {

	private MemberDAO dao;
	
	// dao setter
	public void setDAO(DAO dao) {
		
		this.dao = (MemberDAO) dao;
		
	}
		
	public List<MemberVO> service(Object obj) throws Exception {
	
		PageObject pageObject = (PageObject) obj;
		// DB board에서 리스트 쿼리 실행해서 데이터 가져오기 - 리턴 
		// 전체 페이지 개수
		//pageObject.setTotalRow(dao.getTotalRow(pageObject));
		
		// DB 처리는 DAO에서 처리 - MemberDAO.list()
		// MemberController - (Execute) - [MemberListService] - [MemberDAO.list()]
		return dao.list(pageObject);
		
		
	}

}
