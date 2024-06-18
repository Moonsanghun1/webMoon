<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일반게시판 글 등록폼</title>
</head>
<body>
<form action="write.jsp" method = "post">
<table>
	<tr>
		<th colspan = "2">
			<h1>일반게시판 글 등록 형식</h1>
		</th> 
	</tr>
	
	<tr>
		<th>제목</th>
		<td><input id = "title" name = "title" required class = "textInput"
		maxlength="100" pattern="^[^ .].{2,99}"
		title = "맨앞에 공백문자 불가 3~100자 입력"
		placeholder=""></td>
	</tr>
	

	
	<tr>
		<th>내용</th>
		<td><textarea class = "textInput" rows="7" id = "content"name = "content" 
		placeholder = "첫글자는 공백문자나 줄바꿈을 입력할 수 없습니다." required>
		</textarea>
		</td>
	</tr>	
 	
 	<tr>
		<th>작성자</th>
		<td><input id = "writer" name = "writer" required class = "textInput"
		maxlength="100" pattern="^[a-zA-Z가-힣]{2,10}$"
		title="한글과 영어만 입력. 2~10자 이내"
		placeholder="이름은 영어와 한글만 가능"></td>
	</tr>
	
	<tr>
		<th>비밀번호</th>
		<td><input id = "pw" name = "pw" required class = "textInput"
		maxlength="20" pattern="^.{3,20}$"
		title="3~20자 입력 가능"
		placeholder="비밀번호를 입력하세요"></td>
	</tr>
	
	<tr>
		<th>비밀번호 확인</th>
		<td><input id = "pw1" name = "pw1" required class = "textInput"
		maxlength="20" pattern="^.{3,20}$"
		title="3~20자 입력 가능"
		placeholder="비밀번호를 입력하세요"></td>
	</tr>
	
	<tr>

		<td colspan = "2">
		<button type="submit">등록</button>
		<button type="reset">다시입력</button>
		<button type="button" onclick="history.back();">취소</button>
		
		</td>

	</tr>
</table>
</form>
</body>
</html>