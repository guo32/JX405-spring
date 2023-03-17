<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>게시글 목록</title>
    <link href="/resources/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
    <style>
        @font-face {
            font-family: 'NeoDunggeunmoPro-Regular';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2302@1.0/NeoDunggeunmoPro-Regular.woff2') format('woff2');
            font-weight: normal;
            font-style: normal;
        }
        * {
            font-family: 'NeoDunggeunmoPro-Regular';
        }
    </style>
</head>
<body>
<div class="container">
    <div class="col-12 align-items-center">
        <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
            <div class="container-fluid">
                <a class="navbar-brand" href="#">👾 게시판 👾</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarColor01">
                    <ul class="navbar-nav me-auto">
                        <li class="nav-item">
                            <a class="nav-link active" href="#">Home
                                <span class="visually-hidden">(current)</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Features</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Pricing</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">About</a>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Dropdown</a>
                            <div class="dropdown-menu">
                                <a class="dropdown-item" href="#">Action</a>
                                <a class="dropdown-item" href="#">Another action</a>
                                <a class="dropdown-item" href="#">Something else here</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="#">Separated link</a>
                            </div>
                        </li>
                    </ul>
                    <form class="d-flex" action="/board/search/1" method="get">
                        <input class="form-control m-sm-2" type="search" placeholder="Search" name="keyword">
                        <button class="btn btn-secondary m-2 my-sm-0" type="submit">search</button>
                    </form>
                </div>
            </div>
        </nav>
    </div>
    <div class="row h-100 align-items-center">
        <div class="row">
            <div class="col-12 align-items-center">
<%--                <div class="text-center fs-3 mb-2 text-light">👾 게시판 👾</div>--%>
                <div class="bg-gradient p-4 rounded-2">
                    <table class="table table-hover table-striped">
                        <thead>
                        <tr class="table-light">
                            <td>번호</td>
                            <td>제목</td>
                            <td>작성자</td>
                            <td>작성일</td>
                            <td>수정일</td>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${list}" var="item">
                            <tr onclick="location.href='/board/showOne/${item.id}'">
                                <td>${item.id}</td>
                                <td>${item.title}</td>
                                <td>${item.writerNickname}</td>
                                <td>${item.entryDate}</td>
                                <td>${item.modifyDate}</td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                    <div>
                        <ul class="pagination justify-content-center">
                            <li class="page-item">
                                <a class="page-link" href="${pagingAddr}/1?keyword=${keyword}">&lt;</a>
                            </li>
                            <c:forEach var="i" begin="${paging.start}" end="${paging.end}">
                                <c:choose>
                                    <c:when test="${i == current}">
                                        <li class="page-item active disabled">
                                            <a class="page-link link-warning">${i}</a>
                                        </li>
                                    </c:when>
                                    <c:otherwise>
                                        <li class="page-item">
                                            <a class="page-link" href="${pagingAddr}/${i}?keyword=${keyword}">${i}</a>
                                        </li>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
                            <li class="page-item">
                                <a class="page-link" href="${pagingAddr}/${paging.totalPage}?keyword=${keyword}">&gt;</a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="text-end">
                    <button class="btn btn-sm btn-light" onclick="location.href='/board/register'">글 작성</button>
                    <button class="btn btn-sm btn-info" onclick="location.href='/user/myInfo'">내 정보</button>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
