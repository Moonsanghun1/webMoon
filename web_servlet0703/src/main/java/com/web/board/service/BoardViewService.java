package com.web.board.service;

import java.util.List;

import com.web.board.dao.BoardDAO;
import com.web.board.vo.BoardVO;
import com.web.main.dao.DAO;
import com.web.main.service.Service;
import com.webjjang.util.page.PageObject;

public class BoardViewService implements Service {
	
	private BoardDAO dao;
	
	@Override
	public void setDAO(DAO dao) {
		// TODO Auto-generated method stub
		this.dao = (BoardDAO) dao;
	}
	@Override
	public BoardVO service(Object obj) throws Exception {
		// TODO Auto-generated method stub
		Long objs[] = (Long[]) obj;
		Long no = objs[0];
		Long inc = objs[1];
		
		if(inc == 1) dao.increase(no);
		
		return dao.view(no);
	}


}
