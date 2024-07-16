<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>질문/답변 보기</title>
</head>
<body>
<div class = "container">
	<h3>질문/답변 보기</h3>
	<div class="card">
  <div class="card-header">
	<span class= "float-right">${vo.no}</span>	
	${vo.title }
</div>
  <div class="card-body"><pre>${vo.content }</pre></div>
  <div class="card-footer">
	<span class= "float-right">${vo.writeDate }</span>	
	${vo.name }
</div>
</div>
<c:if test="${!empty login && vo.id != login.id }">
<a href="answerForm.do?no=${vo.no }&perPageNum=${param.perPageNum}" class = "btn btn-primary">답변하기</a>
</c:if>
<a href="list.do?${pageObject.pageQuery}" class = "btn btn-info">리스트</a>
</div>
</body>
</html>