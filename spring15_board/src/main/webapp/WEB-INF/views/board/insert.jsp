<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>views/insert.jsp</title>
</head>
<body>
<h1>글등록하기</h1>
<!-- 등록버튼을 누르면 입력한 내용이 db에 저장되도록 해보세요. -->
<form method="post" action="<c:url value='/board/insert'/>">
	작성자 <input type="text" name="writer"><br>
	제목 <input type="text" name="title"><br>
	내용 <textarea rows="5" cols="cols" name="content"></textarea><br>
	<input type="submit" value="등록">
</form>
</body>
</html>

















