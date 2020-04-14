<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

	<div class="content_full_wrap sub_wrap" id="best_seller_box">
		<div class="container overhidden">
			<nav aria-label="breadcrumb">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="#">홈</a></li>
					<li class="breadcrumb-item active" aria-current="page">신간 도서</li>
				</ol>
			</nav>
			<aside>
				<h2>신간 도서</h2>
				<div class="aside_content">
						<p>
					<a>국내 도서</a>
					<i class="fas fa-plus <c:if test='${cate_ref1 > 100 && cate_ref1 < 700}'>collapsed</c:if>" data-toggle="collapse" data-target="#collapseExample1" aria-expanded="false" aria-controls="collapseExample1"></i> 
				</p>
				<ul class="collapse aside_menu_list <c:if test='${cate_ref1 > 100  && cate_ref1 < 700}'>show</c:if>" id="collapseExample1">
					<c:forEach var="domestic_vo" items="${domestic_vo}">
						<li>
							<a <c:if test='${cate_num eq domestic_vo.cate_num}'>style="color:#0e7eda; font-weight:bold"</c:if> href='<c:url value="/new_book?cate_num=${domestic_vo.cate_num}&cate_ref1=${domestic_vo.cate_ref1}"/>'>${domestic_vo.cate_name }</a>
						</li> 
					</c:forEach>  
				</ul>   
				<p>  
					<a>외국 도서</a>
					<i class="fas fa-plus <c:if test='${cate_ref1 >= 700}'>collapsed</c:if>" data-toggle="collapse" data-target="#collapseExample2" aria-expanded="false" aria-controls="collapseExample2"></i>
				</p> 
				<ul class="collapse aside_menu_list <c:if test='${cate_ref1 >= 700}'>show</c:if>" id="collapseExample2">
					<c:forEach var="oversea_vo" items="${oversea_vo}"> 
						<li>
							<a <c:if test='${cate_num eq oversea_vo.cate_num}'>style="color:#0e7eda; font-weight:bold"</c:if> href='<c:url value="/new_book?cate_num=${oversea_vo.cate_num }&cate_ref1=${oversea_vo.cate_ref1}"/>'>${oversea_vo.cate_name }</a>
						</li>
					</c:forEach>
				</ul> 
				</div>
			</aside>
			<div class="sub_right_box">
				<input hidden="hidden" class="having_date" value="date">
				<h3 style="margin-bottom: 15px;">신간도서 </h3> 
				<div class="sub_right_content">
					<form class="new_book_form">
							<div class="itemList_top_menu"> 
						<div class="best_seller_date">
							<input hidden="hidden" class="cate_ref1_val" value="${cate_ref1}">
							<input hidden="hidden" class="cate_num_val" value="${cate_num}">
							<input hidden="hidden" class="choice_year" value="${year}">
							<input hidden="hidden" class="choice_month" value="${month}">  
							<input hidden="hidden" class="choice_week" value="${week}">    
							<select class="form-control best_year" name="best_year"></select> 
							<select class="form-control best_month" name="best_month"></select>  
							<select class="form-control best_week"></select> 
							<input type="button" search_id="new_book" class="btn btn-primary week_search_btn" value="검색">
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
					<div class="itemList_array_menu">
						<%-- 페이지 네비게이션 --%> 
						<ul class="pagination item_pagenum" style="margin-top: 0;">
							<li class="page-item">  
								<c:choose>
									<c:when test="${(util.startPageNum%util.pageBlockCount==1) && (util.startPageNum>util.pageBlockCount)}">
										<a class="page-link" aria-label="Previous" href="<c:url value='/new_book?pageNum=${util.startPageNum-1}&year=${year}&month=${month}&week=${week}&cate_num=${cate_num}&cate_ref1=${cate_ref1}'/>">
											<span aria-hidden="true">«</span>
										</a>
									</c:when>     
									<c:otherwise>
										<a class="page-link" aria-label="Previous" href="<c:url value='/new_book?pageNum=${util.pageNum-1}&year=${year}&month=${month}&week=${week}&cate_num=${cate_num}&cate_ref1=${cate_ref1}'/>">
										<span aria-hidden="true">«</span>
										</a> 
									</c:otherwise> 
								</c:choose>    
							</li> 
							<c:forEach var="i" begin="${util.startPageNum }" end="${util.endPageNum }">
								<c:choose> 
									<c:when test="${util.pageNum==i }"> 
										<li class="page-item" id="page_ck" >
											<a class="page-link" href="<c:url value='/new_book?pageNum=${i}&year=${year}&month=${month}&week=${week}&cate_num=${cate_num}&cate_ref1=${cate_ref1}'/>">${i}</a>
										</li>
									</c:when> 
									<c:otherwise> 
										<li class="page-item">
											<a class="page-link" href="<c:url value='/new_book?pageNum=${i}&year=${year}&month=${month}&week=${week}&cate_num=${cate_num}&cate_ref1=${cate_ref1}'/>">${i}</a>
										</li>
									</c:otherwise>
								</c:choose>   
							</c:forEach>    
							<li class="page-item">
								<c:choose>
									<c:when test="${util.pageNum < util.totalPageCount}">
										<a class="page-link"   href="<c:url value='/new_book?pageNum=${util.pageNum+1}&year=${year}&month=${month}&week=${week}&cate_num=${cate_num}&cate_ref1=${cate_ref1}'/>" aria-label="Next"> 
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
						<div class="best_seller_info">
							<p><span class="year_txt"></span>년도 <span class="month_txt"></span>월 <span class="week_txt"></span>째주 신간도서</p>
						</div> 
					</div> 
						<div class="book_item_list_box">
							<ul class="book_item_list">
								<c:forEach var="list" items="${item_list}" varStatus="status">
								<li class="book_item_box"> 
									<div class="book_item_box_left">   
										<div class="book_item_imgBox">
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
												<c:if test="${list.PRODUCT_DISCOUNT != '0'}"> 
													<span class="discount_tag">할인도서</span>
												</c:if>
												<c:if test="${list.PRODUCT_SHIPPING_CHARGE eq '0'}">
													<span class="parcel_tag">무료배송</span>
												</c:if> 
											</p>  
											<h3 class="list_book_title"> 
												<a href="book_detail?product_num=${list.PRODUCT_NUM}">${list.PRODUCT_NAME }</a>
											</h3>
											<p class="book_info">평점 
												<span class="star_before item_list_star_before"> 
													<input hidden class="item_star_val" value="${list.PRODUCT_GRADE}" >
													<span class="star_after"></span>
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
				</div>
			</div>
		</div>
	</div>
