<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class= "container">
 	<table class = "table">
 		<tr>
 			<th>번호</th>
 			<td class="no" >${vo.no }</td>
 		</tr>	
 		<tr>
 			<th>제목</th>
 			<td>${vo.title }</td>
 		</tr>	
 		<tr>
 			<th>내용</th>
 			<td><pre>${vo.content }</pre></td>
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
 			<th>조회수</th>
 			<td>${vo.hit }</td>
 		</tr>	
 	</table>
 	<a class="btn btn-primary" href="updateForm.do?no=${vo.no }">수정</a>
 	<a class="btn btn-danger" data-toggle="modal" data-target="#myModal">삭제</a>
</div>
<!-- The Modal -->
<div class="modal" id="myModal">
  <div class="modal-dialog">
    <div class="modal-content">
	<form action="delete.do?no=${param.no }">
		<input type="hidden" name = "no" value ="${param.no }">
      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">글 삭제</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <!-- Modal body -->
			<div class="modal-body">
				<div class="form-group">
					<label for="pwd">Password:</label> 
					<input type="password" class="form-control" id="pw" name = "pw">
				</div>
			</div>

			<!-- Modal footer -->
      <div class="modal-footer">
        <button type="submit" class="btn btn-danger" >삭제</button>
        <button type="button"  class="btn btn-info" data-dismiss="modal" >Close</button>
      </div>
	 </form>
    </div>
  </div>
</div>
</body>
</html>