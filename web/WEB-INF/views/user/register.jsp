<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>회원가입</title>
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
    <div class="row h-100 align-items-center">
        <div class="row">
            <div class="col-12 align-items-center">
                <div class="text-center fs-3 mb-2 text-light">👾 게시판 회원가입 👾</div>
                <div class="bg-gradient p-3 rounded-2">
                    <c:if test="${not empty message}">
                        <div class="alert alert-dismissible alert-danger">
                            <h6>${message}</h6>
                        </div>
                    </c:if>
                    <form action="/user/register" method="post">
                        <label for="username" class="col-form-label">아이디</label>
                        <input type="text" id="username" name="username" placeholder="아이디" class="form-control">
                        <label for="password" class="col-form-label">비밀번호</label>
                        <input type="password" id="password" name="password" placeholder="비밀번호" class="form-control">
                        <label for="nickname" class="col-form-label">닉네임</label>
                        <input type="text" id="nickname" name="nickname" placeholder="닉네임" class="form-control">
                        <div class="text-center">
                            <button type="submit" class="btn btn-success mt-2">회원가입</button>
                            <button type="button" class="btn btn-danger mt-2" onclick="location.href='/'">취소</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
