<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 2023-03-15
  Time: 오후 7:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>글</title>
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
<div class="container h-100">
    <div class="d-flex align-items-center">
        <div class="col">
            <div class="col-10">
                <form action="/board/upsert" method="post">
                    <input type="hidden" value="${board.id}" name="attemptId"/>
                    <div class="row mb-1">
                        <div class="col">
                            <label for="form-title">제목</label>
                            <input type="text" name="title" value="${board.title}" class="form-control" id="form-title"/>
                        </div>
                    </div>
                    <div class="row mb-1">
                        <div class="col">
                            <label for="form-content">내용</label>
                            <input type="text" name="content" value="${board.content}" class="form-control" id="form-content"/>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <button type="submit" class="btn btn-success mt-2">입력</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>
