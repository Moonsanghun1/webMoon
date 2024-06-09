package com.web.notice.service;

import java.util.List;

import com.web.notice.dao.NoticeDAO;
import com.web.notice.vo.NoticeVO;
import com.web.main.service.Service;

public class NoticeListService implements Service {

	public List<NoticeVO> service(Object obj) throws Exception {
		// DB notice에서 리스트 쿼리 실행해서 데이터 가져오기 - 리턴 
		// DB 처리는 DAO에서 처리 - NoticeDAO.list()
		// NoticeController - (Execute) - [NoticeListService] - [NoticeDAO.list()]
		return new NoticeDAO().list();
		
		
	}

}
