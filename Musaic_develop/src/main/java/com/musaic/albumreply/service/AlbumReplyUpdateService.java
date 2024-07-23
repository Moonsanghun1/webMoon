package com.musaic.albumreply.service;


import com.musaic.albumreply.dao.AlbumReplyDAO;
import com.musaic.albumreply.vo.AlbumReplyVO;
import com.musaic.main.dao.DAO;
import com.musaic.main.service.Service;

public class AlbumReplyUpdateService implements Service {
	
	private AlbumReplyDAO dao;
	
	// dao setter
	public void setDAO(DAO dao) {
		
		this.dao = (AlbumReplyDAO) dao;
		
	}

	public Integer service(Object obj) throws Exception {
		// DB board에서 리스트 쿼리 실행해서 데이터 처리 
		
		// BoardReplyController - (Execute) - [BoardReplyUpdateService] - [BoardReplyDAO.update()]
		return dao.update((AlbumReplyVO)obj);
		
		
	}

}
