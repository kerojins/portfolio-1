<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>home.jsp</title>
</head>
<body>
<h1>MyBoard</h1>
<img src="<c:url value='/resources/images/1.png'/>"><br>
<!-- 게시글등록을 누르면 insert.jsp페이지로 이동하도록 코드작성해 보세요. -->
<a href="<c:url value='/board/insert'/>">게시글등록</a><br>
<a href="<c:url value='/board/list'/>">게시글목록</a><br>
</body>
</html>







