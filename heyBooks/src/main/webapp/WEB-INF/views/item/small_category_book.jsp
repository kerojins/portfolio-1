<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="content_full_wrap sub_wrap" id="best_seller_box">
	<div class="container overhidden">
		<nav aria-label="breadcrumb">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="<c:url value='/'/>">홈</a></li>
				<li class="breadcrumb-item " aria-current="page"><a href="<c:url value='/domestic_book'/>">${cate_info_list[0].cate_name}</a></li>
				<li class="breadcrumb-item " aria-current="page"><a href="<c:url value='/medium_category_book?cate_num=${cate_info_list[1].cate_num}&cate_ref1=${cate_info_list[1].cate_ref1}&cate_name=${cate_info_list[1].cate_name}"'/>">${cate_info_list[1].cate_name}</a></li>
				<li class="breadcrumb-item active" aria-current="page"><a href="<c:url value='/small_category_book?cate_num=${cate_info_list[2].cate_num}&cate_name=${cate_info_list[2].cate_name}'/>">${cate_info_list[2].cate_name}</a></li>
			</ol>
		</nav>
		<div class="sub_full_box">
			<!-- <h3 style="margin-bottom:0;">신간도서 </h3>  -->
			<ul class="nav nav-tabs best_seller_nav">
				<li class="nav-item"><a class="nav-link <c:if test="${list_arr eq 'cnt'}">active</c:if>"
					href="<c:url value='/small_category_book?cate_num=${cate_num}&cate_name=${cate_name}&list_arr=cnt'/>">베스트 셀러</a></li>
				<li class="nav-item"><a class="nav-link <c:if test="${list_arr eq 'product_issue_date'}">active</c:if>"
					href="<c:url value='/small_category_book?cate_num=${cate_num}&cate_name=${cate_name}&list_arr=product_issue_date'/>">신간 도서</a></li>
			</ul>  
			<div class="sub_right_content">    
				<form class="small_cate_form" id="small_cate_form" method="post">
					<div class="itemList_top_menu">
						<div class="itemList_array_menu"> 
							<div class="array_select_list">
								<ul>
									<li><a href="<c:url value='/small_category_book?cate_num=${cate_num}&cate_name=${cate_name}&list_arr=cnt'/>" <c:if test="${list_arr eq 'cnt' }">class="active"</c:if>>순위 높은 순</a></li>
									<li><a href="<c:url value='/small_category_book?cate_num=${cate_num}&cate_name=${cate_name}&list_arr=product_issue_date'/>" <c:if test="${list_arr eq 'product_issue_date' }">class="active"</c:if>>발행일순</a></li>
									<li><a href="<c:url value='/small_category_book?cate_num=${cate_num}&cate_name=${cate_name}&list_arr=product_name'/>" <c:if test="${list_arr eq 'product_name' }">class="active"</c:if>>상품명순</a></li>
									<li><a href="<c:url value='/small_category_book?cate_num=${cate_num}&cate_name=${cate_name}&list_arr=product_grade'/>" <c:if test="${list_arr eq 'product_grade' }">class="active"</c:if>>평점순</a></li>
									<li><a href="<c:url value='/small_category_book?cate_num=${cate_num}&cate_name=${cate_name}&list_arr=product_review'/>" <c:if test="${list_arr eq 'product_review' }">class="active"</c:if>>리뷰순</a></li>
								</ul>
							</div> 
							<div class="item_all_choice"> 
								<span class="item_select_option"> 전체 
									<input type="checkbox" id="item_all_check">
									<label for="item_all_check" class="input_label"></label>
								</span>   
								<input class="btn btn-primary all_cart"  type="button" value="쇼핑카트 담기">
								<input class="btn btn-primary all_wish"  value="위시리스트">
							</div>
						</div> 
					</div> 
					<div class="book_item_list_box"> 
						<ul class="book_item_list">
							<c:forEach var="list" items="${item_list}" varStatus="status">
								<li class="book_item_box">
									<div class="book_item_box_left">   
										<div class="book_item_imgBox">
											<p class="book_item_rank">${status.count}</p>
											<a href="#">   
												<c:set var="img" value="${list.PRODUCT_PICTURE}"/>
												<% 
													String img_txt = (String)pageContext.getAttribute("img");
													if(img_txt != null){
														String img_name = img_txt.split(",")[1];
														pageContext.setAttribute("img_name", img_name);
													}
												%>
												<img width="110" src="<c:url value='/resources/upload/${img_name}'/>">
											</a> 
										</div>   
										<div class="book_item_content"> 
											<p class="item_tag">
												<c:if test="${list.PRODUCT_DISCOUNT ne '0'}"> 
													<span class="discount_tag">할인도서</span>
												</c:if>
												<c:if test="${list.PRODUCT_SHIPPING_CHARGE eq '0'}">
													<span class="parcel_tag">무료배송</span>
												</c:if>  
											</p>  
											<h3 class="list_book_title"> 
												<a href="book_detail?product_num=${list.PRODUCT_NUM}">${list.PRODUCT_NAME }</a>
											</h3>
											<p class="book_info"> 
												<span class="star_before item_list_star_before"> 
													<input hidden="hidden" class="item_star_val" value="${list.PRODUCT_GRADE}" >
													<span class="star_after"></span>
												</span>  
												<span class="item_reviewCount">${list.REVIEW_CNT}<c:if test="${list.REVIEW_CNT == null}">0</c:if>명</span> 
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
												<span class="origin_price"><span>${list.PRODUCT_PRICE }</span>원</span>
											</p>  
										</div>  
									</div>
									<div class="book_item_box_right book_item_check">
										<p class="item_select_option">  
											<input type="checkbox" name="item_checking" id="check_item${status.index}" value="${list.PRODUCT_NUM}" class="item_checking">
											<label for="check_item${status.index}" class="input_label"></label>
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
				</form>
				<%-- 페이지 네비게이션 --%> 
				<ul class="pagination item_pagenum">
					<li class="page-item">  
						<c:choose>
							<c:when test="${(util.startPageNum%util.pageBlockCount==1) && (util.startPageNum>util.pageBlockCount)}">
								<a class="page-link" aria-label="Previous" href="<c:url value='/small_category_book?pageNum=${util.startPageNum-1}&cate_num=${cate_num}&cate_name=${cate_name}&list_arr=${list_arr}&rowCount=${rowCount}'/>">
									<span aria-hidden="true">«</span>
								</a>
							</c:when>     
							<c:otherwise>
								<a class="page-link" aria-label="Previous" href="<c:url value='/small_category_book?pageNum=${util.pageNum-1}&cate_num=${cate_num}&cate_name=${cate_name}&list_arr=${list_arr}&rowCount=${rowCount}'/>">
								<span aria-hidden="true">«</span>
								</a> 
							</c:otherwise> 
						</c:choose>   
					</li> 
					<c:forEach var="i" begin="${util.startPageNum }" end="${util.endPageNum }">
						<c:choose> 
							<c:when test="${util.pageNum==i }"> 
								<li class="page-item" id="page_ck" >
									<a class="page-link" href="<c:url value='/small_category_book?pageNum=${i}&cate_num=${cate_num}&cate_name=${cate_name}&list_arr=${list_arr}&rowCount=${rowCount}'/>">${i}</a>
								</li>
							</c:when> 
							<c:otherwise> 
								<li class="page-item">
									<a class="page-link" href="<c:url value='/small_category_book?pageNum=${i}&cate_num=${cate_num}&cate_name=${cate_name}&list_arr=${list_arr}&rowCount=${rowCount}'/>">${i}</a>
								</li>
							</c:otherwise>
						</c:choose>   
					</c:forEach>    
					<li class="page-item">
						<c:choose>
							<c:when test="${util.pageNum < util.totalPageCount}">
								<a class="page-link"   href="<c:url value='/small_category_book?pageNum=${util.pageNum+1}&cate_num=${cate_num}&cate_name=${cate_name}&list_arr=${list_arr}&rowCount=${rowCount}'/>" aria-label="Next"> 
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
	</div>
</div>
