package com.web.main.controller;

import java.util.HashMap;
import java.util.Map;

import com.web.board.dao.BoardDAO;
import com.web.board.service.BoardListService;
import com.web.main.dao.DAO;
import com.web.main.service.Service;

public class init {
	private static Map<String, Service> serviceMap = new HashMap<>();
	private static Map<String, DAO> daoMap = new HashMap<>();
	
	static {
		daoMap.put("boardDAO", new BoardDAO());
		
		serviceMap.put("/board/list.do", new BoardListService());
		
		serviceMap.get("/board/list.do").setDAO(daoMap.get("boardDAO"));
		
		System.out.println("Init.static 초기화 블록 ----- 객체 생성과 로딩-----");
	}
	public static Service get(String uri) {
		return serviceMap.get(uri);
		
	}
}
