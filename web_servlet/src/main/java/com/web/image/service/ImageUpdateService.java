package com.web.image.service;

import com.web.board.dao.BoardDAO;
import com.web.board.vo.BoardVO;
import com.web.main.dao.DAO;
import com.web.main.service.Service;

public class ImageUpdateService implements Service {
	
	private BoardDAO dao;
	
	// dao setter
	public void setDAO(DAO dao) {
		
		this.dao = (BoardDAO) dao;
		
	}

	public Integer service(Object obj) throws Exception {
		// DB board에서 리스트 쿼리 실행해서 데이터 처리 
		
		// BoardController - (Execute) - [BoardListService] - [BoardDAO.update()]
		return dao.update((BoardVO)obj);
		
		
	}

}
