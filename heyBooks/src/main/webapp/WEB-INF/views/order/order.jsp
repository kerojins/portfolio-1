<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="cart_box">
	<div class="container">
		<h2>주문/배송</h2>
		<form id="order_form">
			<div class="order_content">
				<h4>01 주문상품 목록</h4>
				<table class="order_table">
					<tbody>
						<tr>
							<th width="45%">상품정보</th>
							<th width="16%">판매가</th>
							<th width="10%">수량</th>
							<th width="14%">예상적립금</th>
							<th width="15%">합계</th>
						</tr>
						<tr>
							<td class="order_item_info">
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

							</td>
							<td class="order_item_count">
								<p>1개</p>
							</td>
							<td class="order_item_mileage">
								<p>700원</p>
							</td>
							<td class="order_item_allPrice">
								<p class="order_item_allPrice_txt">43,300원</p>
							</td>
						</tr>
					</tbody>
				</table>
				<div class="order_more">
					<p class="order_return">
						*상품변경을 원하시면 <a href="#">장바구니 가기</a>
					</p>
					<p class="order_mileage">
						총 적립가능액: <span> 1,890원</span>
					</p>
				</div>
			</div>
			<div class="order_shipping">
				<h4>02 배송지</h4>
				<table class="shipping_table shipping_member_name">
					<tbody>
						<tr class="shipping_table_row">
							<th>주문자 정보</th>
							<td colspan="2">
								<p>
									<span>진수현</span><span>heyhey@naver.com</span><span>010-1234-5675</span>
								</p>
							</td>
						</tr>
					</tbody>
				</table>
				<table class="shipping_table">
					<tbody>
						<tr class="shipping_table_row" style="border-top: none;">
							<th>배송지 정보</th>
							<td style="padding: 25px">
								<%-- 테이블 코딩 --%>
								<div class="shipping_info">
									<div class="order_location_choice">
										<a>기본배송지</a> <a>새로입력</a> <a>회원정보동일</a> <a>최근배송지</a>
									</div>
									<table class="shipping_receive_table">
										<tbody>
											<tr class="shipping_recieve_name">
												<th>받으시는 분</th>
												<td colspan="3"><input type="text" name="receive_name"></td>
											</tr>
											<tr class="shipping_recieve_number">
												<th>휴대폰 번호</th>
												<td><select name="receive_pNumber"><option>010</option>
														<option>011</option>
														<option>016</option></select> - <input type="text"
													name="receive_pNumber"> - <input type="text"
													name="receive_pNumber"></td>
												<th>전화번호</th>
												<td><select name="receive_hNumber"><option>010</option>
														<option>011</option>
														<option>016</option></select> - <input type="text"
													name="receive_hNumber"> - <input type="text"
													name="receive_hNumber"></td>
											</tr>
											<tr>
												<th>배송주소</th>
												<td colspan="3">배송주소 넣을공간</td>
											</tr>
										</tbody>
									</table>
									<div></div>
								</div>
							</td>
							<td rowspan="2" id="extend_area"></td>
						</tr>
						<tr class="shipping_table_row">
							<th>배송메시지</th>
							<td><textarea></textarea></td>
						</tr>
					</tbody>
				</table>
			</div>

			<div class="mileage_box">
				<h4>03 할인/적립</h4>
			</div>
			<div class="order_pay">
				<div class="order_total_wrap">
					<table class="order_total_table">
						<tr>
							<th width="12%">수량</th>
							<th width="22%">주문금액</th>
							<th width="22%">상품할인</th>
							<th width="22%">배송비</th>
							<th width="23%">결제금액</th>
						</tr>
						<tr>
							<td class="order_total_count">3종(3개)</td>
							<td class="order_total_originPrice"><span>37,500</span>원</td>
							<td class="order_total_dicount"><span>3,750</span>원</td>
							<td class="order_total_parcel"><span>0</span>원</td>
							<td class="order_total_price"><span>33,750</span>원</td>
						</tr>
					</table>
					<span class="order_total_minus"><i class="fas fa-minus"></i></span>
					<span class="order_total_plus"><i class="fas fa-plus"></i></span> <span
						class="order_total_equals"><i class="fas fa-equals"></i></span>
				</div>
			</div>
			<div class="payment_box">
				<h4>04 결제정보</h4>
			</div>
			<div class="order_btn">
				<a class="order_home_btn">쇼핑계속하기</a><a class="order_page_btn">주문하기</a>
			</div>
		</form>
	</div>
</div>