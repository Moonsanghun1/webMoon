<%@page import="com.web.LoginVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	System.out.println("login.jsp -------------------");
	//DB에서 가져오기를 해야한다.(DAO) 하드 코딩 중.
 	LoginVO vo = new LoginVO();
	vo.setId("test");
	vo.setPw("1111");
	vo.setName("문상훈");
	vo.setPhoto("/test.img");
	vo.setGradeNo(1);
	vo.setGradeName("일반회원");
	vo.setNewMsgCnt(5L);
	// 로그인 처리 - 가져온 정보를 세션에 담는다.
	// 정해진 공간에 데이터가 존재하면 로그인, 존재하지 않으면 로그아웃
	
	session.setAttribute("login", vo);
	
	// main으로 자동 이동
	response.sendRedirect("main.jsp");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>