<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cooke &amp; Session</title>
</head>
<body>
<%
// 자바입니다. - 쿠키 처리를 합니다. -> controller에서 처리

// 1. 저장할 Cookie 객체 생성 - 세팅
Cookie c = new Cookie("id" , "pinksung");
// 2. 유효기간 설정 - 1분 단위 지정
c.setMaxAge(365*24*60*60);
// 3. 쿠키 서버 -> 클라이언트 전송(사용자 컴퓨터 저장)
response.addCookie(c);
// 4. 쿠키를 생성하여 클라이언트에 전송 
response.addCookie(new Cookie("pwd" , "1111"));
response.addCookie(new Cookie("age" , "20"));
%>
<h3>쿠키 설정</h3>
<a href= "02_getCookies.jsp">겟쿠</a>
</body>
</html>