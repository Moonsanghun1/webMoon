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
import com.web.boardreply.service.BoardReplyDeleteService;
import com.web.boardreply.service.BoardReplyListService;
import com.web.boardreply.service.BoardReplyUpdateService;
import com.web.boardreply.service.BoardReplyWriteService;
import com.web.image.dao.ImageDAO;
import com.web.image.service.ImageChangeService;
import com.web.image.service.ImageDeleteService;
import com.web.image.service.ImageListService;
import com.web.image.service.ImageUpdateService;
import com.web.image.service.ImageViewService;
import com.web.image.service.ImageWriteService;
import com.web.main.dao.DAO;
import com.web.main.service.Service;
import com.web.member.dao.MemberDAO;
import com.web.member.service.MemberChangeGradeService;
import com.web.member.service.MemberChangeStatusService;
import com.web.member.service.MemberCheckIdService;
import com.web.member.service.MemberListService;
import com.web.member.service.MemberLoginService;
import com.web.member.service.MemberWriteService;

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
		// service 생성
		serviceMap.put("/boardreply/list.do", new BoardReplyListService()); 
		serviceMap.put("/boardreply/write.do", new BoardReplyWriteService()); 
		serviceMap.put("/boardreply/update.do", new BoardReplyUpdateService()); 
		serviceMap.put("/boardreply/delete.do", new BoardReplyDeleteService());		
		// 조립 dao -> servive
		serviceMap.get("/boardreply/list.do").setDAO(daoMap.get("boardReplyDAO"));
		serviceMap.get("/boardreply/write.do").setDAO(daoMap.get("boardReplyDAO"));
		serviceMap.get("/boardreply/update.do").setDAO(daoMap.get("boardReplyDAO"));
		serviceMap.get("/boardreply/delete.do").setDAO(daoMap.get("boardReplyDAO"));
		
		// ----[회원관리 객체 생성과 조립] ====
		
		daoMap.put("memberDAO", new MemberDAO());
		// service 생성
		serviceMap.put("/member/login.do", new MemberLoginService()); 
		serviceMap.put("/ajax/checkId.do", new MemberCheckIdService()); 
		serviceMap.put("/member/write.do", new MemberWriteService()); 
		serviceMap.put("/member/list.do", new MemberListService()); 
		serviceMap.put("/member/changeGrade.do", new MemberChangeGradeService()); 
		serviceMap.put("/member/changeStatus.do", new MemberChangeStatusService()); 
		// 조립 dao -> servive
		serviceMap.get("/member/login.do").setDAO(daoMap.get("memberDAO"));
		serviceMap.get("/ajax/checkId.do").setDAO(daoMap.get("memberDAO"));
		serviceMap.get("/member/write.do").setDAO(daoMap.get("memberDAO"));
		serviceMap.get("/member/list.do").setDAO(daoMap.get("memberDAO"));
		serviceMap.get("/member/changeGrade.do").setDAO(daoMap.get("memberDAO"));
		serviceMap.get("/member/changeStatus.do").setDAO(daoMap.get("memberDAO"));
		
		
		// ----[이미지 객체 생성과 조립] ====
		
		daoMap.put("imageDAO", new ImageDAO());
		// service 생성
		serviceMap.put("/image/list.do", new ImageListService()); 
		serviceMap.put("/image/view.do", new ImageViewService()); 
		serviceMap.put("/image/write.do", new ImageWriteService()); 
		serviceMap.put("/image/changeImage.do", new ImageChangeService()); 
		serviceMap.put("/image/update.do", new ImageUpdateService()); 
		serviceMap.put("/image/delete.do", new ImageDeleteService()); 
		// 조립 dao -> servive
		serviceMap.get("/image/list.do").setDAO(daoMap.get("imageDAO"));
		serviceMap.get("/image/view.do").setDAO(daoMap.get("imageDAO"));
		serviceMap.get("/image/write.do").setDAO(daoMap.get("imageDAO"));
		serviceMap.get("/image/changeImage.do").setDAO(daoMap.get("imageDAO"));
		serviceMap.get("/image/update.do").setDAO(daoMap.get("imageDAO"));
		serviceMap.get("/image/delete.do").setDAO(daoMap.get("imageDAO"));
		
		System.out.println("Init.static 초기화 블록 ----- 객체 생성과 로딩-----");
	}
		
	public static Service get(String uri) {
			return serviceMap.get(uri);
			
		}
	
	
}
