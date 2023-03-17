<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>인덱스</title>
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
                <div class="text-center fs-3 mb-2 text-light">👾 게시판 로그인 👾</div>
                <div class="bg-gradient p-3 rounded-2">
                    <c:if test="${not empty message}">
                        <div class="alert alert-dismissible alert-danger">
                            <h6>${message}</h6>
                        </div>
                    </c:if>
                    <form method="post" action="/user/auth">
                        <label for="input-username" class="col-form-label">아이디</label>
                        <input type="text" id="input-username" name="username" placeholder="아이디" class="form-control"/>
                        <label for="input-password" class="col-form-label">비밀번호</label>
                        <input type="password" id="input-password" name="password" placeholder="비밀번호" class="form-control"/>
                        <div class="mt-2 text-center">
                            <button type="submit" class="btn btn-primary">로그인</button>
                            <button type="button" onclick="location.href='/user/register'" class="btn btn-light">회원가입</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
