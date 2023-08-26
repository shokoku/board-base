<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>회원 가입</title>
    <link rel="stylesheet" type="text/css" href="/resources/css/bootstrap.min.css">
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="#">MySite</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav">
            <!-- 로그인이 안된 경우 -->
            <c:if test="${empty sessionScope.id}">
                <li class="nav-item">
                    <a class="nav-link" href="/user/join">회원가입</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/user/login">로그인</a>
                </li>
            </c:if>

            <!-- 로그인이 된 경우 -->
            <c:if test="${not empty sessionScope.id}">
                <li class="nav-item">
                    <a class="nav-link">${sessionScope.id}</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/user/info/${sessionScope.id}">회원정보</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/user/logout">로그아웃</a>
                </li>
            </c:if>
        </ul>
    </div>
</nav>

</body>
</html>
