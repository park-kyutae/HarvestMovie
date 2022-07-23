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


<div class="container">
    <div class="row">
        <div class="col col-sm-3" onclick="history.go(-1)" style="font-size: medium">
            <img src="${pageContext.request.contextPath}/images/back_arrow.svg"> 리뷰
        </div>
    </div>
    <div class="row d-flex justify-content-center">
        <div class="col col-sm-6" style="font-size: x-large">
            <b>리뷰 작성</b>
        </div>
    </div>
    <div class="row d-flex justify-content-center" style="padding-bottom: 3%">
        <div class="col col-sm-6 p-0 m-0">
            <div class="card-body">
                <div class="input-group">
                    <form action="reviewWrite.do?mv_num=${param.mv_num}" method="post" class="form-control">
                        <textarea name="review_message"
                                  id="review_message" class="w-100 form-control"
                                  rows="15"></textarea>
                        <input type="button" value="취소"
                               onclick="history.go(-1)">
                        <input type="button" value="작성"
                               onclick="location.href='/movie/review/reviewModify.do?mv_num=${param.mv_num}'">
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>
<%--&lt;%&ndash;TODO 평론가 인증 마크 추가&ndash;%&gt;--%>
