<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cooke &amp; Session</title>
</head>
<body>
<h3>클라이언트로부터 얻어온 Cookie</h3>
<%
Cookie[] cookies = request.getCookies();
for(Cookie c : cookies){
	out.print(c.getName() + " : " +  c.getValue()+ "<br>");
}

String id = (String) session.getAttribute("id");
String pwd = (String) session.getAttribute("pwd");
Integer age = (Integer) session.getAttribute("age");
%>

id : <%= id %> <br>
pwd : <%= pwd %> <br>
age : <%= age %> <br>

<a href="03_removeCookies.jsp">쿠키 지우기</a>
</body>
</html>