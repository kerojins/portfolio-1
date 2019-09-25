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
									<span>홍길동</span><span>heyhey@naver.com</span><span>010-1234-5675</span>
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
										<a>기본배송지</a> <a>새로입력</a> <a>회원정보동일</a> <a>최근배송지</a> <a id="call_list">+더보기</a>
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
												<td class="order_location" colspan="3"><input
													type="text" id="sample6_postcode" placeholder="우편번호">
													<input type="button" onclick="sample6_execDaumPostcode()"
													value="우편번호 찾기"><br> <input type="text"
													id="sample6_address" placeholder="주소"><br> <input
													type="text" id="sample6_detailAddress" placeholder="상세주소">
													<input type="text" id="sample6_extraAddress"
													placeholder="참고항목"></td>
											</tr>
										</tbody>
									</table>
									<div></div>
								</div>
							</td>
							<td rowspan="2" id="extend_area">
								<div class="recent_list">
									<h6>최근 배송지 목록</h6>
									<ul>
										<li>
											<p class="recent_list_name"><input type="radio" name="resent_loc"><span>홍길동</span></p>
											<p>서울특별시 세종로 22-13 (432-42)</p>
										</li>
									</ul>

								</div>

							</td>
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
				<table class="shipping_table discount_table">
					<tbody>
						<tr class="shipping_table_row">
							<th>적립금</th>
							<td colspan="">
								<p>
									<input type="text" placeholder="0"> 원 / <span
										class="mileage_money">1,000원</span>
								</p>
							</td>
						</tr>
					</tbody>
				</table>
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
				<div class="pi_select">
					<div>
						<span class="mr15"><input type="radio" name="settle_type"
							id="sett_10" value="10" class="mt3m mr3"><label
							for="sett_10">신용카드</label></span> <span class="mr15" style=""><input
							type="radio" name="settle_type" id="sett_11" value="11"
							class="mt3m mr3"><label for="sett_11">제휴 신용카드</label></span> <span
							class="mr15" style=""><input type="radio"
							name="settle_type" id="sett_20" value="20" class="mt3m mr3"><label
							for="sett_20">휴대폰 결제</label></span> <span class="mr15" style=""><input
							type="radio" name="settle_type" id="sett_30" value="30"
							class="mt3m mr3"><label for="sett_30">실시간 계좌이체</label></span> <span
							class="mr15" style=""><input type="radio"
							name="settle_type" id="sett_40" value="40" class="mt3m mr3"><label
							for="sett_40">무통장 입금</label></span>
					</div>
				</div>
			</div>
			<div class="order_btn">
				<a class="order_home_btn" href="<c:url value='/cart'/>">카트로 돌아가기</a><a
					class="order_page_btn">결제하기</a>
			</div>
		</form>
	</div>
</div>



<%-- 배송지 주소 API --%>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	function sample6_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 각 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var addr = ''; // 주소 변수
						var extraAddr = ''; // 참고항목 변수

						//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
						if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
							addr = data.roadAddress;
						} else { // 사용자가 지번 주소를 선택했을 경우(J)
							addr = data.jibunAddress;
						}

						// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
						if (data.userSelectedType === 'R') {
							// 법정동명이 있을 경우 추가한다. (법정리는 제외)
							// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
							if (data.bname !== ''
									&& /[동|로|가]$/g.test(data.bname)) {
								extraAddr += data.bname;
							}
							// 건물명이 있고, 공동주택일 경우 추가한다.
							if (data.buildingName !== ''
									&& data.apartment === 'Y') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
							if (extraAddr !== '') {
								extraAddr = ' (' + extraAddr + ')';
							}
							// 조합된 참고항목을 해당 필드에 넣는다.
							document.getElementById("sample6_extraAddress").value = extraAddr;

						} else {
							document.getElementById("sample6_extraAddress").value = '';
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('sample6_postcode').value = data.zonecode;
						document.getElementById("sample6_address").value = addr;
						// 커서를 상세주소 필드로 이동한다.
						document.getElementById("sample6_detailAddress")
								.focus();
					}
				}).open();
	}
</script>