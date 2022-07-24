<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    <title>영화 상세 페이지</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/movieDetail.js"></script>
    <!-- JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
            crossorigin="anonymous"></script>
</head>
<body>
<input type="hidden" value="${movieVO.mv_num}" id="mv_num">
<div class="container-fluid">
    <div class="row">
        <div class="col col-sm-12 ratio"
             style="--bs-aspect-ratio: 30%;background: url(${pageContext.request.contextPath}/upload/${movieVO.mv_main_pic});background-size: cover">
        </div>
    </div>
    <div class="row  d-flex justify-content-center border-bottom" style="background: whitesmoke">
        <div class="col-sm-2 position-relative d-flex justify-content-center">
            <img src="${pageContext.request.contextPath}/upload/${movieVO.mv_poster}"
                 class="ratio position-absolute border border-2 border-white"
                 style="bottom: 5%;--bs-aspect-ratio: 100%; width: 71%"><br>
        </div>
        <div class="col-sm-7">
            <div class="row">
                <div class=" col-sm-7">
                    <div class="ratio" style="--bs-aspect-ratio: 50%">
                        <div>
                            <span class="fs-1 fw-bolder mb-0">${movieVO.mv_title}</span><span
                                class="text-secondary"> ${movieVO.mv_limit_age}세<br></span>
                            <span class="text-secondary my-2">${movieVO.mv_launch_date}<br>
                                ${movieVO.mv_genre} · ${movieVO.mv_location}<br>
                            </span>
                            <img src="${pageContext.request.contextPath}/images/start_small.svg"
                                 height="12%"><span class="fs-5 align-middle">${movieVO.avg_rating}
                        </span>

                        </div>
                    </div>


                </div>
                <div class="col-sm-5">
                    <div class="row">
                        <div class="col d-flex justify-content-end mb-2 mt-4">
                            <img src="${pageContext.request.contextPath}/images/star_blank.png" id="0.5"
                                 class="mv_star"
                                 width="6%">
                            <img src="${pageContext.request.contextPath}/images/star_blank_reverse.png" id="1"
                                 class="mv_star" width="6%">
                            <img src="${pageContext.request.contextPath}/images/star_blank.png" id="1.5"
                                 class="mv_star"
                                 width="6%">
                            <img src="${pageContext.request.contextPath}/images/star_blank_reverse.png" id="2"
                                 class="mv_star" width="6%">
                            <img src="${pageContext.request.contextPath}/images/star_blank.png" id="2.5"
                                 class="mv_star"
                                 width="6%">
                            <img src="${pageContext.request.contextPath}/images/star_blank_reverse.png" id="3"
                                 class="mv_star" width="6%">
                            <img src="${pageContext.request.contextPath}/images/star_blank.png" id="3.5"
                                 class="mv_star"
                                 width="6%">
                            <img src="${pageContext.request.contextPath}/images/star_blank_reverse.png" id="4"
                                 class="mv_star" width="6%">
                            <img src="${pageContext.request.contextPath}/images/star_blank.png" id="4.5"
                                 class="mv_star"
                                 width="6%">
                            <img src="${pageContext.request.contextPath}/images/star_blank_reverse.png" id="5"
                                 class="mv_star" width="6%">

                        </div>
                    </div>
                    <div class="row">
                        <div class="col  d-flex justify-content-end mb-2">
                            <img src="${pageContext.request.contextPath}/images/unchecked.svg"
                                 id="mv_will_watch"
                                 width="10%">
                            <span class="fs-4">보고싶어요</span>
                        </div>

                    </div>
                    <div class="row">
                        <div class="col  d-flex justify-content-end">
                            <form action="movieModifyMain.do?mv_num=${movieVO.mv_num}" method="post">
                                <input type="number" id="mv_main_list_num" name="mv_main_list_num" max="3" min="1"
                                       class="form-control" required>
                                <input type="submit" class="btn btn-secondary btn-sm" value="메인 영화">
                            </form>
                        </div>

                    </div>
                    <div class="row  d-flex justify-content-end">
                        <div class="col  d-flex justify-content-end">
                            <button type="button" class="btn btn-outline-secondary btn-sm mx-2"
                                    onclick="location.href='/movie/movieModifyForm.do?mv_num=${movieVO.mv_num}'">수정
                            </button>
                            <button type="button" class="btn btn-danger btn-sm"
                                    onclick="location.href='/movie/movieDelete.do?mv_num=${movieVO.mv_num}'">삭제
                            </button>
                        </div>
                    </div>
                </div>

            </div>

        </div>
    </div>
    <div class=" row justify-content-center mt-4 mb-5">
        <div class="col col-sm-6">
            <div class="fs-4 fw-bolder mb-2">기본정보<br></div>
            <div class="mx-1 text-secondary">${movieVO.mv_launch_date} · ${movieVO.mv_genre}
                · ${movieVO.mv_location}<br></div>
            <div class="mb-2 mx-1 text-secondary">${movieVO.mv_runningtime}분 · ${movieVO.mv_limit_age}세<br></div>
            <p class="mx-1 text-break">${movieVO.mv_summary}</p>


        </div>
        <div class="col col-sm-2">
            <c:forEach var="staff_job" items="${movieVO.mv_staff_info}">
                <span class="fw-bolder">${staff_job.key}<br></span>
                <span class="text-secondary">
                <c:forEach var="staff_name" items="${staff_job.value}" varStatus="status">
                    ${staff_name}<c:if test="${status.count!=1}">,</c:if>
                    <br>
                </c:forEach>
                </span>
            </c:forEach>
        </div>
    </div>
    <div class="row justify-content-center mb-3">
        <div class="col col-sm-8">
            <div class="row mb-2">
                <div class="col">
                    <span class="fs-4 fw-bolder">리뷰</span>
                </div>
                <a class="fs-5 text-secondary col col-sm-3 d-flex justify-content-end m-1 text-decoration-none "
                   href="/movie/review/review.do?mv_num=${movieVO.mv_num}">
                    더 보기
                </a>
            </div>
            <div class="row">
                <c:forEach var="reviewVO" items="${reviewVOList}">
                    <div class="col mx-3 rounded" style="background: #f2f2f2">
                        <a href="/movie/review/review.do?mv_num=${movieVO.mv_num}"
                           class="text-decoration-none text-black">

                            <div class="ratio fs-5 my-2 mx-2" style="height: 10%">${reviewVO.mem_name}</div><c:if test="${reviewVO.isCritic == 'true'}">
                            <img src="${pageContext.request.contextPath}/images/critic.svg" width="5%"></c:if>
                            <div class="ratio border-top border-secondary" style="--bs-aspect-ratio: 90%">
                                <span class="fs-6 mx-2">${reviewVO.review_message}</span>
                            </div>
                        </a>

                    </div>
                </c:forEach>
            </div>
        </div>

    </div>


    <div class="row justify-content-center d-flex mb-3">
        <div class="col col-sm-8">
            <div class="row mb-2">
                <div class="col">
                    <span class="fs-4 fw-bolder">사진들</span>
                </div>
            </div>
            <div class="row row-cols-3">
                <c:forEach var="pic" items="${movieVO.mv_pic}" varStatus="status">
                    <div class="col">
                        <img src="${pageContext.request.contextPath}/upload/${pic}" class="w-100 "
                             data-bs-toggle="modal" data-bs-target="#mv_pic_modal_${status.index}">
                    </div>
                    <div class="modal fade" id="mv_pic_modal_${status.index}" tabindex="-1" aria-hidden="true">
                        <div class="modal-dialog modal-fullscreen">
                            <div class="modal-content">

                                <div class="modal-header">
                                    <h5 class="modal-title" id="staticBackdropLabel">${movieVO.mv_title}</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                                            aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <div class="container-fluid">
                                        <div class="row">
                                            <div class="col">
                                                <img src="${pageContext.request.contextPath}/upload/${pic}"
                                                     data-bs-toggle="modal"
                                                     data-bs-target="#mv_pic_modal_${status.index}"
                                                     width="100%"><br>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
            <%--        TODO 예고편 max처리 하던지 스크롤 추가하던지--%>
        </div>

    </div>
    <div class="row justify-content-center d-flex">
        <div class="col col-sm-8">
            <div class="row">
                <div class="col">
                    <span class="fs-4 fw-bolder">예고편</span>
                </div>
            </div>
            <div class="row row-cols-2">
                <c:forEach var="trailer" items="${movieVO.mv_trailer}">
                    <div class="col">
                        <div class="ratio ratio-16x9">
                            <iframe src="https://www.youtube.com/embed/${trailer}" title="YouTube video"
                                    allowfullscreen></iframe>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</div>
</div>

</div>
<%--<input type="hidden" value="${movieVO.mv_num}" id="mv_num">--%>

<%--<div class="w-100 ratio "--%>
<%--     style="--bs-aspect-ratio: 25%;background: url(${pageContext.request.contextPath}/upload/${movieVO.mv_main_pic});background-size: cover">--%>
<%--</div>--%>
<%--<div class="w-100 ratio" style="--bs-aspect-ratio: 15%">--%>
<%--    <div class="container-fluid bg-light">--%>
<%--        <div class="row d-flex justify-content-center">--%>
<%--            <div class="col-sm-2 position-relative">--%>
<%--                <img src="${pageContext.request.contextPath}/upload/${movieVO.mv_poster}"--%>
<%--                     class="ratio position-absolute" style="bottom: 20%;--bs-aspect-ratio: 100%; width: 71%"><br>--%>
<%--            </div>--%>
<%--            <div class="col-sm-7">--%>
<%--                <div class="row">--%>
<%--                    <div class=" col-sm-7">--%>
<%--                        <div class="ratio" style="--bs-aspect-ratio: 50%">--%>
<%--                            <div>--%>
<%--                                ${movieVO.mv_title} ${movieVO.mv_limit_age}<br>--%>
<%--                                ${movieVO.mv_launch_date} · ${movieVO.mv_genre} · ${movieVO.mv_location}<br>--%>
<%--                                ${movieVO.avg_rating}--%>
<%--                            </div>--%>
<%--                        </div>--%>


<%--                    </div>--%>
<%--                    <div class="col-sm-5">--%>
<%--                        <div class="row">--%>
<%--                            <div class="col  d-flex justify-content-end">--%>
<%--                                <img src="${pageContext.request.contextPath}/images/star_blank.png" id="0.5"--%>
<%--                                     class="mv_star"--%>
<%--                                     width="8%">--%>
<%--                                <img src="${pageContext.request.contextPath}/images/star_blank_reverse.png" id="1"--%>
<%--                                     class="mv_star" width="8%">--%>
<%--                                <img src="${pageContext.request.contextPath}/images/star_blank.png" id="1.5"--%>
<%--                                     class="mv_star"--%>
<%--                                     width="8%">--%>
<%--                                <img src="${pageContext.request.contextPath}/images/star_blank_reverse.png" id="2"--%>
<%--                                     class="mv_star" width="8%">--%>
<%--                                <img src="${pageContext.request.contextPath}/images/star_blank.png" id="2.5"--%>
<%--                                     class="mv_star"--%>
<%--                                     width="8%">--%>
<%--                                <img src="${pageContext.request.contextPath}/images/star_blank_reverse.png" id="3"--%>
<%--                                     class="mv_star" width="8%">--%>
<%--                                <img src="${pageContext.request.contextPath}/images/star_blank.png" id="3.5"--%>
<%--                                     class="mv_star"--%>
<%--                                     width="8%">--%>
<%--                                <img src="${pageContext.request.contextPath}/images/star_blank_reverse.png" id="4"--%>
<%--                                     class="mv_star" width="8%">--%>
<%--                                <img src="${pageContext.request.contextPath}/images/star_blank.png" id="4.5"--%>
<%--                                     class="mv_star"--%>
<%--                                     width="8%">--%>
<%--                                <img src="${pageContext.request.contextPath}/images/star_blank_reverse.png" id="5"--%>
<%--                                     class="mv_star" width="8%">--%>

<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <div class="row">--%>
<%--                            <div class="col  d-flex justify-content-end">--%>
<%--                                <img src="${pageContext.request.contextPath}/images/unchecked.svg"--%>
<%--                                     id="mv_will_watch"--%>
<%--                                     width="15%">보고싶어요--%>
<%--                            </div>--%>

<%--                        </div>--%>
<%--                    </div>--%>

<%--                </div>--%>
<%--            </div>--%>

<%--        </div>--%>

<%--        <div class=" row justify-content-center">--%>
<%--            <div class="col col-sm-7">--%>
<%--                <h4>기본정보</h4>--%>
<%--                ${movieVO.mv_summary}<br>--%>
<%--                ${movieVO.mv_launch_date} · ${movieVO.mv_genre} · ${movieVO.mv_location}<br>--%>
<%--                ${movieVO.mv_runningtime} · ${movieVO.mv_limit_age}--%>

<%--            </div>--%>
<%--            <div class="col col-sm-2">--%>
<%--                <c:forEach var="staff_job" items="${movieVO.mv_staff_info}">--%>
<%--                    ${staff_job.key}<br>--%>
<%--                    <c:forEach var="staff_name" items="${staff_job.value}">--%>
<%--                        ${staff_name},--%>
<%--                        <br>--%>
<%--                    </c:forEach>--%>
<%--                </c:forEach>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--        <div class="row">--%>
<%--            <div class="col col-sm-12">--%>
<%--                <c:forEach var="reviewVO" items="${reviewVOList}">--%>
<%--                    ${reviewVO.review_message}--%>
<%--                </c:forEach>--%>
<%--                &lt;%&ndash;                TODO 리뷰 없을떄 처리&ndash;%&gt;--%>
<%--            </div>--%>

<%--        </div>--%>
<%--        <div class="row">--%>
<%--            <h4>영화 사진</h4>--%>
<%--            <c:forEach var="pic" items="${movieVO.mv_pic}">--%>
<%--                <div class="col col-sm-4">--%>
<%--                    <img src="${pageContext.request.contextPath}/upload/${pic}" width="100%"><br>--%>
<%--                </div>--%>
<%--            </c:forEach>--%>
<%--            <h4>예고편</h4>--%>
<%--            <c:forEach var="trailer" items="${movieVO.mv_trailer}">--%>
<%--                <div class="col col-sm-4">--%>
<%--                    <div class="ratio ratio-16x9">--%>
<%--                        <iframe src="https://www.youtube.com/embed/${trailer}" title="YouTube video" allowfullscreen></iframe>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </c:forEach>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>


<%--<br>--%>
<%--<div class="row w-100 bg-light ratio m-0 p-0" style="--bs-aspect-ratio: 15%;">--%>
<%--    <div class="d-flex  justify-content-center p-0 m-0">--%>
<%--        <div class="w-75  row">--%>
<%--            <div class="ratio col-md-4 " style="bottom:10% ;width: 15%; --bs-aspect-ratio: 140%">--%>
<%--            </div>--%>
<%--            <div class="col-md-8">--%>
<%--                <div></div>--%>
<%--                <div class="self-align-right">--%>

<%--                </div>--%>


<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>

<%--</div>--%>

<%--메인 이미지 <br>--%>
<%--포스터<br>--%>
<%--제목<br>--%>
<%--연령제한<br>--%>
<%--장르<br>--%>
<%--제작 지역<br>--%>
<%--개봉일<br>--%>
<%--줄거리<br>--%>
<%--${movieVO.mv_summary}<br>--%>
<%--평점<br>--%>
<%--스태프--%>

<%--사진들<br>--%>
<%--
<%--<br><br><br>--%>

<%--<br><br>--%>

<%--리뷰--%>
<%--<a href="/movie/review/review.do?mv_num=${movieVO.mv_num}">리뷰 상세</a><br>--%>
<%--리뷰 목록--%>


<%--<br><br>--%>
<%-------------------------------관리자 기능--------------------------------------------------------%>
<%--<br><br>--%>


</body>
</html>









