<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



		<div class="sub_right_box my_box_wrap mypage_order_detail">
			<div class="sub_right_content">
				<h3 class="my_page_title">주문/배송 상세정보</h3>
				<div class="bx bx_padding vsb">
					<ul class="fl order_info2">
						<li class="first">
							<dl>
								<dt>주문일자</dt>
								<dd>
									<strong>2019.07.28</strong>
								</dd>
							</dl>
						</li>
						<li>
							<dl>
								<dt>주문번호</dt>
								<dd class="ordnum">
									<strong class="pointcol">2019072883337091</strong> <a href="#">
										내역삭제</a>
									<!--N=a:odd.delete-->
									<a href="#">재구매</a>
									<!--N=a:odd.reball-->
								</dd>
							</dl>
						</li>

					</ul>
					<div class="btn_area fr mgr"></div>
				</div>
				<form id="order_form">
					<div class="order_content">

						<table class="order_table">
							<tbody>
								<tr>
									<th width="15%">상품번호</th>
									<th width="32%">상품정보</th>
									<th width="16%">상품금액(수량)</th>
									<th width="10%">배송비</th>
									<th width="14%">주문 상태</th>
									<th width="13%">선택</th>
								</tr>
								<tr>
									<td class="order_item_number">
										<p>12164531</p> 
									</td>
									<td class="order_item_info">
										<p class="order_item_img">
											<a href="#"><img width="60"
												src="/sh/resources/images/list_item1.jpg"></a>
										</p>
										<div class="order_item_title">
											<p class="item_tag">
												<span class="discount_tag">할인도서</span><span
													class="parcel_tag">무료배송</span>
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
										<p class="order_item_price_txt">53,320원<br>(3개)</p>
									</td>
									<td class="order_item_mileage">
										<p>2,500원</p>
									</td>
									<td class="order_item_allPrice">
										<p class="order_item_allPrice_txt">배송 완료</p>
									</td>
									<td class="order_item_choice"><a>구매확정</a>
								<a>리뷰쓰기</a> <a>반품요청</a></td>
								</tr>
							</tbody>
						</table>
					</div>

					<div class="my_pay_info">
						<h4>결제금액정보</h4>
						<table cellspacing="0" border="1" class="tb_list2">
							<colgroup>
								<col>
								<col width="305">
							</colgroup>
							<tbody>
								<tr class="first">
									<td class="money">
										<div class="l_none">
											<dl class="first">
												<dt>상품금액</dt>
												<dd>
													<ul>
														<li><strong>상품합계</strong>
															<p>
																<em class="thm">37,000</em>원
															</p></li>
														<li><strong>배송비합계</strong>
															<p>
																<em class="thm">0</em>원
															</p></li>
													</ul>
												</dd>
												<dd class="total">
													<em class="thm">37,000</em>원
												</dd>
											</dl>
											<dl class="discount">
												<dt>할인금액</dt>
												<dd>
													<ul>
														<li><strong>상품/주문할인</strong>
															<p>
																<em class="thm">4,000</em>원
																<!--N=a:odd.benefit-->
															</p></li>
														<li><strong>배송비할인</strong>
															<p>
																<em class="thm">0</em>원
															</p></li>
													</ul>
												</dd>
												<dd class="total">
													<em class="thm">4,000</em>원
												</dd>
											</dl>
											<dl class="end">
												<dt>포인트 결제액</dt>
												<dd>
													<ul>
														<li><strong>포인트</strong>
															<p>
																<em class="thm">788</em>원
															</p></li>
													</ul>
												</dd>
												<dd class="total">
													<em class="thm">788</em>원
												</dd>
											</dl>
										</div>
									</td>

									<td class="amount bg_point">
										<dl>
											<dt class="blind">결제정보</dt>
											<dd>
												<ul>
													<li><strong>상품금액</strong>
														<p>
															<em class="thm">37,000</em>원
														</p></li>
													<li><strong>할인금액</strong>
														<p>
															(-) <em class="thm">4,000</em>원
														</p></li>
													<li><strong>포인트</strong>
														<p>
															(-) <em class="thm">788</em>원
														</p></li>
												</ul>
											</dd>
										</dl>
									</td>
								</tr>
								<tr>
									<td class="money btm_line _primaryPayAdmission">
										<div>
											<table cellspacing="0" border="1">
												<colgroup>
													<col width="22%">
													<col>
													<col width="9%">
												</colgroup>
												<tbody>
													<tr>
														<th scope="row">결제방법</th>
														<td class="">신용카드<br> <span class="period">(<em>2019.07.28
																	05:17</em>)
														</span>
														</td>
													</tr>
												</tbody>
											</table>
										</div>
									</td>
									<td class="amount bg_point tot">
										<dl>
											<dt class="blind">결제정보</dt>
											<dd>
												<ul>
													<li><strong>결제금액</strong>
														<p>
															<em class="thm">32,212</em>원
														</p></li>
												</ul>
											</dd>
										</dl>
									</td>
								</tr>
							</tbody>
						</table>
					</div>

					<div class="order_shipping my_order_shipping">
						<h4>배송정보</h4>
						<span class="change_shipping"><a href="#">배송정보 변경</a></span>
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
						<table class="shipping_table my_order_info_table">
							<tbody>
								<tr class="shipping_table_row" style="border-top: none;">
									<th>배송지 정보</th>
									<td>
										<div class="shipping_info">
											<table class="shipping_receive_table">
												<tbody>
													<tr class="shipping_recieve_name">
														<th>받으시는 분</th>
														<td colspan="3">홍길동</td>
													</tr>
													<tr class="shipping_recieve_number">
														<th>휴대폰 번호</th>
														<td>010-4245-2646</td>
														<th>전화번호</th>
														<td>02-5634-6325</td>
													</tr>
													<tr>
														<th>배송주소</th>
														<td class="order_location" colspan="3">128-25 <br>
															서울시 상도동 2길 42-11<br> 1층
														</td>
													</tr>
												</tbody>
											</table>
											<div></div>
										</div>
									</td>
								</tr>
								<tr class="shipping_table_row">
									<th>배송메시지</th>
									<td></td>
								</tr>
							</tbody>
						</table>
					</div>

					<div class="order_shipping change_order_shipping">
						<h4>배송정보</h4>
						<span class="change_shipping_ok"><a href="#">변경 완료</a></span>
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

										<div class="shipping_info">
											<table class="shipping_receive_table">
												<tbody>
													<tr class="shipping_recieve_name">
														<th>받으시는 분</th>
														<td colspan="3"><input type="text"
															name="receive_name"><a class="recent_shipping">최근배송지</a></td>
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
