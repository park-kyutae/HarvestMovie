<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>영화 수정하기</title>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
            crossorigin="anonymous"></script>

    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/movie.js"></script>

</head>
<body class="bg-light">
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<div class="container">
    <main>
        <div>
            <br>
            <h4 class="mb-3">영화 정보</h4>
            <form class="needs-validation" novalidate method="post" action="movieModify.do?mv_num=${param.mv_num}" enctype="multipart/form-data">
                <div>
                    <div class="col-sm-6">
                        <label for="mv_title" class="form-label">제목</label>
                        <input type="text" class="form-control" name="mv_title" id="mv_title"
                               value="${movieVO.mv_title}"
                               required>
                        <div class="invalid-feedback">
                            제목을 입력해야 합니다.
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <label for="mv_genre" class="form-label">장르</label>
                        <input type="text" class="form-control" name="mv_genre" id="mv_genre"
                               value="${movieVO.mv_genre}"
                               required>
                        <div class="invalid-feedback">
                            장르를 입력해야 합니다.
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <label for="mv_runningtime" class="form-label">러닝타임</label>
                        <input type="number" class="form-control" name="mv_runningtime" id="mv_runningtime"
                               value="${movieVO.mv_runningtime}"
                               placeholder="00" required>
                        <div class="invalid-feedback">
                            러닝타임을 입력해야 합니다.
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <label for="mv_limit_age" class="form-label">시청 가능 연령</label>
                        <input type="number" class="form-control" name="mv_limit_age" id="mv_limit_age"
                               value="${movieVO.mv_limit_age}"
                               name="mv_limit_age" required>
                        <div class="invalid-feedback">
                            시청 가능 연령을 입력해야 합니다.
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <label for="mv_location" class="form-label">제작 지역</label>
                        <input type="text" class="form-control" name="mv_location" id="mv_location" placeholder="미국"
                               value="${movieVO.mv_location}"
                               required>
                        <div class="invalid-feedback">
                            제작 지역을 입력해야 합니다.
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <label for="mv_launch_date" class="form-label">개봉일</label>
                        <input type="date" class="form-control" name="mv_launch_date" id="mv_launch_date"
                               value="${movieVO.mv_launch_date}"
                               placeholder="2022-07-21" required>
                        <div class="invalid-feedback">
                            개봉일을 입력해야 합니다.
                        </div>
                    </div>
                    <br>
                    <div class="input-group">
                        <span class="input-group-text">요약</span>
                        <textarea class="form-control" aria-label="With textarea" name="mv_summary"
                                  rows="10" required>${movieVO.mv_summary}</textarea>
                    </div>
                    <br>
                    <h4>제작진</h4>
                    <div class="col-sm-6">

                        <c:forEach var="staff" items="${movieVO.mv_staff_info}">
                            <label for="mv_${staff.key}" class="form-label">
                                    <c:if test="${staff.key=='director'}">감독</c:if>
                                    <c:if test="${staff.key=='actor'}">배우</c:if>
                                    <c:if test="${staff.key=='writer'}">각본</c:if>
                            </label>
                            <c:forEach var="staff_name" items="${staff.value}">
                                <input type="text" value="${staff_name}" name="mv_${staff.key}"><br>
                                <br>
                            </c:forEach>
                        </c:forEach>


                    </div>
                    <br>
                    <div class="col-sm-20">
                        <label for="show_mv_trailer"><h4>예고편</h4></label>
                        <br>
                        <span id="show_mv_trailer">
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
                        <div class="row mt-2">
                            <div class="col col-md-6">
                                <input type="text" id="mv_trailer" name="mv_trailer" placeholder class="form-control"
                                       required value="${trailer_str}">
                            </div>
                            <div class="col col-md-2">
                                <input type="button" id="mv_trailer_btn" name="mv_pic_btn" class="btn btn-outline-dark"
                                       value="예고편 미리보기"><br>
                            </div>
                        </div>

                        <div class="form-text">유튜브 URL의 영상 고유 문자열을 입력하세요. 쉼표로 구분 됩니다.</div>
                    </div>
                    <br>
                    <div>
                        <h4>포스터</h4>
                        <img src="${pageContext.request.contextPath}/upload/${movieVO.mv_poster}" id="mv_poster"
                             width="300px" class="pic"><br>
                        <input type="file" accept="image/gif,image/jpeg" name="mv_poster"
                               class="form-control pic_btn mt-2" ><br>
                    </div>
                    <div>
                        <h4>메인 사진</h4>
                        <img src="${pageContext.request.contextPath}/upload/${movieVO.mv_main_pic}" id="mv_main_pic"
                             width="300px" class="pic"><br>
                        <input type="file" accept="image/gif,image/jpeg" name="mv_main_pic"
                               class="form-control pic_btn mt-2" ><br>
                    </div>
                    <div>
                        <h4>영화 사진들</h4>
                        <div class="row">
                            <div class="col col-md-4">
                                <img src="${pageContext.request.contextPath}/upload/${movieVO.mv_pic[0]}"
                                     class="pic img-fluid"
                                     id="mv_pic1" width="400px">
                                <input type="file" accept="image/gif,image/jpeg" name="mv_pic1"
                                       class="form-control pic_btn mt-2" ><br>
                            </div>
                            <div class="col col-md-4">
                                <img src="${pageContext.request.contextPath}/upload/${movieVO.mv_pic[1]}"
                                     class="pic img-fluid"
                                     id="mv_pic2" width="400px">
                                <input type="file" accept="image/gif,image/jpeg" name="mv_pic2"
                                       class="form-control pic_btn mt-2" ><br>
                            </div>
                            <div class="col col-md-4">
                                <img src="${pageContext.request.contextPath}/upload/${movieVO.mv_pic[2]}"
                                     class="pic img-fluid"
                                     id="mv_pic3" width="400px">
                                <input type="file" accept="image/gif,image/jpeg" name="mv_pic3"
                                       class="form-control pic_btn mt-2" ><br>
                            </div>
                        </div>
                    </div>
                    <div>
                        <button class="btn btn-secondary btn-lg " style="float: right" type="submit">제출</button>
                        <button class="btn btn-outline-secondary btn-lg mx-2" style="float: right" type="button"
                                onclick="history.go(-1)">취소
                        </button>
                    </div>
                </div>
            </form>
        </div>
    </main>

</div>
</div>


</body>
</html>










