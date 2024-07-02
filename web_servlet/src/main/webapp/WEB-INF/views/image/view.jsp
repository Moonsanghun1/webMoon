<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이미지 보기</title>
</head>
<body>
<div class= "container">
<h1>이미지 보기</h1>

<table class = "table">
	<tr>
		<th>번호</th>
		<td> ${vo.no}</td>
	</tr>
	
	<tr>
		<th>제목</th>
		<td>${vo.title}</td>
	</tr>
	
	<tr>
		<th>사진</th>
		<td> <img alt="사진" src="${vo.fileName}"></td>
	</tr>
	
	<tr>
		<th>내용</th>
		<td><pre>${vo.content}</pre></td>
	</tr>	
 	
 	<tr>
		<th>작성자</th>
		<td>${vo.id}</td>
	</tr>
	
	<tr>
		<th>작성일</th>
		<td>${vo.writeDate}</td>
	</tr>
	
	<tr>
		<td colspan ="2">
			<a href = "updateForm.do?no=${param.no }&page=${param.page }&perPageNum=${param.perPageNum}&key=${param.key}&word=${param.word}" class= "btn btn-primary" >수정</a>
			<button class="btn btn-primary" data-toggle="modal" data-target="#myModal">삭제</button>
			<a href = "list.do?page=${param.page }&perPageNum=${param.perPageNum}&key=${param.key}&word=${param.word}" class= "btn btn-info">리스트</a>
		</td>
	</tr>
</table>
</div>
</body>
</html>