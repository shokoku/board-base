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
<h2 class="text-center">글 상세</h2>
<div class="container">
    <form:form action="${board.id}/edit"  method="get">

        <div class="form-floating mb-3">
            <input type="text" class="form-control" id="writer" name="writer" value="${board.writer}" placeholder="작성자" disabled>
            <label for="writer">작성자</label>
        </div>

        <div class="form-floating mb-3">
            <input type="text" class="form-control" id="createdDate" name="createdDate" value="${board.createdDate}" placeholder="작성 일자" disabled>
            <label for="createdDate">작성 일자</label>
        </div>

        <div class="form-floating mb-3">
            <input type="text" class="form-control" id="title" name="title" value="${board.title}" placeholder="제목" disabled>
            <label for="title">제목</label>
        </div>

        <div class="form-floating mb-3">
            <textarea class="form-control" id="content" name="content" placeholder="비밀번호" disabled>${board.content}</textarea>
            <label for="content">내용</label>
        </div>
        <div class="row">
            <div class="col">
                <button type="submit" class="btn btn-primary btn-lg w-100">수정</button>
            </div>

            <div class="col">
                <button type="button" onclick="location.href='/board';" class="btn btn-lg btn-secondary w-100">목록</button>
            </div>

            <div class="col">
                <button type="button" onclick="location.href='${board.id}/delete';" class="btn btn-lg btn-danger w-100">삭제</button>
            </div>

        </div>

    </form:form>
</div>
</body>
</html>
