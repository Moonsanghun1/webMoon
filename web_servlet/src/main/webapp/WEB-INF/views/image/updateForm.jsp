<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>일반게시판 글수정 폼</title>
</head>
<body>
<div class = "container">
	<h1>일반게시판 글 수정 형식</h1>
	<div class="alert alert-danger">
   	 	이미지를 제외한 나머지 텍스트 데이터 수정
  	</div>
	<form action="update.do" method = "post">
			<input type = "hidden" name = "page" value = "${param.page }">
			<input type = "hidden" name = "perPageNum" value = "${param.perPageNum }">
			<input type = "hidden" name = "key" value = "${param.key }">
			<input type = "hidden" name = "word" value = "${param.word }">

	 
	 <div class="form-group">
   		<label for="no">번호</label>
    	<input id = "no" name = "no" required class = "form-control" value = "${vo.no }" readonly="readonly">
  	</div>
	 <div class="form-group">
   		<label for="title">제목</label>
    	<input id = "title" name = "title" required class = "form-control"
		maxlength="100" pattern="^[^ .].{2,99}" title = "맨앞에 공백문자 불가 3~100자 입력" value="${vo.title }"
		placeholder="제목 입력">
  	</div>
  	
	 <div class="form-group">
   		<label for="content">내용</label>
    	<textarea class = "form-control" rows="7" id = "content"name = "content" 
		placeholder = "첫글자는 공백문자나 줄바꿈을 입력할 수 없습니다." required>${vo.content }</textarea>
  	</div>

  	
		<button class = "btn btn-primary">수정</button>
		<button type="reset" class = "btn btn-info">다시입력</button>
		<button type="button" onclick="history.back();" class = "btn btn-warning">취소</button>
</form>
</div>
</body>
</html>