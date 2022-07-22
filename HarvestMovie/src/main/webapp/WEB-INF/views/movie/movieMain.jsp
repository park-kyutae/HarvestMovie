<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
            crossorigin="anonymous"></script>
    <title>Harvest Movie</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<%--    <script type="text/javascript" src="${pageContext.request.contextPath}/js/movieDetail.js"></script>--%>
</head>
<body>

<div class="container-fluid">
    <div class="row bg-dark  d-flex justify-content-center">
        <div class="col col-sm-9">
            <div id="main_movie_carousel" class="carousel slide" data-bs-ride="true">
                <div class="carousel-indicators">
                    <button type="button" data-bs-target="#main_movie_carousel" data-bs-slide-to="0" class="active"
                            aria-current="true" aria-label="Slide 1"></button>
                    <button type="button" data-bs-target="#main_movie_carousel" data-bs-slide-to="1"
                            aria-label="Slide 2"></button>
                    <button type="button" data-bs-target="#main_movie_carousel" data-bs-slide-to="2"
                            aria-label="Slide 3"></button>
                </div>
                <div class="carousel-inner">
                    <c:forEach var="mainVO" items="${mainVOList}">
                        <div class="carousel-item active">
                            <img src="${pageContext.request.contextPath}/upload/${mainVO.mv_main_pic}"
                                 class="d-block w-100">
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>

    </div>
    <div class="row">
        <div class="row">
            <div class="col">
                <h4>평점</h4>
            </div>
        </div>rr
        <div class="row">
            <c:forEach var="ratingVO" items="${ratingVOList}">
                <div class="col col-sm-2">
                    <a href="/movie/movieDetail.do?mv_num=${ratingVO.mv_num}"><img class="ratio"
                                                                                   src="${pageContext.request.contextPath}/upload/${ratingVO.mv_poster}"
                                                                                   style="--bs-aspect-ratio: 100%" ;
                                                                                   width="71%"></a><br>
                        ${ratingVO.mv_title}<br>
                        ${ratingVO.mv_launch_date} · ${ratingVO.mv_location}<br>
                        ${ratingVO.avg_rating}
                </div>
            </c:forEach></div>
    </div>
    <div class="row d-flex justify-content-center">
        <div class="row">
            <div class="col">
<h4>장르</h4>
            </div>
        </div>
        <div class="row">
            <c:forEach var="genreVO" items="${genreVOList}">
            <div class="col col-sm-2">
                <a href="/movie/movieDetail.do?mv_num=${genreVO.mv_num}"><img class="ratio"
                                                                              src="${pageContext.request.contextPath}/upload/${genreVO.mv_poster}"
                                                                              style="--bs-aspect-ratio: 100%" ;
                                                                              width="71%"></a><br>
                    ${genreVO.mv_title}<br>
                    ${genreVO.mv_launch_date} · ${genreVO.mv_location}<br>
                    ${genreVO.avg_rating}
            </div>
        </c:forEach></div>
    </div>

</div>


</body>
</html>


<%--메인 <br>--%>

<%--장르--%>
<%--<span id="genre_span">--%>
<%--<c:forEach var="genreVO" items="${genreVOList}">--%>
<%--    제목<br>--%>
<%--    ${genreVO.mv_title}<br>--%>
<%--    개봉일<br>--%>
<%--    ${genreVO.mv_launch_date}<br>--%>
<%--    지역<br>--%>
<%--    ${genreVO.mv_location}<br>--%>
<%--    평점 <br>--%>
<%--    ${genreVO.avg_rating}<br>--%>
<%--    <a href="/movie/movieDetail.do?mv_num=${genreVO.mv_num}"><img--%>
<%--            src="${pageContext.request.contextPath}/upload/${genreVO.mv_poster}"></a><br>--%>
<%--</c:forEach>--%>
<%--    <br><br><br>-------------------별점---------------<br><br><br>--%>
<%--<c:forEach var="ratingVO" items="${ratingVOList}">--%>
<%--    제목<br>--%>
<%--    ${ratingVO.mv_title}<br>--%>
<%--    개봉일<br>--%>
<%--    ${ratingVO.mv_launch_date}<br>--%>
<%--    지역<br>--%>
<%--    ${ratingVO.mv_location}<br>--%>
<%--    평점 <br>--%>
<%--    ${ratingVO.avg_rating}<br>--%>
<%--    <a href="/movie/movieDetail.do?mv_num=${ratingVO.mv_num}"><img--%>
<%--            src="${pageContext.request.contextPath}/upload/${ratingVO.mv_poster}"></a><br>--%>
<%--</c:forEach>--%>
<%--</span>--%>