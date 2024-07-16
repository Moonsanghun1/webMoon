package com.web.qna.service;

import com.web.main.dao.DAO;
import com.web.main.service.Service;
import com.web.qna.dao.QnaDAO;
import com.web.qna.vo.QnaVO;

public class QnaViewService implements Service {
	
	private QnaDAO dao;
	
	// dao setter
	public void setDAO(DAO dao) {
		
		this.dao = (QnaDAO) dao;
		
	}
	@Override
	public QnaVO service(Object obj) throws Exception {

		// DB 처리는 DAO에서 처리 - QnaDAO.list()
		// QnaController - (Execute) - [QnaViewService] - [QnaDAO.list()]
		return dao.view((Long) obj);
	}

}
