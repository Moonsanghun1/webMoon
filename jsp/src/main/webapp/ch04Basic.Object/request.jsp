<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>request</title>
</head>
<body>
<h1>request</h1>
<p>클라이언트에서 서버 쪽으로 넘겨 주는 데이터가 저장되어 있다.</p>
컨택스트 패스 : <%= request.getContextPath() %> <br>
요청방식 : <%= request.getMethod() %> <br>
요청한 URL : <%= request.getRequestURL() %> <br>
요청한 URI : <%= request.getRequestURI() %> <br>
서버의 이름 : <%= request.getServerName() %> <br>
프로토콜 : <%= request.getProtocol() %> <br>
request.getRemoteAddr() : <%= request.getRemoteAddr() %> <br>
<%-- response.getContentType() : <%= response.getContentType() %> <br> --%>
<%-- response.getWriter() : <%= response.getWriter() %> <br> --%>
request.getRemoteAddr() : <%= request.getCookies() %> <br>

------------------ 넘어오는 데이터 확인 (이전 페이지에서 세팅) -------------------<br>

name = <%= request.getParameter("name") %> <br>
age = <%= request.getParameter("age") %> <br>

<%
// request에 속성으로 저장 - 처리된 데이터
request.setAttribute("title", "자바란??"); 
%><br>
------------------- 속성으로 저장해 놓은 데이터 --------------------<br>
title = <%= request.getAttribute("title") %><br>
title = ${title} - EL 객체 <br>



</body>
</html>