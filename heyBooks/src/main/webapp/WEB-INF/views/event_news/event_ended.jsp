<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="event_box">
	<div class="container">
		<h3>이벤트</h3>
		<ul class="nav nav-tabs event_tabs">
			<li class="nav-item">
				<a class="nav-link" href="<c:url value='event_proceed'/>">진행 중인 이벤트</a>
			</li> 
			<li class="nav-item">
				<a class="nav-link active" href="<c:url value='event_ended'/>">지난 이벤트</a>
			</li>
		</ul> 
		<div class="list_layout event_list">
			<ul>
				<c:forEach var="list" items="${event_list}">
				<li>
					<div class="list_layout_left list_img_box">
						<a class="" href="<c:url value='/event_detail?event_num=${list.event_num}'/>">
							<img src="<c:url value='/resources/upload/editor/${list.event_thumbnail}'/>">
						</a>
					</div> 
					<div class="list_layout_right list_content event_content">
						<h4>
							<a href="<c:url value='/event_detail?event_num=${list.event_num}'/>">[EVENT] ${list.event_title}</a>
						</h4> 
						<div>
							<p>
								<span class="point_txt">기간</span>
								<span class="event_content_txt">${list.event_period}</span>
							</p>
							<p>
								<span class="point_txt">내용</span>
								<span class="event_content_txt">${list.event_content}</span>
							</p>
						</div> 
					</div>
				</li> 
				</c:forEach>
			</ul>
		</div>
		<ul class="pagination item_pagenum">
			<li class="page-item">  
				<c:choose>
					<c:when test="${(util.startPageNum%util.pageBlockCount==1) && (util.startPageNum>util.pageBlockCount)}">
						<a class="page-link" aria-label="Previous" href="<c:url value='/event_proceed?pageNum=${util.startPageNum-1}'/>">
							<span aria-hidden="true">«</span>
						</a>
					</c:when>     
					<c:otherwise>
						<a class="page-link" aria-label="Previous" href="<c:url value='/event_proceed?pageNum=${util.pageNum-1}'/>">
						<span aria-hidden="true">«</span>
						</a> 
					</c:otherwise> 
				</c:choose>   
			</li> 
			<c:forEach var="i" begin="${util.startPageNum }" end="${util.endPageNum }">
				<c:choose> 
					<c:when test="${util.pageNum==i }"> 
						<li class="page-item" id="page_ck" >
							<a class="page-link" href="<c:url value='/event_proceed?pageNum=${i}'/>">${i}</a>
						</li>
					</c:when> 
					<c:otherwise>  
						<li class="page-item">
							<a class="page-link" href="<c:url value='/event_proceed?pageNum=${i}'/>">${i}</a>
						</li>
					</c:otherwise>
				</c:choose>   
			</c:forEach>    
			<li class="page-item">
				<c:choose>
					<c:when test="${util.pageNum < util.totalPageCount}">
						<a class="page-link"   href="<c:url value='/event_proceed?pageNum=${util.pageNum+1}&event_now=now'/>" aria-label="Next"> 
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