package com.web.message.service;

import java.util.List;
import com.web.main.dao.DAO;
import com.web.main.service.Service;
import com.web.message.dao.MessageDAO;
import com.web.message.vo.MessageVO;
import com.webjjang.util.page.PageObject;

public class MessageListService implements Service {

	private MessageDAO dao;
	
	// dao setter
	public void setDAO(DAO dao) {
		
		this.dao = (MessageDAO) dao;
		
	}
		
	public List<MessageVO> service(Object obj) throws Exception {
	
		PageObject pageObject = (PageObject) obj;
		// DB board에서 리스트 쿼리 실행해서 데이터 가져오기 - 리턴 
		// 전체 페이지 개수
		pageObject.setTotalRow(dao.getTotalRow(pageObject));
		
		// DB 처리는 DAO에서 처리 - BoardDAO.list()
		// MessageController - (Execute) - [MessageListService] - [MessageDAO.list()]
		return dao.list(pageObject);
		
		
	}

}
