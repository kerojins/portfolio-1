<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="event_box">
	<div class="container">
		<div class="board_title">
			<h3>공지사항</h3>
			<a href="<c:url value='/notice'/>">목록</a>
		</div> 
		<table class="table my_qna_table">
			<tbody>
				<tr>
					<th scope="col">제목</th>
					<td colspan="3">${vo.notice_title}</td>
				</tr>
				<tr>
					<th scope="row">등록일</th>
					<c:set var="date" value="${vo.notice_date}"/> 
					<%--  수정 등록일 날짜,시간 표시  --%> 
					<%  
						Date date = (Date) pageContext.getAttribute("date");
						SimpleDateFormat sdate = new SimpleDateFormat("yyyy-MM-dd");
						String date_txt = sdate.format(date);
						pageContext.setAttribute("date_txt", date_txt); 
						
					%>  
					<td>${date_txt}</td> 
					<th>조회수</th>
					<td><span>${vo.notice_hit}</span></td>
				</tr> 
			</tbody>
		</table>
		<div class="notice_content">
			${vo.notice_content}
		</div>
		<div class="board_detail_paging"> 
			<c:if test="${prev != null }">
				<a class="prev" href="<c:url value='/notice_detail?notice_num=${prev}'/>"><i class="fas fa-angle-double-left"></i>이전글</a>
			</c:if> 
			<c:if test="${next != null }">
				<a class="next" href="<c:url value='/notice_detail?notice_num=${next}'/>">다음글<i class="fas fa-angle-double-right"></i></a>
			</c:if> 
		</div> 
	</div>
</div>