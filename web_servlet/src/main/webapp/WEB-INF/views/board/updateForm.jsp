<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>일반게시판 글수정 폼</title>
</head>
<body>
<div class = "container">
<form action="update.do" method = "post">
			<input type = "hidden" name = "page" value = "${param.page }">
			<input type = "hidden" name = "perPageNum" value = "${param.perPageNum }">
			<input type = "hidden" name = "key" value = "${param.key }">
			<input type = "hidden" name = "word" value = "${param.word }">
			<h1>일반게시판 글 수정 형식</h1>
	<table class = "table">
	
	
	<tr>
			<th >번호</th>
			<td>
			<input id = "no" name = "no" readonly value = "${vo.no}" class = "form-control"></td>
		</tr>
	
	<tr>
		<th>제목</th>
		<td><input id = "title" name = "title" required class = "form-control"
		maxlength="100" pattern="^[^ .].{2,99}" 
		title = "맨앞에 공백문자 불가 3~100자 입력" value = "${vo.title}"
		placeholder=""></td>
	</tr>
	

	
	<tr>
		<th>내용</th>
		<td><textarea class = "form-control" rows="7" id = "content"name = "content" 
		placeholder = "첫글자는 공백문자나 줄바꿈을 입력할 수 없습니다." 
		required> ${vo.content}</textarea>
		</td>
	</tr>	
 	
 	<tr>
		<th>작성자</th>
		<td><input id = "writer" name = "writer" required class = "form-control"
		maxlength="100" pattern="^[a-zA-Z가-힣]{2,10}$"
		title="한글과 영어만 입력. 2~10자 이내" value = "${vo.writer}"
		placeholder="이름은 영어와 한글만 가능"></td>
	</tr>
	
	<tr>
		<th>비밀번호</th>
		<td><input id = "pw" name = "pw" required class = "form-control"
		maxlength="20" pattern="^.{3,20}$"
		title="3~20자 입력 가능"
		placeholder="비밀번호를 입력하세요"></td>
	</tr>
	
	<tr>
		<th>비밀번호 확인</th>
		<td><input id = "pw1" name = "pw1" required class = "form-control"
		maxlength="20" pattern="^.{3,20}$"
		title="3~20자 입력 가능"
		placeholder="비밀번호를 입력하세요"></td>
	</tr>
	
	<tr>

		<td colspan = "2">
		<button class = "btn btn-primary">수정</button>
		<button type="reset" class = "btn btn-info">다시입력</button>
		<button type="button" onclick="history.back();" class = "btn btn-warning">취소</button>
		
		</td>

	</tr>
</table>
</form>
</div>
</body>
</html>