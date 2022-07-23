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
    <script type="text/javascript"></script>
</head>
<body>

<div class="container">
    <div class="row">
        <div class="col col-sm-3" onclick="history.go(-1)" style="font-size: medium">
            <img src="${pageContext.request.contextPath}/images/back_arrow.svg"> 코멘트
        </div>
    </div>
    <c:if test="${myReviewVO.mem_num > 0}">
        <div class="row d-flex justify-content-center">
            <div class="col col-sm-6" style="font-size: x-large">
                <b>내 리뷰</b>
            </div>
        </div>
        <div class="row d-flex justify-content-center" style="padding-bottom: 3%">
            <div class="col col-sm-6 card">
                <div class=" card-body ">
                    <h5 class="card-title">${myReviewVO.mem_id}</h5>
                    <p class="card-text">${myReviewVO.review_message}</p>
                    <input type="button" value="수정"
                           onclick="location.href='/movie/review/reviewModifyForm.do?mv_num=${param.mv_num}'">
                    <input type="button" value="삭제"
                           onclick="location.href='/movie/review/reviewDelete.do?mv_num=${param.mv_num}'">
                </div>
            </div>
        </div>
    </c:if>
    <div class="row d-flex justify-content-center py-3 px-0 ">
        <div class="col col-sm-6 d-flex justify-content-end">
                <input type="button" value="리뷰 작성"
                       onclick="location.href='/movie/review/reviewWriteForm.do?mv_num=${param.mv_num}'">

        </div>
    </div>
    <c:forEach var="reviewVO" items="${reviewVOList}">
        <c:if test="${reviewVO.mem_num != 0}">
            <div class="row d-flex justify-content-center">
                <div class="card col col-sm-6 ">
                    <div class="card-body">
                        <h5 class="card-title">${reviewVO.mem_id}</h5>
                        <p class="card-text">${reviewVO.review_message}</p>
                        <input type="button" value="삭제">
                    </div>
                </div>
            </div>
        </c:if>
    </c:forEach>
</div>

</body>
</html>
<%--&lt;%&ndash;TODO 평론가 인증 마크 추가&ndash;%&gt;--%>
