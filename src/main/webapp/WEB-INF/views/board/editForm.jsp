<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>글 상세</title>
    <link rel="stylesheet" type="text/css" href="/resources/css/bootstrap.min.css">
</head>
<body>
<h2 class="text-center">글 수정</h2>
<div class="container">
    <form:form action="/board/${board.id}/edit" method="post">
        <input type="hidden" name="page" value="${page}">
        <input type="hidden" name="size" value="${size}">
        <input type="hidden" name="type" value="${type}">
        <input type="hidden" name="keyword" value="${keyword}">

        <div class="form-floating mb-3">
            <input type="text" class="form-control" id="writer" name="writer" value="${board.writer}" placeholder="작성자" disabled>
            <label for="writer">작성자</label>
        </div>

        <div class="form-floating mb-3">
            <input type="text" class="form-control" id="createdDate" name="createdDate" value="${board.createdDate}" placeholder="작성 일자" disabled>
            <label for="createdDate">작성 일자</label>
        </div>

        <div class="form-floating mb-3">
            <input type="text" class="form-control" id="title" name="title" value="${board.title}" placeholder="제목">
            <label for="title">제목</label>
        </div>

        <div class="form-floating mb-3">
            <textarea class="form-control" id="content" name="content" placeholder="비밀번호">${board.content}</textarea>
            <label for="content">내용</label>
        </div>

        <div class="form-floating mb-3">
            <select class="form-control" id="category" name="category">
                <option value="NEWS" ${board.category == 'NEWS' ? 'selected' : ''}>뉴스</option>
                <option value="EVENT" ${board.category == 'EVENT' ? 'selected' : ''}>이벤트</option>
                <option value="NOTICE" ${board.category == 'NOTICE' ? 'selected' : ''}>공지</option>
            </select>
            <label for="category">카테고리</label>
        </div>

        <div class="mb-3">
            <input type="checkbox" class="form-check-input" id="secret" name="secret" ${board.secret ? 'checked' : ''}>
            <label class="form-check-label" for="secret">비밀글 설정</label>
        </div>

        <div class="mb-3">
            <label>중요도</label><br>
            <input type="radio" name="importance" value="LOW" id="low" ${board.importance == 'LOW' ? 'checked' : ''}>
            <label for="low">낮음</label>

            <input type="radio" name="importance" value="MEDIUM" id="medium" ${board.importance == 'MEDIUM' ? 'checked' : ''}>
            <label for="medium">보통</label>

            <input type="radio" name="importance" value="HIGH" id="high" ${board.importance == 'HIGH' ? 'checked' : ''}>
            <label for="high">높음</label>
        </div>

        <div class="row">
            <div class="col">
                <button type="submit" class="btn btn-primary btn-lg w-100">저장</button>
            </div>
            <div class="col">
                <button type="button" onclick="location.href='/board/${board.id}?page=${page}&size=${size}&type=${type}&keyword=${keyword}';" class="btn btn-secondary btn-lg w-100">취소</button>
            </div>
        </div>

    </form:form>
</div>
</body>
</html>
