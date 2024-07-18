package com.web.message.service;

import com.web.main.dao.DAO;
import com.web.main.service.Service;
import com.web.message.dao.MessageDAO;
import com.web.message.vo.MessageVO;

public class MessageWriteService implements Service {

	private MessageDAO dao;
	
	// dao setter
	public void setDAO(DAO dao) {
		
		this.dao = (MessageDAO) dao;
		
	}
	public Integer service(Object obj) throws Exception {
		MessageVO vo = (MessageVO) obj;
		// DB 처리는 DAO에서 처리 - MessageDAO.list()
		// MessageController - (Execute) - [MessageListService] - [MessageDAO.list()]
		//
		Integer result = dao.write(vo);
		dao.increaseNewMsgCnt(vo.getAccepterId());
		return result;
		
		
	}

}
