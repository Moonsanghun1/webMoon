package com.musaic.cartalbum.service;

import java.util.List;

import com.musaic.cartalbum.dao.CartAlbumDAO;
import com.musaic.cartalbum.vo.CartAlbumVO;
import com.musaic.main.dao.DAO;
import com.musaic.main.service.Service;

public class CartAlbumListService implements Service {
	
    private CartAlbumDAO dao;
    
    // dao setter
    public void setDAO(DAO dao) {
        this.dao = (CartAlbumDAO) dao;
    }

    @Override
    public List<CartAlbumVO> service(Object obj) throws Exception {
//        PageObject pageObject = (PageObject) obj;
        
        // DB에서 앨범 리스트 가져오기
        return dao.list((CartAlbumVO) obj);
    }
}
