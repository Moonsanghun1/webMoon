package com.web.board.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.web.board.service.BoardDeleteService;
import com.web.board.service.BoardListService;
import com.web.board.service.BoardUpdateService;
import com.web.board.service.BoardViewService;
import com.web.board.service.BoardWriteService;
import com.web.board.vo.BoardVO;
import com.web.util.exe.Execute;
import com.web.util.io.BoardPrint;
import com.web.util.io.In;
import com.webjjang.util.PageObject;
// Board Module에 맞는 메뉴 선택, 데이터 수집, 예외 처리
public class BoardController {

	public String execute(HttpServletRequest request) {
		System.out.println("BoardController.execute() --------------------------");
			// 메뉴 입력
			String uri = request.getRequestURI();
			
			Object result = null;
			// 메뉴 처리
			Long no = 0L;
			
			String jsp = null;
			
			try { //정상처리
				
				// 메뉴 처리 : CRUD DB처리 - controller - service - DAO
				switch (uri) {
				case "/board/list.do":
					//[BoardController] - (Excute) - BoardListService - BoardDAO.list()
					System.out.println("1. 일반 게시판 리스트");
					
					PageObject pageObject = PageObject.getInstance(request);
					// DB에서 데이터 가져오기 - 가져온 데이터는 List<BoardVO>
					result = Execute.execute(new BoardListService(), pageObject);
					// 가져온 데이터 출력하기
					request.setAttribute("list", result);
					// /WEB-INF/views/ + board/list + .jsp
					jsp = "board/list";
					break;
				case "/board/view.do":
					System.out.println("2. 일반 게시판 글 보기");
					
					// 1. 조회수 1증가(글보기)
					no = In.getLong("글번호");
					// 2. 일반게시판 글보기 데이터 가져오기 : 글보기 , 글수정
					//전달 데이터 - 글번호, 조회수 증가 여부 (1:증가 0: 증가 안함) : 배열 또는 Map
					result = Execute.execute(new BoardViewService(), new Long[]{no , 1L});
					// 게시판 글보기 출력 : BoardPrint 
					new BoardPrint().print((BoardVO)result);
					
					break;
				case "3":
					System.out.println("3. 일반 게시판 글 등록");
					
					// 데이터 수집 - 사용자 : 제목, 내용, 작성자, 비밀번호
					String title = In.getStr("제목");
					String content = In.getStr("내용");
					String writer = In.getStr("작성자");
					String pw = In.getStr("비밀번호");
					
					// 변수 - vo 저장하고 Service 
					BoardVO vo = new BoardVO();
					vo.setTitle(title);
					vo.setContent(content);
					vo.setWriter(writer);
					vo.setPw(pw);
					
					Execute.execute(new BoardWriteService(), vo);
					// [BoardController] - BoardWriteService - BoardDAO.write(vo)
					
					
					break;
				case "4":
					
					System.out.println("4. 일반 게시판 글 수정");
					
					// 수정할 글번호를 받는다. - 데이터 수집
					no = In.getLong("글번호");
					
					// 수정할 데이터 가져오기 - 글보기 - BoardViewService
					BoardVO updateVO = (BoardVO) Execute.execute(new BoardViewService(), new Long[]{no , 0L});
					
					// 가져온 데이터 수정하기 - 데이터 수집
					whileLoop:
					while(true) {
						new BoardPrint().print(updateVO);
						System.out.println();
						System.out.println("------------------------------------------------------------");
						System.out.println("  1. 제목 /  2. 내용  /  3. 작성자  /  9 . 수정 취소  /  0. 수정완료  ");
						System.out.println("------------------------------------------------------------");
						String item = In.getStr("수정 항목 선택");
						switch(item) {
						case "1" : {
							updateVO.setTitle(In.getStr("제목"));
							break;
						}
						case "2" : {
							updateVO.setContent(In.getStr("내용"));
							break;
						}
						case "3" : {
							updateVO.setWriter(In.getStr("작성자"));
							break;
						}
						case "9" : {
							System.out.println();
							System.out.println("수정이 취소 되었습니다");
							break whileLoop;
						}
						case "0" : {
							// 비밀번호 입력
							updateVO.setPw(In.getStr("수정을 위한 비밀번호 입력"));
							// DB 적용하는 처리문 작성 BoardUpdateService()
							Execute.execute(new BoardUpdateService(), updateVO);
							break whileLoop;
						}
						default:
							System.out.println("******************************************");
							System.out.println("******* 잘못된 항목 번호를 선택하셨습니다. *********");
							System.out.println("***** [1~3, 9 0] 번호를 선택하셔야 합니다. ******");
							System.out.println("******************************************");
						}
					} // end of while
					// DB에 데이터 수정하기 - BoardUpdateService
					
					break;
					
				case "5":
					System.out.println("5. 일반 게시판 글 삭제");
					// 데이터 수집 - DB에서 실행에 필요한 데이터 - 글번호, pw - BoardVO
					BoardVO deleteVO = new BoardVO();
					deleteVO.setNo(In.getLong("삭제학 번호 입력"));
					deleteVO.setPw(In.getStr("본인 확인용 비밀번호 입력"));
					// DB 처리
					Execute.execute(new BoardDeleteService(), deleteVO);
					System.out.println();
					System.out.println("***************************");
					System.out.println("**"+ deleteVO.getNo()+"번 게시글이 삭제되었습니다. "+"**");
					System.out.println("***************************");
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
