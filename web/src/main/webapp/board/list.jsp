<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일반 게시판 리스트</title>
<style>
				

/* box속성의 객체를 가운데 정렬 시키기 - table */
table {
	/* table에 여백주기 - 데이터를 반복적으로 사용 : 맨위에서 부터 시계방향으로(상우하좌)
					   길이나 크기를 지정할 때 0이 아니면 단위를 꼭 써야합니다. (px, pt, cm, mm, m, inch, em...)*/
	margin: 0 auto;
	width: 800px;
}

th, td {
	/* boarder-with : 1px; boarder-type : solid; boarder-coler : #888
	 	- 데이터 특성에 따라서 항목에 찾아 들어간다.
	 	-색상 : #888
	 		-색상 이름 : red,blue, black, white ...
	 		- RGB : 16진수 #FFFFFF - #RGB : R - 0~FF : 256 등급으로 나눔
	 					  #FFF - #RGB : R - 0~F : 16등급으로 나눔
		- 선 타입 : solid - 실선
				  dotted - 점선
				  dashed - 긴 점선
				  double - 이중선*/
	border: 1px solid #888; /* 테두리 */
	padding: 5px; /* 테두리와 데이터의 공백 */
}

th {
	background: black /* 배경색 - #000 */;
	color: white /* 글자색 - #fff */;
}

.dataRow:hover {
	background: #444;
	cursor: pointer;
}

button:hover {
	cursor: pointer;
}
</style>
</head>
<body>
	<table>
		<!-- tr : table row - 테이블 한줄 -->
		<tr>
			<!-- th : table head - 테이블 제목 텍스트 -->
			<th colspan="5">
				<h1>일반 게시판 리스트</h1>
				
			</th>
		</tr>
		<!-- 게시판 데이터의 제목 -->
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>조회수</th>
		</tr>
		<!-- 실질적인 데이터 표시 : 데이터가 있는 만큼 줄(tr)이 생긴다.  -->
		<!-- JS로 글보기로 페이지 이동 
 			onclick : click 이벤트 핸들러 태그 안에 속성 : 마우스가 위에 올라와 있다는건 on 그리고 누르는건 click-->
		<tr onclick="location = 'view.jsp';" class="dataRow">
			<!-- td : table data - 테이블 데이터 텍스트 -->
			<td>10</td>
			<td>자바란?</td>
			<td>홍길동</td>
			<td>2024-05-01</td>
			<td>3</td>
		</tr>

		<tr onclick="location = 'view.jsp';" class="dataRow">
			<td>9</td>
			<td>키오스크 과정</td>
			<td>관리자</td>
			<td>2024-04-20</td>
			<td>21</td>
		</tr>

		<tr>
			<td colspan='5'>
				<!-- a tag : 데이터를 클릭하면 href의 정보를 가져와서 페이지 이동시킨다.  --> 
				<a href="writeForm.jsp"><button>등록</button></a>
			</td>
		</tr>

	</table>
</body>
</html>