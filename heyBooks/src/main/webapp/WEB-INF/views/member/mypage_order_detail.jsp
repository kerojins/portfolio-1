<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
		<div class="my_box_wrap mypage_order_detail">
				<h3 class="my_page_title" style="margin-bottom: 10px;">주문/배송 상세정보</h3>
				<div class="bx bx_padding vsb">
					<input hidden="hidden" class="aside_hide" value="ok">
					<ul class="fl order_info2">
						<li class="first">
							<dl>
								<dt>주문일자</dt>
								<dd>
									<c:set var="date" value="${vo.order_date}"/> 
									<%--  수정 등록일 날짜,시간 표시  --%> 
									<%  
										Date date = (Date) pageContext.getAttribute("date");
										SimpleDateFormat sdate = new SimpleDateFormat("yyyy.MM.dd");
										String date_txt = sdate.format(date);
										pageContext.setAttribute("date_txt", date_txt); 
										
									%> 
									<strong>${date_txt}</strong>
								</dd>
							</dl>
						</li>
						<li> 
							<dl>
								<dt>주문번호</dt>
								<dd class="ordnum">
									<strong class="pointcol">${vo.order_num}</strong> 
									<a href="#">내역삭제</a>
									<a href="#">재구매</a>
								</dd>
							</dl>
						</li>
					</ul>
					<div class="btn_area fr mgr"></div>
				</div>
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
								<c:forEach var="list" items="${order_item_list}" varStatus="status">
									<tr>
										<td class="order_item_number">
											<p>${item_list[status.index].product_num}</p> 
										</td>
										<td class="order_item_info">
											<p class="order_item_img">
												<a href="#">
													<img width="60" src="/sh/resources/upload/${item_list[status.index].product_picture}">
												</a> 
											</p>
											<div class="order_item_title">  
												<p class="item_tag">
													<c:if test="${item_list[status.index].product_discount != '0'}"> 
														<span class="discount_tag">할인도서</span>
													</c:if>
													<c:if test="${item_list[status.index].product_shipping_charge eq '0'}">
														<span class="parcel_tag">무료배송</span>
													</c:if> 
												</p>  
												<p class="order_item_title_txt">
													<a href="#">${list.order_item_name}</a>
												</p>
												<p>
													<span class="order_item_editor">민지형</span><span
														class="order_item_publising">${item_list[status.index].product_publish}</span>
												</p>
											</div>
										</td>
										<td class="order_item_price">  
											<input class="order_item_price" hidden="hidden" value="${item_list[status.index].product_price}">
											<input class="order_item_cnt" hidden="hidden" value="${list.order_item_quantity}">
											<p class="order_item_origin">${item_list[status.index].product_price}원</p>
											<p class="order_item_price_txt">${list.order_item_price}원<br>(${list.order_item_quantity}개)</p>
										</td> 
										<td class="order_item_mileage">
											<p>${item_list[status.index].product_shipping_charge}원</p>
										</td>
										<td class="order_item_allPrice">
											<p class="order_item_allPrice_txt">${vo.order_status}</p>
										</td>
										<td class="order_item_choice">
											<a href="<c:url value='/book_detail?product_num=${item_list[status.index].product_num}'/>">리뷰쓰기</a> 
										</td>
									</tr> 
								</c:forEach>
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
														<li>
															<strong>상품합계</strong>
															<p>
																<em class="thm order_origin_total">스크립트계산</em>원
															</p>
														</li>
														<li>
															<strong>배송비합계</strong>
															<p>
																<em class="thm shipping_price">${vo.order_shipping_charge}</em>원
															</p>
														</li>  
													</ul>
												</dd>
												<dd class="total">
													<em class="thm item_total_price">script</em>원
												</dd>
											</dl> 
											<dl class="discount"> 
												<dt>할인금액</dt>
												<dd>
													<ul>
														<li><strong>상품/주문할인</strong>
															<p>
																<em class="thm">${vo.total_discount_price}</em>원
															</p></li>
													
													</ul> 
												</dd>
												<dd class="total">
													<em class="thm">${vo.total_discount_price}</em>원
												</dd>
											</dl>
											<dl class="end">
												<dt>포인트 결제액</dt>
												<dd>
													<ul>
														<li><strong>포인트</strong>
															<p>
																<em class="thm">${use_mileage}</em>원
															</p>
														</li> 
													</ul>
												</dd>
												<dd class="total">
													<em class="thm">${use_mileage}</em>원
												</dd>
											</dl>
										</div>
									</td>

									<td class="amount bg_point">
										<dl>
											<dt class="blind">결제정보</dt>
											<dd>
												<ul> 
													<li>
														<strong>상품금액</strong>
														<p>
															<em class="thm item_total_price">script</em>원
														</p>
													</li>
													<li>
														<strong>할인금액</strong>
														<p>
															(-) <em class="thm">${vo.total_discount_price}</em>원
														</p>
													</li>
													<li>
														<strong>포인트</strong>
														<p>
															(-) <em class="thm">${use_mileage}</em>원
														</p>
													</li>
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
														<td class="">${vo.order_status}<br> 
																<c:set var="date" value="${vo.order_date}"/> 
																	<%--  수정 등록일 날짜,시간 표시  --%> 
																	<%  
																		SimpleDateFormat sdate1 = new SimpleDateFormat("yyyy.MM.dd hh:mm");
																		date_txt = sdate1.format(date);
																		pageContext.setAttribute("date_txt", date_txt); 
																		 
																	%>  
															<span class="period"> 
																(<em>${date_txt}</em>)
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
															<em class="thm">${vo.total_price }</em>원
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
						<span class="change_shipping"><a>배송정보 변경</a></span>
						<table class="shipping_table shipping_member_name">
							<tbody>
								<tr class="shipping_table_row"> 
									<th>주문자 정보</th>
									<td colspan="2">
										<p>
											<span>${member_vo.members_name}</span>
											<span>${member_vo.members_email}</span>
											<span>${member_vo.members_phone_number}</span>
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
														<td colspan="3">${vo.order_name}</td>
													</tr>
													<tr class="shipping_recieve_number">
														<th>휴대폰 번호</th>
														<td>${vo.order_phone_number}</td>
														<th>전화번호</th>
														<td>${vo.order_add_number }</td>
													</tr>
													<tr>
														<th>배송주소</th>
														<td class="order_location" colspan="3">${vo.order_post}<br>
															${vo.order_address}<br> ${vo.order_detail_address } ${vo.order_extra_address }
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
									<td>${vo.order_message}</td>
								</tr>
							</tbody>
						</table>
					</div>
					<form action="<c:url value='/order_update'/>" method="post">
					<div class="order_shipping change_order_shipping"> 
						<h4>배송정보</h4>
						<span class="change_shipping_ok">
							<input type="submit" value="변경 완료">
						</span>
						<table class="shipping_table shipping_member_name">
							<tbody>
								<tr class="shipping_table_row">
									<th>주문자 정보</th>
									<td colspan="2">
										<p>
											<span>${member_vo.members_name}</span>
											<span>${member_vo.members_email}</span>
											<span>${member_vo.members_phone_number}</span>
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
												  <input hidden="hidden" name="order_num" value="${vo.order_num}">
												  <input hidden="hidden" class="members_num_val" value="${member_vo.members_num}">
												  <a class="same_info">회원정보동일</a> 
												  <a class="reset_info">새로입력</a> 
											</div> 
											<table class="shipping_receive_table"> 
												<tbody> 
													<tr class="shipping_recieve_name"> 
														<th>받으시는 분</th> 
														<td colspan="3"><input type="text" class="order_name" name="order_name" value="${vo.order_name}"></td>
													</tr>
													<tr class="shipping_recieve_number">
														<th>휴대폰 번호</th>
														<td>
															<select class="order_phone_number0" name="order_phone_number">
																<option <c:if test="${phone[0] eq '010'}">selected</c:if> value="010">010</option>
																<option <c:if test="${phone[0] eq '011'}">selected</c:if>value="011">011</option> 
																<option <c:if test="${phone[0] eq '016'}">selected</c:if>value="016">016</option>  
															</select> - 
															<input type="text" class="order_phone_number1" name="order_phone_number" value="${phone[1]}"> - 
															<input type="text" class="order_phone_number2" name="order_phone_number" value="${phone[2]}">
														</td>
														<th>전화번호</th>
														<td>
															<input type="text" class="order_add_number0" name="order_add_number" value="${add_number[0]}"> - 
															<input type="text" class="order_add_number1" name="order_add_number" value="${add_number[1]}"> - 
															<input type="text" class="order_add_number2" name="order_add_number" value="${add_number[2]}">
														</td>
													</tr>
													<tr>
														<th>배송주소</th>
														<td class="order_location" colspan="3">
															<input type="text" class="order_post" name="order_post" value="${vo.order_post}"id="sample6_postcode" placeholder="우편번호">
															<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br> 
															<input type="text" class="order_address" name="order_address" value="${vo.order_address}" id="sample6_address" placeholder="주소"><br> 
															<input type="text" class="order_detail_address" name="order_detail_address" value="${vo.order_detail_address}" id="sample6_detailAddress" placeholder="상세주소">
															<input type="text" class="order_extra_address" name="order_extra_address" value="${vo.order_extra_address}" id="sample6_extraAddress" placeholder="참고항목">
														</td>
													</tr>  
												</tbody>  
											</table>
										</div> 
									</td>
									
								</tr> 
								<tr class="shipping_table_row">
									<th>배송메시지</th>
									<td><textarea name="order_message">${order_message}</textarea></td>
								</tr>
						</tbody>
						</table>
					</div>
				</form>
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
