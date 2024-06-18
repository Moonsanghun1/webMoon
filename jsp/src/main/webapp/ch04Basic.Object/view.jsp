<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
 request.setAttribute("name", "lee");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일반 게시판 글보기</title>
</head>
<body>
<h1>일반 게시판 글보기</h1>
일반 게시판 글보기에서 확인 : ${name} <br>
<!-- 댓글 -->
<div>
	<!-- include 디렉티브 태그 : 복사, 
	jsp include 액션 태그: 메소드 호출, 맨위에 디렉티브 태그도 지워야한다,-->
<%-- 	<%@ inclued file = "reply.jspf" %> --%>
	<jsp:include page= "reply.jspf"/>
	<!-- 필요한 모달 창 넣기. -->
	<jsp:include page= "deleteModal.jsp"/>
</div>
</body>
</html>