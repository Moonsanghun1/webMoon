package com.web.boardreply.service;

import com.web.board.dao.BoardDAO;
import com.web.board.vo.BoardVO;
import com.web.boardreply.dao.BoardReplyDAO;
import com.web.boardreply.vo.BoardReplyVO;
import com.web.main.dao.DAO;
import com.web.main.service.Service;

public class BoardReplyWriteService implements Service {

	private BoardReplyDAO dao;
	
	// dao setter
	public void setDAO(DAO dao) {
		
		this.dao = (BoardReplyDAO) dao;
		
	}
	public Integer service(Object obj) throws Exception {
		// DB board에서 리스트 쿼리 실행해서 데이터 가져오기 - 리턴 
		// DB 처리는 DAO에서 처리 - BoardDAO.list()
		// BoardController - (Execute) - [BoardListService] - [BoardDAO.list()]
		return dao.write((BoardReplyVO)obj);
		
		
	}

}
