<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일반 게시판 글 등록 폼</title>

<!-- 라이브러리 등록 -->
<!-- 라이브러리 필요하다. 웹 라이브러리(js 라이브러리)
	1. 다운로드 : jquery.com : 내 서버에 파일을 둔다.
	2. CDN(Content Delivery Network) - 배달 받는 방식 사용-->
<!-- Bootstrap(디자인의 표준화) : jquery(동작의 표준화) 포함. -->
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
  
<script type="text/javascript">
	$(function() {

		//2. jquery 적용확인
		console.log("jquery loading");

	});
</script>
<title>이미지 리스트</title>
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
	<div class="container">
		<h2>이미지 리스트</h2>
		<form action="list.jsp">
			<div class="row">
				<div class="col-md-8">
					<div class="input-group mb-3">
						<div class="input-group-prepend">

							<select name="key" id="key" class="form-control">
								<option value="t">제목</option>
								<option value="c">내용</option>
								<option value="w">작성자</option>
								<option value="tc">제목/내용</option>
								<option value="tw">제목/작성자</option>
								<option value="cw">내용/작성자</option>
								<option value="tcw">모두</option>
							</select>

						</div>
						<input type="text" class="form-control" placeholder="검색" id="word"
							name="word">
						<div class="input-group-append">
							<button class="btn btn-outline-primary">
								<i class="fa fa-search"></i>
							</button>
						</div>
					</div>
				</div>
				<!-- col-md-8의 끝 : 검색 -->
				<div class="col-md-4">
					<!-- 너비를 조정하여 오른쪽으로 정렬하기 위한 div. class = "float-right" : 오른쪽 정렬(CSS) -->
					<div style="width: 175px;" class="float-right">
						<div class="input-group mb-3">
							<div class="input-group-prepend">
								<span class="input-group-text">Rows/Page</span>


							</div>
							<select id="perPageNum" name="perPageNum" class="form-control">
								<option>10</option>
								<option>15</option>
								<option>20</option>
								<option>25</option>
							</select>
						</div>
					</div>
				</div>
				<!-- col-md-4의 끝 : 한 페이지당 표시 데이터 개수 -->
			</div>
		</form>
		<!-- 이미지 리스트를 보여 주는 부분 시작 : BootStrap -->
		<div class="row">
			<div class="col-md-4">
				<div class="card" style="width: 100%">
					<img class="card-img-top" src="/img/cat01.jpg" alt="Card image">
					<div class="card-body">
						<h4 class="card-title">때껄룩</h4>
						<p class="card-text">take a look</p>
					</div>
				</div>
				<!-- 이미지 카드의 끝 -->
			</div>
			<!-- col-md-4의 끝 -->
			<div class="col-md-4">
				<div class="card" style="width: 100%">
					<img class="card-img-top" src="/img/cat02.jpg" alt="Card image">
					<div class="card-body">
						<h4 class="card-title">때껄룩</h4>
						<p class="card-text">take a look</p>
					</div>
				</div>
				<!-- 이미지 카드의 끝 -->
			</div>
			<!-- col-md-4의 끝 -->
			<div class="col-md-4">
				<div class="card" style="width: 100%">
					<img class="card-img-top" src="/img/cat03.jpg" alt="Card image">
					<div class="card-body">
						<h4 class="card-title">때껄룩</h4>
						<p class="card-text">take a look</p>
					</div>
				</div>
				<!-- 이미지 카드의 끝 -->
			</div>
			<!-- col-md-4의 끝 -->
		</div>
		<!-- end of row -->

	</div>
</body>
</html>