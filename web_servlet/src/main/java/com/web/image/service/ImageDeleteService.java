package com.web.image.service;

import com.web.image.dao.ImageDAO;
import com.web.image.vo.ImageVO;
import com.web.main.dao.DAO;
import com.web.main.service.Service;

public class ImageDeleteService implements Service {
	
		private ImageDAO dao;
		
		// dao setter
		public void setDAO(DAO dao) {
			
			this.dao = (ImageDAO) dao;
			
		}

	public Integer service(Object obj) throws Exception {
		// DB board에서 리스트 쿼리 실행해서 데이터 가져오기 - 리턴 
		// DB 처리는 DAO에서 처리 - ImageDAO.list()
		// ImageController - (Execute) - [ImageDeleteService] - [ImageDAO.delete()]
		return dao.delete((ImageVO)obj);
		
		
	}

}
