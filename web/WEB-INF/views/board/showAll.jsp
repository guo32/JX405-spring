<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>게시글 목록</title>
</head>
<body>
<c:forEach items="${list}" var="item">
    <a href="/board/showOne/${item.id}">${item.id} ${item.title} ${item.entryDate}</a> <br>
</c:forEach>
</body>
</html>
