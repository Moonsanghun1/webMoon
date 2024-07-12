<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="pageNav"  tagdir="/WEB-INF/tags"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 리스트</title>

<style type="text/css">
.dataRow:hover{
cursor: pointer;
background: #e0e0e0;
}
</style>

<script type="text/javascript">
	//이벤트 처리
	//this - select 태그 선택 . next() 다움 태그 - div 태그
$(function() {
	
	function dataRowClick() {
		alert("dataRow click");
	};
	// 이벤트 처리
	$(".dataRow").on("click", function() {
		dataRowClick();
	});
	
	
	
	$(".grade, .status").parent()
	.on("mouseover", function(){
		// dataRow의 click 이벤트를 없앤다.
		$(".dataRow").off("click");
	})
	.on("mouseout", function(){
		// dataRow의 click 이벤트를 다시 설정해준다..
		$(".dataRow").on("click", function(){
			dataRowClick()
		});
	});
	
	$(".dataRow").on("change", ".grade, .status",function() {
		// alert("값이 바뀜");
		// this - select 태그 선택 .next() 다음 태그 - div 태그
		// 변경되었는지 알아내는 것 처리.
		let changeData = $(this).val();
		let data= $(this).data("data");
		console.log("원래 데이터 = " + data + ", 바꿀 데이터 = " + changeData);
		if(changeData == data)
			$(this).next().find("button").prop("disabled" , true);
		else
			$(this).next().find("button").prop("disabled" , false);
	});
	
	$(".dataRow").on("change", ".grade",function() {
		// alert("값이 바뀜");
		// this - select 태그 선택 .next() 다음 태그 - div 태그
		// 변경되었는지 알아내는 것 처리.
		let changeData = $(this).val();
		let data= $(this).data("data");
		let statusData= $(this).closest(".dataRow").find(".status").val();
		console.log("원래 데이터 = " + data + ", 바꿀 데이터 = " + changeData + ", 상태 데이터 = " + statusData);
		if(statusData != "정상")
			$(this).next().find("button").prop("disabled" , true);
		else
			$(this).next().find("button").prop("disabled" , false);
	});
	
	$("#changeGradeForm").submit(function() {
		
		let gradeNoData= $(".gradeNo").data("data");
		let statusData= $(".status").data("data");
		
		if(statusData != "정상"){
			alert("상태가 정상이 아니면 관리자로 바꿀 수 없습니다.");
			
			return false;}
	
	});
});	
	
</script>

</head>
<body>
<div class = "container">
	<h1>회원 리스트</h1>
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
						 	<option>10</option>
						 	<option>15</option>
						 	<option>20</option>
						 	<option>25</option>
						</select>
					</div>
				</div>
				</div>
				<!-- col-md-4의 끝 : 한 페이지당 표시 데이터 개수 -->
			</div>
		</form>
<table class = "table">
	<tr>
		<th>사진</th>
		<th>아이디</th>
		<th>이름</th>
		<th>성별</th>
		<th>생년월일</th>
		<th>연락처</th>
		<th>회원 등급</th>
		<th>상태</th>
	</tr>
	
	<c:forEach items="${list }" var="vo">
	<tr class = "dataRow">
		<td>
			<c:if test="${ !empty vo.photo }">
				<img src="${vo.photo }" style="width: 50px; height: 50px;">
			</c:if>
			<c:if test="${ empty vo.photo }">
				<i class="fa fa-user-circle-o" style="font-size:30px"></i>
			</c:if>
		</td>
		<td class = "id">${vo.id}</td>
		<td>${vo.name}</td>
		<td>${vo.gender}</td>
		<td>${vo.birth}</td>
		<td>${vo.tel}</td>
		<td>
			<form action="changeGrade.do" id ="changeGradeForm">
				<input name= "id" value = "${vo.id }" type="hidden">
				<div class ="input-group mb-3" >
					<select class= "form-control grade" name= "gradeNo" data-data="${vo.gradeNo }">
						<option value = "1" ${(vo.gradeNo == 1)? "selected" : "" }>일반회원</option>
						<option value = "9" ${(vo.gradeNo == 9)? "selected" : "" }>관리자</option>
					</select>
					<div class= "input-group-append">
						<button class = "btn btn-success" type="submit" Disabled>Go</button>
					</div>
				</div>
			</form>
		</td>
		<td>
			<form action="changeStatus.do" id = "changeStatusForm">
				<input name= "id" value = "${vo.id }" type="hidden">
				<div class ="input-group mb-3" >
					<select class= "form-control status" name= "status" data-data="${vo.status }">
						<option value = "정상" ${(vo.status == "정상")? "selected" : "" }>정상</option>
						<option value = "탈퇴" ${(vo.status == "탈퇴")? "selected" : "" }>탈퇴</option>
						<option value = "휴면" ${(vo.status == "휴면")? "selected" : "" }>휴면</option>
						<option value = "강퇴" ${(vo.status == "강퇴")? "selected" : "" }>강퇴</option>
					</select>
					<div class= "input-group-append">
						<button class = "btn btn-success" type="submit" Disabled>변경</button>
					</div>
				</div>
			</form>
		</td>
		
	</tr>
	</c:forEach>
	
	
	<tr>
		<td colspan="5">
			
			<a href = "writeForm.do?perPageNum=${pageObject.perPageNum }" class = "btn btn-primary">등록</a>
		</td>
	</tr>
</table>
	<div> 
	<pageNav:pageNav listURI="list.do" pageObject="${pageObject }"></pageNav:pageNav>
	</div>
</div>
</body>
</html>