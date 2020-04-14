<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="editor_box">
	<div class="container">
			<div class="item_detail_content">
				<div class="item_detail_middle_box editor_info">
					<h3>작가 프로필</h3> 
					<div class="editor_info_content">
						<a href="<c:url value='/editor_notice_insert?editor_num=${editor_vo.editor_num}'/>" class="editor_alert_btn">
							<input hidden="hidden" class="editor_add_msg" value="${msg}">
							<i class="fas fa-plus"></i> 
							작가 신간알림 및 소식 받기 
						</a>  
						<h4>${editor_vo.editor_name}</h4>
						<ul>
							<li>
								<span class="editor_info_list_title">국적</span> 
								<span class="editor_info_list_content">${editor_vo.editor_nation}</span>
							</li>
							<li>
								<span class="editor_info_list_title">출생</span> 
								<span class="editor_info_list_content">
							<c:choose>
								<c:when test="${editor_birth_arr != null}">
									${editor_birth_arr[0]}년 ${editor_birth_arr[1]}월 ${editor_birth_arr[2]}일
								</c:when>
								<c:otherwise>
									불명
								</c:otherwise>
							</c:choose>
							</span></li>
							<c:if test="${eidtor_school ne ''}">
								<li>
									<span class="editor_info_list_title">학력</span> 
									<span class="editor_info_list_content"> 
										${editor_school}
									</span> 
								</li>
							</c:if>
							<c:if test="${eidtor_award ne ''}">
							<li> 
								<span class="editor_info_list_title">수상</span> 
								<span class="editor_info_list_content"> 
									${editor_award}
								</span> 
							</li>  
							</c:if> 
						</ul>
						<div class="editor_about">${editor_vo.editor_introduce }</div>
					</div>
				</div>	  
				<div class="item_detail_middle_box"> 
					<h3>작가 등록 작품</h3>
					<div class="itemList_array_menu"> 
							<div class="array_select_list">
								<ul>
									<li><a href="<c:url value='/editor_detail?editor_num=${editor_vo.editor_num}&list_arr=cnt'/>" <c:if test="${list_arr eq 'cnt' }">class="active"</c:if>>판매순</a></li>
									<li><a href="<c:url value='/editor_detail?editor_num=${editor_vo.editor_num}&list_arr=product_name'/>" <c:if test="${list_arr eq 'product_name' }">class="active"</c:if>>상품명순</a></li>
									<li><a href="<c:url value='/editor_detail?editor_num=${editor_vo.editor_num}&list_arr=product_grade'/>" <c:if test="${list_arr eq 'product_grade' }">class="active"</c:if>>평점순</a></li>
								</ul>
							</div> 
					</div>  
					<div class="book_item_list_box"> 
						<ul class="book_item_list"> 
							<c:forEach var="list" items="${editor_item_list}" varStatus="status">
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
												<c:if test="${list.PRODUCT_DISCOUNT ne '0'}"> 
													<span class="discount_tag">할인도서</span>
												</c:if>
												<c:if test="${list.PRODUCT_SHIPPING_CHARGE eq '0'}">
													<span class="parcel_tag">무료배송</span>
												</c:if>  
											</p>  
											<h5 class="list_book_title"> 
												<a href="book_detail?product_num=${list.PRODUCT_NUM}">${list.PRODUCT_NAME }</a>
											</h5>
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
										<p class="item_select_option" style="padding-left:40px; ">  
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
					<%-- 페이지 네비게이션 --%>  
					<ul class="pagination item_pagenum" style="margin-top: 20px">
						<li class="page-item">  
							<c:choose>
								<c:when test="${(util.startPageNum%util.pageBlockCount==1) && (util.startPageNum>util.pageBlockCount)}">
									<a class="page-link" aria-label="Previous" href="<c:url value='/editor_detail?pageNum=${util.startPageNum-1}&editor_num=${editor_vo.editor_num}&list_arr=${list_arr}'/>">
										<span aria-hidden="true">«</span>
									</a>
								</c:when>     
								<c:otherwise>
									<a class="page-link" aria-label="Previous" href="<c:url value='/editor_detail?pageNum=${util.pageNum-1}&editor_num=${editor_vo.editor_num}&list_arr=${list_arr}'/>">
									<span aria-hidden="true">«</span>
									</a> 
								</c:otherwise> 
							</c:choose>   
						</li> 
						<c:forEach var="i" begin="${util.startPageNum }" end="${util.endPageNum }">
							<c:choose> 
								<c:when test="${util.pageNum==i }"> 
									<li class="page-item" id="page_ck" >
										<a class="page-link" href="<c:url value='/editor_detail?pageNum=${i}&editor_num=${editor_vo.editor_num}&list_arr=${list_arr}'/>">${i}</a>
									</li>
								</c:when> 
								<c:otherwise> 
									<li class="page-item">
										<a class="page-link" href="<c:url value='/editor_detail?pageNum=${i}&editor_num=${editor_vo.editor_num}&list_arr=${list_arr}'/>">${i}</a>
									</li>
								</c:otherwise>
							</c:choose>   
						</c:forEach>    
						<li class="page-item">
							<c:choose>
								<c:when test="${util.pageNum < util.totalPageCount}">
									<a class="page-link"   href="<c:url value='/editor_detail?pageNum=${util.pageNum+1}&editor_num=${editor_vo.editor_num}&list_arr=${list_arr}'/>" aria-label="Next"> 
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
</div>