package com.web.board.service;

import com.web.board.dao.BoardDAO;
import com.web.board.vo.BoardVO;
import com.web.main.service.Service;

public class BoardUpdateService implements Service {

	public Integer service(Object obj) throws Exception {
		// DB board에서 리스트 쿼리 실행해서 데이터 처리 
		
		// BoardController - (Execute) - [BoardListService] - [BoardDAO.update()]
		return new BoardDAO().update((BoardVO)obj);
		
		
	}

}
