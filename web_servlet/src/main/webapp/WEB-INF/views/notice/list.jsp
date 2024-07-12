<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="pageNav"  tagdir="/WEB-INF/tags"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 리스트</title>

<style type="text/css">
.dataRow:hover{
cursor: pointer;
}
</style>
<script type="text/javascript">
$(function() {
<%--	$("#${pageObject.period}").prop('checked', true); --%> // 태그 선택을 아이디로 
	$("[value = '${pageObject.period}']").prop('checked', true); // 태그 선택 속성으로 
		

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
	
	$(".noticeOption").change(function() {
		//alert("라디오 버튼");
		if(this.optionList[0].checked){
			location = "/notice/list.do?period=pre";
		}
		else if(this.optionList[1].checked){
			location = "/notice/list.do?period=old";
		}
		else if(this.optionList[2].checked){
			location = "/notice/list.do?period=res";
		}
		else if(this.optionList[3].checked){
			location = "/notice/list.do?period=all";
		};
	});
});
	</script>
</head>
<body>
<div class = "container">
	<h1>공지사항 리스트</h1>
	
	<c:if test="${!empty login && login.gradeNo == 9 }">
			<form class= "noticeOption">
			 	<div class="custom-control custom-radio custom-control-inline">
					<label class="custom-control-label" for="pre">
					<input type="radio" class="custom-control-input" id="pre" name="optionList" value="pre"> 현재공지
					</label>
				</div>
				<div class="custom-control custom-radio custom-control-inline">
					<input type="radio" class="custom-control-input" id="old" name="optionList" value="old"> 
					<label class="custom-control-label" for="old">이전공지</label>
				</div>
				<div class="custom-control custom-radio custom-control-inline">
					<input type="radio" class="custom-control-input" id="res" name="optionList" value="res"> 
					<label class="custom-control-label" for="res">예정공지</label>
				</div>
				<div class="custom-control custom-radio custom-control-inline">
					<input type="radio" class="custom-control-input" id="all" name="optionList" value="all"> 
					<label class="custom-control-label" for="all">모든공지</label>
				</div>
			</form>
	</c:if>
	
	
	<!-- 검색란의 시작 -->
	<form action="list.do" id = "searchForm">
		<input name = "page" value="1" type="hidden">
			<div class="row">
				<div class="col-md-8">
					<div class="input-group mb-3">
						<div class="input-group-prepend">

							<select name="key" id="key" class="form-control">
								<option value="t">제목</option>
								<option value="c">내용</option>
								<option value="tc">제목/내용</option>
								<option value="tc">모두</option>
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
		<th>번호</th>
		<th>제목</th>
		<th>수정일</th>
		<th>시작일</th>
		<th>종료일</th>
	</tr>
	
	<c:forEach items="${list }" var="vo">
	<tr class = "dataRow">
		<td class = "no">${vo.no}</td>
		<td>${vo.title}</td>
		<td>${vo.updateDate}</td>
		<td>${vo.startDate}</td>
		<td>${vo.endDate}</td>
	</tr>
	</c:forEach>
	
	
	<c:if test="${!empty login && login.gradeNo == 9 }">
	<tr>
		<td colspan="5">
			<a href = "writeForm.do?perPageNum=${pageObject.perPageNum }"><button class = "btn btn-primary">등록</button></a>
		</td>
	</tr>
	</c:if>
	</table>
	<div> 
		<pageNav:pageNav listURI="list.do" pageObject="${pageObject }"></pageNav:pageNav>
	</div>
</div>
</body>
</html>