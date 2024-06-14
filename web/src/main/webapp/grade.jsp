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
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
  
  <style type="text/css">
  div > i:hover{
  	cursor: pointer;
  }
  </style>

<script type="text/javascript">
	$(function() {
		//이벤트 처리
		// i 태그 손가락 올라간 것과 왼쪽은 검정색 - fa-star
		// 왼쪽은 흰색- fa-star-o  
		// class 조작 - addClass() / removeClass()
		$("div > i").click(function() {
			$("div > i").removeClass("fa-star fa-star-o");
			// 클릭한 것은 검은색
			$(this).addClass("fa-star")
			// 클릭한 것의 앞에 별도 검은색
			$(this).prevAll().addClass("fa-star");
			// 클릭한 것의 뒤에 별은 흰색으로 만든다
			$(this).nextAll().addClass("fa-star-o");
			let idx = $(this).index();
			alert(idx);
			let score = idx + 1;
			$("#scoreDiv").text(score);
		});
	});
</script>

</head>

<body>
	<div class="container">
		<h3>별점 주기</h3>
		<div>
			<i class="fa fa-star" style="font-size: 36px"></i>
			<i class="fa fa-star" style="font-size: 36px"></i>
			<i class="fa fa-star" style="font-size: 36px"></i>
			<i class="fa fa-star" style="font-size: 36px"></i>
			<i class="fa fa-star" style="font-size: 36px"></i>
			
		</div>
		fa fa-star : full / fa fa-star-o : empty
		<div id = "scoreDiv">
		5
		</div>
	</div>
</body>
</html>