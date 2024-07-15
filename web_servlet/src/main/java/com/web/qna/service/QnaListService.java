package com.web.qna.service;

import java.util.List;
import com.web.main.dao.DAO;
import com.web.main.service.Service;
import com.web.qna.dao.QnaDAO;
import com.web.qna.vo.QnaVO;
import com.webjjang.util.page.PageObject;

public class QnaListService implements Service {

	private QnaDAO dao;
	
	// dao setter
	public void setDAO(DAO dao) {
		
		this.dao = (QnaDAO) dao;
		
	}
		
	public List<QnaVO> service(Object obj) throws Exception {
	
		PageObject pageObject = (PageObject) obj;
		// DB board에서 리스트 쿼리 실행해서 데이터 가져오기 - 리턴 
		// 전체 페이지 개수
		pageObject.setTotalRow(dao.getTotalRow(pageObject));
		
		// DB 처리는 DAO에서 처리 - BoardDAO.list()
		// BoardController - (Execute) - [BoardListService] - [BoardDAO.list()]
		return dao.list(pageObject);
		
		
	}

}
