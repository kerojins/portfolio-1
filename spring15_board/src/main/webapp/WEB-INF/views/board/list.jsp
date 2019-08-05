<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>글목록</h1>
<table border="1" width="500">
	<tr>
		<th>글번호</th>
		<th>글제목</th>
		<th>작성자</th>
		<th>조회수</th>
		<th>작성일</th>
		<th>수정</th>
		<th>삭제</th>
		<th>상세글보기</th>
	</tr>
	<c:forEach var="vo" items="${list }">
		<tr>
			<td>${vo.num }</td>
			<td>${vo.title }</td>
			<td>${vo.writer }</td>
			<td>${vo.hit }</td>
			<td>${vo.regdate }</td>
			<td><a href="<c:url value='/board/update?num=${vo.num }'/>">수정</a></td>
			<td><a href="<c:url value='/board/delete?num=${vo.num }'/>">삭제</a></td>
			<td><a href="<c:url value='/board/detail?num=${vo.num }'/>">상세글보기</a></td>
		</tr>
	</c:forEach>
</table>
<br>
<div>
	<c:forEach var="i" begin="${pu.startPageNum }" end="${pu.endPageNum }">
		<c:choose>
			<c:when test="${pu.pageNum==i }">
				<a href="<c:url value='/board/list?pageNum=${i }&field=${field }&keyword=${keyword }'/>">
				<span style="color:blue">[${i }]</span></a>
			</c:when>
			<c:otherwise>
				<a href="<c:url value='/board/list?pageNum=${i }&field=${field }&keyword=${keyword }'/>">
				<span style="color:gray">[${i }]</span></a>
			</c:otherwise>
		</c:choose>
	</c:forEach>
</div>
<div>
	<form method="post" action="<c:url value='/board/list'/>">
		<select name="field">
			<option value="title" <c:if test="${field=='title' }">selected="selected"</c:if>>글제목</option>
			<option value="writer" <c:if test="${field=='writer' }">selected="selected"</c:if>>작성자</option>
			<option value="content" <c:if test="${field=='content' }">selected="selected"</c:if>>내용</option>
		</select>
		<input type="text" name="keyword" value="${keyword }">
		<input type="submit" value="검색">
	</form>
</div>
<a href="<c:url value='/board/list'/>">전체글목록</a>
<a href="<c:url value='/'/>">홈으로</a>
</body>
</html>












