package com.web.board.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.web.main.controller.init;
import com.web.util.exe.Execute;
import com.webjjang.util.page.PageObject;

public class BoardController {
	
	public String execute(HttpServletRequest request) {
		System.out.println("boardController.execute()------");
		
		Object result = null;
		
		String jsp = null;
		
		String uri = request.getRequestURI();
		
		HttpSession session = request.getSession();
		
		try {
			switch (uri) {
			case "/board/list.do": 
				System.out.println("일반게시판 리스트 (boardController)");
				
				//PageObject pageObject = PageObject.getInstance(request);
				
				result = Execute.execute(init.get(uri), null);
				
				request.setAttribute("list", result);
				
				//request.setAttribute("pageObject", pageObject);
				
				jsp = "board/list";
				
				break;
				
			default:
				
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return jsp;
	}
}
