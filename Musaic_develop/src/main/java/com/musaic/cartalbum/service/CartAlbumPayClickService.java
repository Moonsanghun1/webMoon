package com.musaic.cartalbum.service;

import com.musaic.cartalbum.dao.CartAlbumDAO;
import com.musaic.cartalbum.vo.CartAlbumVO;
import com.musaic.main.dao.DAO;
import com.musaic.main.service.Service;

public class CartAlbumPayClickService implements Service {

	private CartAlbumDAO dao;
	
	// DAO setter
	public void setDAO(DAO dao) {
		this.dao = (CartAlbumDAO) dao;
	}
	
	@Override
	public CartAlbumVO service(Object obj) throws Exception {
		// DB 처리는 DAO에서 처리 - CartAlbumDAO.view()
		return dao.payClick();
	}
}
