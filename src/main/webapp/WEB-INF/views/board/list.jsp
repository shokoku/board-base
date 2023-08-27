<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>글 목록</title>
    <link rel="stylesheet" type="text/css" href="/resources/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="/resources/css/list.css">
</head>

<body>
<h2 class="text-center">글 목록</h2>
<div class="container">
    <div class="d-flex justify-content-between">
        <div>
            총 ${pagingDTO.totalElements}건
        </div>

        <div class="dropdown-section">
            <form method="get" action="">
                <c:set var="selectedSize" value="${param.size}" />
                <input type="hidden" name="page" value="1" />
                <input type="hidden" name="type" value="${param.type}" />
                <input type="hidden" name="keyword" value="${param.keyword}" />
                <select name="size" onchange="this.form.submit()" class="form-select form-select-sm">
                    <c:forEach var="sizeOption" items="10,15,20,30">
                        <option value="${sizeOption}" ${sizeOption == selectedSize ? 'selected' : ''}>${sizeOption}개씩 보기</option>
                    </c:forEach>
                </select>
            </form>
        </div>
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
                <td><a href="board/${board.id}?page=${param.page}&size=${param.size}&type=${param.type}&keyword=${param.keyword}">${board.title}</a></td>
                <td>${board.writer}</td>
                <fmt:parseDate var="parsedDate" value="${board.createdDate}" pattern="yyyy-MM-dd'T'HH:mm" />
                <td><fmt:formatDate value="${parsedDate}" pattern="yyyy-MM-dd" /></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <!-- Search Form -->
    <div class="container searchForm">
        <form method="get" action="">
            <input type="hidden" name="page" value="1" />
            <input type="hidden" name="size" value="${param.size}" />

            <div class="input-group">
                <select name="type" class="form-select searchSelect">
                    <option value="title" ${param.type == 'title' ? 'selected' : ''}>제목</option>
                    <option value="content" ${param.type == 'content' ? 'selected' : ''}>내용</option>
                    <option value="writer" ${param.type == 'writer' ? 'selected' : ''}>작성자</option>
                </select>
                <input type="text" name="keyword" value="${param.keyword}" placeholder="검색어를 입력하세요" class="form-control">
                <button type="submit" class="btn btn-primary">검색</button>
            </div>
        </form>
    </div>


    <!-- Pagination -->
    <div class="pagination-section">
        <ul class="pagination justify-content-center">
            <c:if test="${pagingDTO.hasPreviousGroup()}">
                <li class="page-item">
                    <a class="page-link" href="?page=${pagingDTO.previousGroupStartPage()}&size=${param.size}&type=${param.type}&keyword=${param.keyword}" aria-label="Previous Group">
                        <span aria-hidden="true">&laquo;&laquo;</span>
                    </a>
                </li>
            </c:if>

            <c:forEach begin="${pagingDTO.startPageGroup}" end="${pagingDTO.endPageGroup}" var="pageNum">
                <c:choose>
                    <c:when test="${pageNum == param.page}">
                        <li class="page-item active"><span class="page-link">${pageNum}</span></li>
                    </c:when>
                    <c:otherwise>
                        <li class="page-item">
                            <a class="page-link" href="?page=${pageNum}&size=${param.size}&type=${param.type}&keyword=${param.keyword}">${pageNum}</a>
                        </li>
                    </c:otherwise>
                </c:choose>
            </c:forEach>

            <c:if test="${pagingDTO.hasNextGroup()}">
                <li class="page-item">
                    <a class="page-link" href="?page=${pagingDTO.nextGroupStartPage()}&size=${param.size}&type=${param.type}&keyword=${param.keyword}" aria-label="Next Group">
                        <span aria-hidden="true">&raquo;&raquo;</span>
                    </a>
                </li>
            </c:if>
        </ul>
    </div>

    <div class="btn-section m-auto">
        <button type="button" onclick="location.href='board/add?page=${param.page}&size=${param.size}&type=${param.type}&keyword=${param.keyword}';" class="btn btn-lg btn-primary w-100">글쓰기</button>
    </div>
</div>
</body>
</html>
