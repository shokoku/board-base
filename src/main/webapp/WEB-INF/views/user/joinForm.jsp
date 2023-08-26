<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>회원 가입</title>
    <link rel="stylesheet" type="text/css" href="/resources/css/bootstrap.min.css">
    <style>
        .container{
            max-width: 580px;
        }
    </style>
</head>
<body>
    <h2 class="text-center">회원 가입</h2>
    <div class="container">
        <form:form action="/user/join" modelAttribute="user" method="post">
            <div class="form-floating mb-3">
                <input type="text" class="form-control" id="id" name="id" placeholder="아이디">
                <label for="id">아이디</label>
            </div>

            <div class="form-floating mb-3">
                <input type="password" class="form-control" id="pw" name="pw" placeholder="비밀번호">
                <label for="pw">password</label>
            </div>

            <div class="form-floating mb-3">
                <input type="text" class="form-control" id="name" name="name" placeholder="이름">
                <label for="name">이름</label>
            </div>

            <div class="form-floating mb-3">
                <input type="tel" class="form-control" id="phone" name="phone" placeholder="전화번호">
                <label for="phone">전화번호</label>
            </div>

            <div class="form-floating mb-3">
                <input type="email" class="form-control" id="email" name="email" placeholder="이메일">
                <label for="email">이메일</label>
            </div>

            <button type="submit" class="btn btn-primary btn-lg w-100">가입</button>
        </form:form>
    </div>
</body>
</html>
