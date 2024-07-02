<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="pageNav"  tagdir="/WEB-INF/tags"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일반게시판 리스트</title>

<style type="text/css">
.dataRow:hover{
opacity: 20%;
cursor: pointer;
}
</style>
<script type="text/javascript">
$(function() {
	// 이벤트 처리
	$(".dataRow").click(function() {
// 		alert("click");
// 		글번호 필요 - 수집
		let no = $(this).find(".no").text();
		console.log("no = " + no );
		location="view.do?no=" + no + "&inc=1&${pageObject.pageQuery}" ;
	});
	
	
	
	$("#perPageNum").change(function() {
		//alert("change perPageNum");
		// page는 1페이지 + 검색 데이터를 전부 보낸다
		$("#searchForm").submit();
	});
	// 검색 데이터 세팅
	$("#key").val("${(empty pageObject.key)?'t':pageObject.key}");
	$("#perPageNum").val("${(empty pageObject.perPageNum)?'10':pageObject.perPageNum}");
});
	</script>
</head>
<body>
<div class = "container">
	<h1>이미지 게시판 리스트</h1>
	<form action="list.do" id = "searchForm">
		<input name = "page" value="1" type="hidden">
			<div class="row">
				<div class="col-md-8">
					<div class="input-group mb-3">
						<div class="input-group-prepend">

							<select name="key" id="key" class="form-control">
								<option value="t">제목</option>
								<option value="c">내용</option>
								<option value="w">작성자</option>
								<option value="tc">제목/내용</option>
								<option value="tw">제목/작성자</option>
								<option value="cw">내용/작성자</option>
								<option value="tcw">모두</option>
							</select>

						</div>
						<input type="text" class="form-control" placeholder="검색" id="word" value = "${pageObject.word }"
							name="word">
						<div class="input-group-append">
							<button class = "btn btn-outline-primary">검색</button>
						</div>
					</div>
				</div>
				<!-- col-md-8의 끝 : 검색 -->
				<div class="col-md-4">
				<!-- 너비를 조정하여 오른쪽으로 정렬하기 위한 div. class = "float-right" : 오른쪽 정렬(CSS) -->
				<div style="width: 175px;" class = "float-right" >
				<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class = "input-group-text">Rows/Page</span>
							

						</div>
						<select id = "perPageNum" name = "perPageNum" class="form-control" >
						 	<option>6</option>
						 	<option>9</option>
						 	<option>12</option>
						 	<option>18</option>
						</select>
					</div>
				</div>
				</div>
				<!-- col-md-4의 끝 : 한 페이지당 표시 데이터 개수 -->
			</div>
		</form>
 	<c:if test="${empty list }">
 		<div class = "jumbotron">
 			<h4>데이터가 존재하지 않습니다.</h4>
 		</div>
	</c:if>
 	<c:if test="${!empty list }">
 		<div class="row">
 		<!-- 이미지의 데이터가 있는 만큼 반복해서 표시하는 처리 시작 -->
	 		<c:forEach items="${list }" var="vo" varStatus="vs">
	 			<!-- 줄바굼 처리 - 찍는 인덱스 번호가 3의 배수이면 줄바꿈을 한다. -->
	 			<c:if test="${(vs.index != 0) && (vs.index % 3 == 0 ) }">
	 			 ${"</div>"}
	 			 ${"<div class='row'>"}
	 			</c:if>
	 			<!-- 데이터 표시 시작 -->
	  			<div class="col-md-4 dataRow" >
	  				<div class="card" style="width:100%">
					  	<img class="card-img-top" src="${vo.fileName }" alt="image">
					  	<div class="card-body">
					    	<h5 class="card-title">
					    		<span class= "float-right">${vo.writeDate }</span>
								${vo.name }(${vo.id })
							</h5>
					    	<p class="card-text">
					    		<span class = "no">${vo.no }</span>. ${vo.title }
					    	</p>
					  	</div>
					</div>
	  			</div>
	 			<!-- 데이터 표시 끝 -->
	 		 </c:forEach>		
 		<!-- 이미지의 데이터가 있는 만큼 반복해서 표시하는 처리 끝 -->	
		</div>
		
	</c:if>
	
	<div> 
	<pageNav:pageNav listURI="list.do" pageObject="${pageObject }"></pageNav:pageNav>
	</div>
	<c:if test="${!empty login }">
	<!-- 로그인이 되어있으면 보이게 하자. -->
	<a href="writeForm.do?perPageNum=${pageObject.perPageNum }" class="btn btn-primary">등록</a>
	</c:if>
</div>
</body>
</html>