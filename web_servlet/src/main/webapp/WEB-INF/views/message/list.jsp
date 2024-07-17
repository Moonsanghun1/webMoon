<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="pageNav" tagdir="/WEB-INF/tags"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메세지 리스트</title>
</head>
<body>
	<div class= "container">
		<h3>${(pageObject.acceptMode == 1)?"받은 ":(pageObject.acceptMode == 2)?"보낸 ":"모든 "}메세지 리스트</h3>
			<span class = "float-right">
				<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#sendModal">보내기</button>
			</span>
		<div>
			<a href="list.do?mode=1&${pageObject.pageQuery }" class = "btn btn-primary">받은 메세지</a>
			<a href="list.do?mode=2&${pageObject.pageQuery }" class = "btn btn-info">보낸 메세지</a>
			<a href="list.do?mode=3&${pageObject.pageQuery }" class = "btn btn-secondary">모든 메세지</a>
		</div>
		<div>
			<c:if test="${empty list }">메세지가 존재하지 않습니다.</c:if>
			<c:if test="${!empty list }">
					<c:forEach items="${list }" var="vo">
						<div class="media border p-3 dataRow ">
							<c:if test="${vo.senderId == login.id }">
							<!-- 내가 보낸 사람이다. 받는 사람의 정보만 표시한다. -->
							<div class="media-body ${(empty vo.acceptDate)?'font-weight-bold':'' } text-right" >
								${vo.accepterName }
								<small><i>(${vo.accepterId	 })</i></small>
								<p>
									번호: ${vo.no }
								   /보낸 날짜: ${vo.sendDate }
								   /받은 날짜: ${(empty vo.acceptDate)?"읽지 않음": (vo.acceptDate)}
								
								</p>
							</div>
							<img src="${vo.accepterPhoto }" class="mr-3 mt-3 rounded-circle" style="width: 40px;">
							</c:if>
						
							<c:if test="${vo.accepterId == login.id }">
							<!-- 내가 받은 사람이다. 보낸 사람의 정보만 표시한다. -->
							<img src="${vo.senderPhoto }" class="mr-3 mt-3 rounded-circle" style="width: 40px;">
							<div class="media-body ${(empty vo.sendDate)?'font-weight-bold':'' }" >
								${vo.senderName }
								<small><i>(${vo.senderId})</i></small>
								<p>
									번호: ${vo.no }
								   /보낸 날짜: ${vo.sendDate }
								   /받은 날짜: ${(empty vo.acceptDate)?"읽지 않음": (vo.acceptDate)}
								</p>
							</div>
							</c:if>
						</div>
					</c:forEach>
			</c:if>
			
		</div>
	</div>
	<!-- The Modal -->
<div class="modal" id="sendModal">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">Modal Heading</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

	<form action="write.do" method="post">
		<input type="hidden" name= "perPageNum" required class = "form-control" value="${pageObject.perPageNum}">
     	 <!-- Modal body -->
      	<div class="modal-body">
			<div class = "form-group">
				<label>받는 사람 아이디</label>
				<input name= "accepterId" required class = "form-control">
			</div>
			<div class = "form-group">
				<label>보낼 메시지</label>
				<textarea name= "content" required rows = "7" class = "form-control"></textarea>
			</div>
     	 </div>

      <!-- Modal footer -->
      	<div class="modal-footer">
      	  <button type="submit" class="btn btn-primary">등록</button>
      	  <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
      	  
     	</div>
	</form>
    </div>
  </div>
</div>
</body>
</html>