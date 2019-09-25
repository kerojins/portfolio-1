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
						<tr>
							<td class="order_item_info">
								<p class="item_select_option">
									<input type="checkbox" id="check_item1" class="item_checking"><label
										for="check_item1" class="input_label"></label>
								</p>
								<p class="order_item_img">
									<a href="#"><img width="80"
										src="<c:url value='/resources/images/list_item1.jpg'/>"></a>
								</p>
								<div class="order_item_title">
									<p>
										<span class="discount_tag">할인도서</span><span class="parcel_tag">무료배송</span>
									</p>
									<p class="order_item_title_txt">
										<a href="#">대도시의 사랑법</a>
									</p>
									<p>
										<span class="order_item_editor">민지형</span><span
											class="order_item_publising">민음사</span>
									</p>
								</div>

							</td>
							<td class="order_item_price">
								<p class="order_item_price_txt">13,320원</p>
								<p class="order_item_discount">
									(<span>10%</span><i class="fas fa-long-arrow-alt-down"></i>)
								</p>
								<p class="order_item_mileage">
									<span>P</span>640원
								</p>
							</td>
							<td class="order_item_count">
								<p class="item_select_option">
									<input type="text" name="qnt" value="1" class="num" size="2"
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
						<tr>
							<td class="order_item_info">
								<p class="item_select_option">
									<input type="checkbox" id="check_item2" class="item_checking"><label
										for="check_item2" class="input_label"></label>
								</p>
								<p class="order_item_img">
									<a href="#"><img width="80"
										src="<c:url value='/resources/images/list_item1.jpg'/>"></a>
								</p>
								<div class="order_item_title">
									<p>
										<span class="discount_tag">할인도서</span><span class="parcel_tag">무료배송</span>
									</p>
									<p class="order_item_title_txt">
										<a href="#">대도시의 사랑법</a>
									</p>
									<p>
										<span class="order_item_editor">민지형</span><span
											class="order_item_publising">민음사</span>
									</p>
								</div>

							</td>
							<td class="order_item_price">
								<p class="order_item_price_txt">13,320원</p>
								<p class="order_item_discount">
									(<span>10%</span><i class="fas fa-long-arrow-alt-down"></i>)
								</p>
								<p class="order_item_mileage">
									<span>P</span>640원
								</p>
							</td>
							<td class="order_item_count">
								<p class="item_select_option">
									<input type="text" name="qnt" value="1" class="num" size="2"
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
			<div class="order_btn">
				<a class="order_home_btn" href="/">쇼핑계속하기</a><a class="order_page_btn"  href="<c:url value='/order' />">주문하기</a>
			</div>
		</form>
	</div>
</div>