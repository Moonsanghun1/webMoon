<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 글 수정 폼</title>
<script src="https://code.jquery.com/ui/1.13.3/jquery-ui.js"></script>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.13.3/themes/base/jquery-ui.css">

	
<script type="text/javascript">
	
	$(function() {
		 
		 let now = new Date();
		 let startYear = now.getFullYear();
		 let yearRange = (startYear - 2) +":" + startYear ;

		// 날짜 입력 설정 - datepicker
		$(".datepicker").datepicker({
			// 입력란의 데이터 포맷
			dateFormat: "yy-mm-dd",
			// 월 선택 입력 추가
			changeMonth: true,
			// 년 선택 입력 추가
			changeYear: true,
			// 월 선택할 때의 이름 - 영어가 기본
			dayNamesMin: [ "일", "월", "화", "수", "목", "금", "토" ],
			// 달력의 요일 표시
			monthNamesShort: [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월" ],
			// 선택 년도의 범위 - 0살 ~ 100살 
			yearRange : yearRange,
			
		});
	});
</script>	
</head>
<body>
<div class= "container" >
<h1>공지사항 글 수정 형식</h1>
<form action="update.do" method = "post">
<input name = "perPageNum" value = "${param.perPageNum}" type = "hidden">
<div class="form-group">
<label for="title">공지사항 글 번호</label>
<input id = "no" name = "no" readonly value = "${vo.no}" class = "form-control">
</div>
	<div class="form-group">
   		<label for="title">제목</label>
		<input id = "title" name = "title" required class = "form-control"
		maxlength="100" pattern="^[^ .].{2,99}" title = "맨앞에 공백문자 불가 3~100자 입력" value = "${vo.title}"
		placeholder="제목 입력">
	</div>

	<div class="form-group">
		<label>내용</label>
		<textarea class = "form-control" rows="7" id = "content"name = "content" 
		placeholder = "첫글자는 공백문자나 줄바꿈을 입력할 수 없습니다." required>${vo.content}</textarea>
	</div>
	
	<div class="form-group">
		<label>시작일</label>
		<input id = "startDate" name = "startDate" required 
		 class = "form-control datepicker" value = "${vo.startDate}"
		autocomplete="off"  placeholder="yyyy-mm-dd">
	</div>
	
	<div class="form-group">
	<label>종료일</label>
	<input id = "endDate" name = "endDate" required 
		 class = "form-control datepicker" value = "${vo.endDate}"
		autocomplete="off"  placeholder="yyyy-mm-dd">
	</div>
		<button type="submit" class= "btn btn-primary">수정</button>
		<button type="reset" class= "btn btn-info">다시입력</button>
		<button type="button" class= "btn btn-secondary" onclick="history.back();">취소</button>
		
	
</form>
</div>
</body>
</html>