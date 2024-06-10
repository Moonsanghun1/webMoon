<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일반 게시판 글보기</title>

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
<h1>일반 게시판 글보기</h1>

<table>
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
			
			<a href = "updateForm.jsp"><button>수정</button></a>
			<button>삭제</button>
			<a href = "list.jsp"><button>리스트</button></a>
			<form action="delete.jsp" method = "post">
				<input type="hidden" name="no" value="10">
				<input name="pw" required 
				pattern="^.{4,20}&" 
				title = "비밀번호는 4~20자로 작성하셔야 합니다."
				placeholder="본인 확인용 비밀번호 확인" maxlength="20">
				<button>삭제 진행</button>
			</form>
			</td>
		</tr>

</table>
<!-- a tag : 데이터를 클릭하면 href의 정보를 가져와서 페이지 이동시킨다. -->

</body>
</html>