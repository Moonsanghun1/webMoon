package com.web.boardreply.service;

import java.util.List;


import com.web.boardreply.dao.BoardReplyDAO;
import com.web.boardreply.vo.BoardReplyVO;
import com.web.main.dao.DAO;
import com.web.main.service.Service;
import com.webjjang.util.page.ReplyPageObject;

public class BoardReplyListService implements Service {

	private BoardReplyDAO dao;
	
	// dao setter
	public void setDAO(DAO dao) {
		
		this.dao = (BoardReplyDAO) dao;
		
	}
		
	public List<BoardReplyVO> service(Object obj) throws Exception {
	
		ReplyPageObject replyPageObject = (ReplyPageObject) obj;
		// DB board에서 리스트 쿼리 실행해서 데이터 가져오기 - 리턴 
		// 전체 페이지 개수
		replyPageObject.setTotalRow(dao.getTotalRow(replyPageObject));
		
		// DB 처리는 DAO에서 처리 - BoardDAO.list()
		// BoardController - (Execute) - [BoardListService] - [BoardDAO.list()]
		return dao.list(replyPageObject);
		
		
	}

}
