<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL과 JSTL</title>
</head>
<body>

<%
String[] movieList = {"타이타닉", "시네마천국", "혹성탈출", "킹콩"};
pageContext.setAttribute("movieList" , movieList);
%>
<!-- pageContext에 있는 movieList에 있는 데이터를 하나씩 꺼내서 pageContext의 movie에 저장한다.  -->
<!-- begin : 반복의 시작, end : 반복의 끝 -> list와 함께 인덱스 번호로 사용도 된다. -->
<!-- varStatus : 반복 변수 상태 - vs.index, vs.count, vs.first, vs.last -->
<c:forEach var = "movie" items = "${movieList }"  begin="0" end="1" varStatus="vs">
index =  ${vs.index }, count = ${vs.count }, movieName = ${movie } <br>
</c:forEach>
<c:forEach begin = "1" end = "10" var = "cnt">${cnt}. data<br></c:forEach>
</body>
</html>