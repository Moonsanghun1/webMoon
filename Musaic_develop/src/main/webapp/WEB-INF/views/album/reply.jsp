<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="pageNav"  tagdir="/WEB-INF/tags"%>
<style>
.wrap {
    height: 50px;
    min-height: 100px;
    display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: column;
    gap: 32px;
}

h1 {
    font-size: 40px;
    font-weight: 600;
}

.rating {
    float: none;
    width: 200px;
    display: flex;
}

.rating__input {
    display: none;
}

.rating__label {
    width: 20px;
    overflow: hidden;
    cursor: pointer;
}

.rating__label .star-icon {
    width: 20px;
    height: 40px;
    display: block;
    position: relative;
    left: 0;
    background-image: url('https://velog.velcdn.com/images/jellykelly/post/9957327f-f358-4c25-9989-5bb3dd5755d6/image.svg');
    background-repeat: no-repeat;
    background-size: 40px;
}

.rating__label .star-icon.filled {
    background-image: url('https://velog.velcdn.com/images/jellykelly/post/10caf033-b0ef-4d58-804b-6e33395e4ea5/image.svg');
}

.rating__label--full .star-icon {
    background-position: right;
}

.rating__label--half .star-icon {
    background-position: left;
}

.rating.readonly .star-icon {
    opacity: 0.7;
    cursor: default;
}

    </style>
<script type="text/javascript">

$(function() {
    function renderStars(rating) {
        const totalStars = 5;
        const fullStars = Math.floor(rating/2);
        const halfStar = rating % 2 === 1;
        let starHTML = '';

        for (let i = 0; i < fullStars; i++) {
            starHTML += '<label class="rating__label rating__label--half"> <span class="star-icon filled style="opacity: 1;""></span></label><label class="rating__label rating__label--full"> <span class="star-icon filled style="opacity: 0.5;""></span></label>';
        }

        if (halfStar) {
            starHTML += '<label class="rating__label rating__label--half"> <span class="star-icon filled"></span></label><label class="rating__label rating__label--full"> <span class="star-icon"></span></label>';
        }

        for (let i = fullStars + halfStar; i < totalStars; i++) {
            starHTML += '<label class="rating__label rating__label--half"><span class="star-icon"></span></label><label class="rating__label rating__label--full"><span class="star-icon"></span></label>';
        }

        return starHTML;
    }

    // .replyRating 스팬에 별점 적용
    $('.replyRating').each(function() {
        const rating = parseInt($(this).text().trim(), 10);
        $(this).html(renderStars(rating));
    });
	
    // 이벤트 처리
    // ------------ Modal 화면안의 처리 버튼 이벤트 처리 --------------
    // 댓글 등록 이벤트
    $('#replyWriteBtn').click(function() {
        // 제목을 댓글 등록
        $("#albumReplyModal").find(".modal-title").text("댓글 등록");
        // input / text를 선택한다.
        $("#albumReplyForm").find(".form-group").show();
        //data 지우기
        $("#albumReplyForm").find(".form-group>input, .form-group>textarea").val("");
        
        // 버튼을 선택한다.
        // 먼저 버튼이 다보이게 하고
        $("#albumReplyForm button").show();
        // 필요없는 버튼은 안보이게 한다.
        $("#replyModalUpdateBtn, #replyModalDeleteBtn").hide();
        // 모달 창 보이게
        $("#albumReplyModal").modal("show");
    });
    // 댓글 수정 이벤트
    $('.replyUpdateBtn').click(function() {
        // 제목을 댓글 수정
        $("#albumReplyModal").find(".modal-title").text("댓글 수정");
        // input / text를 선택한다. - 내용 / 작성자 / 비밀번호
        $("#albumReplyForm").find(".form-group").show();
        //data 지우기
        $("#albumReplyForm").find(".form-group>input, .form-group>textarea").val("");
        // 댓글 번호, 내용, 작성자를 데이터를 수집해서  value값으로 세팅해야 한다.
        let replyDataRow= $(this).closest(".replyDataRow"); 
        // data("rno") -> tag 안에 data-rno = '값'
        let rno = replyDataRow.data("rno");
        let content = replyDataRow.find(".replyContent").text();
        let rating= replyDataRow.find(".replyRating").text(); 
        
        // reply Modal 입력란에 세팅하기 
        $("#rno").val(rno);
        $("#content").val(content);
        $("#rating").val(rating);
        
        $("#albumReplyForm").find("input, textarea").show();
        // 버튼을 선택한다.
        // 먼저 버튼이 다보이게 하고
        $("#albumReplyForm button").show();
        // 필요없는 버튼은 안보이게 한다.
        $("#replyModalWriteBtn, #replyModalDeleteBtn").hide();
        // 모달 창 보이게
        $("#albumReplyModal").modal("show");
        // 라디오버튼 숨기기
        $('.rating__input').css('display', 'none');
        // wrap보이게 하기
        $("#albumReplyForm").find(".wrap").show();
        
    });

    $('.replyDeleteBtn').click(function() {
        // 제목을 댓글 삭제로 만든다.
        $("#albumReplyModal").find(".modal-title").text("댓글을 삭제하시겠습니까?");
        // 
        $("#albumReplyForm").find(".form-group").hide();
        $("#albumReplyForm").find(".wrap").hide();
        //data 지우기
        $("#albumReplyForm").find(".form-group>input, .form-group>textarea").val("");        
        // data("rno") -> tag 안에 data-rno = "값"
        $("#rno").val($(this).closest(".replyDataRow").data("rno"))
        
        // 버튼을 선택한다.
        // 먼저 버튼이 다보이게 하고
        $("#albumReplyForm button").show();
        // 필요없는 버튼은 안보이게 한다.
        $("#replyModalWriteBtn, #replyModalUpdateBtn").hide();
        // 모달 창 보이게
        $("#albumReplyModal").modal("show");

    });
    // ------------ Modal 화면안의 처리 버튼 이벤트 처리 끝--------------

    $("#replyModalWriteBtn").click(function(){
        $("#albumReplyForm").attr("action", "/albumreply/write.do");
        // 데이터를 전송하면서 페이지 이동을 시킨다.
        $("#albumReplyForm").submit();
    });
    
    $("#replyModalUpdateBtn").click(function(){
        $("#albumReplyForm").attr("action", "/albumreply/update.do");
        // 데이터를 전송하면서 페이지 이동을 시킨다.
        $("#albumReplyForm").submit();
    });
    
    $("#replyModalDeleteBtn").click(function(){
        $("#albumReplyForm").attr("action", "/albumreply/delete.do");
        // 데이터를 전송하면서 페이지 이동을 시킨다.
        $("#albumReplyForm").submit();
    });
});



</script>
 <div class="card">
        <div class="card-header">
            <button class="btn btn-primary float-right" id="replyWriteBtn">등록</button>
            <h3>댓글 리스트</h3>
        </div>
        <div class="card-body">
            <c:if test="${empty replyList}">
                데이터가 존재하지 않습니다.
            </c:if>
            <c:if test="${!empty replyList}">
                <c:forEach items="${replyList}" var="replyVO">
                    <div class="card replyDataRow" data-rno="${replyVO.rno}" style="margin: 5px 0;">
                        <div class="card-header">
                           <span class="float-right">${replyVO.writeDate}</span>
                        	<span class="replyRating float-right">${replyVO.rating}</span>
                            <b class="replyId">${replyVO.id} (${replyVO.name})</b> 
                        </div>
                        <div class="card-body">
                        	
                            <pre class="replyContent">${replyVO.content}</pre>
                        </div>
                        <div class="card-footer">
                            <button class="btn btn-warning replyUpdateBtn">수정</button>
                            <button class="btn btn-danger replyDeleteBtn">삭제</button>
                        </div>
                    </div>
                </c:forEach>
            </c:if>
        </div>
        <div class="card-footer">
            <pageNav:replayPageNav listURI="view.do" pageObject="${replyPageObject}" query="&inc=0"></pageNav:replayPageNav>
        </div>
    </div>

    <!-- 댓글 등록 / 수정 / 삭제를 위한 모달창 -->
    <div class="modal" id="albumReplyModal">
        <div class="modal-dialog">
            <div class="modal-content">
                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">Modal Heading</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>

                <!-- Modal body -->
             <form id="albumReplyForm" method="post">
                    <input type="hidden" name="rno" id="rno">
                    <input type="hidden" name="no" value="${param.no}">
                    <input type="hidden" name="page" value="${param.page}">
                    <input type="hidden" name="perPageNum" value="${param.perPageNum}">
                    <input type="hidden" name="key" value="${param.key}">
                    <input type="hidden" name="word" value="${param.word}">
                    <div class="modal-body">
                        
                   <div class="wrap">
                   
     <div class="form-group " id="ratingDiv"> 
    <div class="rating">
        <label class="rating__label rating__label--half" for="starhalf">
            <input type="radio" id="starhalf" class="rating__input" name="rating" value="1">
            <span class="star-icon"></span>
        </label>
        <label class="rating__label rating__label--full" for="star1">
            <input type="radio" id="star1" class="rating__input" name="rating" value="2">
            <span class="star-icon"></span>
        </label>
        <label class="rating__label rating__label--half" for="star1half">
            <input type="radio" id="star1half" class="rating__input" name="rating" value="3">
            <span class="star-icon"></span>
        </label>
        <label class="rating__label rating__label--full" for="star2">
            <input type="radio" id="star2" class="rating__input" name="rating" value="4">
            <span class="star-icon"></span>
        </label>
        <label class="rating__label rating__label--half" for="star2half">
            <input type="radio" id="star2half" class="rating__input" name="rating" value="5">
            <span class="star-icon"></span>
        </label>
        <label class="rating__label rating__label--full" for="star3">
            <input type="radio" id="star3" class="rating__input" name="rating" value="6">
            <span class="star-icon"></span>
        </label>
        <label class="rating__label rating__label--half" for="star3half">
            <input type="radio" id="star3half" class="rating__input" name="rating" value="7">
            <span class="star-icon"></span>
        </label>
        <label class="rating__label rating__label--full" for="star4">
            <input type="radio" id="star4" class="rating__input" name="rating" value="8">
            <span class="star-icon"></span>
        </label>
        <label class="rating__label rating__label--half" for="star4half">
            <input type="radio" id="star4half" class="rating__input" name="rating" value="9">
            <span class="star-icon"></span>
        </label>
        <label class="rating__label rating__label--full" for="star5">
            <input type="radio" id="star5" class="rating__input" name="rating" value="10">
            <span class="star-icon"></span>
        </label>
   	 </div>
	</div>
</div>                        
  		  <div class="form-group" id="contentDiv">
                <label for="content">내용</label>
                <textarea class="form-control" rows="2" id="content" name="content"></textarea>
          </div>
                    </div>

                    <!-- Modal footer -->
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" id="replyModalWriteBtn">등록</button>
                        <button type="button" class="btn btn-success" id="replyModalUpdateBtn">수정</button>
                        <button type="button" class="btn btn-danger" id="replyModalDeleteBtn">삭제</button>
                        <button type="button" class="btn btn-warning" data-dismiss="modal">Close</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <script>
    const rateWrap = document.querySelectorAll('.rating'),
    label = document.querySelectorAll('.rating .rating__label'),
    input = document.querySelectorAll('.rating .rating__input'),
    labelLength = label.length,
    opacityHover = '0.5';

let stars = document.querySelectorAll('.rating .star-icon');

// 초기 체크된 별점 표시
checkedRate();

// 별점 컨테이너에 마우스 엔터 이벤트 추가
rateWrap.forEach(wrap => {
    wrap.addEventListener('mouseenter', () => {
        stars = wrap.querySelectorAll('.star-icon');

        stars.forEach((starIcon, idx) => {
            // 각 별에 마우스 엔터 이벤트 추가
            starIcon.addEventListener('mouseenter', () => {
                initStars(); // 모든 별의 "filled" 클래스 제거
                filledRate(idx, labelLength); // 현재 인덱스까지 별을 채움

                // "filled" 클래스가 있는 별의 투명도 설정
                for (let i = 0; i < stars.length; i++) {
                    if (stars[i].classList.contains('filled')) {
                        stars[i].style.opacity = opacityHover;
                    }
                }
            });

            // 각 별에 마우스 리브 이벤트 추가
            starIcon.addEventListener('mouseleave', () => {
                starIcon.style.opacity = '1';
                checkedRate(); // 현재 체크된 별점을 다시 표시
            });

            // 별점 컨테이너에 마우스 리브 이벤트 추가
            wrap.addEventListener('mouseleave', () => {
                starIcon.style.opacity = '1';
            });
        });
    });
});

// 특정 인덱스까지 별을 채우는 함수
function filledRate(index, length) {
    if (index <= length) {
        for (let i = 0; i <= index; i++) {
            stars[i].classList.add('filled');
        }
    }
}

// 현재 체크된 별점을 표시하는 함수
function checkedRate() {
    let checkedRadio = document.querySelectorAll('.rating input[type="radio"]:checked');

    initStars(); // 모든 별의 "filled" 클래스 제거
    checkedRadio.forEach(radio => {
        let previousSiblings = prevAll(radio);

        // 체크된 라디오 버튼의 이전 형제 요소들까지 별을 채움
        for (let i = 0; i < previousSiblings.length; i++) {
            previousSiblings[i].querySelector('.star-icon').classList.add('filled');
        }

        radio.nextElementSibling.classList.add('filled'); // 현재 체크된 라디오 버튼에 해당하는 별을 채움

        // 이전 형제 요소를 모두 반환하는 함수
        function prevAll() {
            let radioSiblings = [],
                prevSibling = radio.parentElement.previousElementSibling;

            while (prevSibling) {
                radioSiblings.push(prevSibling);
                prevSibling = prevSibling.previousElementSibling;
            }
            return radioSiblings;
        }
    });
}

// 모든 별의 "filled" 클래스를 제거하는 함수
function initStars() {
    for (let i = 0; i < stars.length; i++) {
        stars[i].classList.remove('filled');
    }
}

</script>
    