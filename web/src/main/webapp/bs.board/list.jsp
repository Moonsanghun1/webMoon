<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 라이브러리 등록 -->
<!-- 라이브러리 필요하다. 웹 라이브러리(js 라이브러리)
	1. 다운로드 : jquery.com : 내 서버에 파일을 둔다.
	2. CDN(Content Delivery Network) - 배달 받는 방식 사용-->
<!-- Bootstrap(디자인의 표준화) : jquery(동작의 표준화) 포함. -->
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
  <script type="text/javascript" src="/js/boardInputUtil.js"></script>
	<script type="text/javascript">
	
	$(function(){
		
	//2. jquery 적용확인
	console.log("jquery loading");
		
	});
	
	</script>
<title>일반 게시판 리스트</title>
<style>

.dataRow:hover {
	background: #444;
	cursor: pointer;
}

button:hover {
	cursor: pointer;
}
</style>
</head>
<body>
<div class = "container">
	<h1>일반 게시판 리스트</h1>
	<table class="table">
		<!-- tr : table row - 테이블 한줄 -->
		
		<!-- 게시판 데이터의 제목 -->
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>조회수</th>
		</tr>
		<!-- 실질적인 데이터 표시 : 데이터가 있는 만큼 줄(tr)이 생긴다.  -->
		<!-- JS로 글보기로 페이지 이동 
 			onclick : click 이벤트 핸들러 태그 안에 속성 : 마우스가 위에 올라와 있다는건 on 그리고 누르는건 click-->
		<tr onclick="location = 'view.jsp';" class="dataRow">
			<!-- td : table data - 테이블 데이터 텍스트 -->
			<td>10</td>
			<td>자바란?</td>
			<td>홍길동</td>
			<td>2024-05-01</td>
			<td>3</td>
		</tr>

		<tr onclick="location = 'view.jsp';" class="dataRow">
			<td>9</td>
			<td>키오스크 과정</td>
			<td>관리자</td>
			<td>2024-04-20</td>
			<td>21</td>
		</tr>

		<tr>
			<td colspan='5'>
				<!-- a tag : 데이터를 클릭하면 href의 정보를 가져와서 페이지 이동시킨다.  --> 
				<a href="writeForm.jsp" class="btn btn-primary">등록</a>
			</td>
		</tr>

	</table>
	</div>
</body>
</html>