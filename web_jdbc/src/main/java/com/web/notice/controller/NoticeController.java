package com.web.notice.controller;

import java.util.List;

import com.web.main.controller.Main;
import com.web.notice.service.NoticeDeleteService;
import com.web.notice.service.NoticeListService;
import com.web.notice.service.NoticeUpdateService;
import com.web.notice.service.NoticeViewService;
import com.web.notice.service.NoticeWriteService;
import com.web.notice.vo.NoticeVO;
import com.web.util.exe.Execute;
import com.web.util.io.NoticePrint;
import com.web.util.io.In;
// Notice Module에 맞는 메뉴 선택, 데이터 수집, 예외 처리
public class NoticeController {

	public void execute() {
		// 게시판 기능 무한반복
		while(true) {
			// 모듈 출력
			Main.loginInfo();
			System.out.println();
			System.out.println("<<--------- 공지사항 --------->>");
			// 메뉴 출력 - 리스트, 글보기, 글등록, 글수정, 글삭제
			System.out.println("=============================");
			System.out.println("==1. 리스트, 2. 글 보기, 3. 글 등록==");
			System.out.println("==4. 글 수정, 5. 글 삭제, 0. 이전 ==");
			System.out.println("=============================");
			
			// 메뉴 입력
			String menu = In.getStr("메뉴");
			
			Object result = null;
			// 메뉴 처리
			Long no = 0L;
			
			try { //정상처리
				
				// 메뉴 처리 : CRUD DB처리 - controller - service - DAO
				switch (menu) {
				case "1":
					//[NoticeController] - (Excute) - NoticeListService - NoticeDAO.list()
					System.out.println("1. 공지사항 리스트");
					// DB에서 데이터 가져오기 - 가져온 데이터는 List<NoticeVO>
					result = Execute.execute(new NoticeListService(), null);
					// 가져온 데이터 출력하기
					new NoticePrint().print((List<NoticeVO>) result);
					break;
				case "2":
					System.out.println("2. 공지사항 글 보기");
					
					no = In.getLong("글번호");
					// 2. 공지사항 글보기 데이터 가져오기 : 글보기 , 글수정
					//전달 데이터 - 글번호, 조회수 증가 여부 (1:증가 0: 증가 안함) : 배열 또는 Map
					result = Execute.execute(new NoticeViewService(), no);
					// 게시판 글보기 출력 : NoticePrint 
					new NoticePrint().print((NoticeVO)result);
					
					break;
				case "3":
					System.out.println("3. 공지사항 글 등록");
					
					// 데이터 수집 - 사용자 : 제목, 내용, 작성자, 비밀번호
					String title = In.getStr("제목");
					String content = In.getStr("내용");
					String startDate = In.getStr("시작일 (YYYY-MM-DD)");
					String endDate = In.getStr("종료일 (YYYY-MM-DD)");
					
					
					// 변수 - vo 저장하고 Service 
					NoticeVO vo = new NoticeVO();
					vo.setTitle(title);
					vo.setContent(content);
					vo.setStartDate(startDate);
					vo.setEndDate(endDate);

					Execute.execute(new NoticeWriteService(), vo);
					// [NoticeController] - NoticeWriteService - NoticeDAO.write(vo)
					
					
					break;
				case "4":
					
					System.out.println("4. 공지사항 글 수정");
					
					// 수정할 글번호를 받는다. - 데이터 수집
					no = In.getLong("글번호");
					
					// 수정할 데이터 가져오기 - 글보기 - NoticeViewService
					NoticeVO updateVO = (NoticeVO) Execute.execute(new NoticeViewService(), no);
					
					// 가져온 데이터 수정하기 - 데이터 수집
					whileLoop:
					while(true) {
						new NoticePrint().print(updateVO);
						System.out.println();
						System.out.println("------------------------------------------------------------");
						System.out.println("  1. 제목 /  2. 내용  /  3. 시작일  /  4. 종료일  / 9. 수정 취소  /  0. 수정완료  ");
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
							updateVO.setStartDate(In.getStr("시작일 (YYYY-MM-DD)"));
							break;
						}
						case "4" : {
							updateVO.setEndDate(In.getStr("종료일 (YYYY-MM-DD)"));
							break;
						}

						case "9" : {
							System.out.println();
							System.out.println("수정이 취소 되었습니다");
							break whileLoop;
						}
						case "0" : {
							
							// DB 적용하는 처리문 작성 NoticeUpdateService()
							Execute.execute(new NoticeUpdateService(), updateVO);
							break whileLoop;
						}
						default:
							System.out.println("******************************************");
							System.out.println("******* 잘못된 항목 번호를 선택하셨습니다. *********");
							System.out.println("***** [1~4, 9, 0] 번호를 선택하셔야 합니다. ******");
							System.out.println("******************************************");
						}
					} // end of while
					// DB에 데이터 수정하기 - NoticeUpdateService
					
					break;
					
				case "5":
					System.out.println("5. 공지사항 글 삭제");
					// 데이터 수집 - DB에서 실행에 필요한 데이터 - 글번호, pw - NoticeVO
					
					no = In.getLong("삭제할 번호 입력");

					// DB 처리
					Execute.execute(new NoticeDeleteService(), no);
					System.out.println();
					System.out.println("***************************");
					System.out.println("**"+ no +"번 공지사항이 삭제되었습니다. "+"**");
					System.out.println("***************************");
					break;
				case "0":
					System.out.println("0. 이전");
					return;
	
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
		} // end of while
	} //end of main
}// end of class
