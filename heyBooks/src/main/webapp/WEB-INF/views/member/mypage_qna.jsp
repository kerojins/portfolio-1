<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
		<div class="sub_right_box my_box_wrap">
			<div class="sub_right_content">
				<h3 class="my_page_title" style="margin-bottom:10px">1:1 문의</h3>
				<a href="<c:url value='/mypage_qna_write'/>" class="qna_btn">문의하기</a>  
				<table class="table my_qna_table">
					<colgroup>
					 <col style="width:10%">
					 <col style="width:50%">
					 <col style="width:20%">
					 <col style="width:20%"> 
					</colgroup>
					<thead>
						<tr>
							<th scope="col">번호</th>
							<th scope="col">제목</th>
							<th scope="col">날짜</th>
							<th scope="col">답변상태</th>
						</tr>
					</thead> 
					<tbody>
						<c:forEach var="vo" items="${list}" varStatus="status" >
						<tr> 
							<td scope="row">${(util.pageNum -1 ) * 10 + status.count}</td>
							<td style="text-align: left;"><a href="<c:url value='/counsel_detail?counsel_num=${vo.counsel_num}'/>">${vo.counsel_title }</a></td>
							
							<c:set var="date" value="${vo.counsel_date}" />
							<%-- 수정 등록일 날짜,시간 표시 --%>
							<%
									Date date = (Date) pageContext.getAttribute("date");
									SimpleDateFormat sdate = new SimpleDateFormat("yyyy-MM-dd");
									String date_txt = sdate.format(date);
									pageContext.setAttribute("date_txt", date_txt);
							%>
							<td>${date_txt}</td> 
							<td><span style="font-weight: 600;">${vo.counsel_answer }</span></td> 
						</tr> 
						</c:forEach>  
					</tbody>
				</table> 
				<%-- 페이지 네비게이션 --%>
						<ul class="pagination item_pagenum">
							<li class="page-item"> 
								<c:choose>
									<c:when test="${(util.startPageNum%util.pageBlockCount==1) && (util.startPageNum>util.pageBlockCount)}">
										<a class="page-link" href="<c:url value='/mypage_qna?pageNum=${util.startPageNum-1 }&list_arr=${list_arr}'/>" aria-label="Previous">
											<span aria-hidden="true">«</span>
										</a>
									</c:when>   
									<c:otherwise>
										<a class="page-link" href="<c:url value='/mypage_qna?pageNum=${util.pageNum-1 }&list_arr=${list_arr}'/>" aria-label="Previous">
										<span aria-hidden="true">«</span>
										</a> 
									</c:otherwise>
								</c:choose>   
							</li> 
							<c:forEach var="i" begin="${util.startPageNum }" end="${util.endPageNum }">
								<c:choose> 
									<c:when test="${util.pageNum==i }"> 
										<li class="page-item" id="page_ck"><a class="page-link"  href="<c:url value='/mypage_qna?pageNum=${i}&list_arr=${list_arr}'/>">${i}</a></li>
									</c:when>  
									<c:otherwise>  
										<li class="page-item"><a class="page-link" href="<c:url value='/mypage_qna?pageNum=${i}&list_arr=${list_arr}'/>">${i}</a></li>
									</c:otherwise>
								</c:choose>  
							</c:forEach>    
							<li class="page-item">
								<c:choose>
									<c:when test="${util.pageNum < util.totalPageCount}">
										<a class="page-link" href="<c:url value='mypage_qna?pageNum=${util.pageNum + 1 }&list_arr=${list_arr}&'/>" aria-label="Next"> 
											<span aria-hidden="true">»</span>
										</a>
									</c:when>  
									<c:otherwise>
										<a class="page-link" href=""> 
											<span aria-hidden="true">»</span>
										</a>
									</c:otherwise>
								</c:choose>
							</li>    
						</ul>
				</div>
			</div>
