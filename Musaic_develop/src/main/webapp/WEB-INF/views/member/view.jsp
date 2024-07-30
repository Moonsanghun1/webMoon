<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MEMBER VIEW</title>
<style>
th{
width:20%;
}
.photodiv {
  width: 250px;
  aspect-ratio: 1 / 1;
  overflow: hidden;
  display: flex;
  justify-content: center;
}

.photodiv > img {
  width: 250px;
  height: 250px;
  object-fit: cover;
  object-position: center top;
}
</style>
</head>

<body>
	<div class="container">
	<br>
		<h3 style="margin-left:40%"><i class="fa fa-folder-open-o"></i> Member View</h3>
		<br><hr>
		<div class="row">
			<div class="col-lg-5 photodiv">
				<c:if test="${!empty vo.photo }">
					<img src="${vo.photo }">
				</c:if>
				<c:if test="${empty vo.photo }">
					<div class="m-5 pb-5"><i class="fa fa-user-circle-o float-right" style="font-size:150px;"></i></div>
				</c:if>
			</div>
			<div class="col-lg-7">
				<table class="table">
					<tr>
						<th>ID</th>
						<td>${vo.id }</td>
					</tr>
					<tr>
						<th>성명</th>
						<td>${vo.name }</td>
					</tr>
					<tr>
						<th>성별</th>
						<td>${vo.gender }</td>
					</tr>
					<tr>
						<th>연락처</th>
						<td>${vo.tel }</td>
					</tr>
					<tr>
						<th>E-Mail</th>
						<td>${vo.email }</td>
					</tr>
					<tr>
						<th>주소</th>
						<td>${vo.address }</td>
					</tr>
					<tr>
						<th>등록일</th>
						<td>${vo.regDate }</td>
					</tr>
					<c:if test="${login.gradeNo==9}">
						<tr>
							<th>등급</th>
							<td>${vo.gradeName }</td>
						</tr>
						<tr>
							<th>상태</th>
							<td>${vo.status }</td>
						</tr>
						<tr>
							<th>최근접속일</th>
							<td>${vo.conDate }</td>
						</tr>
					</c:if>
				</table>
			</div>
		</div>
		<c:if test="${login.id==vo.id}">
		<a style="color:gray" data-toggle="modal" data-target="#deleteModal">
		<small>탈퇴하기</small></a></c:if>
		<a href="updateform.do?id=${vo.id}" class="btn btn-success float-right">수정</a>
	</div>
	
	
	<!-- 모달창 -->
	<div class="modal fade" id="deleteModal">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
			
				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">정말 탈퇴하시겠습니까?</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					탈퇴 버튼 선택시, 계정은 삭제되며 복구되지 않습니다.
				</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<a class="btn btn-secondary" href="delete.do?id=${vo.id}">탈퇴</a>
					<button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
				</div>

			</div>
		</div>
	</div>
	
</body>
</html>