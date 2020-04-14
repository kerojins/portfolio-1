<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="content_full_wrap sub_wrap" id="best_seller_box">
	<div class="container overhidden">
		<nav aria-label="breadcrumb">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="#">홈</a></li>
				<li class="breadcrumb-item active" aria-current="page">국내 도서</li>
			</ol>
		</nav>
		<aside>
			<h2>국내 도서</h2>
			<ul class="aside_menu_list">
				<c:forEach var="domestic_vo" items="${domestic_vo}">
					<li><a href='<c:url value="/medium_category_book?cate_num=${domestic_vo.cate_num}&cate_ref1=${domestic_vo.cate_ref1}&cate_name=${domestic_vo.cate_name}"/>'>${domestic_vo.cate_name}</a></li>
				</c:forEach>
			</ul> 
		</aside>
		<div class="sub_right_box">
			<div class="national_category_box">
				<div id="category_new_books">
					<h4>신간 도서</h4>
					<div class="category_new_books_slide">
						<c:forEach var="list" items="${new_item_list}" begin="0" end="5">
							<div class="vertical_item_box">
								<p class="favorite_item_img">
									<c:set var="img" value="${list.PRODUCT_PICTURE}"/>
										<% 
											String img_txt = (String)pageContext.getAttribute("img");
											if(img_txt != null){
												String img_name = img_txt.split(",")[1];
												pageContext.setAttribute("img_name", img_name);
											}
										%>
									<a href="<c:url value='/book_detail?product_num=${list.PRODUCT_NUM}'/>">
										<img src="<c:url value='resources/upload/${img_name }' />">
									</a>
								</p>  
								<div>
									<h4 class="vertical_item_title">
										<a href="<c:url value='/book_detail?product_num=${list.PRODUCT_NUM}'/>">${list.PRODUCT_NAME}</a>
									</h4>
									<p class="vertical_item_editor" style="padding-left: 4px;">
										<a href="#">${list.EDITOR_NAME}</a>
									</p>
	
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
				<div id="category_best"> 
					<h4>베스트 셀러</h4>
					<ul class="book_item_list">
						<c:forEach var="list" items="${best_item_list}" begin="0" end="5" varStatus="status">
							<c:choose>
								<c:when test="${status.index == 0}">
									<li class="book_item_box">
										<div class="book_item_box_left">
											<div class="book_item_imgBox"> 
												<p class="book_item_rank">1</p>
													<c:set var="img" value="${list.PRODUCT_PICTURE}"/>
													<% 
														String img_txt = (String)pageContext.getAttribute("img");
														if(img_txt != null){
															String img_name = img_txt.split(",")[1];
															pageContext.setAttribute("img_name", img_name);
														}
													%>
													<a href="<c:url value='/book_detail?product_num=${list.PRODUCT_NUM}'/>"> 
														<img width="60" src="/sh/resources/upload/${img_name}">
													</a>
											</div>
											<div class="book_item_content">
												<h6 class="list_book_title"><a href="<c:url value='/book_detail?product_num=${list.PRODUCT_NUM}'/>">${list.PRODUCT_NAME}</a></h6>
												<p class="book_info">
													<span class="book_editor">${list.EDITOR_NAME}</span>
													<span class="book_publising">${list.PRODUCT_PUBLISH}</span> 
												</p>
												<p class="book_price">
													<span class="book_buy_price"><span>${list.PRODUCT_DISCOUNT_PRICE}</span>원</span>
												</p> 
											</div> 
										</div>  
									</li>
								</c:when>
								<c:otherwise>
									<li class="item_other_list"><span>${status.count }</span><p><a href="<c:url value='/book_detail?product_num=${list.PRODUCT_NUM}'/>">${list.PRODUCT_NAME}</a></p></li>
								</c:otherwise>
							</c:choose>
							
						</c:forEach>
					</ul> 
				</div> 
			</div>
			<div class="category_array_box">
				<h4>분야별 TOP5</h4>
				<c:forEach var="i" begin="1" end="5" varStatus="status">
				<div class="section <c:if test="${i == 1}">on</c:if>" >
					<h5>  
						<a>${domestic_vo[i-1].cate_name}</a>
					</h5>
					<div class="section_content">  
						<ul> 
							<c:set var="best" value="best_item_list${i}"/>
							<c:forEach var="list" items="${requestScope[best]}" begin="0" end="4">
								<li>   
									<div class="vertical_item_box"> 
											<p class="favorite_item_img"> 
												<c:if test="${list.PRODUCT_PICTURE != null}">
													<c:set var="img" value="${list.PRODUCT_PICTURE}"/>
													<% 
														String img_txt = (String)pageContext.getAttribute("img");
														if(img_txt != null){
															String img_name = img_txt.split(",")[1];
															pageContext.setAttribute("img_name", img_name);
														}
													%>  
												</c:if>
												<a href="<c:url value='/book_detail?product_num=${list.PRODUCT_NUM}'/>">
													<img src="<c:url value='/resources/upload/${img_name}'/>">
												</a> 
											</p> 
											<div>
												<h4 class="vertical_item_title">
													<a href="<c:url value='/book_detail?product_num=${list.PRODUCT_NUM}'/>">${list.PRODUCT_NAME}</a>
												</h4> 
												<p class="vertical_item_editor">
													<a href="#">${list.EDITOR_NAME }</a>
												</p>
												<p class="vertical_item_rate">
													<span class="star_before item_list_star_before"> 
														<input hidden="hidden" class="item_star_val" value="${list.PRODUCT_GRADE}" >
														<span class="star_after"></span>
													</span>  
													<span class="item_reviewCount">${list.REVIEW_CNT}명</span>
												</p>
											</div>
										</div>
									</li>
							</c:forEach> 
						</ul>
					</div>
				</div> 
				</c:forEach>
				<span class="more_view"><a>+더보기</a></span>
			</div>
		</div>
	</div>
</div>







