package com.web.board.service;

import java.util.List;

import com.web.board.dao.BoardDAO;
import com.web.board.vo.BoardVO;
import com.web.main.dao.DAO;
import com.web.main.service.Service;

public class BoardWriteService implements Service {

	private BoardDAO dao;

	@Override
	public void setDAO(DAO dao) {
		// TODO Auto-generated method stub
		this.dao = (BoardDAO) dao;
		
	}
	

	
@Override
	public Integer service(Object obj) throws Exception {
		// TODO Auto-generated method stub

		return dao.write((BoardVO) obj);
	}

}