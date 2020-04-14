<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="event_box">
	<div class="container">
		<div class="board_title">
			<h3>이벤트</h3>
			<a href="<c:url value='/event_proceed'/>">목록</a>
		</div> 
		<div class="content_box">
			<h4>${vo.event_title }</h4>
			<div class="content_txt"> 
			  ${vo.event_content}
			</div>
		</div>
	</div>
</div>