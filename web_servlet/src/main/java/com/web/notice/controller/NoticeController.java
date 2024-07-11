package com.web.notice.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.web.main.controller.Init;
import com.web.notice.vo.NoticeVO;
import com.web.util.exe.Execute;
import com.webjjang.util.page.PageObject;
// Notice Module에 맞는 메뉴 선택, 데이터 수집, 예외 처리
public class NoticeController {

	public String execute(HttpServletRequest request) {

			String uri = request.getRequestURI();
			System.out.println("@@@@ uri= " + uri);
			// 처리 결과를 화면에 표시하기 위해서
			HttpSession session = request.getSession();
			
			Object result = null;
			// 메뉴 처리
			Long no = 0L;
			
			String jsp = null;
			try { //정상처리
				
				// 메뉴 처리 : CRUD DB처리 - controller - service - DAO
				switch (uri) {
				
				case "/notice/list.do":
					//[NoticeController] - (Excute) - NoticeListService - NoticeDAO.list()
					System.out.println("1. 공지사항 리스트");
					// 페이지 처리를 위한 객체
					PageObject pageObject = PageObject.getInstance(request);
					
					// DB에서 데이터 가져오기 - 가져온 데이터는 List<NoticeVO>
					result = Execute.execute(Init.get(uri), pageObject);
					
					request.setAttribute("list", result);
					request.setAttribute("pageObject", pageObject);
					
					jsp = "notice/list";
					break;
				case "/notice/view.do":
					System.out.println("2. 공지사항 글 보기");
					pageObject = PageObject.getInstance(request);
					no = Long.parseLong(request.getParameter("no"));
					// 2. 공지사항 글보기 데이터 가져오기 : 글보기 , 글수정
					//전달 데이터 - 글번호, 조회수 증가 여부 (1:증가 0: 증가 안함) : 배열 또는 Map
					result = Execute.execute(Init.get(uri), no);
					
					request.setAttribute("vo", result);
					request.setAttribute("pageObject", pageObject);
					jsp = "notice/view";
					break;
				case "/notice/writeForm.do":
					System.out.println("3-1. 공지사항 글 등록폼");
					
					
					jsp = "/notice/writeForm";
					break;
				case "/notice/write.do":
					System.out.println("3-2. 공지사항 글 등록");
					
					// 데이터 수집 - 사용자 : 제목, 내용, 작성자, 비밀번호
					String title = request.getParameter("title");
					String content = request.getParameter("title");
					String startDate = request.getParameter("startDate");
					String endDate = request.getParameter("endDate");
					
					// 변수 - vo 저장하고 Service 
					NoticeVO vo = new NoticeVO();
					vo.setTitle(title);
					vo.setContent(content);
					vo.setStartDate(startDate);
					vo.setEndDate(endDate);

					result = Execute.execute(Init.get(uri), vo);
					// [NoticeController] - NoticeWriteService - NoticeDAO.write(vo)
					request.setAttribute("vo", result);
					jsp = "redirect:/notice/list.do";
					session.setAttribute("msg", "공지가 등록되었습니다.");
					break;
				case "/notice/updateForm.do":
					System.out.println("4-1. 공지사항 글 수정 폼");
					no = Long.parseLong(request.getParameter("no"));
					result = Execute.execute(Init.get("/notice/view.do"), no);
					
					request.setAttribute("vo", result);
					
					jsp = "/notice/updateForm";
					break;
				case "/notice/update.do":
					System.out.println("4-2. 공지사항 글 수정처리");
					pageObject = PageObject.getInstance(request);
					// 데이터 수집 - 사용자 : 제목, 내용, 작성자, 비밀번호
					no = Long.parseLong(request.getParameter("no"));
					title = request.getParameter("title");
					content = request.getParameter("title");
					startDate = request.getParameter("startDate");
					endDate = request.getParameter("endDate");
					
					// 변수 - vo 저장하고 Service 
					vo = new NoticeVO();
					vo.setNo(no);
					vo.setTitle(title);
					vo.setContent(content);
					vo.setStartDate(startDate);
					vo.setEndDate(endDate);
					
					result = Execute.execute(Init.get(uri), vo);
					// [NoticeController] - NoticeWriteService - NoticeDAO.write(vo)
					jsp = "redirect:/notice/view.do?no="+ no + "&" + pageObject.getPageQuery();
					session.setAttribute("msg", "공지가 수정되었습니다.");
					break;
				
					
				case "/notice/delete.do":
					System.out.println("5. 공지사항 글 삭제");
					// 데이터 수집 - DB에서 실행에 필요한 데이터 - 글번호, pw - NoticeVO
					
					no = Long.parseLong(request.getParameter("no"));
					result = Execute.execute(Init.get(uri), no);
					jsp = "redirect:/notice/list.do";
					session.setAttribute("msg", "공지가 삭제되었습니다.");
					break;
			
	
				default:
					jsp = "error/404";
					break;
				}// end of switch
			
			}catch (Exception e) {
				// TODO: handle exception
				//e.printStackTrace();
				request.setAttribute("e", e);
				
				jsp = "error/500";
				
				
			} // end of try ~ catch
		return jsp;
	} //end of main
}// end of class
