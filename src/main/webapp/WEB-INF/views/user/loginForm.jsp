<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>로그인</title>
    <link rel="stylesheet" type="text/css" href="/resources/css/bootstrap.min.css">
    <style>
        .container{
            max-width: 580px;
        }
    </style>
</head>
<body>
<h2 class="text-center">로그인</h2>
<div class="container">
    <form:form action="/user/login" modelAttribute="user" method="post">
        <div class="form-floating mb-3">
            <input type="text" class="form-control" id="id" name="id" placeholder="아이디">
            <label for="id">아이디</label>
        </div>

        <div class="form-floating mb-3">
            <input type="password" class="form-control" id="pw" name="pw" placeholder="비밀번호">
            <label for="pw">password</label>
        </div>

        <button type="submit" class="btn btn-primary btn-lg w-100">로그인</button>
    </form:form>
</div>
</body>
</html>
