<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>response</title>
</head>
<body>
<%
System.out.println("response.jsp-------------");
// 여기는 자바입니다.
response.sendRedirect("response_target.jsp");
%>
test - 이거 안찍힘.
</body>
</html>