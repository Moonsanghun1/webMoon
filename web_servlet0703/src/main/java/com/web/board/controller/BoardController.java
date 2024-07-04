package com.web.board.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.web.board.vo.BoardVO;
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
				
			case "/board/view.do": 
				System.out.println("일반게시판 상세보기 (boardController)");
				
				String strNo = request.getParameter("no");
				Long no = Long.parseLong(strNo);
				String strInc = request.getParameter("inc");
				Long inc = Long.parseLong(strInc);
				//PageObject pageObject = PageObject.getInstance(request);
				
				result = Execute.execute(init.get(uri), new Long[]{no , inc});
				
				request.setAttribute("vo", result);
				
				//request.setAttribute("pageObject", pageObject);
				
				jsp = "/board/view";
				
				break;	
			case "/board/writeForm.do": 
				System.out.println("일반게시판 글 등록 폼 (boardController)");
				
				jsp = "/board/writeForm";
				
				break;	
			case "/board/write.do": 
				System.out.println("일반게시판 글 등록 처리 (boardController)");
				
				
				String title = request.getParameter("title");
				String content = request.getParameter("content");
				String writer = request.getParameter("writer");
				String pw = request.getParameter("pw");
				
				BoardVO vo = new BoardVO();
				vo.setTitle(title);
				vo.setContent(content);
				vo.setWriter(writer);
				vo.setPw(pw);
				
				result = Execute.execute(init.get(uri), vo);
				
				request.setAttribute("vo", result);
				
				//request.setAttribute("pageObject", pageObject);
				
				jsp = "redirect:list.do";
				
				break;	
				
			case "/board/updateForm.do": 
				System.out.println("일반게시판 글 수정 폼 (boardController)");
				
				no = Long.parseLong(request.getParameter("no"));
				System.out.println("no = " + no);
				result = Execute.execute(init.get("/board/view.do"), new Long[]{no , 0L});
				
				request.setAttribute("vo", result);
				
				
				jsp = "board/updateForm";
				
				break;	
			case "/board/update.do": 
				System.out.println("일반게시판 글 수정 처리 (boardController)");
				
				no = Long.parseLong(request.getParameter("no"));
				title = request.getParameter("title");
				content = request.getParameter("content");
				writer = request.getParameter("writer");
				pw = request.getParameter("pw");
				
				vo = new BoardVO();
				vo.setNo(no);
				vo.setTitle(title);
				vo.setContent(content);
				vo.setWriter(writer);
				vo.setPw(pw);
				
				result = Execute.execute(init.get(uri), vo);
				
				request.setAttribute("vo", result);
				
				//request.setAttribute("pageObject", pageObject);
				
				jsp = "redirect:view.do";
				
				break;	
			case "/board/delete.do": 
				System.out.println("일반게시판 글 삭제 처리 (boardController)");
				
				no = Long.parseLong(request.getParameter("no"));
				pw = request.getParameter("pw");
				
				vo = new BoardVO();
				vo.setNo(no);
				vo.setPw(pw);
				
				result = Execute.execute(init.get(uri), vo);
				
				request.setAttribute("vo", result);
				
				//request.setAttribute("pageObject", pageObject);
				
				jsp = "redirect:list.do";
				
				break;	
				
			default:
				
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return jsp;
	}
}
