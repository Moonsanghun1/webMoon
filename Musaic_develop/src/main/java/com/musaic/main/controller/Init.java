package com.musaic.main.controller;

import java.util.HashMap;
import java.util.Map;

import com.musaic.album.dao.AlbumDAO;
import com.musaic.album.service.AlbumChangeService;
import com.musaic.album.service.AlbumDeleteService;
import com.musaic.album.service.AlbumListService;
import com.musaic.album.service.AlbumUpdateService;
import com.musaic.album.service.AlbumViewService;
import com.musaic.album.service.AlbumWriteService;
import com.musaic.albumreply.dao.AlbumReplyDAO;
import com.musaic.albumreply.service.AlbumReplyDeleteService;
import com.musaic.albumreply.service.AlbumReplyListService;
import com.musaic.albumreply.service.AlbumReplyUpdateService;
import com.musaic.albumreply.service.AlbumReplyWriteService;
import com.musaic.main.dao.DAO;
import com.musaic.main.service.Service;

public class Init {

	// service 생성해서 저장하는 객체 - <URI, service>
	private static Map<String, Service> serviceMap = new HashMap<>();
	// dao 생성해서 저장하는 객체 - <className, dao>
	private static Map<String, DAO> daoMap = new HashMap<>();
	
	// static 변수에 데이터를 초기화 시키는 1번만 실행되는 블록 -> 클래스가 불려지만 자동실행
	static {
		// ---- [앨범 관리 객체 생성과 조립 ] -----------------------
		 //dao 생성
		daoMap.put("albumDAO", new AlbumDAO());
		//service 생성
		serviceMap.put("/album/list.do", new AlbumListService());
		serviceMap.put("/album/view.do", new AlbumViewService());
		serviceMap.put("/album/write.do", new AlbumWriteService());
		serviceMap.put("/album/update.do", new AlbumUpdateService());
		serviceMap.put("/album/delete.do", new AlbumDeleteService());
		serviceMap.put("/album/changeImage.do", new AlbumChangeService());
		 //조립 dao->service
		serviceMap.get("/album/list.do").setDAO(daoMap.get("albumDAO"));
		serviceMap.get("/album/view.do").setDAO(daoMap.get("albumDAO"));
		serviceMap.get("/album/write.do").setDAO(daoMap.get("albumDAO"));
		serviceMap.get("/album/update.do").setDAO(daoMap.get("albumDAO"));
		serviceMap.get("/album/delete.do").setDAO(daoMap.get("albumDAO"));
		serviceMap.get("/album/changeImage.do").setDAO(daoMap.get("albumDAO"));
		
		// ----[앨범 댓글 객체 생성과 조립] ====
		daoMap.put("albumreplyDAO", new AlbumReplyDAO());
		// service 생성
		serviceMap.put("/albumreply/list.do", new AlbumReplyListService()); 
		serviceMap.put("/albumreply/write.do", new AlbumReplyWriteService()); 
		serviceMap.put("/albumreply/update.do", new AlbumReplyUpdateService()); 
		serviceMap.put("/albumreply/delete.do", new AlbumReplyDeleteService());		
		// 조립 dao -> servive
		serviceMap.get("/albumreply/list.do").setDAO(daoMap.get("albumreplyDAO"));
		serviceMap.get("/albumreply/write.do").setDAO(daoMap.get("albumreplyDAO"));
		serviceMap.get("/albumreply/update.do").setDAO(daoMap.get("albumreplyDAO"));
		serviceMap.get("/albumreply/delete.do").setDAO(daoMap.get("albumreplyDAO"));
		System.out.println("Init.static 초기화 블록 ----- 객체 생성과 로딩 ------");
	}
	
	public static Service get(String uri) {
		return serviceMap.get(uri);
	}
	
}
