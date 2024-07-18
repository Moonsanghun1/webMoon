package com.web.message.service;

import com.web.main.dao.DAO;
import com.web.main.service.Service;
import com.web.message.dao.MessageDAO;
import com.web.message.vo.MessageVO;

public class MessageViewService implements Service {
	
	private MessageDAO dao;
	
	// dao setter
	public void setDAO(DAO dao) {
		
		this.dao = (MessageDAO) dao;
		
	}
	@Override
	public MessageVO service(Object obj) throws Exception {
		
		// 받은 메세지인 경우 (vo.accepterId != null) 처리 - 받은 날짜, 새로운 메세지
		MessageVO vo =  (MessageVO) obj;
		Long no = vo.getNo();
		String id = vo.getAccepterId();
		
		// 받은 메세지 (vo.accepterId != null)인 경우의 처리
		if(vo.getAccepterId() != null ) {
		// 읽음 표시 처리 - readed : 1 - null -> sysdate, readed : 0 - acceptDate 유지
			int readed = dao.setReaded(no);
			if(readed == 1) dao.decreaseNewMsgCnt(id);
		}
		// DB 처리는 DAO에서 처리 - BoardDAO.list()
		//MessageController - (Execute) - [MessageViewService] - [MessageDAO.list()]
		return dao.view(no);
	}

}
