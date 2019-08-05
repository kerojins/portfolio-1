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
<h1>글수정하기</h1>
<form method="post" action="<c:url value='/board/insert'/>">
	글번호 <input type="text" name="num" value="${vo.num }" readonly="readonly"><br>
	작성자 <input type="text" name="writer" value="${vo.writer }"><br>
	제목 <input type="text" name="title" value="${vo.title }"><br>
	내용 <textarea rows="5" cols="cols" name="content">${vo.content }</textarea><br>
	작성일 <input type="text"  value="${vo.regdate}" disabled="disabled"><br>
	<input type="submit" value="등록">
</form>
</body>
</html>

















