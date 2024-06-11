<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일반 게시판 글보기</title>

<!-- 라이브러리 등록 -->
<!-- 라이브러리 필요하다. 웹 라이브러리(js 라이브러리)
	1. 다운로드 : jquery.com : 내 서버에 파일을 둔다.
	2. CDN(Content Delivery Network) - 배달 받는 방식 사용-->
<!-- Bootstrap(디자인의 표준화) : jquery(동작의 표준화) 포함. -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="/js/boardInputUtil.js"></script>

<style type="text/css">
#deleteDiv {
	display: none;
	margin: 10px 0;
}
</style>

<script type="text/javascript">
	$(function() { // 문서가 준비되면 실행

		//이벤트 처리
		
		// 메인 삭제 버튼 클릭
		$("#deleteBtn").click(function() {
			$(this).attr("disabled", true);
			$("#deleteDiv").show();
		});
		
		// deleteDiv의 삭제 버튼 처리
		$("#deleteForm").submit(function() {

			console.log("writeForm submit Event")
			if(isEmpty("#pw", "비밀번호", 0)) return false;
			// 길이 체크
			if(lengthCheck("#pw" , "비밀번호", 3, 20, 0)) return false;
		});
		// deleteDiv의 취소 버튼 처리
		$("#deleteCancelBtn").click(function() {
			console.log("writeForm 취소버튼 click Event")
			$("#pw").val("");
			$("#deleteDiv").hide();
			$("#deleteBtn").attr("disabled", false);
		});
	});
</script>

</head>
<body>
	<div class="container">


		<table class="table">
			<tr>
				<th>번호</th>
				<td>10</td>
			</tr>

			<tr>
				<th>작성일</th>
				<td>2024-01-12</td>
			</tr>

			<tr>
				<th>제목</th>
				<td>안녕하세요</td>
			</tr>

			<tr>
				<th>작성자</th>
				<td>문상훈</td>
			</tr>

			<tr>
				<th>내용</th>
				<td>반갑습니다 여러분</td>
			</tr>
			<tr>
				<th>조회수</th>
				<td>15</td>
			</tr>

			<tr>

				<td colspan='2'>
					<a href="updateForm.jsp"
					class="btn btn-primary">수정</a>
					<button class="btn btn-danger" id="deleteBtn">삭제</button> <a
					href="list.jsp" class="btn btn-success">리스트</a>
					<div id="deleteDiv">
						<form action="delete.jsp" method="post" id="deleteForm">
							<input type="hidden" name="no" value="10"> 
							<input
								name="pw" required pattern="^.{3,20}&" type="password"
								title="비밀번호는 3~20자로 작성하셔야 합니다." placeholder="본인 확인용 비밀번호 확인"
								maxlength="20">
							<button class="btn btn-danger">삭제</button>
							<button type="button" class="btn btn-success"
								id="deleteCancelBtn">취소</button>
						</form>
					</div>
				</td>
			</tr>

		</table>
		<!-- a tag : 데이터를 클릭하면 href의 정보를 가져와서 페이지 이동시킨다. -->
	</div>
</body>
</html>