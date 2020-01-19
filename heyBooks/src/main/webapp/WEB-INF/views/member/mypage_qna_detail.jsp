<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="sub_right_box my_box_wrap">
	<div class="sub_right_content">
		<h3 class="my_page_title" style="margin-bottom: 20px">1:1 문의</h3>
		<table class="table my_qna_table">
			<tr>
				<th scope="col">제목</th>
				<td colspan="3" >${vo.counsel_title}</td>
			</tr>
			<tr>
				<th scope="row">등록일</th>
					<c:set var="date" value="${vo.counsel_date}" />
					<%-- 수정 등록일 날짜,시간 표시 --%>
					<%
							Date date = (Date) pageContext.getAttribute("date");
							SimpleDateFormat sdate = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
							String date_txt = sdate.format(date);
							pageContext.setAttribute("date_txt", date_txt);
					%> 
				<td>${date_txt}</td> 
				<th>답변상태</th>
				<td><span>${vo.counsel_answer}</span></td>
			</tr>
		</table>
		<div class="qna_detail_box question_box">
			<span>Q</span>
			<p>${vo.counsel_content}</p>
		</div>
		<div class="qna_detail_box answer_box"> 
			<span>A</span>
			<p>이거 내용이 이상해요 정말 정말</p>
		</div>
		<div class="twin_btn qna_btn"> 
			<a class="twin_home_btn" href="/sh/mypage_qna">목록보기</a>
			<a href="<c:url value='counsel_update?counsel_num=${vo.counsel_num}'/>" class="twin_page_btn">수정하기</a>
		</div>
	</div>
</div>
