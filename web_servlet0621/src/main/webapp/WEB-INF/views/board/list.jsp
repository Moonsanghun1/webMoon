<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일반게시판 리스트</title>

<style type="text/css">
.dataRow:hover{
cursor: pointer;
}
</style>
<script type="text/javascript">
$(function() {
	// 이벤트 처리
	$(".dataRow").click(function() {
// 		alert("click");
// 		글번호 필요 - 수집
		let no = $(this).find(".no").text();
		console.log("no = " + no );
		location="view.do?no=" + no + "&inc=1";
	});
	
});
</script>
</head>
<body>
<div class = "container">
	<h1>일반 게시판 리스트</h1>
<table class = "table">
	<tr>
		<th>번호</th>
		<th>제목</th>
		<th>작성자</th>
		<th>작성일</th>
		<th>조회수</th>
	</tr>
	
	<c:forEach items="${list }" var="vo">
	<tr class = "dataRow">
		<td class = "no">${vo.no}</td>
		<td>${vo.title}</td>
		<td>${vo.writer}</td>
		<td>${vo.writeDate}</td>
		<td>${vo.hit}</td>
	</tr>
	</c:forEach>
	
	<tr>
		<td colspan="5">
			<a href = "writeForm.do"><button>등록</button></a>
		</td>
	</tr>
</table>
</div>
</body>
</html>