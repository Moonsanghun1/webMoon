<%@page import="com.web.board.vo.BoardVO"%>
<%@page import="com.web.board.service.BoardListService"%>
<%@page import="java.util.List"%>
<%@page import="com.web.util.exe.Execute"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일반게시판 리스트</title>
</head>
<body>
<table>
	<tr>
		<th colspan="5">
			<h1>일반게시판 리스트</h1>
		</th>
	</tr>
	
	<tr>
		<th>번호</th>
		<th>제목</th>
		<th>작성자</th>
		<th>작성일</th>
		<th>조회수</th>
	</tr>
	
	<c:forEach items="${list }" var="vo">
	<tr onclick = "location = 'view.jsp?no= ${vo.no}&inc=1';" class = "dataRow">
		<td>${vo.no}</td>
		<td>${vo.title}</td>
		<td>${vo.writer}</td>
		<td>${vo.writeDate}</td>
		<td>${vo.hit}</td>
	</tr>
	</c:forEach>
	
	<tr>
		<td colspan="5">
			<a href = "writeForm.jsp"><button>등록</button></a>
		</td>
	</tr>
</table>
</body>
</html>