<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

		<div class="sub_right_box my_box_wrap">
			<div class="sub_right_content">
				<h3 class="my_page_title">신간 알림</h3>
				<div class="notice_editor">
					<div class="array_select_list">
						<ul>
						
							<li><a>최근 출간순</a></li>
							<li><a>가나다순</a></li>
						</ul>
					</div>
					<ul class="notice_editor_list">
						<c:forEach var="item_list" items="${editor_item_list}" varStatus="status">
							<li>
								<div class="notice_editor">
									<p>${editor_list[status.index].editor_name}</p>
									<%-- <span>Henry David Thoreau</span> --%>
								</div> 
								<ul class="notice_editor_book"> 
									<c:forEach var="list" items="${item_list}" varStatus="list_status">
										<li>
											<p class="notice_editor_book_img">
												<a>
													<img src="<c:url value='/resources/upload/${list.PRODUCT_PICTURE}'/>">
												</a>
											</p>
											<div class="notice_editor_book_content">
												<c:if test="${list.new_item eq 'new'}">
													<span class="new_item_mark">NEW!</span> 
												</c:if>
												<p class="notice_editor_title">
													<a>${editor_list[status.index].editor_name}</a>
												</p>
												<span>${list.PRODUCT_ISSUE_DATE}</span> 
												
											</div> 
										</li>   
									</c:forEach>  
								</ul>   
								<p class="notice_editor_delete"> 
									<a href="<c:url value='/mypage_book_notice_delete?editor_num=${editor_list[status.index].editor_num}'/>">삭제</a>
								</p>
						</li>
						</c:forEach>
					</ul>
				</div>
			</div>
		</div>



