package com.web.image.service;

import java.util.List;

import com.web.image.dao.ImageDAO;
import com.web.image.vo.ImageVO;
import com.web.main.dao.DAO;
import com.web.main.service.Service;
import com.webjjang.util.page.PageObject;

public class ImageListService implements Service {

	private ImageDAO dao;
	
	// dao setter
	public void setDAO(DAO dao) {
		
		this.dao = (ImageDAO) dao;
		
	}
		
	public List<ImageVO> service(Object obj) throws Exception {
	
		PageObject pageObject = (PageObject) obj;
		// DB board에서 리스트 쿼리 실행해서 데이터 가져오기 - 리턴 
		// 전체 페이지 개수
		pageObject.setTotalRow(dao.getTotalRow(pageObject));
		// DB 처리는 DAO에서 처리 - BoardDAO.list()
		// BoardController - (Execute) - [BoardListService] - [BoardDAO.list()]
		return dao.list(pageObject);
		
		
	}

}
