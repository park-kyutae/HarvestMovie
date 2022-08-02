<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" type="text/css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
    <meta charset="UTF-8">
    <title>Insert title here</title>
</head>
<body>
<div class="col-2 sidebar">
    <div class="p-3 mt-2" >
        <div class="border-bottom ">
            <a href="${pageContext.request.contextPath}/member/adminpage.do"
              class="d-flex align-items-center mb-3 mb-md-0 me-md-auto link-dark text-decoration-none">
            <div class="fs-4 ps-2">어드민페이지</div>
        </a>
        </div>
        <ul class="nav nav-pills flex-column mb-auto">
            <li class="nav-item">
                <a href="${pageContext.request.contextPath}/member/adminpage.do" class="nav-link link-dark"
                   aria-current="page">
                    회원 관리
                </a>
            </li>
            <li class="nav-item">
                <a href="${pageContext.request.contextPath}/shop/productManagement.do" class="nav-link link-dark"
                   aria-current="page">
                    상품 관리
                </a>
            </li>
            <li class="nav-item">
                <a href="${pageContext.request.contextPath}/movie/movieWriteForm.do" class="nav-link link-dark"
                   aria-current="page">
                    영화 작성
                </a>
            </li>
        </ul>
    </div>
</div>

</body>
</html>