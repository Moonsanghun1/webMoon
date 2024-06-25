package com.web.main.controller;

import java.util.HashMap;
import java.util.Map;

import com.web.board.dao.BoardDAO;
import com.web.board.service.BoardDeleteService;
import com.web.board.service.BoardListService;
import com.web.board.service.BoardUpdateService;
import com.web.board.service.BoardViewService;
import com.web.board.service.BoardWriteService;
import com.web.boardreply.dao.BoardReplyDAO;
import com.web.boardreply.service.BoardReplyListService;
import com.web.main.dao.DAO;
import com.web.main.service.Service;

public class Init {
	
	// service 생성해서 저장하는 객체 - <URI, service>
	private static Map<String, Service> serviceMap = new HashMap<>() ;
	private static Map<String, DAO> daoMap = new HashMap<>() ;
	
	// static 변수에 데이터를 초기화 시키는 1번만 실행되는 블럭 -> 클래스가 불려지면 자동실행
	static {
		// dao 생성
		daoMap.put("boardDAO", new BoardDAO());
		// service 생성
		serviceMap.put("/board/list.do", new BoardListService()); 
		serviceMap.put("/board/view.do", new BoardViewService()); 
		serviceMap.put("/board/write.do", new BoardWriteService()); 
		serviceMap.put("/board/update.do", new BoardUpdateService()); 
		serviceMap.put("/board/delete.do", new BoardDeleteService()); 
		// 조립 dao -> servive 
		serviceMap.get("/board/list.do").setDAO(daoMap.get("boardDAO"));
		serviceMap.get("/board/view.do").setDAO(daoMap.get("boardDAO"));
		serviceMap.get("/board/write.do").setDAO(daoMap.get("boardDAO"));
		serviceMap.get("/board/update.do").setDAO(daoMap.get("boardDAO"));
		serviceMap.get("/board/delete.do").setDAO(daoMap.get("boardDAO"));
		// ----[일반 게시판 댓글 객체 생성과 조립] ====
		daoMap.put("boardReplyDAO", new BoardReplyDAO());
		
		serviceMap.put("/boardreply/list.do", new BoardReplyListService()); 
		serviceMap.get("/boardreply/list.do").setDAO(daoMap.get("boardReplyDAO"));
		
		System.out.println("Init.static 초기화 블록 ----- 객체 생성과 로딩-----");
	}
		
	public static Service get(String uri) {
			return serviceMap.get(uri);
			
		}
	
	
}
