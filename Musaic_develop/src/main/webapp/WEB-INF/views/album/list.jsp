<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="pageNav"  tagdir="/WEB-INF/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>앨범 리스트</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style type="text/css">
/* 기본 스타일 */
.dataRow:hover {
    opacity: 0.8;
    cursor: pointer;
}

.imageDiv {
   
    width: 40%;
}

.title {
    height: 60px;
}

.card {
    margin-bottom: 20px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    transition: transform 0.2s;
    display: flex;
    flex-direction: row;
    align-items: center;
    padding: 10px;
}

.card:hover {
    transform: scale(1.05);
}

.card-body h5 {
    font-weight: bold;
}

.card-body p {
    font-size: 1.1em;
}

.jumbotron {
    text-align: center;
    background-color: #f8f9fa;
}

.input-group-text {
    background-color: #007bff;
    color: white;
}

.float-right {
    float: right !important;
}
</style>
<script type="text/javascript">
$(function() {
    // 제목 해당 태그 중 제일 높은 것을 이용하여 모두 맞추기
    let titleHeights = [];

    $(".title").each(function(idx, title) {
        titleHeights.push($(title).height());
    });

    let maxTitleHeight = Math.max.apply(null, titleHeights);
    $(".title").height(maxTitleHeight);

    // 이미지 사이즈 조정 5:4
    let imgWidth = $(".imageDiv:first").width();
    let height = imgWidth / 5 * 4;
    $(".imageDiv").height(height);

    $(".imageDiv > img").each(function(idx, image) {
        if ($(image).height() > height) {
            let image_width = $(image).width();
            let image_height = $(image).height();
            let width = height / image_height * image_width;

            $(image).height(height);
            $(image).width(width);
        }
    });

    // 이벤트 처리
    $(".dataRow").click(function() {
        let no = $(this).find(".no").text();
        location = "view.do?no=" + no + "&${pageObject.pageQuery}";
    });

    $("#perPageNum").change(function() {
        $("#searchForm").submit();
    });

    // 검색 데이터 세팅
    $("#key").val("${(empty pageObject.key)?'t':pageObject.key}");
    $("#perPageNum").val("${(empty pageObject.perPageNum)?'10':pageObject.perPageNum}");
});
</script>
</head>
<body>
<div class="container">
    <h1>앨범 리스트</h1>
    <form action="list.do" id="searchForm">
        <input name="page" value="1" type="hidden">
        <div class="row mb-3">
            <div class="col-md-8">
                <div class="input-group">
                    <div class="input-group-prepend">
                        <select name="key" id="key" class="form-control">
                            <option value="t">제목</option>
                            <option value="c">내용</option>
                            <option value="tc">제목/내용</option>
                            <option value="f">파일명</option>
                        </select>
                    </div>
                    <input type="text" class="form-control" placeholder="검색" id="word" value="${pageObject.word}" name="word">
                    <div class="input-group-append">
                        <button class="btn btn-outline-primary">검색</button>
                    </div>
                </div>
            </div>
            <div class="col-md-2 float-right">
            </div>
            <div class="col-md-2 float-right">
                <div class="input-group float-right">
                    <div class="input-group-prepend">
                        <span class="input-group-text">Rows/Page</span>
                    </div>
                    <select id="perPageNum" name="perPageNum" class="form-control">
                        <option selected="selected">6</option>
                        <option>9</option>
                        <option>12</option>
                        <option>18</option>
                    </select>
                </div>
            </div>
        </div>
    </form>
    <c:if test="${empty list}">
        <div class="jumbotron">
            <h4>데이터가 존재하지 않습니다.</h4>
        </div>
    </c:if>
    <c:if test="${!empty list}">
        <div class="row">
            <c:forEach items="${list}" var="vo" varStatus="vs">
                <c:if test="${(vs.index != 0) && (vs.index % 2 == 0)}">
                    ${"</div><div class='row'>"}
                </c:if>
                <div class="col-md-6 dataRow">
                    <div class="card">
                        <div class="imageDiv text-center align-content-center">
                            <img class="card-img-top  float-left" src="${vo.image}" alt="image">
                        </div>
                        <div class="card-body">
                            <h5 class="card-title">
                            </h5>
                                <span class="float-left">${vo.title}</span> <br>
                                <span class="float-left">${vo.artist}</span><br>
                                <span class="float-left">${vo.release_date}</span><br>
                            <p class="card-text text-truncate title">
                                <span class="no">${vo.albumNo}</span>. 
                            </p>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </c:if>
    <div>
        <pageNav:pageNav listURI="list.do" pageObject="${pageObject}"></pageNav:pageNav>
    </div>
    <c:if test="${!empty login}">
        <a href="writeForm.do?perPageNum=${pageObject.perPageNum}">
            <button class="btn btn-primary">등록</button>
        </a>
    </c:if>
</div>
</body>
</html>
