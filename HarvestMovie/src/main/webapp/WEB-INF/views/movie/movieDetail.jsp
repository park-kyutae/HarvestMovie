
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>영화 상세 페이지</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/movieDetail.js"></script>
</head>
<body>
메인 이미지 <br>
<img src="${pageContext.request.contextPath}/upload/${movieVO.mv_main_pic}"><br>
포스터<br>
<img src="${pageContext.request.contextPath}/upload/${movieVO.mv_poster}"><br>
제목<br>
${movieVO.mv_title}<br>
연령제한<br>
${movieVO.mv_limit_age}<br>
장르<br>
${movieVO.mv_genre}<br>
제작 지역<br>
${movieVO.mv_location}<br>
개봉일<br>
${movieVO.mv_launch_date}<br>
줄거리<br>
${movieVO.mv_summary}<br>
평점<br>
${movieVO.avg_rating}<br>
사진들<br>
<c:forEach var="pic" items="${movieVO.mv_pic}">
    <img src="${pageContext.request.contextPath}/upload/${pic}"><br>

</c:forEach>
예고편 <br>
<c:forEach var="trailer" items="${movieVO.mv_trailer}">
    <iframe width="560" height="315" src="https://www.youtube.com/embed/${trailer}" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
</c:forEach>
<br><br><br>
<input type="hidden" value="${movieVO.mv_num}" id="mv_num">
<img src="${pageContext.request.contextPath}/images/start_blank.jpg" id="0.5" class="mv_star" width="100px">
<img src="${pageContext.request.contextPath}/images/start_blank_reverse.jpg" id="1" class="mv_star" width="100px">
<img src="${pageContext.request.contextPath}/images/start_blank.jpg" id="1.5" class="mv_star" width="100px">
<img src="${pageContext.request.contextPath}/images/start_blank_reverse.jpg" id="2" class="mv_star" width="100px">
<img src="${pageContext.request.contextPath}/images/start_blank.jpg" id="2.5" class="mv_star" width="100px">
<img src="${pageContext.request.contextPath}/images/start_blank_reverse.jpg" id="3" class="mv_star" width="100px">
<img src="${pageContext.request.contextPath}/images/start_blank.jpg" id="3.5" class="mv_star" width="100px">
<img src="${pageContext.request.contextPath}/images/start_blank_reverse.jpg" id="4" class="mv_star" width="100px">
<img src="${pageContext.request.contextPath}/images/start_blank.jpg" id="4.5" class="mv_star" width="100px">
<img src="${pageContext.request.contextPath}/images/start_blank_reverse.jpg" id="5" class="mv_star" width="100px">
<br><br>
<img src="${pageContext.request.contextPath}/images/will_watch.png" id="mv_will_watch">

리뷰
<a href="/movie/review/review.do?mv_num=${movieVO.mv_num}">리뷰 작성하기</a><br>
리뷰 목록
<c:forEach var="reviewVO" items="${reviewVOList}">
    ${reviewVO.review_message}
</c:forEach>

<br><br>



</body>
</html>
