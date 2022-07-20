
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>영화 글쓰기</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>

    <script type="text/javascript" src="${pageContext.request.contextPath}/js/movie.js"></script>
</head>
<body>
<form action="movieWrite.do" method="post" enctype="multipart/form-data">
    제목<br>
    <input type="text" id="mv_title" name="mv_title"><br>
    장르<br>
    <input type="text" id="mv_genre" name="mv_genre"><br>
    러닝타임<br>
    <input type="text" id="mv_runningtime" name="mv_runningtime"><br>
    연령<br>
    <input type="text" id="mv_limit_age" name="mv_limit_age"><br>
    지역<br>
    <input type="text" id="mv_location" name="mv_location"><br>
    개봉일 yyyy-mm-dd로 입력<br>
    <input type="text" id="mv_launch_date" name="mv_launch_date"><br>
    스태프<br>
    감독<br>
    <input type="text" id="mv_director" name="mv_director"><br>
    배우<br>
    <input type="text" id="mv_actor" name="mv_actor"><br>
    각본<br>
    <input type="text" id="mv_writer" name="mv_writer"><br>
    기본정보<br>
    <textarea name="mv_summary" id="mv_summary" cols="30" rows="10"></textarea><br>

    예고편<br>
    <span id="show_mv_trailer"></span>

    <input type="text" id="mv_trailer" name="mv_trailer"><br>
    <input type="button" id="mv_trailer_btn" name="mv_pic_btn"><br>


    메인이미지<br>
    <img src="${pageContext.request.contextPath}/images/img_not_exist.jpg" id="mv_main_pic_img" width="300px">
    <input type="file" id="mv_main_pic" accept="image/gif,image/jpeg" name="mv_main_pic"><br>
    포스터<br>
    <img src="${pageContext.request.contextPath}/images/img_not_exist.jpg" id="mv_poster_img" width="300px">
    <input type="file" id="mv_poster" accept="image/gif,image/jpeg" name="mv_poster"><br>
    이미지<br>
    <span id="mv_pic_span"></span>
    <input type="file" id="mv_pic1"  accept="image/gif,image/jpeg" name="mv_pic1"><br>
    <input type="file" id="mv_pic2"  accept="image/gif,image/jpeg" name="mv_pic2"><br>
    <input type="file" id="mv_pic3"  accept="image/gif,image/jpeg" name="mv_pic3"><br>


    <input type="submit" id="movie_submit" value="제출">
</form>
<form action="movieWrite.do" enctype="multipart/form-data" method="post">


</form>
</body>
</html>
