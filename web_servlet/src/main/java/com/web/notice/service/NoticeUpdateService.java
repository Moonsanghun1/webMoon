package com.web.notice.service;

import com.web.notice.dao.NoticeDAO;
import com.web.notice.vo.NoticeVO;
import com.web.main.dao.DAO;
import com.web.main.service.Service;

public class NoticeUpdateService implements Service {

	private NoticeDAO dao;

	public Integer service(Object obj) throws Exception {
		// DB notice에서 리스트 쿼리 실행해서 데이터 처리 
		
		// NoticeController - (Execute) - [NoticeUpdateService] - [NoticeDAO.update()]
		return dao.update((NoticeVO)obj);
		
		
	}

	@Override
	public void setDAO(DAO dao) {
		// TODO Auto-generated method stub
		this.dao = (NoticeDAO) dao;
	}

}
