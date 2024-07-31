<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Music View</title>
<style>
.card {
	border: 1px solid #ddd;
	padding: 20px;
	border-radius: 5px;
	display: flex;
	flex-direction: row;
	margin-bottom: 20px;
}

.card img {
	width: 300px; /* 이미지 너비를 500px로 설정 */
	height: 300px; /* 이미지 높이를 500px로 설정 */
	object-fit: cover; /* 이미지 비율을 유지하며 잘림 방지 */
	margin-right: 50px;
}

.card-body {
	flex: 1;
}

.card-footer {
	font-size: 0.9em;
	color: #777;
	max-height: 200px;
	overflow-y: auto;
	margin-top: 20px;
	margin-bottom: 50px;
	max-height: 300px; /* 높이 조정 (필요시 조정 가능) */
}

.lyric-title {
	font-size: 1.2em;
	font-weight: bold;
	margin-top: 30px;
}

h2 {
	padding-top: 20px;
	padding-bottom: 10px;
}

.details {
	font-size: 0.9em;
	color: #444; /* 진한 회색 */
}

.details strong {
	display: block;
	margin-bottom: 5px;
}

.details p {
	margin: 5px 0;
}

.details .singer {
	font-size: 1.5em; /* 가수 폰트 크기 크게 */
	color: #444; /* 기본 텍스트 색상 */
	padding-bottom: 10px;
}

.modal-header .close {
	cursor: pointer;
}
</style>
</head>
<body>
	<div class="container">
		<h2>곡 정보</h2>
		<p>
		<div class="card">
			<c:if test="${!empty vo}">
				<img src="${vo.image}" alt="${vo.musicTitle}">
				<div class="card-body">
					<h2>${vo.musicTitle}</h2>
					<div class="details">
						<p class="singer">${vo.singer}</p>
						<!-- 가수 정보 스타일 변경 -->
						<p>작곡가: ${vo.songWriter}</p>
						<p>작사가: ${vo.lyricist}</p>
						<p>
							발매일:
							<fmt:formatDate value="${vo.release_Date}" pattern="yyyy-MM-dd" />
						</p>
						<p>장르: ${vo.genre}</p>
					</div>
					<!-- 관리자인 경우에만 수정 및 삭제 버튼을 표시 -->
					<c:if test="${!empty login && login.gradeNo == 9 }">
						<div class="float-right">
							<a href="updateForm.do?musicNo=${vo.musicNo}"
								class="btn btn-dark">수정</a> <a
								href="changeStatus.do?musicNo=${vo.musicNo}"
								class="btn btn-danger" data-toggle="modal"
								data-target="#myModal">상태 변경</a>
						</div>
					</c:if>
				</div>
			</c:if>
		</div>
		<c:if test="${!empty vo}">
			<div class="lyric-title">가사</div>
			<div class="card-footer lyric-content">
				<!-- Display formatted lyrics -->
				<c:out value="${vo.formattedLyric}" escapeXml="false" />
			</div>
		</c:if>
	</div>


	<!-- The Modal -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title" id="myModalLabel">상태 선택</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>

				<!-- Modal Body -->
				<form id="statusForm" action="changeStatus.do" method="post">
					<input type="hidden" name="musicNo" value="${vo.musicNo}">
					<div class="modal-body">
						<div class="form-group">
							<label for="statusSelect">상태 선택:</label> <select
								class="form-control" id="statusSelect" name="MusicStatus"
								required>
								<option value="" disabled selected>상태 선택</option>
								<option value="공개" ${vo.musicStatus == '공개' ? 'selected' : ''}>공개</option>
								<option value="비공개" ${vo.musicStatus == '비공개' ? 'selected' : ''}>비공개</option>
							</select>
						</div>
					</div>

					<!-- Modal Footer -->
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Close</button>
						<button type="submit" class="btn btn-primary">저장</button>
					</div>
				</form>

			</div>
		</div>
	</div>

</body>
</html>