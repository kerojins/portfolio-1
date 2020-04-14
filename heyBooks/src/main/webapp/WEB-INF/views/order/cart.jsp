<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="cart_box">
	<div class="container">
		<h2>쇼핑 카트</h2>
		<form id="cart_form" method="post" action="<c:url value='order'/>">
			<div class="order_content">
				<div class="item_all_choice">   
					<span class="item_select_option">
						<input type="checkbox" id="item_all_check"  checked="checked">
						<label for="item_all_check" class="input_label"></label>전체 선택 
					</span> 
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
										<input type="checkbox" id="check_item${status.count}" name="cart_ck_list" value="${cart_list[status.index].cart_item_num}" onclick="order_check();" class="item_checking">
										<label for="check_item${status.count}" class="input_label"></label>
									</p>  
									<c:set var="img" value="${vo.product_picture}"/>
									<% 
										String img_txt = (String)pageContext.getAttribute("img");
										if(img_txt != null){
											String img_name = img_txt.split(",")[1];
											pageContext.setAttribute("img_name", img_name);
										}
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
									<input type="text" hidden="hidden" class="cart_item_num" value="${cart_list[status.index].cart_item_num}">
									<input type="text" hidden="hidden" class="item_origin_price" value="${vo.product_price}">
									<input type="text" hidden="hidden" class="item_shipping" value="${vo.product_shipping_charge}">
									<p class="order_item_price_txt">${vo.product_discount_price}원</p>
									<p class="order_item_discount">
										(<span class="discount_txt">${vo.product_discount}</span>%<i class="fas fa-long-arrow-alt-down"></i>)
									</p>
									<p class="order_item_mileage">
										<span class="point_txt">P</span><span class="mileage_text">마일리지금액</span>
									</p> 
								</td> 
								<td class="order_item_count">
									<p class="item_select_option">
										<input type="text" class="item_count" name="qnt" value="${cart_list[status.index].cart_item_quantity}" class="num" size="2"
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
									<p class="order_item_allPrice_txt"><span class="allPrice_txt">합계금액</span>원</p>
								</td>
								<td class="order_item_choice"> 
									<a class="order_item_quickBuy">바로구매</a>
									<a class="order_item_library">위시리스트</a> 
									<a class="order_item_delete" href="<c:url value='/cart_delete?cart_item_num=${cart_list[status.index].cart_item_num }'/>">삭제</a>
								</td>
							</tr>  
						</c:forEach>
					</tbody>
				</table> 
				<div>
					<input class="left del_btn btn-primary btn cart_sel_del" value="선택 삭제">
					<p class="order_mileage">총 적립 가능액: 
						<span class="total_mileage">상품적립금</span> P
						<input class="mileage_val" name="mileage_val" hidden="hidden">
					</p>
				</div> 
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
							<td class="order_total_count">
								<i class="count_subject">몇</i>종(<i class="count_num">몇</i>개)
								<input class="total_count_val" name="total_count_val" hidden="hidden" value="">
								<input class="count_num_val" name="count_num_val" hidden="hidden" value="">
								<input class="count_subject_val" name="count_subject_val" hidden="hidden" value="">
							</td>
							<td class="order_total_originPrice">
								<span>상품정가</span>원
							</td>
							<td class="order_total_dicount">
								<input class="total_discount_price_val" name="total_discount_price" hidden="hidden" value="">
								<span>상품할인</span>원
							</td>  
							<td class="order_total_parcel">
								<span class="parcel_txt">배송비</span>원
								<input class="parcel_val" name="parcel_val" hidden="hidden" value="">
							</td>
							<td class="order_total_price">
								<span class="total_price_txt">주문합계</span>원
								<input class="total_price_val" name="total_price_val" hidden="hidden" value="">
								<input class="item_total_price_val" name="item_total_price_val"  hidden="hidden" value="">
							</td>
						</tr> 
					</table>  
					<span class="order_total_minus"><i
						class="fas fa-minus"></i></span> <span class="order_total_plus"><i
						class="fas fa-plus"></i></span> <span class="order_total_equals"><i
						class="fas fa-equals"></i></span> 
				</div>
			</div>
			<div class="twin_btn">
				<a class="twin_home_btn" href="/">쇼핑계속하기</a><input type="submit" class="twin_page_btn order_btn"  value="주문하기">
			</div>
		</form>
	</div>
</div>   
<script>
$(document).ready(function(){
	$(".total_count_val").val($(".order_total_count").text());
	$(".count_num_val").val($(".count_num").text());
	$(".count_subject_val").val($(".count_subject").text());
	$(".parcel_val").val($(".parcel_txt").text());
	$(".total_price_val").val($(".total_price_txt").text());
	$(".mileage_val").val($(".total_mileage").text());
}); 
</script>