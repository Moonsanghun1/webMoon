package com.musaic.main.controller;

import java.util.HashMap;
import java.util.Map;

import com.musaic.album.dao.AlbumDAO;
import com.musaic.album.service.AlbumListService;
import com.musaic.main.dao.DAO;
import com.musaic.main.service.Service;

public class Init {

	// service 생성해서 저장하는 객체 - <URI, service>
	private static Map<String, Service> serviceMap = new HashMap<>();
	// dao 생성해서 저장하는 객체 - <className, dao>
	private static Map<String, DAO> daoMap = new HashMap<>();
	
	// static 변수에 데이터를 초기화 시키는 1번만 실행되는 블록 -> 클래스가 불려지만 자동실행
	static {
		// ---- [일반 게시판 객체 생성과 조립 ] -----------------------
		 //dao 생성
		daoMap.put("albumDAO", new AlbumDAO());
		//service 생성
		serviceMap.put("/album/list.do", new AlbumListService());
		 //조립 dao->service
		serviceMap.get("/album/list.do").setDAO(daoMap.get("albumDAO"));

		System.out.println("Init.static 초기화 블록 ----- 객체 생성과 로딩 ------");
	}
	
	public static Service get(String uri) {
		return serviceMap.get(uri);
	}
	
}
