<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="content_full_wrap sub_wrap" id="best_seller_box">
	<div class="container overhidden">
		<nav aria-label="breadcrumb">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="#">홈</a></li>
				<li class="breadcrumb-item" aria-current="page">
					<c:choose>
						<c:when test="${medium_cate_vo[0].cate_ref2 eq '100'}">	
							국내 도서
						</c:when>
						<c:otherwise>
							외국 도서  
						</c:otherwise>
					</c:choose>
				</li>
				<li class="breadcrumb-item active" aria-current="page">${cate_name }</li>
			</ol>
		</nav>
		<aside>
			<h2>${cate_name}</h2>
			<ul class="aside_menu_list">
				<c:forEach var="medium_cate_vo" items="${medium_cate_vo}">
					<li><a href="<c:url value='/small_category_book?cate_num=${medium_cate_vo.cate_num}&cate_name=${medium_cate_vo.cate_name}'/>">${medium_cate_vo.cate_name}</a></li>
				</c:forEach> 
			</ul> 
		</aside>
		<div class="sub_right_box">
			<div class="category_array_box">
				<h4>새로나온 책</h4>
				<c:forEach var="i" begin="1" end="5" varStatus="status">
					<div class="section <c:if test="${i == 1}">on</c:if>" >
						<h5>  
							<a>${medium_cate_vo[i-1].cate_name}</a>
						</h5>
						<div class="section_content">   
							<ul> 
								<c:set var="best" value="new_item_list${i}"/>
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
			<div class="category_array_box">
				<h4>베스트 셀러</h4>
				<c:forEach var="i" begin="1" end="5" varStatus="status">
					<div class="section <c:if test="${i == 1}">on</c:if>" >
						<h5>  
							<a>${medium_cate_vo[i-1].cate_name}</a>
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
														<a href="#">${list.EDITOR_NAME}</a>
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







