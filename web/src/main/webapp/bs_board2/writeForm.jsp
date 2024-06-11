<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- jquery 라이브러리 사용 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
 <script type="text/javascript" src ="/js/boardInputUtil.js"></script>
<script type="text/javascript">
$(function() {
	
	$("#writeForm").submit(function(){
		alert("writeForm submit");
		
	let title = $("#title").val().trim();
	$("#title").val(title);  
	if(title == ""){
		alert("제목은 필수입니다.")
		$("#title").focus();
		return false;
	}
	// 공백 제거
	if(isEmpty("#content", "내용", 1)) return false;
	if(isEmpty("#writer", "작성자", 1)) return false;
	if(isEmpty("#pw", "비밀번호", 0)) return false;
	if(isEmpty("#pw2", "비밀번호 확인", 0)) return false;
	
	// 비밀번호 일치 체크
	let pw = $("#pw").val();
	let pw2 = $("#pw2").val();
	if(pw != pw2){
		alert("비밀번호가 같지 않습니다.")
		$("#pw", "#pw2").val("");
		$("#pw").focus();
		return false;
	}
	
	// 길이 제한 체크
	
	if(lengthCheck("#title" ,"제목", 3, 100, 1)) return false;
	if(lengthCheck("#content" ,"내용", 3, 1000, 1)) return false;
	if(lengthCheck("#writer" ,"작성자", 3, 10, 1)) return false;
	if(lengthCheck("#pw" ,"비밀번호", 4, 20, 0)) return false;
	if(lengthCheck("#pw2" ,"비밀번호 확인", 4, 20, 0)) return false;
			
	return false;
	});
	return false;
});
</script>

<title>일반 게시판 글등록 형식</title>
</head>
<body>
<div class = "container">
<form action="write.jsp" method ="post" id = "writeForm">
	<div class="form-group">
  		<label for="title">제목</label><br>
  		<input type="text" class="form-control" id="title" maxlength="100" placeholder="제목 입력" name = "title">
	</div>
	
	<div class="form-group">
 	<label for="content">내용</label>
  	<textarea class="form-control" rows="7" id="content" placeholder="내용 입력" name = "content"></textarea>
	</div>
	
	<div class="form-group">
  		<label for="writer">작성자</label><br>
  		<input type="text" class="form-control" id="writer" name = "writer"  placeholder="작성자 입력">
	</div>
	
	<div class="form-group">
  <label for="pw">비밀번호</label> <br>
  <input type="password" class="form-control" id="pw" name = "pw" placeholder="비밀번호 입력">
  </div>
<div class="form-group">
  <label for="pw2">비밀번호 확인</label> <br>
  <input type="password" class="form-control" id="pw2" name = "pw2" placeholder="비밀번호 확인">
</div>

<button type="submit" class="btn btn-primary">등록</button>
<button type="reset" class="btn btn-secondary">새로 쓰기</button>
<button type="button" class="btn btn-success">취소</button>

</form>
</div>
</body>
</html>