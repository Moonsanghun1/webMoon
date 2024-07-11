package com.web.image.service;

import com.web.image.dao.ImageDAO;
import com.web.image.vo.ImageVO;
import com.web.main.dao.DAO;
import com.web.main.service.Service;

public class ImageUpdateService implements Service {
	
	private ImageDAO dao;
	
	// dao setter
	public void setDAO(DAO dao) {
		
		this.dao = (ImageDAO) dao;
		
	}

	public Integer service(Object obj) throws Exception {
		// DB board에서 리스트 쿼리 실행해서 데이터 처리 
		
		// ImageController - (Execute) - [ImageListService] - [ImageDAO.update()]
		return dao.update((ImageVO)obj);
		
		
	}

}