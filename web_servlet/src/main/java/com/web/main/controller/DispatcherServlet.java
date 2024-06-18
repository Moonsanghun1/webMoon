package com.web.main.controller;

import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.web.board.controller.BoardController;

/**
 * Servlet implementation class DispatcherServlet
 */
@WebServlet(urlPatterns = "*.do",loadOnStartup = 1 )
public class DispatcherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	// Controller 선언과 생성 - 1번만 된다.
		private BoardController boardController = new BoardController();
	
	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		// 드라이버 확인 / 객체 생성 처리 - Class.forName(class명)
	}

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// 메뉴를 출력하고 선택(uri)하고 처리
		// uri -/board가 앞에 붙어 있으면 BoardController로 가게 만든다.
		System.out.println("DispatcherServlet.service()----------------");
		
		String uri = request.getRequestURI();
		System.out.println("uri =" +uri);
		
		// uri = /module/기능 -> /board/list.do
		int pos = uri.indexOf("/", 1);
		System.out.println("pos = " + pos);
		
		if (pos == -1) {
			request.getRequestDispatcher("/WEB-INF/views/error/404.jsp").forward(request, response);
			return;
		} 
		
		String module = uri.substring(0, pos);
		System.out.println("module = " + module);
		
		String jsp = null;
		
		switch (module) {
		case "/board" : {
			System.out.println("일반 게시판");
			jsp = boardController.execute(request);	
			System.out.println("jsp = " + jsp);
			break;
		}
		default:
			request.getRequestDispatcher("/WEB-INF/views/error/404.jsp").forward(request, response);
			return;
		}
		// jsp로 forward 한다.
		request.getRequestDispatcher("/WEB-INF/views/" + jsp +".jsp").forward(request, response);
	}
	
}
