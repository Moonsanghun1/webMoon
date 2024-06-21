package com.web.board.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.web.board.service.BoardDeleteService;
import com.web.board.service.BoardListService;
import com.web.board.service.BoardUpdateService;
import com.web.board.service.BoardViewService;
import com.web.board.service.BoardWriteService;
import com.web.board.vo.BoardVO;
import com.web.main.controller.init;
import com.web.util.exe.Execute;
import com.webjjang.util.page.PageObject;

// Board Module에 맞는 메뉴 선택, 데이터 수집, 예외 처리
public class BoardController {

	public String execute(HttpServletRequest request) {
		System.out.println("BoardController.execute() --------------------------");
		// 게시판 기능 무한반복
		
			String jsp = null;
			// 메뉴 입력
			
			String uri = request.getRequestURI();
			
			Object result = null;
			// 메뉴 처리
			Long no = 0L;
			
			try { //정상처리
				
				// 메뉴 처리 : CRUD DB처리 - controller - service - DAO
				switch (uri) {
				case "/board/list.do":
					//[BoardController] - (Excute) - BoardListService - BoardDAO.list()
					System.out.println("1. 일반 게시판 리스트");
					PageObject pageObject = PageObject.getInstance(request);
					// DB에서 데이터 가져오기 - 가져온 데이터는 List<BoardVO>			
					result = Execute.execute(init.get(uri), pageObject);
					
					request.setAttribute("list", result);
					
					jsp = "board/list";
					break;
				case "/board/view.do":
					System.out.println("2. 일반 게시판 글 보기");
					
					// 1. 조회수 1증가(글보기)
					String strNo = request.getParameter("no"); 
					no = Long.parseLong(strNo);
					String strInc = request.getParameter("inc");
					Long inc = Long.parseLong(strInc);
					// 2. 일반게시판 글보기 데이터 가져오기 : 글보기 , 글수정
					//전달 데이터 - 글번호, 조회수 증가 여부 (1:증가 0: 증가 안함) : 배열 또는 Map
					result = Execute.execute(init.get(uri), new Long[]{no , inc});
					// 게시판 글보기 출력 : BoardPrint 
					request.setAttribute("vo", result);
					jsp = "board/view";
					break;
				case "/board/writeForm.do":
					System.out.println("3-1. 일반 게시판 글 등록폼");
					jsp = "board/write";
					break;
				case "/board/write.do":
					System.out.println("3-2. 일반 게시판 글 등록 처리");
					
					// 데이터 수집 - 사용자 : 제목, 내용, 작성자, 비밀번호
					String title = request.getParameter("title");
					String content = request.getParameter("content");
					String writer = request.getParameter("writer");
					String pw = request.getParameter("pw");
					
					// 변수 - vo 저장하고 Service 
					BoardVO vo = new BoardVO();
					vo.setTitle(title);
					vo.setContent(content);
					vo.setWriter(writer);
					vo.setPw(pw);
					
					Execute.execute(init.get(uri), vo);
					// [BoardController] - BoardWriteService - BoardDAO.write(vo)
					jsp = "redirect:list.do";
					
					break;
				case "/board/updateForm.do":
					System.out.println("4-1. 일반 게시판 글 수정폼");
					no = Long.parseLong(request.getParameter("no"));
					result = Execute.execute(init.get("/board/view.do"), new Long[]{no , 0L});
					// 가져온 데이터를 JSP로 보내기 위해서 request에 담는다.
					request.setAttribute("vo", result);
					jsp = "board/updateForm";
					break;
				case "/board/update.do":
					
					System.out.println("4-2. 일반 게시판 글 수정처리");

				
					// 데이터 수집 - 사용자 : 제목, 내용, 작성자, 비밀번호
					no = Long.parseLong(request.getParameter("no"));
					title = request.getParameter("title");
					content = request.getParameter("content");
					writer = request.getParameter("writer");
					pw = request.getParameter("pw");
					
					// DB에 데이터 수정하기 - BoardUpdateService
					vo = new BoardVO();
					vo.setNo(no);
					vo.setTitle(title);
					vo.setContent(content);
					vo.setWriter(writer);
					vo.setPw(pw);
					Execute.execute(init.get(uri), vo);
					// [BoardController] - BoardWriteService - BoardDAO.write(vo)
					jsp = "redirect:view.do?no=" + no + "&inc=0";
					
					break;
					
				case "/board/delete.do":
					System.out.println("5. 일반 게시판 글 삭제");
					// 데이터 수집 - DB에서 실행에 필요한 데이터 - 글번호, pw - BoardVO
					no = Long.parseLong(request.getParameter("no"));
					pw = request.getParameter("pw");
					
					vo = new BoardVO();
					vo.setNo(no);
					vo.setPw(pw);
					// DB 처리
					Execute.execute(init.get(uri), vo);
					System.out.println();
					System.out.println("***************************");
					System.out.println("**"+ vo.getNo()+"번 게시글이 삭제되었습니다. "+"**");
					System.out.println("***************************");
					jsp = "redirect:list.do";
					break;
				default:
					System.out.println("================================");
					System.out.println("==    잘못된 메뉴를 입력하셨습니다.   ==");
					System.out.println("== [0~5,0] 중에서 입력하셔야 합니다. ==");
					System.out.println("================================");
					break;
				}// end of switch
			
			}catch (Exception e) {
				// TODO: handle exception
				//e.printStackTrace();
				System.out.println();
				System.out.println("$%@$%@%$%@$%$@%@$%$@$%@%$$@%$%@$%@$%@$%@$%@$%$@$@%");
				System.out.println("$%@$%@%$%@$%$@%       오류 출력        @$%@$%@$%$@$@%");
				System.out.println("$%@$%@%$%@$%$@%@$%$@$%@%$$@%$%@$%@$%@$%@$%@$%$@$@%");
				System.out.println("$%@$%@%$%@$%  타입 : "+ e.getClass().getSimpleName() + "@$%@$%@$%$@$@%");
				System.out.println("$%@$%@%$%@$%  내용 : "+ e.getMessage() + "@$%@$%@$%$@$@%");
				System.out.println("$%@$%@%$%@$%  조치 : "+ "데이터를 확인후 다시 실행하시오" + "@$%@$%@$%$@$@%");
				System.out.println("$%@$%@%$%@$%   : "+ "계속 오류가 나면 전산담당자에게 연락하시오" + "@$%@$%@$%$@$@%");
				System.out.println("$%@$%@%$%@$%$@%@$%$@$%@%$$@%$%@$%@$%@$%@$%@$%$@$@%");
				
				
			} // end of try ~ catch
		return jsp;
	} //end of main
}// end of class
