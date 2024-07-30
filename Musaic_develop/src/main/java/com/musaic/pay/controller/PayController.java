package com.musaic.pay.controller;


import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.musaic.main.controller.Init;
import com.musaic.member.db.LoginVO;
import com.musaic.pay.vo.PayVO;
import com.musaic.util.exe.Execute;

// Pay Module 에 맞는 메뉴 선택 , 데이터 수집(기능별), 예외 처리
public class PayController {

	public String execute(HttpServletRequest request) {
		System.out.println("PayController.execute() --------------------------");
		// uri
		String uri = request.getRequestURI();
		
		Object result = null;
		Object result2 = null;
		
		String jsp = null;
		
		HttpSession session = request.getSession();
		LoginVO login = (LoginVO) session.getAttribute("login");
		String id =login.getId();
		
		try { // 정상 처리
		
			// 메뉴 처리 : CRUD DB 처리 - Controller - Service - DAO
			switch (uri) {
			case "/pay/payWriteForm.do":
				//아직 데이터가 없음
				System.out.println("1.결제 처리 폼");
				result = Execute.execute(Init.get(uri),id);
				request.setAttribute("list", result);
				jsp="pay/payWriteForm";
				break;
			case "/pay/payWrite.do":
				System.out.println("1-2. 결제 등록 처리");
				
				// 데이터 수집(사용자->서버 : form - input - name)
				//Long price = Long.parseLong(request.getParameter("payPrice"));
				//String image = request.getParameter("payImage");
				String address = request.getParameter("address");
				String name = request.getParameter("name");
				String phone = request.getParameter("phone");
				String cardType = request.getParameter("cardType");
				String cardBank = request.getParameter("cardBank");
				String cardNum = request.getParameter("cardNum");
				String phonePay = request.getParameter("phonePay");
				String payTel = request.getParameter("payTel");
				String bankType = request.getParameter("bankType");
				String bankNum = request.getParameter("bankNum");
				// 변수 - vo 저장하고 Service
				PayVO vo = new PayVO();
				vo.setMemberId(id);
				vo.setAddress(address);
				vo.setName(name);
				vo.setPhone(phone);
				vo.setMemberId(id);
				
				if(cardType != null) {
				vo.setCardType(cardType);
				vo.setCardBank(cardBank);
				vo.setCardNum(cardNum);
				}
				if(phonePay !=null) {
					vo.setPhonePay(phonePay);
					vo.setPayTel(payTel);
				}
				if(bankNum !=null && equals("")) {
					vo.setBankType(bankType);
					vo.setBankNum(bankNum);
				}
	
				
				// [PayController] - PayWriteService - PayDAO.write(vo)
				Execute.execute(Init.get(uri), vo);
	            // URL 인코딩
	            String encodedAddress = URLEncoder.encode(address, "UTF-8");
	            String encodedName = URLEncoder.encode(name, "UTF-8");
	            String encodedPhone = URLEncoder.encode(phone, "UTF-8");

				
				// jsp 정보 앞에 "redirect:"가 붙어 있어 redirect를
				// 아니면 jsp로 forward로 시킨다.
				jsp = "redirect:payList.do?address="+encodedAddress+"&name="+encodedName+""
						+ "&phone="+encodedPhone;
				System.out.println(jsp);
				break;
			case "/pay/payList.do":
				// [PayController] - (Execute) - PayListService - PayDAO.list()
				System.out.println("2.결제 리스트");
				
				result = Execute.execute(Init.get(uri),null);
				result2 = Execute.execute(Init.get("/pay/payWriteForm.do"),id);
				
				request.setAttribute("list", result);
				request.setAttribute("cart", result2);
				
				jsp = "pay/payList";
				break;
			case "/pay/payView.do":
				System.out.println("3.결제 상세 보기");
				// 넘어오는 글번호 수집한다.(request에 들어 있다.)
				result = Execute.execute(Init.get(uri),id);
				result2 = Execute.execute(Init.get("/pay/payWriteForm.do"),id);
				// 가져온 데이터를 JSP로 보내기 위해서 request에 담는다.
				request.setAttribute("vo", result);
				request.setAttribute("cart", result2);
				jsp = "pay/payView";
				break;
			case "/pay/payUpdate.do":
				System.out.println("4.결제 배송지 수정 처리");
				
				// 데이터 수집(사용자->서버 : form - input - name)
				 address = request.getParameter("address");
				 name = request.getParameter("name");
				Long payNo = Long.parseLong(request.getParameter("payNo"));
				 vo = new PayVO();
				vo.setAddress(address);
				vo.setName(name);
				vo.setPayNo(payNo);

				 
				// DB 적용하는 처리문 작성. BoardUpdateservice
				Execute.execute(Init.get(uri), vo);

	             encodedAddress = URLEncoder.encode(address, "UTF-8");
	             encodedName = URLEncoder.encode(name, "UTF-8");

	             
	             //image나 price가 null 아니면 넣고 null이면 넣지 않고 view감 
//	             	if(image != null && price != null) {
					jsp = "redirect:payList.do?address="+encodedAddress+"&name="+encodedName;
//	             	}else {
//	             		jsp = "redirect:payView.do?payNo="+payNo+"&address="+encodedAddress+"&name="+encodedName+"&phone="+encodedPhone;
//	             	}
				break;
			case "/pay/payDelete.do":
				System.out.println("5.취소 사유 등록");
				// 데이터 수집 - DB에서 실행에 필요한 데이터 - 글번호, 비밀번호 - BoardVO
				String cencel = request.getParameter("cencel");
				String status = request.getParameter("status");
				payNo = Long.parseLong(request.getParameter("payNo"));
				PayVO deleteVO = new PayVO();
				deleteVO.setCancel(cencel);
				deleteVO.setStatus(status);
				deleteVO.setPayNo(payNo);
				// DB 처리
				Execute.execute(Init.get(uri), deleteVO);
				jsp ="redirect:payView.do?payNo="+payNo;
				
				break;
			case "/pay/adminList.do":
				System.out.println("6.관리자 리스트");	
				result = Execute.execute(Init.get(uri),null);
				request.setAttribute("list", result);
				jsp ="pay/adminList";
				break;
			case "/pay/changeStatus.do":
				System.out.println("6-2.관리자 상태 변경");	
				status =request.getParameter("status");
				payNo = Long.parseLong(request.getParameter("payNo"));				
				 vo = new PayVO();
				 vo.setStatus(status);
				 vo.setPayNo(payNo);
				 result = Execute.execute(Init.get(uri),vo);
				 jsp = "redirect:adminList.do";
				break;
			default:
				jsp = "error/404";
				break;
			} // end of switch
		} catch (Exception e) {
			// TODO: handle exception
			// e.printStackTrace();
			
			//예외객체를 jsp에서 사용하기 위해 request에 담는다
			request.setAttribute("e", e);
			
			jsp = "error/500";
		} // end of try~catch
		return jsp;
	} // end of execute()
	
} // end of class
