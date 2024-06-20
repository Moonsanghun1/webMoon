<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL과 JSTL</title>
</head>
<body>
<jsp:useBean id="now" class = "java.util.Date"></jsp:useBean>

${now } <br>
<fmt:formatDate value="${now }"/> <br>
date : <fmt:formatDate value="${now }" type="date" /><br>
time : <fmt:formatDate value="${now }" type="time" /><br>
both : <fmt:formatDate value="${now }" type="both" /><br>
<!--  
	yyyy : 년도, 
	yy : 년도 -> 2자리 
	MM : 월 -> 2자리 채우기 6->06 
	M : 0은 표시하지 않는다. 
	h : 12시간 
	H : 24시간  -->
pattern "yyyy년 MM월 dd일 hh시 mm분 ss초" : <fmt:formatDate value="${now }" type="both" pattern = "yyyy년 MM월 dd일 hh시 mm분 ss초"/><br>
pattern "yyy년 M월 d일 h시 m분 s초" : <fmt:formatDate value="${now }" type="both" pattern = "yyy년 M월 d일 h시 m분 s초"/><br>




<pre>
default : <c:out value = "${now }"></c:out> <br>
korea KST : <fmt:formatDate value="${now }" type="both" dateStyle="full" timeStyle="full" timeZone="full"></fmt:formatDate>
<fmt:timeZone value="GMT">
swiss GMT : <fmt:formatDate value="${now }" type="both" dateStyle="full" timeStyle="full" timeZone="full"></fmt:formatDate>
</fmt:timeZone>
<fmt:timeZone value="GMT-8">
NewYork GMT-8 : <fmt:formatDate value="${now }" type="both" dateStyle="full" timeStyle="full" timeZone="full"/>
</fmt:timeZone>
</pre>
</body>
</html>