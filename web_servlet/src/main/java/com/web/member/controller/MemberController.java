package com.web.member.controller;

import java.io.File;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.web.main.controller.Init;
import com.web.member.vo.LoginVO;
import com.web.member.vo.MemberVO;
import com.web.util.exe.Execute;
import com.webjjang.util.page.PageObject;
import com.webjjang.util.page.ReplyPageObject;
// Board Module에 맞는 메뉴 선택, 데이터 수집, 예외 처리
public class MemberController {

	public String execute(HttpServletRequest request) {
		System.out.println("MemberController.execute() --------------------------");
		
			// 로그인 처리를 sesstion으로 한다.
			HttpSession session = request.getSession();
			
			// login된 정보 중에서 id를 많이 사용한다.
			String id = null;
			LoginVO login = (LoginVO) session.getAttribute("login");
			// login이 되어 있는 경우만 id를 꺼내온다.
			if(login != null) id = login.getId();
			// 파일 업로드 설정 -----------
			// 파일의 상대적인 저장위치
			String savePath = "/upload/image";
						// 파일 시스템에서는 절대 저장위치가 필요하다. - 파일 업로드 시 필요.
			String realSavePath = request.getServletContext().getRealPath(savePath); 
						
			// 업로드 파일 용량 제한
			int sizeLimit = 100 * 1024 * 1024;
			
			// realSavdPath 폴더가 존재하지 않으면 만들자.
			File realSavePathFile = new File(realSavePath);
			if(!realSavePathFile.exists()) realSavePathFile.mkdirs();
			
			// uri
			String uri = request.getRequestURI();
			
			Object result = null;
			// 메뉴 처리
			Long no = 0L;
			
			String jsp = null;
			
			try { //정상처리
				
				// 메뉴 처리 : CRUD DB처리 - controller - service - DAO
				switch (uri) {
				case "/member/loginForm.do":
					System.out.println("a. 로그인 폼(MemberController)");
					jsp = "/member/loginForm";
					break;
				
				case "/member/login.do":
					System.out.println("a-1. 로그인 처리");
					
					// 데이터 수집 - 사용자 -> 서버 : form - input - name 
					
					String pw = request.getParameter("pw");
					id = request.getParameter("id");
					
					// 변수 - vo 저장하고 Service 
					LoginVO loginvo = new LoginVO();
					loginvo.setId(id);
					loginvo.setPw(pw);
					
					// [MemberController] - (Execute) - [MemberListService] - [MemberDAO.login(vo)]
					// session에 데이터를 담아서 로그인 처리한다.
					session.setAttribute("login", (LoginVO)Execute.execute(Init.get(uri), loginvo));
					
					// jsp 정보 앞에 "redirect:"가 붙어 있어 redirect를 
					// 아니면 jsp로 forward를 시킨다.
					// 원래는 main이나 진행하려고 했던 uri로 이동시킨다.
					// 그러나 완성이 안되어 있어서 완성되어진 게시판 리스트로 보낸다.
					jsp = "redirect:/";
					// 로그인 완료 메세지 처리
					session.setAttribute("msg", "글 등록이 성곡적으로 되었습니다.");
					
					break;
					
				case "/member/logout.do":
					System.out.println("b. 로그아웃 처리(MemberController)");
					// session의 로그인 내용 지우기
					session.removeAttribute("login");
					
					session.setAttribute("msg", "로그아웃 되었습니다.");
					jsp = "redirect:/";
					break;
				case "/member/list.do":
					//[MemberController] - (Excute) - MemberListService - MemberDAO.list()
					System.out.println("1. 회원 리스트");
					// 페이지 처리를 위한 객체
					// getInstance - 기본 값이 있고 넘어오는 페이지와 검색 정보를 세팅 처리
					PageObject pageObject = PageObject.getInstance(request);
					// id setting - 관리자 계정은 제외시키기 위해서=> accepter
					pageObject.setAccepter(id);
					// DB에서 데이터 가져오기 - 가져온 데이터는 List<MemberVO>
					result = Execute.execute(Init.get(uri), pageObject);
					System.out.println("@@@@@@@@@ result = " +  result);
					
					// PageObject 확인하기
					System.out.println("MemberController.execute().pageObject = " + pageObject);
					// 가져온 데이터 출력하기
					request.setAttribute("list", result);
					// PageObject 담기
					request.setAttribute("pageObject", pageObject);
					// /WEB-INF/views/ + member/list + .jsp
					jsp = "member/list";
					
					break;
				case "/member/view.do":
					System.out.println("2. 일반 게시판 글 보기");
					
					// 1. 조회수 1증가(글보기)
					String strNo = request.getParameter("no");
					no = Long.parseLong(strNo);
					String strInc = request.getParameter("inc");
					Long inc = Long.parseLong(strInc);
					// 2. 일반게시판 글보기 데이터 가져오기 : 글보기 , 글수정
					//전달 데이터 - 글번호, 조회수 증가 여부 (1:증가 0: 증가 안함) : 배열 또는 Map
					result = Execute.execute(Init.get(uri), new Long[]{no , inc});
					
					request.setAttribute("vo", result);
					
					// 댓글 페이지 객체
					// 데이터 전달 - page / perPageNum / no / replyPage / replyPerPageNum
					ReplyPageObject replyPageObject = ReplyPageObject.getInstance(request);
					// 가져온 댓글 데이터 request에 "담기"
					request.setAttribute("replyList", Execute.execute(Init.get("/memberreply/list.do"), replyPageObject));
					// 댓글 페이지 객체 "담기"
					request.setAttribute("replyPageObject",replyPageObject);
					jsp = "/member/view";				
					
					break;
					
				case "/member/writeForm.do":
					System.out.println("3-1. 회원가입 폼");
					jsp = "/member/writeForm";
					break;
				
				case "/member/write.do":
					System.out.println("3-2. 회원가입 처리");
					
					MultipartRequest multi = new MultipartRequest(request, realSavePath, sizeLimit, "utf-8", new DefaultFileRenamePolicy());
					
					// 데이터 수집 - 사용자 -> 서버 : form - input - name 
					id = multi.getParameter("id");
					pw = multi.getParameter("pw");
					String name = multi.getParameter("name");
					String gender = multi.getParameter("gender");
					String birth = multi.getParameter("birth");
					String tel = multi.getParameter("tel");
					String email = multi.getParameter("email");
					String image = multi.getFilesystemName("photoFile");
					System.out.println("@@@@@@@@@photoFile = " + image);
					// 변수 - vo 저장하고 Service 
					MemberVO vo = new MemberVO();
					vo.setId(id);
					vo.setPw(pw);
					vo.setGender(gender);
					vo.setName(name);
					vo.setBirth(birth);
					vo.setTel(tel);
					vo.setEmail(email);
					// fileName은 위치 정보 + 파일명
					// 이미지가 있으면 세팅한다. 없으면 세팅하지 않는다.
					if(!(image == null || image.equals("")))
					vo.setPhoto(savePath + "/" + image);
					
					// [MemberController] - (Execute) - [MemberWriteService] - [MemberDAO.write(vo)]
					// session에 데이터를 담아서 로그인 처리한다.
					Execute.execute(Init.get(uri), vo);
					
					// jsp 정보 앞에 "redirect:"가 붙어 있어 redirect를 
					// 아니면 jsp로 forward를 시킨다.
					// 원래는 main이나 진행하려고 했던 uri로 이동시킨다.
					// 그러나 완성이 안되어 있어서 완성되어진 게시판 리스트로 보낸다.
					jsp = "/member/loginForm";
					session.setAttribute("msg", "회원가입이 성곡적으로 되었습니다.");
					
					break;
				case "/member/checkId.do":
					System.out.println("3-3. 아이디 중복 확인");
					
					// 데이터 수집 - 사용자 -> 서버 : form - input - name 
					id = request.getParameter("id");

					
					// [MemberController] - (Execute) - [MembercheckIdService] - [MemberDAO.checkId(id)]
					// session에 데이터를 담아서 로그인 처리한다.
					id = (String) Execute.execute(Init.get(uri), id);
					
					request.setAttribute("id", id);
					// jsp 정보 앞에 "redirect:"가 붙어 있어 redirect를 
					// 아니면 jsp로 forward를 시킨다.
					// 원래는 main이나 진행하려고 했던 uri로 이동시킨다.
					// 그러나 완성이 안되어 있어서 완성되어진 게시판 리스트로 보낸다.
					jsp = "member/checkId";
					
					session.setAttribute("msg", "글 등록이 성곡적으로 되었습니다.");
					
					break;
				case "/member/updateForm.do":
					System.out.println("4-1. 회원 정보 수정 폼");
					// 사용자 -> 서버 : 글번호 
					no = Long.parseLong(request.getParameter("no"));
					// no 맞는 데이터 DB에서 가져온다. BoardViewService
					//전달 데이터 - 글번호, 조회수 증가 여부 (1:증가 0: 증가 안함) : 배열 또는 Map
					result = Execute.execute(Init.get("/member/view.do"), new Long[]{no , 0L});
					// 가져온 데이터를 JSP로 보내기 위해서 request에 담는다.
					request.setAttribute("vo", result);
					// jsp 정보
					jsp = "board/updateForm";
					break;
					
				case "/member/update.do":
					
					System.out.println("4-2. 회원 정보 수정 처리");
				
					// 데이터 수집 - 사용자 -> 서버 : form - input - name 
					no = Long.parseLong(request.getParameter("no"));
					pw = request.getParameter("pw");
					
					// 변수 - vo 저장하고 Service 
					vo = new MemberVO();
					/*
					 * vo.setNo(no); vo.setTitle(title); vo.setContent(content);
					 * vo.setWriter(writer);
					 */
					vo.setPw(pw);
					
					// DB에 데이터 수정하기 - BoardUpdateService
					Execute.execute(Init.get(uri), vo);
					//페이지 정보 받기 & uri에 붙이기
					pageObject = PageObject.getInstance(request);					
					// 글보기로 자동 이동 -> jsp정보를 작성해서 넘긴다.
					jsp = "redirect:view.do?no=" + no + "&inc=0" + "&" + pageObject.getPageQuery();
					session.setAttribute("msg", "글 수정이 성곡적으로 되었습니다.");
					break;
					
				case "/member/changeGrade.do":
					
					System.out.println("4-3. 회원등급 변경 처리");
					
					// 데이터 수집 - 사용자 -> 서버 : form - input - name 
					int gradeNo = Integer.parseInt(request.getParameter("gradeNo"));
					id = request.getParameter("id");
					
					// 변수 - vo 저장하고 Service 
					vo = new MemberVO();
					vo.setGradeNo(gradeNo);
					vo.setId(id);
					
					// DB에 데이터 수정하기 - BoardUpdateService
					Execute.execute(Init.get(uri), vo);
					//페이지 정보 받기 & uri에 붙이기
					pageObject = PageObject.getInstance(request);					
					// 글보기로 자동 이동 -> jsp정보를 작성해서 넘긴다.
					jsp = "redirect:list.do?"+ pageObject.getPageQuery();
					session.setAttribute("msg", "회원 ["+ id +"]의 등급이 "+ ((gradeNo == 1)? "일반회원으로" : "관리자로")+"변경되었습니다.");
					break;
					
					case "/member/changeStatus.do":
					
					System.out.println("4-4. 회원상태 변경 처리");
					
					// 데이터 수집 - 사용자 -> 서버 : form - input - name 
					String status = request.getParameter("status");
					id = request.getParameter("id");
					
					// 변수 - vo 저장하고 Service 
					vo = new MemberVO();
					vo.setStatus(status);
					vo.setId(id);
					
					// DB에 데이터 수정하기 - BoardUpdateService
					Execute.execute(Init.get(uri), vo);
					//페이지 정보 받기 & uri에 붙이기
					pageObject = PageObject.getInstance(request);					
					// 글보기로 자동 이동 -> jsp정보를 작성해서 넘긴다.
					jsp = "redirect:list.do?"+ pageObject.getPageQuery();
					session.setAttribute("msg", "회원 ["+ id +"]의 상태가 "+ status +"으로 변경되었습니다.");
					break;		
					
				case "/member/delete.do":
					System.out.println("5. 일반 게시판 글 삭제");
					// 데이터 수집 - DB에서 실행에 필요한 데이터 - 글번호, pw - BoardVO
					no = Long.parseLong(request.getParameter("no"));
					pw = request.getParameter("pw");
					String perPageNum = request.getParameter("perPageNum");
				
					vo = new MemberVO();
//					vo.setNo(no);
					vo.setPw(pw);
					
					
					// DB 처리
					Execute.execute(Init.get(uri), vo);
					System.out.println();
					System.out.println("***************************");
//					System.out.println("**"+ vo.getNo()+"번 게시글이 삭제되었습니다. "+"**");
					System.out.println("***************************");

					jsp = "redirect:list.do?" + "&" + "perPageNum="+ perPageNum;
					session.setAttribute("msg", "글 삭제가 성곡적으로 되었습니다.");
					break;
				case "0":
					System.out.println("0. 이전");
					
	
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
	} //end of execute()
}// end of class
