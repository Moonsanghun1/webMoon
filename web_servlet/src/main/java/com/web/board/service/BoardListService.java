package com.web.board.service;

import java.util.List;

import com.web.board.dao.BoardDAO;
import com.web.board.vo.BoardVO;
import com.web.main.service.Service;
import com.webjjang.util.page.PageObject;

public class BoardListService implements Service {

	public List<BoardVO> service(Object obj) throws Exception {
		BoardDAO dao = new BoardDAO();
		PageObject pageObject = (PageObject) obj;
		// DB board에서 리스트 쿼리 실행해서 데이터 가져오기 - 리턴 
		// 전체 페이지 개수
		pageObject.setTotalRow(dao.getTotalRow(pageObject));
		
		// DB 처리는 DAO에서 처리 - BoardDAO.list()
		// BoardController - (Execute) - [BoardListService] - [BoardDAO.list()]
		return new BoardDAO().list(pageObject);
		
		
	}

}
