<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>영화 글쓰기</title>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
            crossorigin="anonymous"></script>

    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/movie.js"></script>

</head>
<body class="bg-light">
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<div class="container">
    <div class="row">
        <div class="col sol-sm6">
            <h4 class="mb-3">영화 정보</h4>
        </div>
        <form class="needs-validation" novalidate method="post" action="movieWrite.do"
              enctype="multipart/form-data">
            <div class="row">
                <div class="col-sm-6">
                    <label for="mv_title" class="form-label">제목</label>
                    <input type="text" class="form-control" name="mv_title" id="mv_title" required>
                    <div class="invalid-feedback">
                        제목을 입력해야 합니다.
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-6">
                    <label for="mv_genre" class="form-label">장르</label>
                    <input type="text" class="form-control" name="mv_genre" id="mv_genre"
                           required>
                    <div class="invalid-feedback">
                        장르를 입력해야 합니다.
                    </div>
                </div>
            </div>
            <div class="col-sm-6">
                <label for="mv_runningtime" class="form-label">러닝타임</label>
                <input type="number" class="form-control" name="mv_runningtime" id="mv_runningtime"
                       placeholder="00" required>
                <div class="invalid-feedback">
                    러닝타임을 입력해야 합니다.
                </div>
            </div>
            <div class="row">
                <div class="col-sm-6">
                    <label for="mv_limit_age" class="form-label">시청 가능 연령</label>
                    <input type="number" class="form-control" name="mv_limit_age" id="mv_limit_age"
                           name="mv_limit_age" required>
                    <div class="invalid-feedback">
                        시청 가능 연령을 입력해야 합니다.
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-6">
                        <label for="mv_location" class="form-label">제작 지역</label>
                        <input type="text" class="form-control" name="mv_location" id="mv_location" placeholder="미국"
                               required>
                        <div class="invalid-feedback">
                            제작 지역을 입력해야 합니다.
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-6">
                        <label for="mv_launch_date" class="form-label">개봉일</label>
                        <input type="date" class="form-control" name="mv_launch_date" id="mv_launch_date"
                               placeholder="2022-07-21" required>
                        <div class="invalid-feedback">
                            개봉일을 입력해야 합니다.
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="input-group">
                        <span class="input-group-text">요약</span>
                        <textarea class="form-control" aria-label="With textarea" name="mv_summary"
                                  rows="10" required></textarea>
                    </div>
                </div>
                <div class="row">
                    <h4>제작진</h4>
                    <div class="col-sm-6">
                        <label for="mv_director" class="form-label">감독</label>
                        <input type="text" class="form-control" name="mv_director" id="mv_director"
                               placeholder
                               required>
                        <div class="invalid-feedback">
                            감독을 입력해야 합니다.
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-6">
                        <label for="mv_actor" class="form-label">배우</label>
                        <input type="text" class="form-control" name="mv_actor" id="mv_actor"
                               placeholder
                               required>
                        <div class="invalid-feedback">
                            배우를 입력해야 합니다.
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-6">
                        <label for="mv_writer" class="form-label">각본</label>
                        <input type="text" class="form-control" name="mv_writer" id="mv_writer"
                               placeholder
                               required>
                        <div class="invalid-feedback">
                            각본을 입력해야 합니다.
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-12">
                        <label for="show_mv_trailer"><h4>예고편</h4></label>
                        <span id="show_mv_trailer"></span>
                    </div>

                    <div class="row">
                        <div class="col col-md-6">
                            <input type="text" id="mv_trailer" name="mv_trailer"
                                   placeholder class="form-control"
                                   required>
                        </div>
                        <div class="col col-md-2">
                            <input type="button" id="mv_trailer_btn" name="mv_pic_btn"
                                   class="btn btn-outline-dark"
                                   value="예고편 미리보기"><br>
                        </div>
                    </div>
                    <div class="form-text">유튜브 URL의 영상 고유 문자열을 입력하세요. 쉼표로 구분 됩니다.</div>
                </div>
            </div>
            <div class="row">
                <div>
                    <h4>포스터</h4>
                    <img src="${pageContext.request.contextPath}/images/X.svg"
                         id="mv_poster" width="30%" class="pic"><br>
                    <input type="file" accept="image/gif,image/jpeg"
                           name="mv_poster"
                           class="form-control pic_btn" required><br>
                </div>
            </div>
            <div class="row">
                <div>
                    <h4>메인 사진</h4>
                    <img src="${pageContext.request.contextPath}/images/X.svg"
                         id="mv_main_pic"
                         width="30%" class="pic"><br>
                    <input type="file" accept="image/gif,image/jpeg"
                           name="mv_main_pic"
                           class="form-control pic_btn" required><br>
                </div>
            </div>
            <div class="row">
                <div>
                    <h4>영화 사진들</h4>
                    <div class="row">
                        <div class="col col-md-4">
                            <img src="${pageContext.request.contextPath}/images/X.svg"
                                 class="pic img-fluid"
                                 id="mv_pic1" width="100%">
                            <input type="file" accept="image/gif,image/jpeg"
                                   name="mv_pic1"
                                   class="form-control pic_btn" required><br>
                        </div>
                        <div class="col col-md-4">
                            <img src="${pageContext.request.contextPath}/images/X.svg"
                                 class="pic img-fluid"
                                 id="mv_pic2" width="100%">
                            <input type="file" accept="image/gif,image/jpeg"
                                   name="mv_pic2"
                                   class="form-control pic_btn" required><br>
                        </div>
                        <div class="col col-md-4">
                            <img src="${pageContext.request.contextPath}/images/X.svg"
                                 class="pic img-fluid"
                                 id="mv_pic3" width="100%">
                            <input type="file" accept="image/gif,image/jpeg"
                                   name="mv_pic3"
                                   class="form-control pic_btn" required><br>
                        </div>
                    </div>
                </div>
                <div>
                    <button class="btn btn-secondary btn-lg mx-2"
                            style="float: right" type="submit">제출
                    </button>
                    <button class="btn btn-outline-secondary btn-lg"
                            style="float: right" type="button"
                            onclick="history.go(-1)">취소
                    </button>
                </div>
            </div>
        </form>

    </div>
</div>


</div>


</body>
</html>