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
//@WebServlet("/DispatcherServlet")
public class DispatcherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	// Controller 선언 생성 - 1번만 된다.
	private BoardController boardController = new BoardController();
	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		System.out.println("----- DispatcherServlet.init() 초기화 진행 ----");
		
		try {
			Class.forName("com.web.board.controller.init");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("----- DispatcherServlet.service() ----");
		
		String uri = request.getRequestURI();
		System.out.println("uri = " + uri);
		
		int pos = uri.indexOf("/" , 1);
		System.out.println("pos = " + pos);
		
		String module = uri.substring(0,pos);
		System.out.println("module = " + module);
		
		String jsp =null;
		
		switch (module) {
		case "/board": {
			System.out.println("일반게시판");
			jsp = boardController.execute(request);
			System.out.println("jsp = " + jsp);
			break;
		}
		default:
			request.getRequestDispatcher("/WEB-INF/views/error/404.jsp").forward(request, response);
			return;
		}
		if (jsp.indexOf("redirect:") == 0) {
		response.sendRedirect(jsp.substring("redirect:".length()));
		}
		else {
		request.getRequestDispatcher("/WEB-INF/views/" + jsp + ".jsp").forward(request, response);
		}
			
			
		
	}

}
