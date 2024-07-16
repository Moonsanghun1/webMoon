package com.web.qna.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import com.web.main.controller.Init;
import com.web.member.vo.LoginVO;
import com.web.qna.vo.QnaVO;
import com.web.util.exe.Execute;
import com.webjjang.util.page.PageObject;
import com.webjjang.util.page.ReplyPageObject;
// Board Module에 맞는 메뉴 선택, 데이터 수집, 예외 처리
public class QnaController {

	public String execute(HttpServletRequest request) {
		System.out.println("QnaController.execute() --------------------------");
		
			// session을 request에서부터 꺼낸다.
			HttpSession session = request.getSession();
			LoginVO login = (LoginVO) session.getAttribute("login");
			String id= null; 
			
			if (login != null) id = login.getId();
		
			// 메뉴 입력
			String uri = request.getRequestURI();
			
			Object result = null;
			// 메뉴 처리
			Long no = 0L;
			
			String jsp = null;
			
			try { //정상처리
				
				// 메뉴 처리 : CRUD DB처리 - controller - service - DAO
				switch (uri) {
				case "/qna/list.do":
					//[QnaController] - (Excute) - QnaListService - QnaDAO.list()
					System.out.println("1. QnA 게시판 리스트");
					// 페이지 처리를 위한 객체
					// getInstance - 기본 값이 있고 넘어오는 페이지와 검색 정보를 세팅 처리
					PageObject pageObject = PageObject.getInstance(request);
					// DB에서 데이터 가져오기 - 가져온 데이터는 List<QnaVO>
					result = Execute.execute(Init.get(uri), pageObject);
					// PageObject 확인하기ㅏ
					System.out.println("QnaController.execute().pageObject = " + pageObject);
					// 가져온 데이터 출력하기
					request.setAttribute("list", result);
					// PageObject 담기
					request.setAttribute("pageObject", pageObject);
					// /WEB-INF/views/ + Qna/list + .jsp
					jsp = "qna/list";
					
					break;
				case "/qna/view.do":
					System.out.println("2. Qna 게시판 글 보기");
					
					// 1. 조회수 1증가(글보기)
					String strNo = request.getParameter("no");
					no = Long.parseLong(strNo);
					// 2. 일반게시판 글보기 데이터 가져오기 : 글보기 , 글수정
					//전달 데이터 - 글번호, 조회수 증가 여부 (1:증가 0: 증가 안함) : 배열 또는 Map
					result = Execute.execute(Init.get(uri), no);
					
					request.setAttribute("vo", result);
					
					// 댓글 페이지 객체
					// 데이터 전달 - page / perPageNum / no / replyPage / replyPerPageNum
					ReplyPageObject replyPageObject = ReplyPageObject.getInstance(request);
					// 가져온 댓글 데이터 request에 "담기"
					request.setAttribute("replyList", Execute.execute(Init.get("/boardreply/list.do"), replyPageObject));
					// 댓글 페이지 객체 "담기"
					request.setAttribute("replyPageObject",replyPageObject);
					jsp = "qna/view";				
					
					break;
					
				case "/qna/questionForm.do":
					System.out.println("3-1. 질문 등록 폼");
					
					request.setAttribute("headTitle", "질문하기 폼");
					
					jsp = "qna/writeForm";
					break;
					
				case "/qna/answerForm.do":
					System.out.println("3-2. 답변 등록 폼");
					request.setAttribute("headTitle", "답변하기 폼");
					
					strNo = request.getParameter("no");
					no = Long.parseLong(strNo);
					// 2. 일반게시판 글보기 데이터 가져오기 : 글보기 , 글수정
					//전달 데이터 - 글번호, 조회수 증가 여부 (1:증가 0: 증가 안함) : 배열 또는 Map
					result = Execute.execute(Init.get("/qna/view.do"), no);
					request.setAttribute("vo", result);
					// 넘어온 글번호에 따른 데이터를 가져와서 request에 저장한다.
					
					jsp = "qna/writeForm";
					break;
				
				case "/qna/write.do":
					System.out.println("3-3. 질문답변 등록 처리");
					
					// 데이터 수집 - 사용자 -> 서버 : form - input - name 
					String title = request.getParameter("title");
					String content = request.getParameter("content");
					String strRefNo = request.getParameter("refNo");
					Long ordNo = Long.parseLong(request.getParameter("ordNo"));
					Long levNo = Long.parseLong(request.getParameter("levNo"));
					String strParentNo = request.getParameter("parentNo");
					
					// 변수 - vo 저장하고 Service 
					QnaVO vo = new QnaVO();
					vo.setTitle(title);
					vo.setContent(content);
					vo.setId(id);
					vo.setOrdNo(ordNo);
					vo.setLevNo(levNo);
					// 답변인 경우의 처리
					if(strRefNo != null && !strRefNo.equals("")) {
						vo.setRefNo(Long.parseLong(strRefNo));
						vo.setParentNo(Long.parseLong(strParentNo));
						vo.setQuestion(false); // 답변임
					// 질문인 경우의 처리
					} else {
						vo.setQuestion(true); // 질문임
					}
					
					
					
					// [BoardController] - BoardWriteService - BoardDAO.write(vo)
					Execute.execute(Init.get(uri), vo);
					
					// jsp 정보 앞에 "redirect:"가 붙어 있어 redirect를 
					// 아니면 jsp로 forward를 시킨다.
					jsp = "redirect:list.do?perPageNum=" + request.getParameter("perPageNum");
					session.setAttribute("msg", "글 등록이 성곡적으로 되었습니다.");
					
					break;
				case "/board/updateForm.do":
					System.out.println("4-1. 일반 게시판 글 수정 폼");
					// 사용자 -> 서버 : 글번호 
					no = Long.parseLong(request.getParameter("no"));
					// no 맞는 데이터 DB에서 가져온다. BoardViewService
					//전달 데이터 - 글번호, 조회수 증가 여부 (1:증가 0: 증가 안함) : 배열 또는 Map
					result = Execute.execute(Init.get("/board/view.do"), new Long[]{no , 0L});
					// 가져온 데이터를 JSP로 보내기 위해서 request에 담는다.
					request.setAttribute("vo", result);
					// jsp 정보
					jsp = "board/updateForm";
					break;
					
				case "/board/update.do":
					
					System.out.println("4-2. 일반 게시판 글 수정 처리");
				
					// 데이터 수집 - 사용자 -> 서버 : form - input - name 
					no = Long.parseLong(request.getParameter("no"));
					title = request.getParameter("title");
					content = request.getParameter("content");
					
					// 변수 - vo 저장하고 Service 
					vo = new QnaVO();
					vo.setNo(no);
					vo.setTitle(title);
					vo.setContent(content);
					
					// DB에 데이터 수정하기 - BoardUpdateService
					Execute.execute(Init.get(uri), vo);
					//페이지 정보 받기 & uri에 붙이기
					pageObject = PageObject.getInstance(request);					
					// 글보기로 자동 이동 -> jsp정보를 작성해서 넘긴다.
					jsp = "redirect:view.do?no=" + no + "&inc=0" + "&" + pageObject.getPageQuery();
					session.setAttribute("msg", "글 수정이 성곡적으로 되었습니다.");
					break;
					
				case "/board/delete.do":
					System.out.println("5. 일반 게시판 글 삭제");
					// 데이터 수집 - DB에서 실행에 필요한 데이터 - 글번호, pw - BoardVO
					no = Long.parseLong(request.getParameter("no"));
					
				
					vo = new QnaVO();
					vo.setNo(no);
					
					
					// DB 처리
					Execute.execute(Init.get(uri), vo);
					System.out.println();
					System.out.println("***************************");
					System.out.println("**"+ vo.getNo()+"번 게시글이 삭제되었습니다. "+"**");
					System.out.println("***************************");

					jsp = "redirect:list.do?" + "&" + "perPageNum="+ request.getParameter("perPageNum");
					session.setAttribute("msg", "글 삭제가 성곡적으로 되었습니다.");
					break;
				case "0":
					System.out.println("0. 이전");
					
	
				default:
					jsp = "error/404";
					break;
				}// end of switch
			
			}catch (Exception e) {
				// TODO: handle exception
				//e.printStackTrace();
				
				// 예외객체를 jsp에서 사용하기 위해 request에 담는다.
				request.setAttribute("e", e);
				e.printStackTrace();
				jsp = "error/500";
				
				
			} // end of try ~ catch
			return jsp;
	} //end of execute()
}// end of class
