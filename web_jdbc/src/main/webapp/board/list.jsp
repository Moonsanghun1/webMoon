<%@page import="com.web.board.vo.BoardVO"%>
<%@page import="com.web.board.service.BoardListService"%>
<%@page import="java.util.List"%>
<%@page import="com.web.util.exe.Execute"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	List<BoardVO> list = (List<BoardVO>)Execute.execute(new BoardListService(), null);
%>    
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
	<% for(BoardVO vo : list){ %>
	<tr onclick = "location = 'view.jsp?no=<%= vo.getNo() %>&inc=1';" class = "dataRow">
		<td><%= vo.getNo() %></td>
		<td><%= vo.getTitle() %></td>
		<td><%= vo.getWriter() %></td>
		<td><%= vo.getWriteDate() %></td>
		<td><%= vo.getHit() %></td>
	</tr>
	
	<% } %>
	<tr>
		<td colspan="5">
			<a href = "writeForm.jsp"><button>등록</button></a>
		</td>
	</tr>
</table>
</body>
</html>