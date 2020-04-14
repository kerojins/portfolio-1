<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


		<div class="sub_right_box my_box_wrap">
			<div class="sub_right_content">
				<div class="join_recent_wrap">
					<h3 class="my_page_title">최근 본 책</h3>
					<p>
						<a class="recent_delete">전체삭제</a>
					<p> 
					<ul class="join_recent_list" style="border-top: 2px solid #d2d3d4;">
						<c:forEach var="list" items="${item_list}" varStatus="status">
							<li> 
								<div class="vertical_item_box">
									<p class="favorite_item_img">
										<a href="<c:url value='/book_detail?product_num=${list.product_num}'/>"><img src="<c:url value = '/resources/upload/${list.product_picture}'/>"></a>
									</p> 
									<div>
										<h4 class="vertical_item_title">
											<a href="<c:url value='/book_detail?product_num=${list.product_num}'/>">${list.product_name}</a>
										</h4>
										<p class="vertical_item_editor">
											<a href="<c:url value='/editor_detail?editor_num=${list.product_editor_num}'/>">${editor_list[status.index]}</a>
										</p> 
									</div> 
								</div> 
							</li>
						</c:forEach>
					</ul>
				</div>
				<%-- 페이지 네비게이션 --%> 
				<ul class="pagination item_pagenum">
					<li class="page-item">  
						<c:choose>
							<c:when test="${(util.startPageNum%util.pageBlockCount==1) && (util.startPageNum>util.pageBlockCount)}">
								<a class="page-link" aria-label="Previous" href="<c:url value='/mypage_recent?pageNum=${util.startPageNum-1}&list_arr=${list_arr}&rowCount=${rowCount}'/>">
									<span aria-hidden="true">«</span>
								</a>
							</c:when>     
							<c:otherwise>
								<a class="page-link" aria-label="Previous" href="<c:url value='/mypage_recent?pageNum=${util.pageNum-1}&list_arr=${list_arr}&rowCount=${rowCount}'/>">
								<span aria-hidden="true">«</span>
								</a> 
							</c:otherwise>   
						</c:choose>   
					</li> 
					<c:forEach var="i" begin="${util.startPageNum }" end="${util.endPageNum }">
						<c:choose> 
							<c:when test="${util.pageNum==i }"> 
								<li class="page-item" id="page_ck" >
									<a class="page-link" href="<c:url value='/mypage_recent?pageNum=${i}&list_arr=${list_arr}&rowCount=${rowCount}'/>">${i}</a>
								</li>
							</c:when> 
							<c:otherwise> 
								<li class="page-item">
									<a class="page-link" href="<c:url value='/mypage_recent?pageNum=${i}&list_arr=${list_arr}&rowCount=${rowCount}'/>">${i}</a>
								</li>
							</c:otherwise>
						</c:choose>   
					</c:forEach>    
					<li class="page-item">
						<c:choose>
							<c:when test="${util.pageNum < util.totalPageCount}">
								<a class="page-link"   href="<c:url value='/mypage_recent?pageNum=${util.pageNum+1}&list_arr=${list_arr}&rowCount=${rowCount}'/>" aria-label="Next"> 
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




