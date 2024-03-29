<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
            crossorigin="anonymous"></script>
    <title>리뷰</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>

    <script type="text/javascript" src="${pageContext.request.contextPath}/js/review.js"></script>

</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<input type="hidden" value="${param.mv_num}" id="mv_num">

<div class="container">
    <div class="row">
        <a href="${pageContext.request.contextPath}/movie/movieDetail.do?mv_num=${param.mv_num}" class="text-decoration-none text-dark">
            <div class="col col-sm-3 fs-5" style="font-size: medium">
                <img height="60%" src="${pageContext.request.contextPath}/images/back_arrow.svg">
                <span class="align-middle">코멘트</span>
            </div>
        </a>
    </div>
    <c:if test="${myReviewVO.user_num > 0}">
        <div class="row d-flex justify-content-center mb-2">
            <div class="col col-sm-6" style="font-size: x-large">
                <span class="fs-4 fw-bolder">내 리뷰</span>
            </div>
        </div>
        <div class="row d-flex justify-content-center" style="padding-bottom: 3%">
            <div class="col col-sm-6 card">
                <div class=" card-body ">
                    <h5 class="card-title">${myReviewVO.mem_name}
                        <c:if test="${myReviewVO.isCritic == 'true'}">
                            <img src="${pageContext.request.contextPath}/images/critic.svg" width="5%"></c:if></h5>
                    <p class="card-text">${myReviewVO.review_message}</p>
                    <div class="d-flex justify-content-end">
                        <input type="button" value="수정" class="btn btn-outline-secondary mx-2"
                               onclick="location.href='${pageContext.request.contextPath}/movie/review/reviewModifyForm.do?mv_num=${param.mv_num}'">
                        <input type="button" value="삭제" class="btn btn-secondary"
                               onclick="location.href='${pageContext.request.contextPath}/movie/review/reviewDelete.do?mv_num=${param.mv_num}&rv_user_num=${myReviewVO.user_num}'">
                    </div>
                </div>
            </div>
        </div>
    </c:if>

    <div class="row d-flex justify-content-center mb-2">
        <div class="col col-sm-6" style="font-size: x-large">
            <span class="fs-4 fw-bolder">리뷰</span>
        </div>
    </div>
    <c:if test="${memberVO.auth > 0}">
    <div class="row d-flex justify-content-center my-1 mx-0">
        <div class="col col-sm-6 d-flex justify-content-end p-0 m-0">
            <input type="button" value="리뷰 작성" class="btn btn-secondary"
                   onclick="location.href='${pageContext.request.contextPath}/movie/review/reviewWriteForm.do?mv_num=${param.mv_num}'">

        </div>
    </div>
    </c:if>
    <c:forEach var="reviewVO" items="${reviewVOList}">
            <div class="row d-flex justify-content-center mb-3">
                <div class="card col col-sm-6 ">
                    <div class="card-body">
                        <h5 class="card-title">${reviewVO.mem_name}<c:if test="${reviewVO.isCritic == 'true'}">
                            <img src="${pageContext.request.contextPath}/images/critic.svg" width="4%"></c:if></h5>
                        <p class="card-text">${reviewVO.review_message}</p>
                        <div class="d-flex justify-content-end">
                            <c:if test="${memberVO.auth ==9}">

                            <input type="button" value="삭제" class="btn btn-secondary"
                                   onclick="location.href='${pageContext.request.contextPath}/movie/review/reviewDelete.do?mv_num=${param.mv_num}&rv_user_num=${reviewVO.user_num}'">
                            </c:if>

                        </div>
                    </div>
                </div>
            </div>
    </c:forEach>
    <c:if test="${!empty reviewVOList}">
        <div class="row d-flex justify-content-center mb-5" id="test">
            <div class="col col-6 d-flex justify-content-center">
                <span id="review_more" class="fs-5 text-secondary" style="cursor: pointer">더 보기</span>
            </div>
        </div>
    </c:if>
    <c:if test="${empty reviewVOList}">
        <div class="row d-flex justify-content-center mb-5" id="test">
            <div class="col col-6 d-flex justify-content-center">
                <span class="fs-5 text-secondary" style="cursor: pointer">리뷰가 없습니다.</span>
            </div>
        </div>
    </c:if>
</div>

</body>
</html>
