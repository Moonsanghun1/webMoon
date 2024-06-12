<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일반 게시판 리스트</title>
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
<style>

</style>
</head>
<body>
	<div class="container">
		<h3>글 보기</h3>
		<form action="list.jsp">
			<div class="row">
				<div class="col-md-7">
					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<select name="key" id="key" class="form-control">
							<option value="t">제목</option>
							<option value="c">내용</option>
							<option value="w">사용자</option>
							</select>
						
						</div>
						<input type="text" class="form-control" placeholder="검색">
						<div class="input-group-append">
							<button class = "btn btn-outline-primary">검색</button>
						</div>
					</div>
				</div>
				<div class="col-md-2"></div>
				<div class="col-md-3">
					<div class="input-group mb-3">
							<div class="input-group-prepend">
							<span class = "input-group-text">list/page</span>
							<select id = "perPageNum" name = "perPageNum" class="form-control">
								<option>10</option>
								<option>15</option>
								<option>20</option>
							</select>
							</div>
					</div>
				</div>
			</div>

		</form>
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
			<!-- 실제적인 데이터 표시 : 데이터가 있는 만큼 줄(tr)이 생긴다. -->
			<!-- JS로 글보기로 페이지 이동
		onclick : click 이벤트 핸들러 속성 -->
			<tr onclick="location='view.jsp';" class="dataRow">
				<!-- td : table data - 테이블 데이터 텍스트 -->
				<td>10</td>
				<td>자바란?</td>
				<td>홍길동</td>
				<td>2024.05.01</td>
				<td>15</td>
			</tr>
			<tr onclick="location='view.jsp';" class="dataRow">
				<td>9</td>
				<td>키오스크 과정</td>
				<td>관리자</td>
				<td>2024.04.20</td>
				<td>21</td>
			</tr>
			<tr>
				<td colspan="5">
					<!-- a tag : 데이터를 클릭하면 href의 정보를 가져와서 페이지 이동시킨다. --> <a
					href="writeForm.jsp"><button>등록</button></a>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>