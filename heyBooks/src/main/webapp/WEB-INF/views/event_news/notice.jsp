<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="event_box">
	<div class="container">
		<h3>공지사항</h3>
		<table class="table my_qna_table">
			<colgroup>
			 <col style="width:10%">
			 <col style="width:55%">
			 <col style="width:25%">
			 <col style="width:10%"> 
			</colgroup>
			<thead>
				<tr>
					<th scope="col">번호</th>
					<th scope="col">제목</th>
					<th scope="col">날짜</th>
					<th scope="col">조회수</th>
				</tr>
			</thead> 
			<tbody>
				<c:forEach var="list" items="${official_list }">
					<tr class="official_content"> 
						<td scope="row"><span class="tag">공지</span></td>
						<td style="text-align:left;"><a href="/sh/notice_detail?notice_num=${list.notice_num}&official=official">${list.notice_title}</a></td>
						<c:set var="date" value="${list.notice_date}"/> 
						<%--  수정 등록일 날짜,시간 표시  --%> 
						<%  
							Date date = (Date) pageContext.getAttribute("date");
							SimpleDateFormat sdate = new SimpleDateFormat("yyyy-MM-dd");
							String date_txt = sdate.format(date);
							pageContext.setAttribute("date_txt", date_txt); 
							 
						%> 
						<td>${date_txt }</td> 
						<td><span>${list.notice_hit }</span></td> 
					</tr> 
				</c:forEach>
				<c:forEach var="list" items="${content_list}" varStatus="status">
					<tr>  
						<td scope="row">${status.count}</td>
						<td style="text-align:left;"><a href="/sh/notice_detail?notice_num=${list.notice_num}">${list.notice_title}</a></td>
						<c:set var="date" value="${list.notice_date}"/> 
						<%--  수정 등록일 날짜,시간 표시  --%> 
						<%  
							Date date = (Date) pageContext.getAttribute("date");
							SimpleDateFormat sdate = new SimpleDateFormat("yyyy-MM-dd");
							String date_txt = sdate.format(date);
							pageContext.setAttribute("date_txt", date_txt); 
							
						%> 
						<td>${date_txt}</td> 
						<td><span>${list.notice_hit}</span></td> 
					</tr> 
				</c:forEach> 
			</tbody>
		</table>
		<ul class="pagination item_pagenum">
				<li class="page-item">  
					<c:choose>
						<c:when test="${(util.startPageNum%util.pageBlockCount==1) && (util.startPageNum>util.pageBlockCount)}">
							<a class="page-link" aria-label="Previous" href="<c:url value='/notice?pageNum=${util.startPageNum-1}&keyword=${notice_keyword}'/>">
								<span aria-hidden="true">«</span>
							</a>
						</c:when>     
						<c:otherwise>
							<a class="page-link" aria-label="Previous" href="<c:url value='/notice?pageNum=${util.pageNum-1}&keyword=${notice_keyword}'/>">
							<span aria-hidden="true">«</span>
							</a> 
						</c:otherwise> 
					</c:choose>   
				</li> 
				<c:forEach var="i" begin="${util.startPageNum }" end="${util.endPageNum }">
					<c:choose> 
						<c:when test="${util.pageNum==i }"> 
							<li class="page-item" id="page_ck" >
								<a class="page-link" href="<c:url value='/notice?pageNum=${i}&keyword=${notice_keyword}'/>">${i}</a>
							</li>
						</c:when> 
						<c:otherwise>  
							<li class="page-item">
								<a class="page-link" href="<c:url value='/notice?pageNum=${i}&keyword=${notice_keyword}'/>">${i}</a>
							</li>
						</c:otherwise>
					</c:choose>   
				</c:forEach>    
				<li class="page-item">
					<c:choose>
						<c:when test="${util.pageNum < util.totalPageCount}">
							<a class="page-link"   href="<c:url value='/notice?pageNum=${util.pageNum+1}&keyword=${notice_keyword}'/>" aria-label="Next"> 
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
			<p class="notice_search">
				<input type="text" name="keyword" value="${notice_keyword}">
				<button class="btn">검색</button>
			</p> 
	</div>
</div> 