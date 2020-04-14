<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


		<div class="sub_right_box my_box_wrap">
			<div class="sub_right_content">
				<form class="wishlist_form" action="<c:url value='/wishlist_delete'/>" method="post">
					<div class="order_content">
						<h3 class="my_page_title" style="margin-bottom:20px">위시리스트</h3>
						<div class="itemList_top_menu">
						<div class="itemList_array_menu"> 
							<div class="item_all_choice"> 
								<span class="item_select_option"> 전체  
									<input type="checkbox" id="item_all_check" checked>
									<label for="item_all_check" class="input_label"></label>
								</span>    
								<input class="btn btn-primary all_cart"  type="button" value="쇼핑카트 담기">
								<input class="btn btn-primary all_del"   type="submit" value="삭제">
							</div>
						</div>  
					</div> 
						<table class="order_table">
							<tbody>
							<c:forEach var="list" items="${wish_item_list}" varStatus="status">
								<tr>
									<td class="order_item_info">
										<p class="item_select_option">
											<input type="checkbox" name="item_checking" checked id="check_item${status.index}" value="${list.product_num}" class="item_checking">
											<label for="check_item${status.index}" class="input_label">
												<i class="fas fa-check" aria-hidden="true"></i>
											</label>
										</p>
										<p class="order_item_img">
											<c:set var="img" value="${list.product_picture}"/>
											<% 
												String img_txt = (String)pageContext.getAttribute("img");
												if(img_txt != null){
													String img_name = img_txt.split(",")[1];
													pageContext.setAttribute("img_name", img_name);
												}
											%>
											<a href="#">
												<img width="80" src="<c:url value='/resources/upload/${img_name}'/>">
											</a>
										</p>  
										<div class="order_item_title">
											<p class="item_tag">
												<c:if test="${list.product_discount ne '0'}"> 
													<span class="discount_tag">할인도서</span>
												</c:if>
												<c:if test="${list.product_shipping_charge eq '0'}">
													<span class="parcel_tag">무료배송</span>
												</c:if> 
											</p>   
											<p class="order_item_title_txt">
												<a href="#">${list.product_name}</a>
											</p>
											<p>
												<span class="order_item_editor" style="padding-right:10px;">${editor_name_list[status.index]}</span>
												<span class="order_item_publising">${list.product_publish}</span>
											</p>
										</div>

									</td>
									<td class="order_item_price">
										<p class="order_item_price_txt">${list.product_discount_price}원</p>
										<p class="order_item_discount">
											(<span>${list.product_discount}%</span>
											<i class="fas fa-long-arrow-alt-down" aria-hidden="true"></i>)
										</p>

									</td> 
									<td class="order_item_choice">
										<input hidden="hidden" class="item_num_val" value="${list.product_num}">
										<input hidden="hidden" name="item_count_num" value="1" class="item_count_num">
										<a class="order_item_library cart_btn">카트담기</a> 
										<a class="order_item_delete" href="<c:url value='/wishlist_delete?product_num=${list.product_num}'/>">삭제</a>
									</td>
								</tr>  
							</c:forEach>
							</tbody>
						</table>
					</div>
				</form>
				<%-- 페이지 네비게이션 --%> 
				<ul class="pagination item_pagenum">
					<li class="page-item">  
						<c:choose>
							<c:when test="${(util.startPageNum%util.pageBlockCount==1) && (util.startPageNum>util.pageBlockCount)}">
								<a class="page-link" aria-label="Previous" href="<c:url value='/mypage_wishlist?pageNum=${util.startPageNum-1}&list_arr=${list_arr}&rowCount=${rowCount}'/>">
									<span aria-hidden="true">«</span>
								</a>
							</c:when>     
							<c:otherwise>
								<a class="page-link" aria-label="Previous" href="<c:url value='/mypage_wishlist?pageNum=${util.pageNum-1}&list_arr=${list_arr}&rowCount=${rowCount}'/>">
								<span aria-hidden="true">«</span>
								</a> 
							</c:otherwise>  
						</c:choose>   
					</li> 
					<c:forEach var="i" begin="${util.startPageNum }" end="${util.endPageNum }">
						<c:choose> 
							<c:when test="${util.pageNum==i }"> 
								<li class="page-item" id="page_ck" >
									<a class="page-link" href="<c:url value='/mypage_wishlist?pageNum=${i}&list_arr=${list_arr}&rowCount=${rowCount}'/>">${i}</a>
								</li>
							</c:when> 
							<c:otherwise> 
								<li class="page-item">
									<a class="page-link" href="<c:url value='/mypage_wishlist?pageNum=${i}&list_arr=${list_arr}&rowCount=${rowCount}'/>">${i}</a>
								</li>
							</c:otherwise>
						</c:choose>   
					</c:forEach>    
					<li class="page-item">
						<c:choose>
							<c:when test="${util.pageNum < util.totalPageCount}">
								<a class="page-link"   href="<c:url value='/mypage_wishlist?pageNum=${util.pageNum+1}&list_arr=${list_arr}&rowCount=${rowCount}'/>" aria-label="Next"> 
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





