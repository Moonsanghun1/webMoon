<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>앨범 상세 보기</title>
<style type="text/css">


.musicImg{
	width: 40px;
	height: 40px;
	margin-right: 10px;
}
</style>
<script>
$(function(){
	
	// 로그인 상태를 나타내는 전역 변수
	var isLoggedIn = ${login != null ? "true" : "false"};
	
  $('[data-toggle="tooltip"]').tooltip();  
  
  //이벤트 처리
  $("#deleteBtn").click(function(){
	 // js 경고창 - alert : 일반 경고, conform : 확인/취소, prompt : 키인
	 // 확인 창이 나타나는데 취소를 누르면 삭제페이지 이동을 취소(return false) 시킨다.
	 if(!confirm("정말 삭제 하시겠습니까?")) return false;
  });
  
	$(".btn-add")
	.click(function(event) {
				// 이벤트 전파 막기
				event.stopPropagation();

				if (!isLoggedIn) {
					// 사용자가 로그인하지 않은 상태면, 로그인 필요 모달 표시
					$("#modalMessage").text("로그인 후 이용하실 수 있습니다.");
					$("#resultModal").modal('show');
					return;
				}

				let musicNo = $(this).data("music-no");
				if (typeof musicNo === 'undefined') {
					console.error("musicNo is undefined");
					return;
				}

				$.ajax({url : "increaseHit.do",
						type : "POST",
						data : {musicNo : musicNo},success : function(response) {
								let modalMessage = response === "success" ? "플레이 리스트 목록에 추가되었습니다."
										: "플레이 리스트 목록에 담기지 않았습니다.";
								$("#modalMessage").text(
										modalMessage);
								$("#resultModal").modal('show');
							},
							error : function() {
								$("#modalMessage").text(
										"서버와의 통신에 실패했습니다.");
								$("#resultModal").modal('show');
							}
						});
			});

// 데이터 행 클릭 시 view.do로 이동
$(".dataRow").click(function() {
if ($(this).hasClass("disabled")) {
	return; // 비활성화된 행의 클릭 이벤트 무시
}
let musicNo = $(this).data("music-no");
if (typeof musicNo === 'undefined') {
	console.error("musicNo is undefined");
	return;
}
console.log("Redirecting to view.do?musicNo=" + musicNo); // 로그 확인
location.href = "/music/view.do?musicNo=" + musicNo; // location.href를 사용하여 페이지 이동

});
});
</script>

</head>
<body>
<div class="container">
	<h1>앨범 상세 보기</h1>
	
	
	
  <div class="media border p-3">
    <img src="${vo.image }" alt="앨범 커버" class="mr-3" style="width:350px;" id = "">
    <div class="media-body">
     <h2>${vo.title }</h2>
     <h4>${vo.artist }</h4>
     <p>발매일 : ${vo.release_date }</p>
     <p>장르 : ${vo.genre }</p>
     <p>가격 : ${vo.price }원</p>
     댓글<span class="replyCnt">${vo.replyCnt}</span>개
     <br>
     <span class="replyRating">${vo.rating}</span> 
    <br>
    <button class="btn btn-info">앨범 듣기</button>
    <button class="btn btn-secondary">장바구니 담기</button>
    <%-- <c:if test="${login.id == vo.id }"> --%>
		<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#changeImageModal">
			이미지 변경
		</button>
<%-- 	</c:if> --%>
    </div>
  </div>
	
<!-- 	앨범 정보  -->
		 <div>
		    <p><pre>${vo.info }</pre></p>
		  </div>
	
			<a class="btn btn-info" href="includeForm.do?no=${param.no }&page=${param.page }&perPageNum=${param.perPageNum}&key=${param.key}&word=${param.word}">수록곡 등록</a>
			<table class="table">
				<!-- 게시판 데이터의 제목 -->
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>가수명</th>
					<c:if test="${!empty login && login.gradeNo == 9}">
						<th>상태</th>
					</c:if>
					<th>담기</th>
				</tr>
				<!-- 실제 데이터 표시 -->
				<c:forEach items="${musicList}" var="vo">
					<c:choose>
						<c:when
							test="${vo.musicStatus == '공개' || (!empty login && login.gradeNo == 9)}">
							<tr class="dataRow ${vo.musicStatus == '비공개' ? 'disabled' : ''}"
								data-music-no="${vo.musicNo}">
								<td class="no">&nbsp;&nbsp;${vo.musicNo}</td>
								<td><img src="${vo.image}" alt="${vo.musicTitle}" class="musicImg"/>
									${vo.musicTitle}</td>
								<td>${vo.singer}</td>
								<c:if test="${!empty login && login.gradeNo == 9}">
									<td>${vo.musicStatus}</td>
								</c:if>
								<td>
									<!-- 담기 버튼 --> <span class="btn-add"
									data-music-no="${vo.musicNo}">&nbsp;&nbsp;<i
										class="fa fa-plus"></i></span>
								</td>
							</tr>
						</c:when>
						<c:otherwise>
							<!-- 비공식 음원은 표시되지 않음 -->
						</c:otherwise>
					</c:choose>
				</c:forEach>

				
			</table>		
	

	<!-- a tag : 데이터를 클릭하면 href의 정보를 가져와서 페이지 이동시킨다. -->
<%-- 	<c:if test="${!empty login && login.id == vo.id }"> --%>
	<a href="updateForm.do?no=${param.no }&page=${param.page }&perPageNum=${param.perPageNum}&key=${param.key}&word=${param.word}" class="btn btn-primary" data-toggle="tooltip" data-placement="top" title="이미지를 제외한 항목만 수정가능합니다">수정</a>
	<a class="btn btn-danger" href = "delete.do?albumNo=${vo.albumNo }&deleteImageName=${vo.image}&perPageNum=${param.perPageNum}" id = "deleteBtn">삭제 </a>
<%-- 	</c:if> --%>
	<a href="list.do?page=${param.page }&perPageNum=${param.perPageNum}&key=${param.key}&word=${param.word}" class="btn btn-info">리스트</a>
	
	<!-- 댓글 처리 시작 -->
<jsp:include page="reply.jsp"/> 
<!-- 댓글 처리 끝 -->
	
</div>
<!-- container의 끝 -->

<!-- The Modal -->
<div class="modal" id="changeImageModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">바꿀 이미지 선택하기</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>
	
		<form action="changeImage.do" method="post" enctype="multipart/form-data">
			<!-- 숨겨서 넘겨야할 데이터 - 이미지 번호, 현재 파일이름(삭제) -->
			<input name="albumNo" value="${vo.albumNo }" type="hidden">
			<input name="deleteImageName" value="${vo.image }" type="hidden">
			 <!-- 페이지 정보도 넘긴다. -->
			<input name="page" value="${param.page }" type="hidden">
			<input name="perPageNum" value="${param.perPageNum }" type="hidden">
			<input name="key" value="${param.key }" type="hidden">
			<input name="word" value="${param.word }" type="hidden">
	      <!-- Modal body -->
	      <div class="modal-body">
			 <div class="form-group">
			    <label for="image">첨부 이미지</label>
				<input id="image" name="image" required class="form-control" type="file">
			  </div>
	      </div>
	
	      <!-- Modal footer -->
	      <div class="modal-footer">
	      	<button class="btn btn-primary">바꾸기</button>
	        <button type="button" class="btn btn-danger"
	         data-dismiss="modal">취소</button>
	      </div>
		
		</form>
    </div>
  </div>
</div>

</body>
</html>