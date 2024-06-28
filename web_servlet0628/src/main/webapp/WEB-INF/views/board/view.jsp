<%@page import="com.web.board.vo.BoardVO"%>
<%@page import="com.web.util.exe.Execute"%>
<%@page import="com.web.board.service.BoardViewService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일반게시판 글 상세보기</title>
</head>
<body>
글번호 : ${param.no }, 조회수 증가 ${param.inc } <br>
<table>
	<tr>
		<th colspan = "2">
			<h1>일반게시판 글 상세보기</h1>
		</th> 
	</tr>
	
	<tr>
		<th>번호</th>
		<td>${vo.no }</td>
	</tr>
	
	<tr>
		<th>제목</th>
		<td>${vo.title }</td>
	</tr>
	
	<tr>
		<th>조회수</th>
		<td>${vo.hit }</td>
	</tr>
	
	<tr>
		<th>내용</th>
		<td>${vo.content }</td>
	</tr>	
 	
 	<tr>
		<th>작성자</th>
		<td>${vo.writer }</td>
	</tr>
	
	<tr>
		<th>작성일</th>
		<td>${vo.writeDate }</td>
	</tr>
	
	<tr>
		<td colspan ="2">
			<a href = "updateForm.do?no=${param.no }&page=${param.page }&perPageNum=${param.perPageNum}&key=${param.key}&word=${param.word}"><button>수정</button></a>
			<a href = "list.do?page=${param.page }&perPageNum=${param.perPageNum}&key=${param.key}&word=${param.word}"><button>리스트</button></a>
			<form action="delete.do?no=${param.no }&page=${param.page }&perPageNum=${param.perPageNum}&key=${param.key}&word=${param.word}" method = "post">
				<input type="hidden" name = "no" value = ${param.no }>
				<input name = "pw" required
				pattern="^.{3,20}$"
				title = "3~20자로 작성하셔야 합니다."
				placeholder = "본인 확인용 비밀번호 확인" maxlength="20">
				<button>삭제 진행</button>
			</form>
		</td>
	</tr>
</table>

</body>
</html>