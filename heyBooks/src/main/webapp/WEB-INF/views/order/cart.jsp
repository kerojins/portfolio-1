<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="cart_box">
	<div class="container">
		<h2>쇼핑 카트</h2>
		<form id="cart_form">
			<div class="order_content">
				<div class="item_all_choice">
					<span class="item_select_option"><input type="checkbox"
						id="item_all_check" checked="checked"><label
						for="item_all_check" class="input_label"></label>전체 선택 </span>
				</div>
				<table class="order_table">
					<tbody>
						<tr>
							<th width="45%">상품정보</th>
							<th width="16%">판매가</th>
							<th width="10%">수량</th>
							<th width="14%">합계</th>
							<th width="15%">선택</th>
						</tr>
						<c:forEach var="vo" items="${item_list}" varStatus="status" >
							<tr> 
								<td class="order_item_info">
									<p class="item_select_option">
										<input type="checkbox" id="check_item1" class="item_checking"><label
											for="check_item1" class="input_label"></label>
									</p>
									<c:set var="img" value="${vo.product_picture}"/>
									<% 
										String img_txt = (String)pageContext.getAttribute("img");
										String img_name = img_txt.split(",")[1];
										pageContext.setAttribute("img_name", img_name);
									%>
									<p class="order_item_img">
										<a href="#"><img width="80"
											src="<c:url value='/resources/upload/${img_name}'/>"></a>
									</p>
									<div class="order_item_title"> 
										<p>
											<c:if test="${vo.product_discount != '0'}"> 
												<span class="discount_tag">할인도서</span>
											</c:if>
											<c:if test="${vo.product_shipping_charge eq '0'}">
												<span class="parcel_tag">무료배송</span>
											</c:if> 
										</p>
										<p class="order_item_title_txt">
											<a href="#">${vo.product_name}</a>
										</p>
										<p>
											<span class="order_item_editor">${editor_name[status.index]}</span><span
												class="order_item_publising">${vo.product_publish }</span>
										</p>
									</div>
	 
								</td>
								<td class="order_item_price">
									<p class="order_item_price_txt">${vo.product_discount_price}</p>
									<p class="order_item_discount">
										(<span>${vo.product_discount}%</span><i class="fas fa-long-arrow-alt-down"></i>)
									</p>
									<p class="order_item_mileage">
										<span class="point_txt">P</span><span class="mileage_text">640원</span>
									</p> 
								</td> 
								<td class="order_item_count">
									<p class="item_select_option">
										<input type="text" name="qnt" value="${cart_list[status.index].cart_item_quantity}" class="num" size="2"
											maxlength="2" onkeydown="onlyNumber();" onkeyup=""><span
											class="item_quantity"><a class="item_quantity_plus"><i 
												class="fas fa-caret-up" aria-hidden="true"></i></a><a 
											class="item_quantity_minus"><i class="fas fa-caret-down"
												aria-hidden="true"></i></a></span>
									</p>
									<p> 
										<a href="#" class="order_count_change">변경</a>
									</p>
	
								</td>
								<td class="order_item_allPrice">
									<p class="order_item_allPrice_txt">43,300원</p>
								</td>
								<td class="order_item_choice"><a class="order_item_quickBuy">바로구매</a>
									<a class="order_item_library">서재담기</a> <a
									class="order_item_delete">삭제</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<p class="order_mileage">총 적립가능액: <span>상품적립금 1,890원</span></p>
			</div>
			<div class="order_pay">
				<h3>쇼핑카트 총 주문금액</h3>
				<div class="order_total_wrap">
					<table class="order_total_table">
						<tr>
							<th width="12%">수량</th>
							<th width="22%">상품정가</th>
							<th width="22%">상품할인</th>
							<th width="22%">배송비</th>
							<th width="23%">주문금액 합계</th>
						</tr>
						<tr>
							<td class="order_total_count">3종(3개)</td>
							<td class="order_total_originPrice"><span>37,500</span>원</td>
							<td class="order_total_dicount"><span>3,750</span>원</td>
							<td class="order_total_parcel"><span>0</span>원</td>
							<td class="order_total_price"><span>33,750</span>원</td>
						</tr>
					</table>
					<span class="order_total_minus"><i
						class="fas fa-minus"></i></span> <span class="order_total_plus"><i
						class="fas fa-plus"></i></span> <span class="order_total_equals"><i
						class="fas fa-equals"></i></span> 
				</div>
			</div>
			<div class="twin_btn">
				<a class="twin_home_btn" href="/">쇼핑계속하기</a><a class="twin_page_btn"  href="<c:url value='/order' />">주문하기</a>
			</div>
		</form>
	</div>
</div>