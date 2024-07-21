package com.musaic.album.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import com.musaic.album.vo.AlbumVO;
import com.musaic.main.controller.Init;
import com.musaic.util.exe.Execute;
import com.webjjang.util.page.PageObject;
import com.webjjang.util.page.ReplyPageObject;
// Album Module에 맞는 메뉴 선택, 데이터 수집, 예외 처리
public class AlbumController {

	public String execute(HttpServletRequest request) {
		System.out.println("AlbumController.execute() --------------------------");
		
			// session을 request에서부터 꺼낸다.
			HttpSession session = request.getSession();
			// 메뉴 입력
			String uri = request.getRequestURI();
			
			Object result = null;
			// 메뉴 처리
			Long no = 0L;
			
			String jsp = null;
			
			try { //정상처리
				
				// 메뉴 처리 : CRUD DB처리 - controller - service - DAO
				switch (uri) {
				case "/album/list.do":
					//[AlbumController] - (Excute) - AlbumListService - AlbumDAO.list()
					System.out.println("1. 앨범 게시판 리스트");
					// 페이지 처리를 위한 객체
					// getInstance - 기본 값이 있고 넘어오는 페이지와 검색 정보를 세팅 처리
					PageObject pageObject = PageObject.getInstance(request);
					// DB에서 데이터 가져오기 - 가져온 데이터는 List<AlbumVO>
					result = Execute.execute(Init.get(uri), pageObject);
					// PageObject 확인하기ㅏ
					System.out.println("AlbumController.execute().pageObject = " + pageObject);
					// 가져온 데이터 출력하기
					request.setAttribute("list", result);
					// PageObject 담기
					request.setAttribute("pageObject", pageObject);
					// /WEB-INF/views/ + Album/list + .jsp
					jsp = "album/list";
					
					break;
				case "/album/view.do":
					System.out.println("2. 앨범 상세 보기");
					
					// 1. 조회수 1증가(글보기)
					String strNo = request.getParameter("no");
					no = Long.parseLong(strNo);
					// 2. 앨범게시판 글보기 데이터 가져오기 : 글보기 , 글수정
					//전달 데이터 - 글번호, 조회수 증가 여부 (1:증가 0: 증가 안함) : 배열 또는 Map
					result = Execute.execute(Init.get(uri), no);
					
					request.setAttribute("vo", result);
					
					// 댓글 페이지 객체
					// 데이터 전달 - page / perPageNum / no / replyPage / replyPerPageNum
					ReplyPageObject replyPageObject = ReplyPageObject.getInstance(request);
					// 가져온 댓글 데이터 request에 "담기"
					request.setAttribute("replyList", Execute.execute(Init.get("/albumreply/list.do"), replyPageObject));
					// 댓글 페이지 객체 "담기"
					request.setAttribute("replyPageObject",replyPageObject);
					jsp = "/album/view";				
					
					break;
					
				case "/album/writeForm.do":
					System.out.println("3-1. 앨범 게시판 글 등록 폼");
					jsp = "/album/writeForm";
					break;
				
				case "/album/write.do":
					System.out.println("3. 앨범 게시판 글등록 처리");
					
					// 데이터 수집 - 사용자 -> 서버 : form - input - name 
					String title = request.getParameter("title");
					String content = request.getParameter("content");
					String writer = request.getParameter("writer");
					String pw = request.getParameter("pw");
					String perPageNum = request.getParameter("perPageNum");
					
					// 변수 - vo 저장하고 Service 
					AlbumVO vo = new AlbumVO();
					vo.setTitle(title);
					
					// [AlbumController] - AlbumWriteService - AlbumDAO.write(vo)
					Execute.execute(Init.get(uri), vo);
					
					// jsp 정보 앞에 "redirect:"가 붙어 있어 redirect를 
					// 아니면 jsp로 forward를 시킨다.
					jsp = "redirect:list.do?perPageNum=" + perPageNum;
					session.setAttribute("msg", "글 등록이 성곡적으로 되었습니다.");
					
					break;
				case "/album/updateForm.do":
					System.out.println("4-1. 앨범 게시판 글 수정 폼");
					// 사용자 -> 서버 : 글번호 
					no = Long.parseLong(request.getParameter("no"));
					// no 맞는 데이터 DB에서 가져온다. AlbumViewService
					//전달 데이터 - 글번호, 조회수 증가 여부 (1:증가 0: 증가 안함) : 배열 또는 Map
					result = Execute.execute(Init.get("/album/view.do"), new Long[]{no , 0L});
					// 가져온 데이터를 JSP로 보내기 위해서 request에 담는다.
					request.setAttribute("vo", result);
					// jsp 정보
					jsp = "album/updateForm";
					break;
					
				case "/album/update.do":
					
					System.out.println("4-2. 앨범 게시판 글 수정 처리");
				
					// 데이터 수집 - 사용자 -> 서버 : form - input - name 
					no = Long.parseLong(request.getParameter("no"));
					title = request.getParameter("title");
					content = request.getParameter("content");
					writer = request.getParameter("writer");
					pw = request.getParameter("pw");
					
					// 변수 - vo 저장하고 Service 
					vo = new AlbumVO();
					vo.setTitle(title);
					
					// DB에 데이터 수정하기 - AlbumUpdateService
					Execute.execute(Init.get(uri), vo);
					//페이지 정보 받기 & uri에 붙이기
					pageObject = PageObject.getInstance(request);					
					// 글보기로 자동 이동 -> jsp정보를 작성해서 넘긴다.
					jsp = "redirect:view.do?no=" + no + "&inc=0" + "&" + pageObject.getPageQuery();
					session.setAttribute("msg", "글 수정이 성곡적으로 되었습니다.");
					break;
					
				case "/album/delete.do":
					System.out.println("5. 앨범 게시판 글 삭제");
					// 데이터 수집 - DB에서 실행에 필요한 데이터 - 글번호, pw - AlbumVO
					long AlbumNo = Long.parseLong(request.getParameter("AlbumNo"));
					pw = request.getParameter("pw");
					perPageNum = request.getParameter("perPageNum");
				
					vo = new AlbumVO();
					vo.setAlbumNo(AlbumNo);
					
					
					// DB 처리
					Execute.execute(Init.get(uri), vo);
					System.out.println();
					System.out.println("***************************");
					System.out.println("**"+ vo.getAlbumNo()+"번 게시글이 삭제되었습니다. "+"**");
					System.out.println("***************************");

					jsp = "redirect:list.do?" + "&" + "perPageNum="+ perPageNum;
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
