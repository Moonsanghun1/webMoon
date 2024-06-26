<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core"%>


<div class="card">
  <div class="card-header">
  <button class="btn btn-primary  float-right write-btn" data-toggle="modal" data-target="#boardReplyModal" >등록</button>
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
				<button class = "btn btn-warning update-btn" data-toggle="modal" data-target="#boardReplyUpdateModal"
				data-rno="${replyVO.rno}" data-writer="${replyVO.writer}" data-content="${replyVO.content}">수정</button>
				
				<button class = "btn btn-danger delete-btn" data-toggle="modal" data-target="#boardReplyDeleteModal" data-rno="${replyVO.rno}">삭제</button>
				</div>
			</div>
			</c:forEach>
			</c:if>
		<!-- 데이터가 있는 만큼 반복 처리 끝 -->
	</div>
  <div class="card-footer">Footer</div>
</div>

<!-- 댓글 등록 / 수정 / 삭제를 위한 모달창 -->
<!-- The Modal -->
<!-- 댓글 등록처리 모달 -->
<div class="modal" id="boardReplyModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
      <!-- 버튼에 따라서 제목을 수정해서 사용 - .text(제목) -->
        <h4 class="modal-title">Modal Heading</h4>
        <button type="button" class="close" data-dismiss="modal" >&times;</button>
      </div>

	  <!-- 데이터를 넘기는 form -->	
      <!-- Modal body -->
      <form id="boardReplyForm" action="/boardreply/write.do">
    	
    	<input type = "hidden" name = "page" value = "${param.page }">
		<input type = "hidden" name = "perPageNum" value = "${param.perPageNum }">
		<input type = "hidden" name = "key" value = "${param.key }">
		<input type = "hidden" name = "word" value = "${param.word }">
    	<input type="hidden" name = "rno">
    	<input type="hidden" name = "no" value = "${param.no }">
				<div class="modal-body">
				
					<!-- 내용 / 작성자 / 비번 -->
					<div class="form-group">
						<label for="content">내용</label>
						<textarea class="form-control" rows="3" id="write-content" name="content"></textarea>
					</div>
					<div class="form-group">
						<label for="writer">작성자</label> 
						<input type="text" class="form-control" id="write-writer" name = "writer">
					</div>
					<div class="form-group">
						<label for="pw">비밀번호</label> 
						<input type="password" class="form-control" id="write-pw" name = "pw">
					</div>
				</div>

				<!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
        <button>등록</button>
      </div>
	  </form>
    </div>
  </div>
</div>

<!-- 댓글 수정처리 모달 -->
<!-- The Modal -->
<div class="modal" id="boardReplyUpdateModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
      <!-- 버튼에 따라서 제목을 수정해서 사용 - .text(제목) -->
        <h4 class="modal-title">Modal Heading</h4>
        <button type="button" class="close" data-dismiss="modal" >&times;</button>
      </div>

	  <!-- 데이터를 넘기는 form -->	
      <!-- Modal body -->
      <form id="boardReplyUpdateForm" action="/boardreply/update.do">
       	<input type = "hidden" name = "page" value = "${param.page }">
		<input type = "hidden" name = "perPageNum" value = "${param.perPageNum }">
		<input type = "hidden" name = "key" value = "${param.key }">
		<input type = "hidden" name = "word" value = "${param.word }">
    	<input type="hidden" name = "rno"  id = "update-rno" >
    	<input type="hidden" name = "no" value = "${param.no }">
				<div class="modal-body">
					<!-- 내용 / 작성자 / 비번 -->
					<div class="form-group">
						<label for="content">내용</label>
						<textarea class="form-control" rows="3" id="update-content" name="content"></textarea>
					</div>
					<div class="form-group">
						<label for="writer">작성자</label> 
						<input type="text" class="form-control" id="update-writer" name = "writer" >
					</div>
					<div class="form-group">
						<label for="pw">비밀번호</label> 
						<input type="password" class="form-control" id="update-pw" name = "pw">
					</div>
				</div>

				<!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
        <button>등록</button>
      </div>
	  </form>
    </div>
  </div>
</div>

<!-- 댓글 삭제처리 모달 -->
<!-- The Modal -->
<div class="modal" id="boardReplyDeleteModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
      <!-- 버튼에 따라서 제목을 수정해서 사용 - .text(제목) -->
        <h4 class="modal-title">Modal Heading</h4>
        <button type="button" class="close" data-dismiss="modal" >&times;</button>
      </div>

	  <!-- 데이터를 넘기는 form -->	
      <!-- Modal body -->
      <form id="boardReplyDeleteForm" action="/boardreply/delete.do">
      	<input type = "hidden" name = "page" value = "${param.page }">
		<input type = "hidden" name = "perPageNum" value = "${param.perPageNum }">
		<input type = "hidden" name = "key" value = "${param.key }">
		<input type = "hidden" name = "word" value = "${param.word }">
    	<input type="hidden" name = "rno"  id = "delete-rno" >
    	<input type="hidden" name = "no" value = "${param.no }">
				<div class="modal-body">
					<!-- 비번 -->
					
					<div class="form-group">
						<label for="pw">비밀번호</label> 
						<input type="password" class="form-control" id="delete-pw" name = "pw">
					</div>
				</div>

				<!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
        <button>삭제</button>
      </div>
	  </form>
    </div>
  </div>
</div>


<script type="text/javascript">
	$(function() {
		$('.write-btn').on('click', function() {

			$('#write-rno').val("");
			$('#write-writer').val("");
			$('#write-content').val("");

		});

		$('.update-btn').on('click', function() {

			var rno = $(this).data('rno');
			var writer = $(this).data('writer');
			var content = $(this).data('content');

			$('#update-rno').val(rno);
			$('#update-writer').val(writer);
			$('#update-content').val(content);
		});

		$('.delete-btn').on('click', function() {
			var rno = $(this).data('rno');
			
			$('#delete-pw').val("");
			$('#delete-rno').val(rno);

		});
	});
</script>