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
<c:set var = "now" value = "<%=new java.util.Date() %>"></c:set>
<!-- pre - 줄바꿈이나 공백같은 특수 문자를 그대로 표시한다. 글 내용을 표시할 때 보통 사용한다. -->
<pre>

톰캣 서버의 기본 로케일 : <%= response.getLocale() %>

<fmt:setLocale value="ko_kr"/>
로케일을 한국어로 설정 후 로케일 확인 : <%= response.getLocale() %>
통화(currency) : <fmt:formatNumber value = "10000" type = "currency"></fmt:formatNumber>
날짜 :  <fmt:formatDate value="${now }"/>

<fmt:setLocale value="ja_JP"/>
로케일을 한국어로 설정 후 로케일 확인 : <%= response.getLocale() %>
통화(currency) : <fmt:formatNumber value = "10000" type = "currency"/>
날짜 :  <fmt:formatDate value="${now }"/>

<fmt:setLocale value="en_US"/>
로케일을 한국어로 설정 후 로케일 확인 : <%= response.getLocale() %>
통화(currency) : <fmt:formatNumber value = "10000" type = "currency"></fmt:formatNumber>
날짜 :  <fmt:formatDate value="${now }"/>

<fmt:setLocale value="ko_kr"/>
숫자 표시(패턴 -000,000.000 - 0은 0으로 자리 채움) : <fmt:formatNumber value = "12345.67" pattern="000,000.000"/>
숫자 표시(패턴 -000,000.0 - 소수점은 반올림) : <fmt:formatNumber value = "12345.67" pattern="000,000.0"/>
숫자 표시(패턴 -###,000.0 - #은 의미없는 0은 표시 안함.) : <fmt:formatNumber value = "12345.67" pattern="000,000.0"/>


</pre>
</body>
</html>