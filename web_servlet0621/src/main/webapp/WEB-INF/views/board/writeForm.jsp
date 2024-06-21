<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일반게시판 글 등록폼</title>
</head>
<body>
<div class= "container" >
<h1>일반게시판 글 등록 형식</h1>
<form action="write.do" method = "post">
<table class= "table">
	<tr>
		<th colspan = "2">
		</th> 
	</tr>
	
	<tr>
		<th>제목</th>
		<td><input id = "title" name = "title" required class = "form-control"
		maxlength="100" pattern="^[^ .].{2,99}" title = "맨앞에 공백문자 불가 3~100자 입력"
		placeholder="제목 입력"></td>
	</tr>
	

	
	<tr>
		<th>내용</th>
		<td><textarea class = "form-control" rows="7" id = "content"name = "content" 
		placeholder = "첫글자는 공백문자나 줄바꿈을 입력할 수 없습니다." required></textarea>
		</td>
	</tr>	
 	
 	<tr>
		<th>작성자</th>
		<td><input id = "writer" name = "writer" required class = "form-control"
		maxlength="100" pattern="^[a-zA-Z가-힣]{2,10}$"
		title="한글과 영어만 입력. 2~10자 이내"
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
		<td><input id = "pw1" name = "pw1" required class = "texform-controltInput"
		maxlength="20" pattern="^.{3,20}$"
		title="3~20자 입력 가능"
		placeholder="비밀번호를 입력하세요"></td>
	</tr>
	
	<tr>

		<td colspan = "2">
		<button type="submit" class= "btn btn-primary">등록</button>
		<button type="reset" class= "btn btn-info">다시입력</button>
		<button type="button" class= "btn btn-secondary" onclick="history.back();">취소</button>
		
		</td>

	</tr>
	
</table>
</form>
</div>
</body>
</html>