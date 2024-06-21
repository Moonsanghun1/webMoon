<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일반게시판 글 상세보기</title>
</head>
<body>
<div class= "container"></div>
<h1>일반게시판 글 상세보기</h1>
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
		<th>조회수</th>
		<td>${vo.hit}</td>
	</tr>
	
	<tr>
		<th>내용</th>
		<td>${vo.content}</td>
	</tr>	
 	
 	<tr>
		<th>작성자</th>
		<td>${vo.writer}</td>
	</tr>
	
	<tr>
		<th>작성일</th>
		<td>${vo.writeDate}</td>
	</tr>
	
	<tr>
		<td colspan ="2">
			<a href = "updateForm.do?no=${param.no }" class= "btn btn-primary" >수정</a>
			<button class="btn btn-primary" data-toggle="modal" data-target="#myModal">삭제</button>
			<a href = "list.do" class= "btn btn-info">리스트</a>
		</td>
	</tr>
</table>

<!-- The Modal -->
  <div class="modal fade" id="myModal">
    <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content">
      	<form action="delete.do" method="post">
      	<input type="hidden" name = "no" value = ${param.no }>
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">글삭제 비밀번호 입력</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
         	<input type = "password" class ="form-control" placeholder="비밀번호 입력" name="pw" >
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
        	<button class = "btn btn-danger">삭제</button>
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        </div>
        </form>
      </div>
    </div>
  </div>
</body>
</html>