<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>${result.title}</title>
</head>
<body>
글 번호: ${result.id} <br>
제목: ${result.title} <br>
작성자: ${result.writerId} | ${result.entryDate} | ${result.modifyDate} <br>
내용: ${result.content} <br>
<c:if test="${loginId == result.writerId}">
    <div>
        <a href="/board/update/${result.id}">수정</a>
        <a href="/board/delete/${result.id}">삭제</a>
    </div>
</c:if>
</body>
</html>
