package com.web.boardreply.service;


import com.web.boardreply.dao.BoardReplyDAO;
import com.web.boardreply.vo.BoardReplyVO;
import com.web.main.dao.DAO;
import com.web.main.service.Service;

public class BoardReplyUpdateService implements Service {
	
	private BoardReplyDAO dao;
	
	// dao setter
	public void setDAO(DAO dao) {
		
		this.dao = (BoardReplyDAO) dao;
		
	}

	public Integer service(Object obj) throws Exception {
		// DB board에서 리스트 쿼리 실행해서 데이터 처리 
		
		// BoardReplyController - (Execute) - [BoardReplyUpdateService] - [BoardReplyDAO.update()]
		return dao.update((BoardReplyVO)obj);
		
		
	}

}
