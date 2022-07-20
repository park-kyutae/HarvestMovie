<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html>
<head>
    <title>영화 수정</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>

    <script type="text/javascript" src="${pageContext.request.contextPath}/js/movie.js"></script>
</head>
<body>
<form action="movieModify.do" method="post" enctype="multipart/form-data">
    제목<br>
    <input type="text" id="mv_title" name="mv_title" value="${movieVO.mv_title}"><br>
    장르<br>
    <input type="text" id="mv_genre" name="mv_genre" value="${movieVO.mv_genre}"><br>
    러닝타임<br>
    <input type="text" id="mv_runningtime" name="mv_runningtime" value="${movieVO.mv_runningtime}"><br>
    연령<br>
    <input type="text" id="mv_limit_age" name="mv_limit_age" value="${movieVO.mv_limit_age}"><br>
    지역<br>
    <input type="text" id="mv_location" name="mv_location" value="${movieVO.mv_location}"><br>
    개봉일 yyyy-mm-dd로 입력<br>
    <input type="text" id="mv_launch_date" name="mv_launch_date" value="${movieVO.mv_launch_date}"><br>
    스태프<br>

    <c:forEach var="staff_job" items="${movieVO.mv_staff_info}">
        ${staff_job.key}<br>
        <c:forEach var="staff_name" items="${staff_job.value}">
            <input type="text" value="${staff_name}"><br>
            <br>
        </c:forEach>
    </c:forEach>
    기본정보<br>
    <textarea name="mv_summary" id="mv_summary" cols="30" rows="10">${movieVO.mv_summary}</textarea><br>


    메인이미지<br>
    <img src="${pageContext.request.contextPath}/upload/${movieVO.mv_main_pic}" id="mv_main_pic_img" width="300px">
    <input type="file" id="mv_main_pic" accept="image/gif,image/jpeg" name="mv_main_pic"><br>
    포스터<br>
    <img src="${pageContext.request.contextPath}/upload/${movieVO.mv_poster}" id="mv_poster_img" width="300px">
    <input type="file" id="mv_poster" accept="image/gif,image/jpeg" name="mv_poster"><br>
    이미지<br>
    <span id="mv_pic_span">
        <c:forEach var="trailer" items="${movieVO.mv_trailer}" varStatus="status">
            <iframe width="560" height="315" src="https://www.youtube.com/embed/${trailer}"
                    title="YouTube video player" frameborder="0"
                    allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                    allowfullscreen></iframe>
            <c:if test="${status.index != 0}">
                <c:set var="trailer_str" value="${trailer_str},${trailer}"/>
            </c:if><c:if test="${status.index == 0}">
            <c:set var="trailer_str" value="${trailer}"/>
        </c:if>

        </c:forEach>
    </span>
    예고편<br>
    <span id="show_mv_trailer"></span>
    <input type="text" id="mv_trailer" name="mv_trailer" value="${trailer_str}"><br>
    <input type="button" id="mv_trailer_btn" name="mv_pic_btn"><br>
    <input type="file" id="mv_pic1" accept="image/gif,image/jpeg" name="mv_pic1" src="${pageContext.request.contextPath}/upload/${movieVO.mv_pic[0]}"><br>
    <input type="file" id="mv_pic2" accept="image/gif,image/jpeg" name="mv_pic2" src="${pageContext.request.contextPath}/upload/${movieVO.mv_pic[1]}"><br>
    <input type="file" id="mv_pic3" accept="image/gif,image/jpeg" name="mv_pic3"src="${pageContext.request.contextPath}/upload/${movieVO.mv_pic[2]}"><br>

<%--TODO 사진을 다시 불러오는 기능 추가 or 미제출 시 업데이트 안하게--%>
    <input type="submit" id="movie_submit" value="수정하기">
</form>
</body>
</html>
