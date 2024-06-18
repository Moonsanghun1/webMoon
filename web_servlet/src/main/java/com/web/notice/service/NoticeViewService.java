package com.web.notice.service;

import com.web.notice.dao.NoticeDAO;
import com.web.notice.vo.NoticeVO;
import com.web.main.service.Service;

public class NoticeViewService implements Service {
	
	@Override
	public NoticeVO service(Object obj) throws Exception {

		// DB 처리는 DAO에서 처리 - NoticeDAO.view() : obj == no 
		// NoticeController - (Execute) - [NoticeViewService] - [NoticeDAO.view()]
		return new NoticeDAO().view((Long) obj);
	}

}
