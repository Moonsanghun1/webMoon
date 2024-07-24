package com.musaic.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.musaic.main.controller.Init;
import com.musaic.member.db.LoginVO;
import com.musaic.member.db.MemberVO;
import com.musaic.util.exe.Execute;
import com.webjjang.util.page.PageObject;

public class MemberController {
	public String execute(HttpServletRequest request) {
		String uri=request.getRequestURI();
		
		String jsp=null;
		Object result=null;
		String id=null;
		
		HttpSession session=request.getSession();
		LoginVO login=(LoginVO) session.getAttribute("login");
		if(login!=null) id=login.getId();
		
		System.out.println();
		try {
			switch(uri) {
			case "/member/list.do":
				System.out.println("======== Member Controller list ========");
				//Execute-Service-DAO
				PageObject po=PageObject.getInstance(request);
				result=Execute.execute(Init.get(uri), po);
				//실행 결과 request 속성으로 담기
				request.setAttribute("list", result);
				request.setAttribute("po", po);
				jsp="member/list";
				break;
			case "/member/writeform.do":
				System.out.println("======== Member Controller write form ========");
				jsp="member/writeform";
				break;
			case "/member/write.do":
				System.out.println("======== Member Controller write ========");
				//데이터 수집
				id=request.getParameter("id");
				String pw=request.getParameter("pw");
				String name=request.getParameter("name");
				String gender=request.getParameter("gender");
				String birth=request.getParameter("birth");
				String[] emails=request.getParameterValues("email");
				String email="";
				if(emails!=null) {
					for(String e:emails)
						email+=e;
				}
				System.out.println("email: "+email);
				String address=request.getParameter("address");
				String[] tels=request.getParameterValues("tel");
				String tel="";
				if(tels!=null) {
					for(String t:tels)
						tel+=t;
				}
				System.out.println("tel: "+tel);
				//vo 데이터 세팅
				MemberVO vo=new MemberVO();
				vo.setId(id);
				vo.setPw(pw);
				vo.setName(name);
				vo.setGender(gender);
				vo.setBirth(birth);
				vo.setTel(tel);
				vo.setEmail(email);
				vo.setAddress(address);
				
				//execute
				Execute.execute(Init.get(uri), vo);
				
				jsp="redirect:list.do";
				break;
			case "/member/loginform.do":
				System.out.println("======== Member Controller login form ========");
				jsp="member/loginform";
				break;
			case "/member/login.do":
				System.out.println("======== Member Controller login ========");
				
				id=request.getParameter("id");
				pw=request.getParameter("pw");
				
				login=new LoginVO();
				login.setId(id);
				login.setPw(pw);
				
				LoginVO loginvo=new LoginVO();
				loginvo=(LoginVO) Execute.execute(Init.get(uri), login);
				
				session.setAttribute("login", loginvo);
				
				jsp="redirect:/main/main.do";
				break;
			case "/member/logout.do":
				System.out.println("======== Member Controller logout ========");
				session.removeAttribute("login");
				jsp="redirect:/main/main.do";
				break;
			case "/member/view.do":
				System.out.println("======== Member Controller view ========");
				
				login=(LoginVO) session.getAttribute("login");
				id=login.getId();
				
				vo=(MemberVO) Execute.execute(Init.get(uri),id);
				
				request.setAttribute("vo", vo);
				
				jsp="member/view";
				break;
			}//end of switch
		}catch(Exception e) {
			e.printStackTrace();
		}
		System.out.println();
		return jsp;
	}
}