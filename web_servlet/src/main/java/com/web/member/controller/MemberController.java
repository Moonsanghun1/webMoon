package com.web.member.controller;

import java.util.List;

import com.web.main.controller.Main;
import com.web.member.service.MemberCondateUpdateService;
import com.web.member.service.MemberDeleteService;
import com.web.member.service.MemberListService;
import com.web.member.service.MemberLoginService;
import com.web.member.service.MemberUpdateService;
import com.web.member.service.MemberViewService;
import com.web.member.service.MemberWriteService;
import com.web.member.vo.LoginVO;
import com.web.member.vo.MemberVO;
import com.web.notice.service.NoticeDeleteService;
import com.web.notice.service.NoticeListService;
import com.web.notice.service.NoticeUpdateService;
import com.web.notice.service.NoticeViewService;
import com.web.notice.service.NoticeWriteService;
import com.web.notice.vo.NoticeVO;
import com.web.util.exe.Execute;
import com.web.util.io.NoticePrint;
import com.web.util.io.In;
import com.web.util.io.MemberPrint;
// Notice Module에 맞는 메뉴 선택, 데이터 수집, 예외 처리
public class MemberController {

	@SuppressWarnings("unchecked")
	public void execute() {
		// 게시판 기능 무한반복
		while(true) {
			// 모듈 출력
			Main.loginInfo();
			System.out.println();
			System.out.println("<<--------- 회원관리--------->>");
			// 메뉴 출력 - 리스트, 글보기, 글등록, 글수정, 글삭제
			System.out.println("=============================");
			System.out.println("==1. 회원 리스트(관리자), 2.회원 정보 보기(회원), 3. 회원가입==");
			System.out.println("==4. 정보수정(회원), 5. 회원탈퇴(회원), 6. " + ((Main.login == null)?"로그인":"로그아웃" ) );
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
					System.out.println("1. 회원 리스트");
					// DB에서 데이터 가져오기 - 가져온 데이터는 List<NoticeVO>
					result = Execute.execute(new MemberListService(), null);
					// 가져온 데이터 출력하기
					new MemberPrint().print((List<MemberVO>) result);
					break;
				case "2":
					System.out.println("2. 내 정보 보기");
					if(Main.login == null) throw new Exception("예외 발생 : 로그인이 필요합니다.");
					// 1. 내정보 보기 데이터 가져오기 : 아이디 , 이름, 성별, 생년월일, 이메일, 가입일, 최근 접속일, 사진, 등급번호, 등급명
					// 일반회원은 로그인한 아이디 정보를 사용한다. 관리자는 직접입력.
			
					String id = (Main.login.getGradeNo() == 9)? In.getStr("아이디"): Main.login.getId();

					result = Execute.execute(new MemberViewService(), id);
					// 게시판 글보기 출력 : NoticePrint 
					new MemberPrint().print((MemberVO)result);
					
					break;
				case "3":
					System.out.println("3. 회원가입");
					
					// 데이터 수집 - 사용자 : 아이디, 비밀번호, 이름, 성별, 생년월일, 연락처, 이메일, 사진
					id = In.getStr("아이디");
					String pw = In.getStr("비밀번호");
					String name = In.getStr("이름");
					String gender = In.getStr("성별 (남자 or 여자)");
					String photo = In.getStr("사진");
					String tel = In.getStr("연락처");
					String email = In.getStr("이메일");
					String birth = In.getStr("생년월일 (YYYY-MM-DD)");
					
					
					// 변수 - vo 저장하고 Service 
					MemberVO vo = new MemberVO();
					vo.setId(id);
					vo.setPw(pw);
					vo.setName(name);
					vo.setGender(gender);
					vo.setPhoto(photo);
					vo.setTel(tel);
					vo.setEmail(email);
					vo.setBirth(birth);

					Execute.execute(new MemberWriteService(), vo);
					// [MemberController] - MemberWriteService - NoticeDAO.write(vo)
					
					
					break;
				case "4":
					
					System.out.println("4. 정보 수정");
					
					if(Main.login == null) throw new Exception("예외 발생 : 로그인이 필요합니다.");
					// 1. 수정 데이터 가져오기 : 아이디 , 이름, 성별, 생년월일, 이메일, 가입일, 최근 접속일, 사진, 등급번호, 등급명
					// 일반회원은 로그인한 아이디 정보를 사용한다. 관리자는 직접입력.
			
					id = Main.login.getId();
					pw = Main.login.getPw();

					vo = (MemberVO) Execute.execute(new MemberViewService(), id);

					// 
					// 수정할 데이터 가져오기 - 글보기 - NoticeViewService
					update(vo);

					break;
					// call by reference -> 주소가 전달된다. 
					
					
				case "5":
					System.out.println("5. 회원탈퇴 : 상태 - 탈퇴로 수정");
					// 데이터 수집 - DB에서 실행에 필요한 데이터 - 글번호, pw - NoticeVO
					
					id = In.getStr("탈퇴할 아이디 입력");
					pw = In.getStr("비밀번호");

					vo = new MemberVO();
					vo.setId(id);
					vo.setPw(pw);
					
					Execute.execute(new MemberDeleteService(), vo);
					// 로그아웃 처리
					Main.login = null;
					// DB 처리
					
					System.out.println();
					System.out.println("***************************");
					System.out.println("** 탈퇴되었습니다. **");
					System.out.println("***************************");
					break;
				
				case "6":
					System.out.println("6. 로그인 / 로그아웃");
					// 데이터 수집 - DB에서 실행에 필요한 데이터 - 글번호, pw - NoticeVO
					if(Main.login == null) {
						
					id = In.getStr("아이디");
					pw = In.getStr("비밀번호");
					LoginVO loginVO = new LoginVO();
					loginVO.setId(id);
					loginVO.setPw(pw);

					// DB 처리 & 로그인 처리 
					Main.login =(LoginVO) Execute.execute(new MemberLoginService(), loginVO);
					// 최근 접속일 변경
					new MemberCondateUpdateService().service(Main.login.getId());
					System.out.println();
					System.out.println("***************************");
					System.out.println("**      로그인 되었습니다     **");
					System.out.println("***************************");
				
					} else {
						// 로그아웃 처리
						Main.login = null;
						System.out.println();
						System.out.println("***************************");
						System.out.println("**     로그아웃 되었습니다.    **");
						System.out.println("***************************");
					} // end of if
					
					break;
				
				case "0": // 이전 메뉴
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
				//e.printStackTrace();
				System.out.println();
				System.out.println("$%@$%@%$%@$%$@%@$%$@$%@%$$@%$%@$%@$%@$%@$%@$%$@$@%");
				System.out.println("$%@$%@%$%@$%$@%       오류 출력        @$%@$%@$%$@$@%");
				System.out.println("$%@$%@%$%@$%$@%@$%$@$%@%$$@%$%@$%@$%@$%@$%@$%$@$@%");
				System.out.println("$%@$%@%$%@$%  타입 : "+ e.getClass().getSimpleName());
				System.out.println("$%@$%@%$%@$%  내용 : "+ e.getMessage());
				System.out.println("$%@$%@%$%@$%  조치 : "+ "데이터를 확인후 다시 실행하시오" );
				System.out.println("$%@$%@%$%@$%   : "+ "계속 오류가 나면 전산담당자에게 연락하시오");
				System.out.println("$%@$%@%$%@$%$@%@$%$@$%@%$$@%$%@$%@$%@$%@$%@$%$@$@%");
				
				
			} // end of try ~ catch
		} // end of while
	} //end of main
	// call by reference -> 주소가 전달된다. 안에서 변경하면 밖에서도 변경이 된다.
		private void update(MemberVO vo) throws Exception {
			// 가져온 데이터 수정하기 - 데이터 수집
			while(true) {
				new MemberPrint().print(vo);
				System.out.println();
				System.out.println("----------------------------------------------");
				System.out.println(" 1. 이름 2. 성별  3. 생년월일  4. 연락처  5. 이메일");
				System.out.println(" 6. 사진 9. 수정 취소 0. 수정 완료");
				System.out.println("----------------------------------------------");
				String item = In.getStr("수정 항목 선택");
				
				switch (item) {
				
				case "1": {
					vo.setName(In.getStr("이름"));
					break;
				}
				case "2": {
					vo.setGender(In.getStr("성별"));
					break;
				}
				case "3": {
					vo.setBirth(In.getStr("생년월일(YYYY-MM-DD)"));
					break;
				}
				case "4": {
					vo.setTel(In.getStr("연락처"));
					break;
				}
				case "5": {
					vo.setEmail(In.getStr("이메일"));
					break;
				}
				case "6": {
					vo.setPhoto(In.getStr("사진"));
					break;
				}
				case "9": {
					System.out.println();
					System.out.println("*** 수정의 취소 되었습니다. ****");
					return;
				}
				case "0": {
					// DB 적용하는 처리문 작성. NoticeUpdateservice
					vo.setPw(In.getStr("본인확인용 비밀번호"));
					Execute.execute(new MemberUpdateService(), vo);
					return;
				}
				default:
					System.out.println("**********************************");;
					System.out.println("** 잘못된 항목 번호를 선택하셨습니다.    **");;
					System.out.println("** [1~6, 9, 0] 번호를 선택하셔야 합니다.*");;
					System.out.println("**********************************");;
				} // end of switch case
			}// end of while
		} // end of update() 
}// end of class
