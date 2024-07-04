<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일반 게시판 글쓰기 폼</title>
</head>
<body>
	<div class= "container">
		<form action="write.do" method="post">
			<div class="form-group">
				<label for="title">제목:</label> 
				<input type="text" class="form-control" id="title" name = "title">
			</div>
			<div class="form-group">
				<label for="content">내용:</label>
				<textarea class="form-control" rows="5" id="content" name = "content"></textarea>
			</div>
			<div class="form-group">
				<label for="writer">작성자:</label> 
				<input type="text" class="form-control" id="writer" name = "writer">
			</div>

			<div class="form-group">
				<label for="pw">비밀번호:</label> 
				<input type="password" class="form-control" id="pw" name = "pw">
			</div>
			<div class="form-group">
				<label for="pw2">비밀번호 확인:</label> 
				<input type="password" class="form-control" id="pw2">
			</div>
			<button class= "btn btn-info">등록</button>
		</form>
	</div>
</body>
</html>