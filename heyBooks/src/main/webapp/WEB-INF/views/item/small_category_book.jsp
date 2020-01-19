<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="content_full_wrap sub_wrap" id="best_seller_box">
	<div class="container overhidden">
		<nav aria-label="breadcrumb">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="#">홈</a></li>
				<li class="breadcrumb-item " aria-current="page">대분류</li>
				<li class="breadcrumb-item " aria-current="page">중분류</li>
				<li class="breadcrumb-item active" aria-current="page">소분류</li>
			</ol>
		</nav>
		<div class="sub_full_box">
			<!-- <h3 style="margin-bottom:0;">신간도서 </h3>  -->
			<ul class="nav nav-tabs best_seller_nav">
				<li class="nav-item"><a class="nav-link <c:if test="${list_arr eq 'best' }">active</c:if>"
					href="<c:url value='/small_category_book?cate_num=${cate_num}&cate_name=${cate_name}&list_arr=best'/>">베스트셀러</a></li>
				<li class="nav-item"><a class="nav-link <c:if test="${list_arr eq 'new' }">active</c:if>"
					href="<c:url value='/small_category_book?cate_num=${cate_num}&cate_name=${cate_name}&list_arr=new'/>">신상품</a></li>
			</ul> 
			<div class="sub_right_content"> 
				<form class="small_cate_form" id="small_cate_form" method="post">
					<div class="itemList_top_menu">
						<div class="itemList_array_menu"> 
							<%-- 페이지 네비게이션 --%>
							<ul class="pagination item_pagenum">
								<li class="page-item"><a class="page-link" href="#"
									aria-label="Previous"> <span aria-hidden="true">«</span>
								</a></li>
								<c:forEach var="i" begin="${util.startPageNum }" end="${util.endPageNum }">
									<c:choose> 
										<c:when test="${util.pageNum==i }"> 
											<li class="page-item" id="page_ck" ><a class="page-link"  href="<c:url value='/small_category_book?pageNum=${i}&cate_num=${cate_num}&cate_name=${cate_name}&list_arr=${list_arr}'/>">${i}</a></li>
										</c:when>  
										<c:otherwise> 
											<li class="page-item"><a class="page-link" href="<c:url value='/small_category_book?pageNum=${i}&cate_num=${cate_num}&cate_name=${cate_name}&list_arr=${list_arr}'/>">${i}</a></li>
										</c:otherwise>
									</c:choose>  
								</c:forEach>  
								<li class="page-item"><a class="page-link" href="#" 
									aria-label="Next"> <span aria-hidden="true">»</span>
								</a></li>   
							</ul>
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
							<c:forEach var="vo" items="${item_list}" varStatus="status"> 
								<li class="book_item_box">
									<div class="book_item_box_left">  
										<div class="book_item_imgBox">
											<p class="book_item_rank">${(util.pageNum -1 ) * 10 + status.count}</p>
											<a href="#">   
												<c:set var="img" value="${vo.product_picture}"/>
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
												<c:if test="${vo.product_discount != '0'}"> 
													<span class="discount_tag">할인도서</span>
												</c:if>
												<c:if test="${vo.product_shipping_charge eq '0'}">
													<span class="parcel_tag">무료배송</span>
												</c:if> 
											</p> 
											<h3 class="list_book_title"> 
												<a>${vo.product_name}</a>
											</h3>
											<p class="book_info">평점
												<span class="star_before">
													<span class="star_after"></span>
												</span> 
												<span class="item_reviewCount">9명</span> 
												<span class="book_editor">
													<a>${editor_name[status.index]}</a>
												</span> 
												<span class="book_publising">
													<a>${vo.product_publish}</a>
												</span>   
												<span class="category">
													<a>${cate_name}</a>
												</span>    
											</p> 
											<p class="book_summary">${vo.product_discription}</p>
											<p class="book_price">가격 
												<span class="book_buy_price">
													<span>${vo.product_discount_price}</span>원
												</span>
												<span class="discount_percent">(<span>${vo.product_discount}%</span>↓)</span>
												<span class="origin_price"><span>${vo.product_price}</span>원</span>
											</p>  
										</div> 
									</div>
									<div class="book_item_box_right book_item_check">
										<p class="item_select_option">
											<input type="checkbox" name="item_checking" id="check_item${status.count}" value="${vo.product_num}" class="item_checking">
											<label for="check_item${status.count}" class="input_label"></label>
											<span style="font-size: 13px; margin-right: 5px; margin-top: 2px;">수량</span> 
											<input type="text" name="item_count_num" value="1" class="item_count_num" size="2" maxlength="2">
											<span class="item_quantity">
												<a class="item_quantity_plus">
											    	<i class="fas fa-caret-up"></i>
											    </a>  
											    <a class="item_quantity_minus">
													<i class="fas fa-caret-down"></i>
												</a>
											</span>
										</p>
										<a class="buy_btn item_right_btn">바로 구매</a>
										<a class="cart_btn item_right_btn">쇼핑카트 담기</a>
										<a onclick="javascript: form.action='/mypage_wishlist';" class="library_btn item_right_btn">위시리스트</a>
									</div>
								</li>
							</c:forEach>
						</ul>
					</div>
				</form>
				
			</div> 
		</div>
	</div>
</div>
