<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- 라이브러리 등록 -->
<!-- 라이브러리 필요하다. 웹 라이브러리(js 라이브러리)
	1. 다운로드 : jquery.com : 내 서버에 파일을 둔다.
	2. CDN(Content Delivery Network) - 배달 받는 방식 사용-->
<!-- Bootstrap(디자인의 표준화) : jquery(동작의 표준화) 포함. -->
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
  
  <style type="text/css">
  .dataRow:hover{
  	background: #ddd;
  	cursor: pointer;
  }
  </style>
  
<script type="text/javascript">
$(function() {
	// 이벤트 처리
	$(".dataRow").click(function() {
		alert("click");
		// 글번호 찾기 - class = no 
		let no = $(this).find(".no").text();
		alert("no: " + no);
		// 글보기로 페이지 이동.
		location = "view.jsp?no=" + no + "&inc=1"; 
	});
});
</script>
  
</head>
<body>
<div class = "container">
	<h3>일반 게시판 리스트</h3>
	<!-- 데이터가 있는 만큼 리스트 만들기. -->
	<ul class="list-group">
		<!-- tag안에 data- ** 속성을 이용하여 데이터를 저장해 놓을 수 있다. 선택객체.data("no"); -->
 	 	<li class="list-group-item dataRow" data-no = "10">
 	 		<div style="padding-bottom: 3px; border-bottom: 1px dotted #888; margin-bottom: 3px;">
 	 			<span class="badge badge-secondary float-right">10</span>
 	 			<b><span class ="no">10</span>. 자바란?</b> 
 	 		</div>
 	 	
 	 	<span class= "float-right">2024.06.13</span>
 	 	<p>문상훈</p>
 	 	</li>		
 	 	
 	 	<li class="list-group-item dataRow" data-no = "9">
 	 		<div style="padding-bottom: 3px; border-bottom: 1px dotted #888; margin-bottom: 3px;">
 	 			<span class="badge badge-secondary float-right">54</span>
 	 			<b><span class ="no">9</span>. 키오스크 과정</b> 
 	 		</div>
 	 	
 	 	<span class= "float-right">2024.04.11</span>
 	 	<p>관리자</p>
 	 	</li>		
	</ul>
</div>
</body>
</html>