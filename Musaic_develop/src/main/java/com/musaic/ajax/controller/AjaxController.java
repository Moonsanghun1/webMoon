package com.musaic.ajax.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.musaic.main.controller.Init;
import com.musaic.util.exe.Execute;

// Ajax Module에 맞는 메뉴 선택, 데이터 수집, 예외 처리
public class AjaxController {

	public String execute(HttpServletRequest request) {
		System.out.println("AjaxController.execute() --------------------------");
		
			// 로그인 처리를 sesstion으로 한다.
			HttpSession session = request.getSession();
			Object result = null;

			// uri
			String uri = request.getRequestURI();
			
			String jsp = null;
			
			try { //정상처리
				
				// 메뉴 처리 : CRUD DB처리 - controller - service - DAO
				switch (uri) {
				
//				case "/ajax/checkId.do":
//					System.out.println("1. 아이디 중복 확인");
//					
//					// 데이터 수집 - 사용자 -> 서버 : form - input - name 
//					id = request.getParameter("id");
//
//					
//					// [AjaxController] - (Execute) - [MembercheckIdService] - [MemberDAO.checkId(id)]
//					// session에 데이터를 담아서 로그인 처리한다.
//					id = (String) Execute.execute(Init.get(uri), id);
//					
//					request.setAttribute("id", id);
//					// jsp 정보 앞에 "redirect:"가 붙어 있어 redirect를 
//					// 아니면 jsp로 forward를 시킨다.
//					// 원래는 main이나 진행하려고 했던 uri로 이동시킨다.
//					// 그러나 완성이 안되어 있어서 완성되어진 게시판 리스트로 보낸다.
//					jsp = "member/checkId";
//					
//					session.setAttribute("msg", "글 등록이 성곡적으로 되었습니다.");
//					
//					break;
				case "/ajax/getTotalMusic.do":
					System.out.println("2. 새로운 메세지 가져오기");
					Long no = Long.parseLong(request.getParameter("albumNo"));
					// [AjaxController] - (Execute) - [MembercheckIdService] - [MemberDAO.checkId(id)]
					// session에 데이터를 담아서 로그인 처리한다.
					result = Execute.execute(Init.get(uri), no);
					System.out.println("@@albumNo="+no +"넘어오는 값=" + result);
					request.setAttribute("vo", result);
					
					jsp = "album/getTotalMusic";
					
					break;
				
			
				default:
					jsp = "error/noModule_404";
					break;
				}// end of switch
			
			}catch (Exception e) {
				// TODO: handle exception
				//e.printStackTrace();
				request.setAttribute("e", e);
				e.printStackTrace();
				jsp = "error/noModule_500";
			} // end of try ~ catch
			return jsp;
	} //end of execute()
}// end of class
