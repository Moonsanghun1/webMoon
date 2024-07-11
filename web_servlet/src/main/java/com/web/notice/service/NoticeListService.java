package com.web.notice.service;

import java.util.List;

import com.web.notice.dao.NoticeDAO;
import com.web.notice.vo.NoticeVO;
import com.webjjang.util.page.PageObject;
import com.web.main.dao.DAO;
import com.web.main.service.Service;

public class NoticeListService implements Service {

	private NoticeDAO dao;
	
	@Override
	public void setDAO(DAO dao) {
		// TODO Auto-generated method stub
		this.dao = (NoticeDAO) dao;
	}
	
	public List<NoticeVO> service(Object obj) throws Exception {
		
		PageObject pageObject = (PageObject) obj;
		// DB board에서 리스트 쿼리 실행해서 데이터 가져오기 - 리턴 
		// 전체 페이지 개수
		pageObject.setTotalRow(dao.getTotalRow(pageObject));
		
		// DB notice에서 리스트 쿼리 실행해서 데이터 가져오기 - 리턴 
		// DB 처리는 DAO에서 처리 - NoticeDAO.list()
		// NoticeController - (Execute) - [NoticeListService] - [NoticeDAO.list()]
		
		return dao.list(pageObject);
		
		
	}


}
