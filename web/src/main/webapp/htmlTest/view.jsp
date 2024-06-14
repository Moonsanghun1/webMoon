<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>앨범 상세보기</title>

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
<script type="text/javascript" src="/js/boardInputUtil.js"></script>


    
<script type="text/javascript">
  function getCheckboxValue() {
    // 체크한 데이터를 담을 배열 선언
    const arr = [];
    // Name이 Color인 속성 취득
    const input_check = document.getElementsByName("input_check");
    // 취득한 속성 만큼 루프
    for (let i = 0; i < input_check.length; i++) {
      // 속성중에 체크 된 항목이 있을 경우
      if (input_check[i].checked == true) {
      	arr.push(input_check[i].value);
      }
    }
    // 결과를 표시
    document.getElementById("result").textContent = arr;
  }
  
  function selectAll(selectAll)  {
	  const checkboxes 
	     = document.querySelectorAll('input[type="checkbox"]');
	  
	  checkboxes.forEach((checkbox) => {
	    checkbox.checked = selectAll.checked
	  })
	}
</script>



</head>
<body>

	<div class="container mt-3">
		<h1>앨범 상세보기</h1>

	<!-- Media middle -->
	<div class="media mt-3">
			<img src="/img/2426.jpg" class="align-self-center mr-3"
				style="width: 300px">
			<div class="media-body">
				<h1>24:26</h1>
				<p>빈지노</p>
				<div>
					<dl>
						<dt>발매일</dt>
						<dd>2012년 7월 3일</dd>
						<dt>장르</dt>
						<dd>힙합</dd>
						<dt>가격</dt>
						<dd>10000원</dd>
					</dl>
				</div>
				<!-- 앨범 듣기, 구매 버튼 -->
				<a href="플레이리스트로" class="btn btn-info" role="button">앨범 듣기</a> 
				<a href="앨범 구매 장바구니로" class="btn btn-info" role="button">앨범 구매</a>
			</div>
		</div>
	</div>
	<!-- 앨범 수록곡 시작 -->
	<div class="container mt-3">
		<!-- 그리드를 사용하여 표의 크기를 줄임 -->
		<div class="col-md-8">
			<h2>수록곡</h2>
			<p>CheckData :<span id="result"></span></p>
			<div class="table-responsive">
				<table class="table table-bordered table-hover">
					
					<thead>
						<tr>
							<th>
								<!-- 체크박스 표시 -->
								<div class="wrap t_right">
									<input type="checkbox" title="CD전체 선택"
										class="input_check d_checkall"   onclick='selectAll(this)'  onclick="getCheckboxValue()"/>
								</div>
							</th>
							<th>#</th>
							<th>제목</th>
							<th>가수</th>
							<th>재생</th>
							<th>곡정보</th>


						</tr>
					</thead>
					
					<tbody>
						<tr>
							<td>
								<!-- 체크박스 표시 -->
								<div class="wrap t_right">
									<input type="checkbox" title="24:26 곡 선택" class="input_check"
										name="input_check" value="1"  onclick="getCheckboxValue()">
								</div>
							</td>
							<td>1</td>
							<td>Boogie On & On</td>
							<td>빈지노</td>
							<!-- 재생 버튼 -->
							<td><i class="fa fa-play-circle-o" style="font-size: 30px"
								onclick="location = '곡 재생';"></i></td>
							<!-- 곡정보 버튼 -->
							<td><i class="fa fa-info-circle" style="font-size: 30px"
								onclick="location = '곡 정보';"></i></td>
						</tr>

						<tr>
							<td>
								<div class="wrap t_right">
									<input type="checkbox" title="24:26 곡 선택" class="input_check "
										name="input_check" value="2" onclick="getCheckboxValue()">
								</div>
							</td>
							<td>2</td>
							<td>Nike Shoes (Feat. Dynamic Duo)</td>
							<td>빈지노, 개코, 최자</td>
							<!-- 재생 버튼 -->
							<td><i class="fa fa-play-circle-o" style="font-size: 30px"
								onclick="location = '곡 재생';"></i></td>
							<!-- 곡정보 버튼 -->
							<td><i class="fa fa-info-circle" style="font-size: 30px"
								onclick="location = '곡 정보';"></i></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<!-- 리스트로 돌아가는 버튼 -->
		<button type="button" class="btn btn-success cancelBtn float-right" onclick="location = 'list.jsp';">리스트</button>
	</div>
	<!-- 앨범 수록곡 끝 -->

	<!-- 앨범 정보의 시작 -->
	<div class="container mt-3">
		<h3>앨범 소개</h3>
		<p>모두가 기다려온 Beenzino의 첫 솔로 앨범 [ 2 4 : 2 6 ] <br>
			
			2009년 혜성처럼 나타나 실력을 인정
			받으며 단숨에 최고의 MC 대열에 선 Beenzino. 프로젝트 팀 Jazzyfact과 Hot Clip으로 꾸준히 좋은
			음악을 선보여 온 그의 솔로 앨범은 그 동안 힙합 팬들 모두가 기다려온 앨범이라고 해도 과언이 아닐 것이다. 이제 마침내
			그의 솔로 EP 앨범 [ 2 4 : 2 6 ]가 발매됐다. 그의 첫 솔로작 [ 2 4 : 2 6 ]에는 Beenzino 다운
			재기발랄함을 느낄 수 있는 트랙, "Nike Shoes", 'Aqua Man". 여름에 자주 듣게 될 법한 "Boogie
			On & On", "Summer Madness". 그리고 자신의 깊은 이야기를 담은 "I'll Be Back", "If I
			Die Tomorrow". 일리네어의 하드코어 트랙 "Profile" 등 다양한 느낌의 곡들이 수록되어 있다.</p>
	
	</div>
	<!-- 앨범 정보의 끝 -->
</body>
</html>