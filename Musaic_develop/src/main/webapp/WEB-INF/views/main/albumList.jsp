<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<style>
    .album-container {
        padding: 20px;
    }

    .album-card {
        border: none;
        border-radius: 8px;
        overflow: hidden;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        transition: transform 0.2s, box-shadow 0.2s;
    }

    .album-card:hover {
        transform: translateY(-10px);
        box-shadow: 0 6px 12px rgba(0, 0, 0, 0.2);
    }

    .album-card img {
        width: 100%;
        height: auto;
    }

    .album-card-body {
        padding: 15px;
    }

    .album-card-title {
        font-size: 1.25rem;
        margin-bottom: 0.5rem;
    }

    .album-card-text {
        font-size: 1rem;
        color: #555;
    }

    .album-release-date {
        font-size: 0.875rem;
        color: #888;
    }
            .album-card {
            border: none;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: transform 0.2s, box-shadow 0.2s;
            cursor: pointer; /* 클릭 가능임을 나타내기 위한 커서 스타일 */
        }
         /* 앨범 번호 숨기기 */
        .album-card .album-no {
            display: none; /* 앨범 번호를 숨깁니다 */
        }
                .album-card-price {
            font-weight: bold; /* 가격을 볼드체로 설정 */
            margin-top: 10px; /* 가격과 HR 선 사이에 여백 추가 */
        }

        .album-card-hr {
            margin: 10px 0; /* HR 선과 다른 요소 사이의 여백 설정 */
        }
</style>

<h1 class="text-center mt-5" style="margin-bottom: 50px; color: #9FAED0;">Album</h1><br>

<c:if test="${empty albumList }">
    <div class="jumbotron text-center">
        <h4>데이터가 존재하지 않습니다.</h4>
    </div>
</c:if>

  <c:if test="${!empty albumList }">
        <div class="container album-container">
            <div class="row">
                <c:forEach items="${albumList }" var="vo" varStatus="vs">
                    <c:if test="${(vs.index != 0) && (vs.index % 3 == 0 ) }">
                        </div>
                        <div class="row">
                    </c:if>
                    <div class="col-md-4 mb-4">
                        <div class="card album-card" data-album-no="${vo.albumNo}">
                            <img class="card-img-top" src="${vo.image}" alt="Album image">
                            <div class="card-body album-card-body">
                                <h5 class="card-title album-card-title">
                                    ${vo.title}
                                </h5>
                                <p class="card-text album-card-text">
                                    <span class="album-no">${vo.albumNo}</span> <!-- 앨범 번호 숨기기 -->
                                    ${vo.artist}
                                </p>
                                <hr class="album-card-hr"> <!-- 가격 위에 HR 선 추가 -->
                                <p class="card-text album-card-price">
                                    <span class="price">${vo.price}</span>원 <!-- 가격 표시 -->
                                </p>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </c:if>

 <script type="text/javascript">
        $(document).ready(function() {
            // 가격 포맷 함수
            function formatPrice(price) {
                return Number(price).toLocaleString();
            }

            // 각 가격을 포맷하여 표시
            $('.price').each(function() {
                var unformattedPrice = $(this).text().replace(/,/g, ''); // 기존 가격에서 쉼표 제거
                $(this).text(formatPrice(unformattedPrice)); // 포맷된 가격으로 업데이트
            });
            // 클릭 시 페이지 이동
            $('.album-card').on('click', function() {
                let albumNo = $(this).data('albumNo');
                if (albumNo) {
                    window.location.href = '/album/view.do?no=' + albumNo;
                }
            });
        });
    </script>
