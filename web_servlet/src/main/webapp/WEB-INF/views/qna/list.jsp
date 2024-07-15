<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="pageNav" tagdir="/WEB-INF/tags" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>질문답변 리스트</title>
</head>
<body>

<div class= "containter">
 	<h3>질문답변 리스트</h3>
 	<table class = "table">
 		<tr>
 			<th>번호</th>
 			<th>제목</th>
 			<th>작성자</th>
 			<th>작성일</th>
 		</tr>
 		<c:forEach items= "${list }" var = "vo">
 			<tr class ="dataRow">
 				<td class = "no">${vo.no }</td>
 				<td>
 				<c:if test="${vo.levNo != 0 }">
 					<c:forEach begin="1" end="${vo.levNo * 3 }">
						&nbsp;
					</c:forEach>
 					<i class="material-icons">subdirectory_arrow_right</i>
 				</c:if>
 				${vo.title }</td>
 				<td>${vo.name }</td>
 				<td>${vo.writeDate }</td>
 			</tr>
 		</c:forEach>
 		
 	</table>
 	<c:if test="${!empty login }">
 		<a href="questionForm.do?perPageNum=${pageObject.perPageNum }" class = "btn btn-primary">질문하기</a>
 	</c:if>
</div>
</body>
</html>