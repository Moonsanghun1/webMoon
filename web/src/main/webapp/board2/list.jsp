<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
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
	
	<tr onclick = "location = 'view.jsp?no=5&inc=1';" class = "dataRow">
		<td>5</td>
		<td>안녕</td>
		<td>문상훈</td>
		<td>2024-05-05</td>
		<td>505</td>
	</tr>
	
<!-- 	<tr onclick = "location = 'view.jsp?no=6&inc=1';" class = "dataRow"> -->
<!-- 		<td>6</td> -->
<!-- 		<td>누구세요</td> -->
<!-- 		<td>홍길동</td> -->
<!-- 		<td>2022-04-01</td> -->
<!-- 		<td>45</td> -->
<!-- 	</tr> -->
	
	<tr>
		<td colspan="5">
			<a href = "writeForm.jsp"><button>등록</button></a>
		</td>
	</tr>
</table>
</body>
</html>