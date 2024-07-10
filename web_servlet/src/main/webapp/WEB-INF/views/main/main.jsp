<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main</title>
<link rel="stylesheet" href="/css/main.css">
<script type="text/javascript" src="/js/main.js"></script>
</head>
<body>
<div class= "container">
	<h2>웹 닷컴</h2>
	<div class="row">
  		<div class="col-md-12 module">
			<jsp:include page="boardList.jsp"/>
		</div>
  	</div>	
  	<div class="row">
  		<div class="col-md-12 module">
		<jsp:include page="imageList.jsp"/>
		</div>
	</div>
  	
 
</div>
</body>
</html>