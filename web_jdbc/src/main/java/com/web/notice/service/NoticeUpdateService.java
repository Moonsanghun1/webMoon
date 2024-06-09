package com.web.notice.service;

import com.web.notice.dao.NoticeDAO;
import com.web.notice.vo.NoticeVO;
import com.web.main.service.Service;

public class NoticeUpdateService implements Service {

	public Integer service(Object obj) throws Exception {
		// DB notice에서 리스트 쿼리 실행해서 데이터 처리 
		
		// NoticeController - (Execute) - [NoticeUpdateService] - [NoticeDAO.update()]
		return new NoticeDAO().update((NoticeVO)obj);
		
		
	}

}
