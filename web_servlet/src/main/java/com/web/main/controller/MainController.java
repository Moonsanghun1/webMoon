package com.web.main.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import com.web.member.vo.LoginVO;
import com.web.util.exe.Execute;
import com.webjjang.util.page.PageObject;
// main Module에 맞는 메뉴 선택, 데이터 수집, 예외 처리
public class MainController {

	public String execute(HttpServletRequest request) {
		System.out.println("BoardController.execute() --------------------------");
		
			// session을 request에서부터 꺼낸다.
			HttpSession session = request.getSession();
			// 메뉴 입력
			String uri = request.getRequestURI();
			
			Object result = null;
			// 메뉴 처리
			
			
			String jsp = null;
			
			int gradeNo = 0;
			LoginVO login = (LoginVO) session.getAttribute("login");
			if(login != null) {
				gradeNo = login.getGradeNo();
			}
			try { //정상처리
				
				// 메뉴 처리 : CRUD DB처리 - controller - service - DAO
				switch (uri) {
				case "/main/main.do":
					System.out.println("1. 메인 처리");
					// 페이지 처리를 위한 객체
					PageObject pageObject =  new PageObject();
					
					if(gradeNo == 9) {
						pageObject.setPeriod("all");
					}else {
						pageObject.setPeriod("pre");
					}
					
					// 메인에 표시할 데이터 - 일반 게시판 / 이미지 /공지사항
					// DB에서 데이터 가져오기 - 가져온 데이터는 List<BoardVO>
					// 일반 게시판
					pageObject.setPerPageNum(7);
					//[MainController] - (Excute) - BoardListService - BoardDAO.list()
					result = Execute.execute(Init.get("/board/list.do"), pageObject);
					request.setAttribute("boardList", result);
					// 이미지 게시판
					pageObject.setPerPageNum(6);
					//[MainController] - (Excute) - ImageListService - ImageDAO.list()
					result = Execute.execute(Init.get("/image/list.do"), pageObject);
					request.setAttribute("imageList", result);
					
					
					// 공지사항 게시판
					pageObject.setPerPageNum(7);
					//[MainController] - (Excute) - NoticeListService - NoticeDAO.list()
					result = Execute.execute(Init.get("/notice/list.do"), pageObject);
					request.setAttribute("noticeList", result);
					
					
					// /WEB-INF/views/ + board/list + .jsp
					jsp = "main/main";
					
					break;
				
					
	
				default:
					jsp = "error/404";
					break;
				}// end of switch
			
			}catch (Exception e) {
				// TODO: handle exception
				//e.printStackTrace();
				
				// 예외객체를 jsp에서 사용하기 위해 request에 담는다.
				request.setAttribute("e", e);
				
				jsp = "error/500";
				
				
			} // end of try ~ catch
			return jsp;
	} //end of execute()
}// end of class
