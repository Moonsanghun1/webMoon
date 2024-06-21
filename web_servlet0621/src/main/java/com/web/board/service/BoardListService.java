package com.web.board.service;

import java.util.List;

import com.web.board.dao.BoardDAO;
import com.web.board.vo.BoardVO;
import com.web.main.dao.DAO;
import com.web.main.service.Service;
import com.webjjang.util.page.PageObject;

public class BoardListService implements Service {

	private BoardDAO dao;

	@Override
	public void setDAO(DAO dao) {
		// TODO Auto-generated method stub
		this.dao = (BoardDAO) dao;
		
	}
	

	
@Override
	public List<BoardVO> service(Object obj) throws Exception {
		// TODO Auto-generated method stub
		PageObject pageObject = (PageObject) obj;
		
		return dao.list(pageObject);
	}

}