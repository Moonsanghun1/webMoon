<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일반 게시판 글보기</title>

<!-- 라이브러리 등록 -->
<!-- 라이브러리 필요하다. 웹 라이브러리(js 라이브러리)
	1. 다운로드 : jquery.com : 내 서버에 파일을 둔다.
	2. CDN(Content Delivery Network) - 배달 받는 방식 사용-->
<!-- Bootstrap(디자인의 표준화) : jquery(동작의 표준화) 포함. -->
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
<script type="text/javascript">
$(function() {
	$("#deleteBtn").click(function(){
		$("#pw").val("");
		
	});
	$("#dlt").submit(function(){
		if (lengthCheck("#pw", "비밀번호", 3, 20, 0))
			return false;
		
	});
	$("#cc").click(function(){
		console.log("삭제 취소");
		$("#pw").val("");
		$("#deleteModal").modal("hide");
	});
	
	
	
});

</script>



</head>
<body>
	<h1>일반 게시판 글보기</h1>

	<table>
		<tr>
			<th>번호</th>
			<td>10</td>
		</tr>

		<tr>
			<th>작성일</th>
			<td>2024-01-12</td>
		</tr>

		<tr>
			<th>제목</th>
			<td>안녕하세요</td>
		</tr>

		<tr>
			<th>작성자</th>
			<td>문상훈</td>
		</tr>

		<tr>
			<th>내용</th>
			<td>반갑습니다 여러분</td>
		</tr>
		<tr>
			<th>조회수</th>
			<td>15</td>
		</tr>

		<tr>

			<td colspan='2'><a href="updateForm.jsp"><button>수정</button></a>
				<button type="button" class="btn btn-primary" data-toggle="modal" id="deleteBtn" data-target="#deleteModal">삭제</button> 
					
					<a href="list.jsp"><button>리스트</button></a>
<!-- 				<form action="delete.jsp" method="post"> -->
<!-- 					<input type="hidden" name="no" value="10"> <input name="pw" -->
<!-- 						required pattern="^.{4,20}&" title="비밀번호는 4~20자로 작성하셔야 합니다." -->
<!-- 						placeholder="본인 확인용 비밀번호 확인" maxlength="20"> -->
<!-- 					<button>삭제 진행</button> -->
<!-- 				</form> -->
			</td>
		</tr>

	</table>
	<!-- a tag : 데이터를 클릭하면 href의 정보를 가져와서 페이지 이동시킨다. -->
<!-- The Modal -->
  <div class="modal fade" id="deleteModal">
    <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">삭제 확인용 비밀번호</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
          <form action="delete.jsp" method="post">
					<input type="hidden" name="no" value="10"> <input name="pw" id="pw"
						required pattern="^.{4,20}&" title="비밀번호는 4~20자로 작성하셔야 합니다."
						placeholder="본인 확인용 비밀번호 확인" maxlength="20">
					<button id="dlt">삭제</button>
					
					<!--  -->
					<button type="button" id="cc" class="btn btn-outline-success">취소</button>
					
				</form>
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        </div>
        
      </div>
    </div>
  </div>
</body>
</html>