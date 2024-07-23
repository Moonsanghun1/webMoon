<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이미지 글보기</title>

<script>
$(function(){
  $('[data-toggle="tooltip"]').tooltip();  
  
  //이벤트 처리
  $("#deleteBtn").click(function(){
	 // js 경고창 - alert : 일반 경고, conform : 확인/취소, prompt : 키인
	 // 확인 창이 나타나는데 취소를 누르면 삭제페이지 이동을 취소(return false) 시킨다.
	 if(!confirm("정말 삭제 하시겠습니까?")) return false;
  });
});
</script>

</head>
<body>
<div class="container">
	<h1>이미지 글보기</h1>
	<div class="card">
	  <div class="card-header">
	  	<b>${vo.albumNo }. ${vo.title }
	  	</b>
	  </div>
	  <div class="card-body">
	  	<div class="card">
		  <div class="card-header">
		  	<!-- card 아래의 card-img-overlay 위쪽의 이미지(또는 class = card-img-top - card 클래스 밖에도 적용) - width의 기본이 100% -->
			<img src="${vo.image }" alt="image">
		    <div class="card-img-overlay">
<%-- 		    	<c:if test="${login.id == vo.id }"> --%>
			    	<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#changeImageModal">
					  이미지 변경
					</button>
<%-- 			    </c:if> --%>
			    <a href="${vo.image }" class="btn btn-success" download >다운로드</a>
			</div>
		  </div>
		  <div class="card-body">
		    <p class="card-text"><pre>${vo.info }</pre></p>
		  </div>
		</div>
	  </div>
	  <div class="card-footer">
	  	<span class="float-right">${vo.release_date }</span>
	  	${vo.artist }
	  </div>
	</div>
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