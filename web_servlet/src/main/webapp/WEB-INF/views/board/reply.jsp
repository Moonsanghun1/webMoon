<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core"%>


<div class="card">
  <div class="card-header">
  <span class = "btn btn-primary float-right" >등록</span>
  <h3>댓글 리스트</h3>
  </div>
  <div class="card-body">
		<!-- 데이터가 있는 만큼 반복 처리 시작 -->
			<c:if test = "${empty replyList }">
				데이터가 존재하지 않는다.
			</c:if>
			<c:if test = "${!empty replyList }">
				<c:forEach items= "${replyList }" var = "replyVO" >
			<div class="card replyDataRow" data-rno= "${replyVO.rno }" style="margin: 5px 0;">
				<div class="card-header">
					<span class="float-right">${replyVO.writeDate }</span>
					<b>${replyVO.writer }</b>
				</div>
				<div class="card-body">
				<pre>${replyVO.content }</pre>
				</div>
				<div class="card-footer">
				<button class = "btn btn-warning">수정</button>
				<button class = "btn btn-danger">삭제</button>
				</div>
			</div>
			</c:forEach>
			</c:if>
		<!-- 데이터가 있는 만큼 반복 처리 끝 -->
	</div>
  <div class="card-footer">Footer</div>
</div>
