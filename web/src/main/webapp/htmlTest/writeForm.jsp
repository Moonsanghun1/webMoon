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

</head>
<body>
<div class = "container">
	<h3><i class="fa fa-book" style="font-size:24px"></i>앨범 등록</h3>
<!-- get 방식 : 주소 뒤에 문자열로 붙여서 데이터 넘기기 -->
<!-- post 방식 : 데이터 넘기는 부분에 포함시켜서 넘기기 -->
<form action="write.jsp" method="post" id = "writeForm">
  <div class="form-group">
    <label for="title">앨범 제목</label>
    <input type="text" class="form-control" placeholder="앨범 제목 입력" id="title" name = "title">
  </div>
  <div class="form-group">
    <label for="info">앨범 설명</label>
    <textarea class="form-control" rows="7" id = "info" name= "info" placeholder="앨범 설명 입력"></textarea>
  </div>
  <div class="form-group">
    <label for="release_date">발매일</label>
    <input type="text" class="form-control" placeholder="발매일 입력" id="release_date" name = "release_date">
  </div>
  <div class="form-group">
    <label for="artist">아티스트</label>
    <input type="text" class="form-control" placeholder="아티스트 입력" id="artist" name = "artist">
  </div>
  <div class="form-group">
    <label for="genre">장르</label>
    <input type="text" class="form-control" placeholder="장르 입력" id="genre" name = "genre">
  </div>
   <div class="form-group">
    <label for="price">앨범 가격</label>
    <input type="text" class="form-control" placeholder="가격 입력" id="price" name = "price">
  </div>
   <div class="form-group">
    <label for="image">앨범 커버</label>
    <div class="form-group">
      <input type="file" class="form-control-file border" name="image" id ="image">
    </div>
  </div>
   <div class="form-group">
    <label for="music_no">앨범 수록곡(음원 번호)</label>
    <input type="text" class="form-control" placeholder="음원번호 입력" id="music_no" name = "music_no">
  </div>

  

<button type="submit" class="btn btn-primary" id = "writeBtn">등록</button>
<button type="reset" class="btn btn-secondary">새로입력</button>
<button type="button" class="btn btn-success cancelBtn">취소</button>

</form>
</div>
</body>
</html>