package com.web.qna.service;

import com.web.board.dao.BoardDAO;
import com.web.board.vo.BoardVO;
import com.web.main.dao.DAO;
import com.web.main.service.Service;

public class QnaViewService implements Service {
	
	private BoardDAO dao;
	
	// dao setter
	public void setDAO(DAO dao) {
		
		this.dao = (BoardDAO) dao;
		
	}
	@Override
	public BoardVO service(Object obj) throws Exception {
		//넘어오는 데이터의 구조 obj - Long[] : obj[0] - no, obj[1] - inc
		Long[] objs = (Long[]) obj; // 데이터를 넣을 때 Long[]로 저장했어야만 한다.
		Long no = objs[0];
		Long inc = objs[1];
		// DB board에서 조회수 1 증가 하고 글보기 데이터 가져오서 리턴
		
		// 1. 조회수 1 증가 : inc == 1 
		if(inc == 1) dao.increase(no);
		// DB 처리는 DAO에서 처리 - BoardDAO.list()
		// BoardController - (Execute) - [BoardListService] - [BoardDAO.list()]
		return dao.view(no);
	}

}
