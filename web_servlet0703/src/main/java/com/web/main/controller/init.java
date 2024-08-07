package com.web.main.controller;

import java.util.HashMap;
import java.util.Map;

import com.web.board.dao.BoardDAO;
import com.web.board.service.BoardDeleteService;
import com.web.board.service.BoardListService;
import com.web.board.service.BoardUpdateService;
import com.web.board.service.BoardViewService;
import com.web.board.service.BoardWriteService;
import com.web.main.dao.DAO;
import com.web.main.service.Service;

public class init {
	private static Map<String, Service> serviceMap = new HashMap<>();
	private static Map<String, DAO> daoMap = new HashMap<>();
	
	static {
		daoMap.put("boardDAO", new BoardDAO());
		
		serviceMap.put("/board/list.do", new BoardListService());
		serviceMap.put("/board/view.do", new BoardViewService());
		serviceMap.put("/board/write.do", new BoardWriteService());
		serviceMap.put("/board/update.do", new BoardUpdateService());
		serviceMap.put("/board/delete.do", new BoardDeleteService());
		
		serviceMap.get("/board/list.do").setDAO(daoMap.get("boardDAO"));
		serviceMap.get("/board/view.do").setDAO(daoMap.get("boardDAO"));
		serviceMap.get("/board/write.do").setDAO(daoMap.get("boardDAO"));
		serviceMap.get("/board/update.do").setDAO(daoMap.get("boardDAO"));
		serviceMap.get("/board/delete.do").setDAO(daoMap.get("boardDAO"));
		
		System.out.println("Init.static 초기화 블록 ----- 객체 생성과 로딩-----");
	}
	public static Service get(String uri) {
		return serviceMap.get(uri);
		
	}
}
