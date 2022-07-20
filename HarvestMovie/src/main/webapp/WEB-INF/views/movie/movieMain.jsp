
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Harvest Movie</title>
</head>
<body>
메인 <br>
<c:forEach var="mainVO" items="${mainVOList}">
    <a href="movieModifyMain.do?mv_num=${param.mv_num}"><img src="${pageContext.request.contextPath}/upload/${mainVO.mv_main_pic}"></a>
</c:forEach>

<br><br><br>

장르
<span id="genre_span">
<c:forEach var="genreVO" items="${genreVOList}">
    제목<br>
    ${genreVO.mv_title}<br>
    개봉일<br>
    ${genreVO.mv_launch_date}<br>
    지역<br>
    ${genreVO.mv_location}<br>
    평점 <br>
    ${genreVO.avg_rating}<br>
    <a href="/movie/movieDetail.do?mv_num=${genreVO.mv_num}"><img
            src="${pageContext.request.contextPath}/upload/${genreVO.mv_poster}"></a><br>
</c:forEach>
    <br><br><br>-------------------별점---------------<br><br><br>
<c:forEach var="ratingVO" items="${ratingVOList}">
    제목<br>
    ${ratingVO.mv_title}<br>
    개봉일<br>
    ${ratingVO.mv_launch_date}<br>
    지역<br>
    ${ratingVO.mv_location}<br>
    평점 <br>
    ${ratingVO.avg_rating}<br>
    <a href="/movie/movieDetail.do?mv_num=${ratingVO.mv_num}"><img
            src="${pageContext.request.contextPath}/upload/${ratingVO.mv_poster}"></a><br>
</c:forEach>
</span>
</body>
</html>
