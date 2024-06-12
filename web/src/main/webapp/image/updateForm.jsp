<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일반 게시판 글 등록 폼</title>

<!-- 라이브러리 등록 -->
<!-- 라이브러리 필요하다. 웹 라이브러리(js 라이브러리)
	1. 다운로드 : jquery.com : 내 서버에 파일을 둔다.
	2. CDN(Content Delivery Network) - 배달 받는 방식 사용-->
<!-- Bootstrap(디자인의 표준화) : jquery(동작의 표준화) 포함. -->
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
  <script type="text/javascript" src="/js/boardInputUtil.js"></script>

<script type="text/javascript">
$(function() {
	//2. jquery 확인
	//console.log("jquery loading...")
	$("#updateForm")submit(function() {
		console.log("date check 진행 ....---");
		
		
		// 6. 데이터 유효성 검사
		//  - 필수 항목 검사. - 제목, 내용, 작성자, 비밀번호
		
		if(isEmpty("#title", "제목", 1)) return false;
		if(isEmpty("#content", "내용", 1)) return false;
		if(isEmpty("#writer", "작성자", 1)) return false;
		if(isEmpty("#pw", "비밀번호", 0)) return false;
		
		//  - 길이 체크 - 제목, 내용, 작성자, 비밀번호
		if(lengthCheck("#title", "제목" , 3, 100, 1)) return false;
		if(lengthCheck("#content", "내용" , 3, 800, 1)) return false;
		if(lengthCheck("#writer", "작성자" , 2, 10, 1)) return false;
		if(lengthCheck("#pw", "비밀번호" , 3, 20, 0)) return false;
		//return false;
		
	});
});


</script>

</head>
<body>
<!-- get 방식 : 주소 뒤에 문자열로 붙여서 데이터 넘기기 -->
<!-- post 방식 : 데이터 넘기는 부분에 포함시켜서 넘기기 -->

<div class="container" >
<h1><i class="fa fa-pencil-square-o" style="font-size:36px"></i>일반게시판 글 수정</h1>
<form action="update.jsp" id = "updateForm">
  <div class="form-group">
    <label for="no">번호</label>
    <input type="text" class="form-control" placeholder="번호" id="no" name = "no">
  </div>
  <div class="form-group">
    <label for="title">제목</label><span class = "badge badge-dark">필수</span>
    <input type="text" class="form-control" value = "부트스트랩" placeholder="제목 입력" id="title" name = "title">
  </div>
  <div class="form-group">
    <label for="content">내용</label>
    <textarea class="form-control" rows="7" id = "content" name= "content" placeholder="내용 입력">디자인 표준화</textarea>
  </div>
  <div class="form-group">
    <label for="writer">작성자</label>
    <input type="text" class="form-control" value = "문상훈" placeholder="작성자 입력" id="writer" name = "writer">
  </div>
  <div class="form-group">
    <label for="pw">비밀번호</label>
    <input type="password" class="form-control" placeholder="비밀번호 입력" id="pw">
  </div>	
  
  <button type="submit" class="btn btn-primary">수정</button>
  <button type="reset" class="btn btn-secondary">재입력</button>
  <button type="button" class="btn btn-success cancelBtn">취소</button>
</form>
</div>


</body>
</html>