<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일반 게시판 글 등록 폼</title>

<style type="text/css"> 
table {
	/* table에 여백주기 - 데이터를 반복적으로 사용 : 맨위에서 부터 시계방향으로(상우하좌)
					   길이나 크기를 지정할 때 0이 아니면 단위를 꼭 써야합니다. (px, pt, cm, mm, m, inch, em...)*/
	margin: 0 auto;
	width: 1000px;
}

th,td {
	border: 1px solid #888; /* 테두리 */
	padding: 5px; /* 테두리와 데이터의 공백 */
}

th {
	background: black; /* 배경색 - #000 */;
	color: white; /* 글자색 - #fff */;
}
input,select, textarea, button {
	padding: 5px;
}
.textInput{
	width: 98%;
}
input:focus select:focus textarea:focus{
	background: white;
}
input, select, textarea{
	background: #ccc;
}
</style>

</head>
<body>
<!-- get 방식 : 주소 뒤에 문자열로 붙여서 데이터 넘기기 -->
<!-- post 방식 : 데이터 넘기는 부분에 포함시켜서 넘기기 -->
<form action="write.jsp" method="post">
<table>
		<tr>
			<!-- th : table head - 테이블 제목 텍스트 -->
			<th colspan="2">
				<h1>일반 게시판 글등록 폼</h1>
			</th>
		</tr>
		
		<tr>
			<th >제목</th>
			<td><input id = "title" name = "title" required class = "textInput"
			maxlength = "100" pattern="^[^ .].{2,99}$"
			title="맨앞에 공백문자 불가 3~100자 입력"
			placeholder="제목 입력: 3자 이상 100자 이내"
			></td>
		</tr>
		
		<tr>
			<th>내용</th>
			<td><textarea class = "textInput" rows="7" id= "content" name = "content" placeholder = "첫글자는 공백문자나 줄바꿈을 입력할 수 없습니다." required></textarea></td>
		</tr>
		
		<tr>
			<th>작성자</th>
			<td><input id = "writer" name = "writer" maxlength="10" required class = "textInput"
			pattern="^[a-zA-Z가-힣]{2,10}$"
			title="한글과 영어만 입력. 2~10자 이내"
			placeholder="이름은 영어와 한글만 가능"
			></td>
		</tr>
		
		<tr>
			<th>비밀번호</th>
			<td><input type="password" id = "pw" name = "pw" maxlength="20" required class = "textInput"
			pattern="^.{3,20}$"
			title="3~20자 입력 가능"
			placeholder="비밀번호를 입력하세요"
			></td>
		</tr>	
		
		<tr>
			<th>비밀번호 확인</th>
		
			<td><input type="password" id = "pw2" name = "pw2" 
			maxlength="20" required class = "textInput"
			pattern="^.{3,20}$"
			title="3~20자 입력 가능"
			placeholder="비밀번호를 확인하세요"
			></td>
		</tr>		
		
		<tr>
			<td colspan='2'>
			<button type = "submit">등록</button>
			<button type = "reset">다시입력</button>
			<button type = "button" onclick="history">취소</button>
			</td>
			
		</tr>

</table>
</form>
</body>
</html>