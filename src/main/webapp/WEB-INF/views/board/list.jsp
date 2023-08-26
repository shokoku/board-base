<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <div class="w-25">
        <form method="get" action="">
            <input type="hidden" name="page" value="1" />
            <select name="size" onchange="this.form.submit()" class="form-select form-select-sm">
                <option value="10" ${pagingDTO.size == 10 ? 'selected' : ''}>10개씩 보기</option>
                <option value="15" ${pagingDTO.size == 15 ? 'selected' : ''}>15개씩 보기</option>
                <option value="20" ${pagingDTO.size == 20 ? 'selected' : ''}>20개씩 보기</option>
                <option value="30" ${pagingDTO.size == 30 ? 'selected' : ''}>30개씩 보기</option>
            </select>
        </form>
    </div>

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
                <td>${pagingDTO.totalElements - (pagingDTO.page - 1) * pagingDTO.size - status.index}</td>
                <td>
                    <a href="board/${board.id}?page=${pagingDTO.page}&size=${pagingDTO.size}">${board.title}</a>
                </td>
                <td>${board.writer}</td>
                <fmt:parseDate var="parsedDate" value="${board.createdDate}" pattern="yyyy-MM-dd'T'HH:mm" />
                <td><fmt:formatDate value="${parsedDate}" pattern="yyyy-MM-dd" /></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <div class="container">
        <ul class="pagination justify-content-center">
            <!-- 이전 페이지 그룹 버튼 -->
            <c:if test="${pagingDTO.hasPreviousGroup()}">
                <li class="page-item">
                    <a class="page-link" href="?page=${pagingDTO.getPreviousGroupStartPage()}&size=${pagingDTO.size}" aria-label="Previous Group">
                        <span aria-hidden="true">&laquo;&laquo;</span>
                    </a>
                </li>
            </c:if>

            <!-- 페이지 번호 -->
            <c:forEach begin="${pagingDTO.startPageGroup}" end="${pagingDTO.endPageGroup}" var="pageNum">
                <c:choose>
                    <c:when test="${pageNum == pagingDTO.page}">
                        <li class="page-item active">
                            <span class="page-link">${pageNum}</span>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <li class="page-item">
                            <a class="page-link" href="?page=${pageNum}&size=${pagingDTO.size}">${pageNum}</a>
                        </li>
                    </c:otherwise>
                </c:choose>
            </c:forEach>

            <!-- 다음 페이지 그룹 버튼 -->
            <c:if test="${pagingDTO.hasNextGroup()}">
                <li class="page-item">
                    <a class="page-link" href="?page=${pagingDTO.getNextGroupStartPage()}&size=${pagingDTO.size}" aria-label="Next Group">
                        <span aria-hidden="true">&raquo;&raquo;</span>
                    </a>
                </li>
            </c:if>

        </ul>
    </div>



    <div class="m-auto">
        <button type="button" onclick="location.href='board/add?page=${pagingDTO.page}&size=${pagingDTO.size}';" class="btn btn-lg btn-primary w-100">글쓰기</button>
    </div>
</div>
</body>
</html>
