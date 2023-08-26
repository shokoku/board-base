<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>글 목록</title>
    <link rel="stylesheet" type="text/css" href="/resources/css/bootstrap.min.css">
    <style>
        table th:nth-child(1) {
            width: 10%;
        }

        table th:nth-child(2) {
            width: 50%;
        }

        table th:nth-child(3), table th:nth-child(4) {
            width: 20%;
        }
        table th, table td {
            text-align: center;
            vertical-align: middle;
        }

        table td:nth-child(2) {
            text-align: left;
            padding-left: 2em;
        }

        a, a:hover {
            text-decoration: none;
            color: black;
        }

    </style>
</head>
<body>
<h2 class="text-center">글 목록</h2>
<div class="container">
    <table class="table">
        <thead>
        <tr>
            <th>No</th>
            <th>제목</th>
            <th>작성자</th>
            <th>작성일</th>
        </tr>
        </thead>

        <tbody>
        <c:forEach var="board" items="${boards}" varStatus="status">
            <tr>
                <td>${fn:length(boards) - status.index}</td>
                <td>
                    <a href="board/${board.id}">${board.title}</a>
                </td>
                <td>${board.writer}</td>
                <fmt:parseDate var="parsedDate" value="${board.createdDate}" pattern="yyyy-MM-dd'T'HH:mm" />
                <td><fmt:formatDate value="${parsedDate}" pattern="yyyy-MM-dd" /></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <div class="m-auto">
        <button type="button" onclick="location.href='board/add';" class="btn btn-lg btn-primary w-100">글쓰기</button>
    </div>
</div>
</body>
</html>
