package com.web.notice.service;

import com.web.notice.dao.NoticeDAO;
import com.web.notice.vo.NoticeVO;
import com.web.main.dao.DAO;
import com.web.main.service.Service;

public class NoticeViewService implements Service {
	
	private NoticeDAO dao;

	@Override
	public NoticeVO service(Object obj) throws Exception {

		// DB 처리는 DAO에서 처리 - NoticeDAO.view() : obj == no 
		// NoticeController - (Execute) - [NoticeViewService] - [NoticeDAO.view()]
		return dao.view((Long) obj);
	}

	@Override
	public void setDAO(DAO dao) {
		// TODO Auto-generated method stub
		this.dao = (NoticeDAO) dao;
	}

}
