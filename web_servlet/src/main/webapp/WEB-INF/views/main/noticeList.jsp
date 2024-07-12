<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="pageNav"  tagdir="/WEB-INF/tags"%>
    


<h3>공지사항 게시판 리스트</h3>

<table class = "table">
	<tr>
		<th>번호</th>
		<th>제목</th>

	</tr>
	
	<c:forEach items="${noticeList }" var="vo">
	<tr class = "dataRow notice noticeLink">
		<td class = "no">${vo.no}</td>
		<td>${vo.title}</td>

	</tr>
	</c:forEach>
</table>
	
	