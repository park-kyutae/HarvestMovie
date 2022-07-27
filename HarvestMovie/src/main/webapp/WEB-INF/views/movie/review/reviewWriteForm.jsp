<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
            crossorigin="anonymous"></script>
    <title>리뷰 작성</title>
    <script type="text/javascript"></script>
</head>
<body>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<div class="container">
    <div class="row">
        <a class="text-decoration-none text-dark" href="/movie/review/reivew.do?mv_num=${param.mv_num}">
            <div class="col col-sm-3 fs-5"  style="font-size: medium">
                <img height="60%" src="${pageContext.request.contextPath}/images/back_arrow.svg"><span
                    class="align-middle">리뷰 작성</span>
            </div>
        </a>
    </div>
    <div class="row d-flex justify-content-center mb2">
        <div class="col col-sm-6" style="font-size: x-large">
            <span class="fs-4 fw-bolder">리뷰 작성</span>
        </div>
    </div>
    <div class="row d-flex justify-content-center" style="padding-bottom: 3%">
        <div class="col col-sm-6 p-0 m-0">
            <div class="card-body">
                <div class="input-group">
                    <form action="reviewWrite.do?mv_num=${param.mv_num}&rv_user_num=${param.rv_user_num}" method="post" class="form-control p-3">
                        <textarea name="review_message"
                                  id="review_message" class="w-100 form-control mb-2"
                                  rows="15"></textarea>
                        <div class="d-flex justify-content-end">
                            <input type="button" value="취소" class="btn btn-outline-secondary mx-2"
                                                                       onclick="history.go(-1)">
                            <input type="submit" value="작성" class="btn btn-secondary"                                   ></div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>
