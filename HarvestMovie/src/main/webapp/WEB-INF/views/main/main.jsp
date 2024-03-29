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
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<div class="container-fluid m-0 p-0">
    <div class="row  d-flex justify-content-center mb-5 bg-black">
        <div class="col col-sm-8">
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
                    <c:forEach var="mainVO" items="${mainVOList}" varStatus="status">
                        <c:if test="${status.count ==1}">
                            <div class="carousel-item active">
                                <a href="${pageContext.request.contextPath}/movie/movieDetail.do?mv_num=${mainVO.mv_num}">
                                    <img src="${pageContext.request.contextPath}/upload/${mainVO.mv_main_pic}"
                                         class="d-block w-100">
                                </a>
                            </div>
                        </c:if>
                        <c:if test="${status.count !=1}">
                            <div class="carousel-item">
                                <a href="${pageContext.request.contextPath}/movie/movieDetail.do?mv_num=${mainVO.mv_num}">
                                    <img src="${pageContext.request.contextPath}/upload/${mainVO.mv_main_pic}"
                                         class="d-block w-100"></a>
                            </div>
                        </c:if>
                    </c:forEach>
                </div>
            </div>
        </div>

    </div>

    <div class="row d-flex justify-content-center mb-3">

        <div class="col col-sm-8">

            <div class="row mb-2">
                <div class="col">
                    <span class="fw-bolder fs-3">평점 순위</span>
                </div>

            </div>
            <div class="row g-3">
                <c:forEach var="ratingVO" items="${ratingVOList}">
                    <div class="col col-sm-3">
                        <div class="ratio" style="--bs-aspect-ratio: 140%">
                            <a href="${pageContext.request.contextPath}/movie/movieDetail.do?mv_num=${ratingVO.mv_num}">
                                <img class=" rounded " style="width: 100%; height: 100%"
                                     src="${pageContext.request.contextPath}/upload/${ratingVO.mv_poster}">
                            </a><br>
                        </div>
                        <span class="fs-4">${ratingVO.mv_title}<br></span>
                        <span class="text-secondary fs-6 ">${ratingVO.mv_launch_date} · ${ratingVO.mv_location}<br></span>
                        <img src="${pageContext.request.contextPath}/images/start_small.svg"
                             height="6%"><span class="text-secondary fs-6 align-middle">${ratingVO.avg_rating}</span>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
    <div class="row d-flex justify-content-center mb-3">
        <div class="col col-sm-8">
            <div class="row mb-2">
                <div class="col">
                    <span class="fw-bolder fs-3">SF</span>
                </div>
            </div>
            <div class="row g-3">
                <c:forEach var="genreVO" items="${genreVOList}">
                    <div class="col col-sm-3">

                        <div class="ratio" style="--bs-aspect-ratio: 140%">
                            <a href="${pageContext.request.contextPath}/movie/movieDetail.do?mv_num=${genreVO.mv_num}">
                                <img class=" rounded " style="width: 100%; height: 100%"
                                     src="${pageContext.request.contextPath}/upload/${genreVO.mv_poster}">
                            </a><br>
                        </div>
                        <span class="fs-4">${genreVO.mv_title}<br></span>
                        <span class="text-secondary fs-6 ">${genreVO.mv_launch_date} · ${genreVO.mv_location}<br></span>
                        <img src="${pageContext.request.contextPath}/images/start_small.svg"
                             height="6%"><span class="text-secondary fs-6 align-middle">${genreVO.avg_rating}</span>
                    </div>
                </c:forEach>
            </div>
        </div>
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
<%--    <a href="${pageContext.request.contextPath}/movie/movieDetail.do?mv_num=${genreVO.mv_num}"><img--%>
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
<%--    <a href="${pageContext.request.contextPath}/movie/movieDetail.do?mv_num=${ratingVO.mv_num}"><img--%>
<%--            src="${pageContext.request.contextPath}/upload/${ratingVO.mv_poster}"></a><br>--%>
<%--</c:forEach>--%>
<%--</span>--%>