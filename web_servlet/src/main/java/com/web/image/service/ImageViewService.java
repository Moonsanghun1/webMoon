package com.web.image.service;

import com.web.image.dao.ImageDAO;
import com.web.image.vo.ImageVO;
import com.web.main.dao.DAO;
import com.web.main.service.Service;

public class ImageViewService implements Service {
	
	private ImageDAO dao;
	
	// dao setter
	public void setDAO(DAO dao) {
		
		this.dao = (ImageDAO) dao;
		
	}
	@Override
	public ImageVO service(Object obj) throws Exception {
	
		
		// DB 처리는 DAO에서 처리 - ImageDAO.list()
		// ImageController - (Execute) - [ImageViewService] - [ImageDAO.list()]
		return dao.view((Long) obj);
	}

}
