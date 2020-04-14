<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="search_page">
	<div class="container">
		<div id="search_content_box">
			<div class="search_content">
				<div class="search_title">
					<h3>검색결과</h3> 
				</div>
				<div class="editor_search_content">
				<h4>'${keyword}' 저자검색 결과</h4>
				 	<ul>
				 		<c:forEach var="list" items="${editor_list}">
					 		<li>
						 		<span class=editor_name>${list.editor_name}</span>
						 		<span class="item_name">${list.editor_item_name}</span>
						 		<c:if test="${list.editor_item_count>1}">
						 			<span class="item_count">외 ${list.editor_item_count-1}권</span>
						 		</c:if>
					 		</li> 
				 		</c:forEach>
				 	</ul>
				</div>
				<div class="item_search_content">
					<h4>'${keyword}' 도서검색 결과</h4>
					<div class="book_item_list_box">
						<div class="itemList_top_menu">
							<div class="itemList_array_menu"> 
								<div class="array_select_list" style="float: left;">
									<ul>
										<li><a href="<c:url value='/search?&keyword=${keyword}&cate_code=${cate_code}&list_arr=cnt'/>" <c:if test="${list_arr eq 'cnt'}">class="active"</c:if>>순위 높은 순</a></li>
										<li><a href="<c:url value='/search?&keyword=${keyword}&cate_code=${cate_code}&list_arr=PRODUCT_ISSUE_DATE'/>" <c:if test="${list_arr eq 'PRODUCT_ISSUE_DATE'}">class="active"</c:if>>발행일순</a></li>
										<li><a href="<c:url value='/search?&keyword=${keyword}&cate_code=${cate_code}&list_arr=PRODUCT_NAME'/>" <c:if test="${list_arr eq 'PRODUCT_NAME'}">class="active"</c:if>>상품명순</a></li>
										<li><a href="<c:url value='/search?&keyword=${keyword}&cate_code=${cate_code}&list_arr=PRODUCT_GRADE'/>" <c:if test="${list_arr eq 'PRODUCT_GRADE'}">class="active"</c:if>>평점순</a></li>
										<li><a href="<c:url value='/search?&keyword=${keyword}&cate_code=${cate_code}&list_arr=REVIEW_CNT'/>" <c:if test="${list_arr eq 'REVIEW_CNT'}">class="active"</c:if>>리뷰순</a></li>
									</ul>  
								</div>   
							</div>   
						</div>
						<ul class="book_item_list">  
							<c:forEach var="list" items="${item_list}">
								<li class="book_item_box"> 
									<div class="book_item_box_left">   
										<div class="book_item_imgBox">
											<a href="#">    
												<img width="110" src="<c:url value='/resources/upload/${list.PRODUCT_PICTURE}'/>">
											</a> 
										</div>   
										<div class="book_item_content"> 
											<c:if test="${list.PRODUCT_DISCOUNT ne '0'}"> 
													<span class="discount_tag">할인도서</span>
											</c:if>
											<c:if test="${list.PRODUCT_SHIPPING_CHARGE eq '0'}"> 
												<span class="parcel_tag">무료배송</span>
											</c:if>   
											<h3 class="list_book_title" style="margin-top: 6px;">  
												<a href="book_detail?product_num=${list.PRODUCT_NUM}">${list.PRODUCT_NAME}</a>
											</h3>
											<p class="book_info"> 
												<span class="star_before item_list_star_before"> 
													<input hidden="hidden" class="item_star_val" value="${list.PRODUCT_GRADE}" style="width: 4px;">
													<span class="star_after" style="width: 0px;"></span>
												</span>  
												<span class="item_reviewCount">${list.REVIEW_CNT}명</span> 
												<span class="book_editor"> 
													<a>${list.EDITOR_NAME}</a> 
												</span>  
												<span class="book_publising">  
													<a>${list.PRODUCT_PUBLISH}</a> 
												</span>     
												<span class="category"> 
													<a>${list.CATE_NAME}</a> 
												</span>    
											</p>  
											<p class="book_summary">${list.PRODUCT_DISCRIPTION}</p>
											<p class="book_price">가격 
												<span class="book_buy_price"> 
													<span>${list.PRODUCT_DISCOUNT_PRICE}</span>원
												</span>
												<span class="discount_percent">(<span>${list.PRODUCT_DISCOUNT}%</span>↓)</span>
												<span class="origin_price"><span>${list.PRODUCT_PRICE}</span>원</span>
											</p>  
										</div>  
									</div>
									<div class="book_item_box_right book_item_check">
										<p class="item_select_option" style="padding-left: 21px">  
											<span style="font-size: 13px; margin-right: 5px; margin-top: 2px;">수량</span> 
											<input type="text" name="item_count_num" value="1" class="item_count_num" size="2" maxlength="2">
											<span class="item_quantity">
												<a class="item_quantity_plus">
											    	<i class="fas fa-caret-up" aria-hidden="true"></i> 
											    </a>  
											    <a class="item_quantity_minus">
													<i class="fas fa-caret-down" aria-hidden="true"></i>
												</a>
											</span> 
										</p>
										<a class="buy_btn item_right_btn">바로 구매</a>
										<a class="cart_btn item_right_btn">쇼핑카트 담기</a>
										<a class="wishlist_btn item_right_btn">위시리스트</a>
									</div>
								</li>
							 </c:forEach>
						</ul>
					</div>
					<ul class="pagination item_pagenum" style="margin:20px 0 30px">
						<li class="page-item">  
							<c:choose> 
								<c:when test="${(util.startPageNum%util.pageBlockCount==1) && (util.startPageNum>util.pageBlockCount)}">
									<a class="page-link" aria-label="Previous" href="<c:url value='/search?pageNum=${util.startPageNum-1}&keyword=${keyword}&list_arr=${list_arr}&cate_code=${cate_code}'/>">
										<span aria-hidden="true">«</span>
									</a>
								</c:when>     
								<c:otherwise>
									<a class="page-link" aria-label="Previous" href="<c:url value='/search?pageNum=${util.pageNum-1}&keyword=${keyword}&list_arr=${list_arr}&cate_code=${cate_code}'/>">
									<span aria-hidden="true">«</span>
									</a> 
								</c:otherwise> 
							</c:choose>   
						</li> 
						<c:forEach var="i" begin="${util.startPageNum }" end="${util.endPageNum }">
							<c:choose> 
								<c:when test="${util.pageNum==i }"> 
									<li class="page-item" id="page_ck" >
										<a class="page-link" href="<c:url value='/search?pageNum=${i}&keyword=${keyword}&list_arr=${list_arr}&cate_code=${cate_code}'/>">${i}</a>
									</li>
								</c:when> 
								<c:otherwise>  
									<li class="page-item"> 
										<a class="page-link" href="<c:url value='/search?pageNum=${i}&keyword=${keyword}&list_arr=${list_arr}&cate_code=${cate_code}'/>">${i}</a>
									</li>
								</c:otherwise>
							</c:choose>   
						</c:forEach>    
						<li class="page-item">
							<c:choose>
								<c:when test="${util.pageNum < util.totalPageCount}">
									<a class="page-link"   href="<c:url value='/search?pageNum=${util.pageNum+1}&keyword=${keyword}&list_arr=${list_arr}&cate_code=${cate_code}'/>" aria-label="Next"> 
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
			<aside class="search_aside">
				<h5>분야</h5>
				<ul>
					<li>
						<a href="<c:url value='/search?&keyword=${keyword}&list_arr=${list_arr}'/>">전체<span>(${total_count})</span></a>
					</li>
					<c:forEach var="list" items="${cate_count_list}">
						<li>
							<a href="<c:url value='/search?&keyword=${keyword}&list_arr=${list_arr}&cate_code=${list.cate_code}'/>">${list.cate_name }<span>(${list.cate_count})</span></a>
						</li>
					</c:forEach>
				</ul>
			</aside>
			
		</div>
	</div>
</div>