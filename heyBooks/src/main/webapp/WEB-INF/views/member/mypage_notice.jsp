<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

		<div class="sub_right_box my_box_wrap">
			<div class="sub_right_content">
			<h3 class="my_page_title" style="float: none;">알림</h3>
				<div class="list_layout notice_layout" style="border-top: 2px solid #d2d3d4;">
					<ul>
						<c:forEach var="list" items="${push_list}" varStatus="status">
							<li>
								<div class="list_layout_left list_img_box">
									<p class="">
										<c:choose>
											<c:when test="${img_list[status.index] != null }">
												<img src="<c:url value='/resources/upload/editor/${img_list[status.index]}'/>">
											</c:when>
											<c:otherwise>
												<img style="border:2px solid #dbe4ea;" src="<c:url value='/resources/images/alert_img.png'/>">
											</c:otherwise>
										</c:choose> 
									</p> 
								</div>
								<div class="list_layout_right list_content">
										<c:choose>
											<c:when test="${list.push_category eq '이벤트'}">
												<a href="<c:url value='/event_detail?event_num=${list.push_ref}'/>"><p>${list.push_content}</p></a>
											</c:when>
											<c:when test="${list.push_category eq '공지'}">
												<a href="<c:url value='/notice_detail?notice_num=${list.push_ref}'/>"><p>${list.push_content}</p></a>
											</c:when>
											<c:otherwise> 
												<p>${list.push_content}</p>
											</c:otherwise>
										</c:choose>  
										<c:choose> 
											<c:when test="${day_list[status.index] ne 0}">
												<span>${day_list[status.index]}일전</span>
											</c:when>
											<c:otherwise>
												<span>오늘</span> 
											</c:otherwise>
										</c:choose>
								</div> 
							</li>
						</c:forEach> 
					</ul>
				</div>
			</div>
		</div>
	

 


