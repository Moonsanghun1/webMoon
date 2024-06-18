<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<p>
	시작은 first.jsp에서 부터 해야한다.
	처리를 다 한 후에 다른 브라우저에서 third.jsp를 실행해봐야 한다.
	</p>
	EL의 name = ${name} <br>
	pageContext의 name = ${pageScope.name} <br>
	request의 name = ${requestScope.name} <br>
	session의 name = ${sessionScope.name} <br>
	application의 name = ${applicationScope.name} <br>
	
	<p>
	

	
	</p>
</body>
</html>