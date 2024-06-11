<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

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

<title>Insert title here</title>
<script type="text/javascript">
	$(function() {
		//console.log("submiiiiit");
		$("#writeForm").submit(function() {
			alert("submit");
			if (lengthCheck("#title", "제목", 3, 20, 1))
				return false;
			if (lengthCheck("#writer", "작성자", 3, 20, 1))
				return false;
			if (lengthCheck("#content", "내용", 3, 20, 1))
				return false;
			if (lengthCheck("#pw", "비밀번호", 3, 20, 0))
				return false;
			if (lengthCheck("#pw2", "비밀번호 재확인", 3, 20, 0))
				return false;

			let pw = $("#pw").val();
			let pw2 = $("#pw2").val();
			if (pw != pw2) {
				$("#pw2,#pw").val("");
				return false;
			}
			return false;
		});
	});
</script>
</head>


<body>
	<div class="container">
		<h2>글 등록 페이지</h2>
		<form action="write.jsp" method="post" id="writeForm">
			<div class="form-group">
				<label for="title">제목</label> <input type="text"
					class="form-control" id="title" placeholder="제목을 입력해주세요.^^"
					name="title">
			</div>
			<div class="form-group">
				<label for="writer">작성자</label> <input type="text"
					class="form-control" id="writer" placeholder="제목을 입력해주세요.^^"
					name="writer">
			</div>
			<div class="form-group">
				<label for="content">내용</label>
				<textarea class="form-control" rows="7" id="content" name="content"
					placeholder="내용을 입력해주세요"></textarea>
			</div>
			<div class="form-group">
				<label for="pw">비밀번호</label> <input type="password"
					class="form-control" id="pw" placeholder="비밀번호 입력해주세요">
			</div>
			<div class="form-group">
				<label for="pw2">비밀번호 재확인</label> <input type="password"
					class="form-control" id="pw2" placeholder="비밀번호를 재입력해주세요.">
			</div>

			<button type="submit" class="btn btn-dark" id="writebtn">등록</button>
			<button type="reset" class="btn btn-light">다시입력</button>
			<button type="button" class="btn btn-link">취소</button>

		</form>
	</div>
</body>
</html>