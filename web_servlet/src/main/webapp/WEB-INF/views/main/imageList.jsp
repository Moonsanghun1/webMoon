<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="pageNav"  tagdir="/WEB-INF/tags"%>
    
<script type="text/javascript">
$(function() {
	
	// 제목 해당 태그 중 제일 높은 것을 이용하여 모두 맞추기
	// console.log($(".title"));
	let titleHeights = [];
	
	$(".title").each(function(idx, title){
		console.log($(title).height());
		titleHeights.push($(title).height());
	});
	console.log(titleHeights.join(", "));
	
	let maxTitleHeight = Math.max.apply(null, titleHeights);
	console.log(maxTitleHeight);
	
	$(".title").height(maxTitleHeight);
	
	// 이미지 사이즈 조정 5:4
	let imgWidth = $(".imageDiv:first").width();
	let imgHeight= $(".imageDiv:first").height();
	console.log("image width=" + imgWidth + ", height=" + imgHeight)
	// 높이 계산 - 너비는 동일하다. : 이미지와 이미지를 감싸고 있는 div의 높이로 사용
	let height = imgWidth / 5 * 4;
	// 전체 imageDiv의 높이를 조정한다.
	$(".imageDiv").height(height);
	// 전체 이미지 배경색 변경
	$(".imageDiv").css("background","black");
	// 이미지 배열로 처리하면 안된다. foreach 사용 - jquery each()
	$(".imageDiv > img").each(function(idx, image){
		//alert(image);
		//alert(height);
		//alert($(image).height());
		// 이미지가 계산된 높이 보다 크면 줄인다.
		if($(image).height() > height){
			let image_width = $(image).width();
			let image_height = $(image).height();
			let width = height  / image_height * image_width;
			
			console.log("chaged image width = " + width);
			
			// 이미지 높이 줄이기
			$(image).height(height);
			// 이미지 너비 줄이기
			$(image).width(width);
			
		}
	});
	

});
	</script>


	<h3>이미지 게시판 리스트</h3>
	<c:if test="${empty imageList }">
 		<div class = "jumbotron">
 			<h4>데이터가 존재하지 않습니다.</h4>
 		</div>
	</c:if>
 	<c:if test="${!empty imageList }">
 		<div class="row">
 		<!-- 이미지의 데이터가 있는 만큼 반복해서 표시하는 처리 시작 -->
	 		<c:forEach items="${imageList }" var="vo" varStatus="vs">
	 			<!-- 줄바굼 처리 - 찍는 인덱스 번호가 3의 배수이면 줄바꿈을 한다. -->
	 			<c:if test="${(vs.index != 0) && (vs.index % 3 == 0 ) }">
	 			 ${"</div>"}
	 			 ${"<div class='row'>"}
	 			</c:if>
	 			<!-- 데이터 표시 시작 -->
	  			<div class="col-md-4 dataRow image imageLink" >
	  				<div class="card" style="width:100%">
	  				<div class = "imageDiv text-center align-content-center" >
					  	<img class="card-img-top" src="${vo.fileName }" alt="image">
					</div>  	
					  	<div class="card-body">
					    	<h5 class="card-title">
					    		<span class= "float-right">${vo.writeDate }</span>
								${vo.name }(${vo.id })
							</h5>
					    	<p class="card-text title">
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
