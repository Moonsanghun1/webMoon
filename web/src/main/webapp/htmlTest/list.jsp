<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>앨범 리스트</title>

<!-- 라이브러리 등록 -->
<!-- 라이브러리 필요하다. 웹 라이브러리(js 라이브러리)
	1. 다운로드 : jquery.com : 내 서버에 파일을 둔다.
	2. CDN(Content Delivery Network) - 배달 받는 방식 사용-->
<!-- Bootstrap(디자인의 표준화) : jquery(동작의 표준화) 포함. -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
	
<!-- 곡이름에 마우스를 가져다대면 커서가 생기도록 만든다. -->	
<style type="text/css">
#rcName{
cursor: pointer;
}	
</style>
</head>

<body>
	<div class="container">
		<h1>앨범 리스트</h1>
		<div class="row">
			<div class="col-md-4">
				<div class="card" style="width: 75%">
					<a href="view.jsp">
					<img class="card-img-top" src="/img/NewJeans.jpg" alt="NewJeans"
						style="width: 100%"></a>
					<div class="card-body">
						<h4 class="card-title" onClick="location.href='view.jsp'" id = "rcName">New Jeans</h4>
						<p class="card-text">뉴진스</p>
						<p class="card-text">2022년 8월 1일</p>
						<a href="플레이리스트로" class="btn btn-primary">앨범 듣기</a>
					</div>
				</div>

			</div>
			<div class="col-md-4">
				<div class="card" style="width: 75%">
				<a href="view.jsp">
					<img class="card-img-top" src="/img/2426.jpg" alt="24:26"
						style="width: 100%"></a>
					<div class="card-body">
						<h4 class="card-title" onClick="location.href='view.jsp'" id = "rcName">24:26</h4>
						<p class="card-text">빈지노</p>
						<p class="card-text">2012년 7월 3일</p>
						<a href="플레이리스트로" class="btn btn-primary">앨범 듣기</a>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card" style="width: 75%">
				<a href="view.jsp">
					<img class="card-img-top" src="/img/Exhibition.jpg"
						alt="Exhibition" style="width: 100%"></a>
					<div class="card-body">
						<h4 class="card-title" onClick="location.href='view.jsp'" id = "rcName">Exhibition</h4>
						<p class="card-text">전람회</p>
						<p class="card-text">1994년 5월 1일</p>
						<a href="플레이리스트로" class="btn btn-primary">앨범 듣기</a>
					</div>
				</div>
			</div>
		</div><!-- 앨범 1번째 줄의 끝 -->
		
		
		<!-- 앨범 리스트 페이지네이션 , 앨범 등록-->
		<nav aria-label="Page navigation example" style="margin-top : 20px">
			<!-- 앨범 등록 버튼 -->
			<a href="writeForm.jsp" class="btn btn-info" role="button">앨범 등록</a>
			<!-- 앨범 리스트 페이지네이션-->
			<ul class="pagination float-right">
				<li class="page-item"><a class="page-link" href="#">Previous</a></li>
				<li class="page-item"><a class="page-link" href="#">1</a></li>
				<li class="page-item"><a class="page-link" href="#">2</a></li>
				<li class="page-item"><a class="page-link" href="#">3</a></li>
				<li class="page-item"><a class="page-link" href="#">Next</a></li>
			</ul>
		</nav>

	</div>
</body>
</html>