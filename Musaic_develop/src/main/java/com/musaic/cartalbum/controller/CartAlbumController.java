package com.musaic.cartalbum.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import com.musaic.cartalbum.vo.CartAlbumVO;
import com.musaic.main.controller.Init;
import com.musaic.member.db.LoginVO;
import com.musaic.util.exe.Execute;

public class CartAlbumController {

	public String execute(HttpServletRequest request) {
		System.out.println("CartAlbumController.execute() --------------------------");
		
		// uri
		String uri = request.getRequestURI();
		System.out.println("@@@@@@@@@@"+uri);
		Object result = null;
		String jsp = null;
		
		@SuppressWarnings("unused")
		
		// login된 정보 중에서 id를 많이 사용한다.
	      HttpSession session = request.getSession();
	      LoginVO login = (LoginVO) session.getAttribute("login");
	      String id=null;
	      if(login!=null) {
	    	  id=login.getId();
	      }
	
		// 입력 받는 데이터 선언
		//Long no = 0L;
		
		try {
			// 정상 처리
			switch (uri) {
				case "/cartalbum/list.do":
					System.out.println("1.장바구니 리스트");
					
//					PageObject pageObject = PageObject.getInstance(request);
//					System.out.println(pageObject);
					

					CartAlbumVO vo = new CartAlbumVO();
					vo.setMemberid(id);
		
					result = Execute.execute(Init.get(uri), vo);
					
					// pageObject 데이터 확인
					//System.out.println("CartAlbumController.execute().pageObject = " + pageObject);
					
					// 가져온 데이터 request에 저장 -> jsp까지 전달된다.
					request.setAttribute("list", result);
					
					// pageObject 담기
					//request.setAttribute("pageObject", pageObject);
					
					// /WEB-INF/views/ + cartalbum/list + .jsp
					jsp = "cartalbum/list";
					break;
					
				    
				case "/cartalbum/write.do":
				    System.out.println("3. 장바구니 담기 처리");
				    
				    Long albumNo = Long.parseLong(request.getParameter("albumNo"));
				    id = login.getId();
				    System.out.println("id: "+id);
				    Long albumCnt = Long.parseLong(request.getParameter("albumCnt"));
				    
//				    CartAlbumVO foundAlbum = new CartAlbumVO();
//				    foundAlbum.setMemberid(id);
//				    List<CartAlbumVO> tempResult = (List<CartAlbumVO>) Execute.execute(Init.get("/cartalbum/list.do"), foundAlbum);
//				    
//				    for (int i = 0; i < tempResult.size(); i++) {
//				    	CartAlbumVO thisAlbum = (CartAlbumVO) tempResult.get(i);
//				    	if (thisAlbum.getAlbumNo() == null) {
//				    		continue;
//				    	}
//				    	if (thisAlbum.getAlbumNo().equals(albumNo)) {
//				    		foundAlbum = thisAlbum;
//				    		break;
//				    	}
//				    }

				    CartAlbumVO vo2 = new CartAlbumVO();
				    
				    vo2.setAlbumNo(albumNo);
			    	vo2.setAlbumCnt(albumCnt);
			    	vo2.setMemberid(id);
			    	Execute.execute(Init.get(uri), vo2);
				    
//				    if (foundAlbum == null) {
//				    	vo2.setAlbumNo(albumNo);
//				    	vo2.setAlbumCnt(albumCnt);
//				    	vo2.setMemberid(id);
//				    	// Execute.execute 메서드를 통해 로직 실행
//					    Execute.execute(Init.get(uri), vo2);
//				    } else {
//				    	
//				    	foundAlbum.setAlbumCnt(foundAlbum.getAlbumCnt() + 1);
//				    	// Execute.execute 메서드를 통해 로직 실행
//					    Execute.execute(Init.get(uri), foundAlbum);
//				    }
				    
				    jsp = "redirect:/cartalbum/list.do";
				   
				    break;

				    
				case "/cartalbum/update.do":
				    System.out.println("4. 장바구니 수정 처리");
				    
				    albumCnt = Long.parseLong(request.getParameter("albumCnt"));
			
				    // CartAlbumVO 객체 생성 및 값 설정
				    vo = new CartAlbumVO();
				    vo.setAlbumCnt(albumCnt);
				   // vo.setAlbumNo(albumNo);
				
				    // Execute.execute 메서드를 통해 로직 실행
				    Execute.execute(Init.get(uri), vo);
				    break;
				    
				    
				    // 배열로 받고, 
				    
				case "/cartalbum/minus.do":
				   System.out.println("4. 장바구니 수량 감소 처리");
				   String strNo = request.getParameter("cartNo");
				   Long no = Long.parseLong(strNo);
				   result = Execute.execute(Init.get(uri), no);
				   
				   jsp = "redirect:/cartalbum/list.do";
				    
				    break;
				    
				case "/cartalbum/add.do":
				    System.out.println("4. 장바구니 수량 증가 처리");
				    strNo = request.getParameter("cartNo");
					no = Long.parseLong(strNo);
					result = Execute.execute(Init.get(uri), no);
					   jsp = "redirect:/cartalbum/list.do";
					    
					    break;

				    
				case "/cartalbum/delete.do":
				    System.out.println("5. 장바구니 삭제 처리");
				    String passNo= ""; // 넘어가는 번호 선언
				    // 삭제할 항목의 no 값 가져오기
				    //String id = request.getParameter("id");
				    passNo = request.getParameter("checkedCartNos");
				    System.out.println("@@@@@@"+request.getParameter("checkedCartNos"));
				   
				    String[] passNoList = passNo.split(",");
				    
				    for (int i = 0; i < passNoList.length; i++) {
				    	String currentPassNo = passNoList[i];
				    	// Execute.execute 메서드를 통해 삭제 로직 실행
				    	result = Execute.execute(Init.get(uri), currentPassNo);
				    }
				   
				    // 삭제 후 리스트 페이지로 리다이렉트
				    jsp = "redirect:/cartalbum/list.do";
				    break;
				    
				    
				    
				case "/cartalbum/pay.do":
					
					System.out.println("결제 페이지로 이동");
					result = Execute.execute(Init.get(uri),null);					
					result = Execute.execute(Init.get(uri), null);
					
					jsp = "pay/payWriteForm";
					break;
					
				default:
					jsp = "error/404";
					break;
			} // end of switch
		} catch (Exception e) {
			// 예외 처리
			e.printStackTrace();
			jsp = "error/500";
			
			// 예외 객체를 JSP에서 사용하기 위해서 request에 담는다.
			request.setAttribute("e", e);
		} // end of try~catch
		
		return jsp;
	} // end of execute()
} // end of class
