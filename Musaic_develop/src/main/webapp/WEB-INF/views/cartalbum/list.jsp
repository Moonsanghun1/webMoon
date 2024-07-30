<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="pageNav" tagdir="/WEB-INF/tags" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CartAlbum list</title>

<style type="text/css">
.input-group {
    display: flex;
    align-items: center;
    margin-right: 10px; /* 수량 조절바 여백 추가 */
}

.input-group-prepend,
.input-group-append {
    display: flex;
}

.input-group-prepend button,
.input-group-append button {
    min-width: 40px;
}

.form-control {
    text-align: center;
}

.custom-checkbox {
    transform: scale(1.5); /* 체크박스 크기 조정 */
}

#shopping-cart-title {
    margin-bottom: 20px; /* 제목 아래 여백 추가 */
}

.album-item {
    display: flex;
    align-items: center;
    margin-bottom: 20px;
}

.album-item img {
    height: 200px;
    width: 200px;
    object-fit: cover;
    margin-right: 20px;
}

.album-item p {
    margin: 0 10px;
}

.container {
    padding: 20px;
}

.input-group {
    max-width: 200px;
}

.pagination-container {
    margin-top: 20px;
    display: flex;
    justify-content: center;
}

.pagination-container a {
    margin: 0 5px;
    padding: 10px 15px;
    background-color: #343a40;
    color: white;
    text-decoration: none;
    border-radius: 5px;
}

.pagination-container a:hover {
    background-color: #495057;
}

.pagination-container .active {
    background-color: #495057;
}

.button-group {
    display: flex;
    gap: 10px; /* Gap between buttons */
    margin-top: 20px;
}

</style>

<script type="text/javascript">
$(function() {
	
	$("#delete-albums").click(function () {
		let checkedValues = Array.from($(".checkbox:checked")).map(function (el) { return $(el).parent().find("input[name=cartNo]").val() })
		let checkedValuesString = checkedValues.join(",");
		location = "delete.do?checkedCartNos="+checkedValuesString;
	})
	// 수량 조절
	$(".minus").click(function() {
		// let no = $(".album-item").find(".albumNo").val();<div>내용</div>
		let no = $(this).parent().parent().parent().parent().find("input[name=cartNo]").val()
		// let checkedValues = Array.from($(".checkbox:checked")).map(function (el) { return el.parent().find("input[name=cartNo]").val() })
		// let checkedValuesString = checkedValues.join(","); 
		//alert(no);
		// +"&checkedCartNos="+checkedValuesString
 		location = "minus.do?cartNo="+no;
	});
 	$(".add").click(function() {
		// let no = $(".album-item").find(".albumNo").val();
		let no = $(this).parent().parent().parent().parent().find("input[name=cartNo]").val()
		// let checkedValues = Array.from($(".checkbox:checked")).map(function (el) { return el.parent().find("input[name=cartNo]").val() })
		// let checkedValuesString = checkedValues.join(","); 
		//alert(no);
		// +"&checkedCartNos="+checkedValuesString
 		location = "add.do?cartNo="+no;
 	});
 	$(".checkbox").change(function() {
 		priceOpp();
	});
 	
 	
 	
 	// check box 선택 시에만 가격이 변동되는 event
 	function priceOpp() {
 		let totalPrice = 0;
 		
		$(".checkbox:checked").each(function() {
			let albumItem = $(this).closest(".album-item");
			let albumCnt = albumItem.find(".quantity").val();
			totalPrice += albumItem.find(".price").text()*albumCnt;			
		});
		$("#totalPrice").text(totalPrice);
		let totalShippingCost = (totalPrice>50000)?0:3000;
		$("#shippingCost").text(totalShippingCost);
		$("#totalAmount").text(totalPrice+totalShippingCost);
	}
	
 	$(document).ready(function () {
 		priceOpp();
 	})
 	
});


</script>
</head>
<body>

<!-- 장바구니 목록 표시를 위한 컨테이너 시작 -->
<div class="container">
    <h3 id="shopping-cart-title">장바구니</h3></div> 

<!-- 금액 정보 및 버튼 섹션 -->
<div class="container mt-3">
    <div class="row">
        <div class="col-md-12 d-flex justify-content-between align-items-center">
            <div>
                <c:forEach items="${list}" var="vo">
                    <div class="album-item">
                    	
                        <input type="hidden" name="cartNo" value="${vo.cartNo}">
                        <input type="hidden" name="albumNo" value="${param.albumNo}" class="albumNo">
                        <br>
                        <span style="margin-right: 1em;"><c:out value="${vo.cartNo}"></c:out></span>
                        <input type="checkbox" class="custom-checkbox checkbox" style="margin-right: 1em;">
                        <img alt="" src="${vo.image}">
                        <div>
                            <pre>앨범명 : ${vo.title}</pre>
                            <pre>가격 : <span class="price">${vo.price}</span>원</pre>
                        </div>
                        <!-- 수량 조절 -->
                        <div class="count-class"> 
                            <div class="input-group mr-auto">
                                <div class="input-group-prepend">
                                    <a class="btn btn-outline-secondary btn-subtract minus" 
                                    type="button">-</a>
                                </div>
                                <input type="text" class="form-control quantity-input quantity" 
                                value="${vo.albumCnt}">
                                <div class="input-group-append">
                                    <a class="btn btn-outline-secondary add" 
                                    type="button">+</a>
                                </div>
                                
                            </div>
                        </div> <!-- count-class end -->
                    </div>
                  </c:forEach>
                        <form action="pay.do" method="post">
                <div class="d-flex align-items-center">
                    <div>
                        상품금액 : <span id="totalPrice"></span><br>
                        배송비 : <span id="shippingCost"></span><br>
                        총 주문금액 : <span id="totalAmount"></span><br>
                    </div>
                    <div class="button-group ml-auto">
                            <input type="hidden" name="totalAmount" value="0">
                            <input id="delete-albums" type="button" class="btn btn-dark" value="선택한 항목 삭제">
                            <input type="submit" class="btn btn-dark" value="주문하기">
                       
                    </div>
                </div>
               </form>
            </div>
        </div>
    </div>
</div>

<!-- 페이징 처리를 위한 버튼 -->
<div class="pagination-container">
    <c:if test="${pageObject.currentPage > 1}">
        <a href="cartAlbumList.jsp?page=${pageObject.currentPage - 1}" class="btn btn-dark">이전</a>
    </c:if>
    <c:forEach var="page" begin="1" end="${pageObject.totalPages}">
        <a href="cartAlbumList.jsp?page=${page}" class="btn btn-dark ${page == pageObject.currentPage ? 'active' : ''}">
            ${page}
        </a>
    </c:forEach>
    <c:if test="${pageObject.currentPage < pageObject.totalPages}">
        <a href="cartAlbumList.jsp?page=${pageObject.currentPage + 1}" class="btn btn-dark">다음</a>
    </c:if>
</div>

<!-- 페이지네이션 처리 -->
<div class="container mt-3">
    <div class="row">
        <div>
            <pageNav:pageNav listURI="paylist.do" pageObject="${pageObject}" />
        </div>
    </div>
</div>
</body>
</html>
