<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="cart_box">
	<div class="container">
		<h2>주문/배송</h2>
		<form id="order_form" action="order_insert" method="post">
			<div class="order_content">
				<h4>01 주문상품 목록</h4> 
				<div class="order_brief_box">
					<c:if test = "${list == null }"> <%-- 바로 구매로 주문할때 보여짐 --%>
					<%-- 주문 간략 테이블 --%>
					<table class="order_table order_breif_table" > 
						<tbody> 
							<tr> 
								<th width="40%">상품정보</th> 
								<th width="10%">총수량</th>
								<th width="13%">주문금액</th> 
								<th width="10%">배송비</th>
								<th width="12%">예상적립금</th>
								<th width="15%">주문금액 합계</th>
							</tr> 
							<tr> 
								<td class="order_item_info">
									<p class="order_item_img">
										<a href="#">
											<c:set var="img" value="${one_info.product_picture}"/>
											<% 
												String img_txt = (String)pageContext.getAttribute("img");
												if(img_txt != null){
													String img_name = img_txt.split(",")[1];
													pageContext.setAttribute("img_name", img_name);
												}
											%>
											<img width="80" src="<c:url value='/resources/upload/${img_name}'/>">
										</a>
									</p>
									<div class="order_item_title"> 
										<p>
											<c:if test="${one_info.product_discount != '0'}"> 
													<span class="discount_tag">할인도서</span>
											</c:if>
											<c:if test="${one_info.product_shipping_charge eq '0'}">
												<span class="parcel_tag">무료배송</span>
											</c:if> 
										</p> 
										<p class="order_item_title_txt">
											<a href="#">${one_info.product_name}<c:if test="${list[1] != null }">외 ${count_subject_val - 1 }종</c:if></a>
											<input name="order_item_name" hidden="hidden" value="${one_info.product_name}">
										</p>
										<p>
											<span class="order_item_editor">${editor}</span>
											<span class="order_item_publising">${one_info.product_publish}</span>
										</p>
									</div>
								</td>
								<td class="order_item_count">
									<p>1종 
										<span class="item_count_text">${item_count}</span>개
									</p>
									<input name="product_num" hidden="hidden" value="${one_info.product_num}">
									<input name="order_item_quantity" hidden="hidden" value="${item_count}">
								</td>
								<td class="order_item_price">
									<p class="order_item_price_txt">
										<span class="item_total_text">${one_info.product_discount_price}</span>원
										<input hidden="hidden" class="item_origin_price" value="${one_info.product_price}">
										<input hidden="hidden" name="order_item_price" value="${one_info.product_discount_price}">
									</p>
									<input hidden="hidden" class="order_discount" value="${one_info.product_discount}">
								</td>
								<td class="order_item_shipping">    
									<p>
										<span class="shipping_txt">${one_info.product_shipping_charge}</span>원
									</p> 
								</td>	
								<td class="order_item_mileage">
									<p> 
										<span class="mileage_txt">0</span>원
									</p> 
								</td>
								<td class="order_item_allPrice"> 
									<p class="order_item_allPrice_txt"><span class="allPrice_txt">43,300</span>원</p>
								</td> 
							</tr> 
						</tbody> 
					</table>
					</c:if>
					<c:if test="${list !=null }"> <%-- 장바구니를 통해 주문할 경우 보여짐 --%>
					<%-- 주문 간략 테이블 --%>
					<table class="order_table order_breif_table" > 
						<tbody> 
							<tr> 
								<th width="40%">상품정보</th> 
								<th width="10%">총수량</th>
								<th width="13%">주문금액</th> 
								<th width="10%">배송비</th>
								<th width="12%">예상적립금</th>
								<th width="15%">주문금액 합계</th>
							</tr> 
							<tr> 
								<td class="order_item_info">
									<p class="order_item_img">
										<a href="#">
											<c:set var="img" value="${one_info.product_picture}"/>
											<% 
												String img_txt = (String)pageContext.getAttribute("img");
												if(img_txt != null){
													String img_name = img_txt.split(",")[1];
													pageContext.setAttribute("img_name", img_name);
												}
											%>
											<img width="80" src="<c:url value='/resources/upload/${img_name}'/>">
										</a>
									</p>
									<div class="order_item_title"> 
										<p>
											<c:if test="${one_info.product_discount != '0'}"> 
												<span class="discount_tag">할인도서</span>
											</c:if>
											<c:if test="${one_info.product_shipping_charge eq '0'}">
												<span class="parcel_tag">무료배송</span>
											</c:if> 
										</p> 
										<p class="order_item_title_txt">
											<a href="#">${one_info.product_name}<c:if test="${list[1] != null }">외 ${count_subject_val - 1 }종</c:if></a>
											<input name="order_item_name" hidden="hidden" value="${one_info.product_name}">
										</p> 
										<p> 
											<span class="order_item_editor">${editor_list[0].editor_name}</span>
											<span class="order_item_publising">${one_info.product_publish}</span>
										</p>
									</div> 
								</td>
								<td class="order_item_count">
									<p>${total_count_val}</p>
										
								</td>
								<td class="order_item_price">
									<p class="order_item_price_txt">
										<span>${item_total_price_val}</span>원
									</p>
									<input hidden="hidden" class="order_discount" value="${one_info.product_discount}">
								</td>
								<td class="order_item_shipping">  
									<p>
										<span class="shipping_txt">${parcel_val}</span>원
									</p> 
								</td>	
								<td class="order_item_mileage">
									<p> 
										<span>${mileage_val}</span>원
									</p>
								</td>
								<td class="order_item_allPrice"> 
									<p class="order_item_allPrice_txt">${total_price_val}원</p>
								</td>
							</tr> 
						</tbody> 
					</table>
					</c:if>
					<div class="order_more">
						<p class="order_return">
							*상품변경을 원하시면 <a href="#">장바구니 가기</a>
						</p>
						<p class="order_all_item">
						<c:if test="${list[1] != null}">
							<a class="btn btn-primary order_list_view">전체 상품 보기</a>
						</c:if> 
						</p>  
					</div> 
				</div>
			</div> 
			
			<c:if test="${list != null }">   <%-- 장바구니를 통해 주문할 경우 보여짐 --%>
			<%--장바구니 주문리스트 --%>
			<div class="cart_order_box">
				<table class="order_table order_list_table">
					<tbody>
						<tr> 
							<th width="45%">상품정보</th>
							<th width="10%">총수량</th>
							<th width="13%">주문금액</th>
 							<th width="12%">예상적립금</th>
							<th width="20%">주문금액 합계</th>
						</tr> 
						<c:forEach var="vo" items="${list}" varStatus="status">
						<tr> 
							<td class="order_item_info">
								<input name="product_num" hidden="hidden" value="${vo.product_num}">
								<p class="order_item_img">
									<a href="#">
										<c:set var="img" value="${vo.product_picture}"/>
										<% 
											String img_text = (String)pageContext.getAttribute("img");
											if(img_text != null){
												String img_name = img_text.split(",")[1];
												pageContext.setAttribute("img_name", img_name);
											}
										%>
										<img width="80" src="<c:url value='/resources/upload/${img_name}'/>">
									</a>
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
										<input name="order_item_name" hidden="hidden" value="${vo.product_name}">
									</p>   
									<p>
										<span class="order_item_editor">${editor_list[status.index].editor_name}</span>
										<span class="order_item_publising">${vo.product_publish}</span>
									</p>
								</div> 

							</td>
							<td class="order_item_count"> 
								<p>
									<span class="item_count_text">${qnt[status.index]}</span>개
									<input name="order_item_quantity" hidden="hidden" value="${qnt[status.index]}">
								</p>
							</td>
							<td class="order_item_price"> 
								<p class="order_item_price_txt"><span class="item_total_text">${vo.product_discount_price}</span>원</p>
								<input hidden="hidden" name="order_item_price" value="${vo.product_discount_price}">
							</td>   
							<td class="order_item_mileage">
								<p><span class="mileage_txt">script</span>원</p>
							</td>
							<td class="order_item_allPrice"> 
								<p class="order_item_allPrice_txt"><span class="allPrice_txt">43,300</span>원</p>
							</td>
						</tr> 
						</c:forEach>
					</tbody>
				</table>
				<div class="order_more">
					<p class="order_return">
						*상품변경을 원하시면 <a href="#">장바구니 가기</a>
					</p>
					<p class="order_all_item">
					<c:if test="${list != null}">
						<a class="btn btn-primary order_brief_view">간략 정보 보기</a>
					</c:if>
					</p>  
				</div> 
			</div>
			</c:if>
			<div class="order_shipping">
				<h4>02 배송지</h4>
				<table class="shipping_table shipping_member_name">
					<tbody>
						<tr class="shipping_table_row">
							<th>주문자 정보</th>
							<td colspan="2">
								<p>
									<span>${member_vo.members_name}</span><span>${member_vo.members_email}</span><span>${member_vo.members_phone_number}</span>
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
										  <a class="same_info">회원정보동일</a> 
										  <a class="reset_info">새로입력</a> 
										<%--
										  <a class="recent_info">최근배송지</a> 
										  <a id="call_list">+더보기</a> 
										  --%>
									</div>
									<table class="shipping_receive_table"> 
										<tbody> 
											<tr class="shipping_recieve_name"> 
												<th>받으시는 분</th>
												<td colspan="3"><input type="text" class="order_name" name="order_name" value="${member_vo.members_name}"></td>
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
													<input type="text" class="order_post" name="order_post" value="${member_vo.members_post}"id="sample6_postcode" placeholder="우편번호">
													<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br> 
													<input type="text" class="order_address" name="order_address" value="${member_vo.members_address}" id="sample6_address" placeholder="주소"><br> 
													<input type="text" class="order_detail_address" name="order_detail_address" value="${member_vo.members_detail_address}" id="sample6_detailAddress" placeholder="상세주소">
													<input type="text" class="order_extra_address" name="order_extra_address" value="${member_vo.members_extra_address}" id="sample6_extraAddress" placeholder="참고항목">
												</td>
											</tr>  
										</tbody>  
									</table>
								</div> 
							</td>
							<%--  <td rowspan="2" id="extend_area">
								<div class="recent_list"> 
									<h6>최근 배송지 목록</h6>
									<ul>
										<li>
											<p class="recent_list_name">
												<input type="radio" name="resent_loc"><span>홍길동</span>
											</p>
											<p>서울특별시 세종로 22-13 (432-42)</p>
										</li>
									</ul>
								</div>
							</td>--%>
						</tr>
						<tr class="shipping_table_row">
							<th>배송메시지</th>
							<td><textarea name="order_message"></textarea></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="mileage_box">
				<h4>03 할인/적립</h4>
				<table class="shipping_table discount_table">
					<tbody>
						<tr class="shipping_table_row">
							<th>적립금 사용</th>
							<td colspan="">
								<p>
									<input type="text" class="use_mileage_val" name="use_mileage" value="0" placeholder="0"> 원 / 
									<input type="text" class="get_mileage_val" name="get_mileage" value="0" hidden="hideen"> 
									<c:choose>
										<c:when test="${mileage_vo == null}"> 
											<span class="mileage_money">0</span>원 
										</c:when>
										<c:otherwise>
											<span class="mileage_money">${mileage_vo.mileage_total}</span>원
										</c:otherwise>
									</c:choose>
									<a class="btn mileage_btn">적용</a>
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
							<td class="order_total_count">
								<c:choose>
									<c:when test="${list == null}">
										1종(${item_count}개)
									</c:when> 
									<c:otherwise>
										${total_count_val}
									</c:otherwise>
								</c:choose> 
							</td>	
							<td class="order_total_originPrice">
								<c:choose>
									<c:when test="${list == null}">
										<span class="item_total_text">37,500</span>원
									</c:when>
									<c:otherwise>
										<span class="">${item_total_price_val}</span>원
									</c:otherwise>
								</c:choose>   
							</td>  
							<td class="order_total_discount">
								<span class="discount_text">0</span>원
							</td>
							<td class="order_total_parcel">
								<c:choose> 
									<c:when test="${list == null}">
										<span class="shipping_text">0</span>원
									</c:when>
									<c:otherwise>
										<span class="">${parcel_val}</span>원
									</c:otherwise>
								</c:choose>  
								 
							</td>
							<td class="order_total_price">
								<c:choose>
									<c:when test="${list == null}">
										<span class="total_text">0</span>원
									</c:when>
									<c:otherwise>
										<span class="">${total_price_val}</span>원
									</c:otherwise>
								</c:choose>  
							</td>
						</tr>
					</table>
					<span class="order_total_minus">
						<i class="fas fa-minus"></i>
					</span>
					<span class="order_total_plus">
						<i class="fas fa-plus"></i>
					</span> 
					<span class="order_total_equals">
						<i class="fas fa-equals"></i>
					</span>
				</div> 
				<input class="members_num_val" name="members_num" value="${member_vo.members_num }" hidden="hidden">
				<input class="total_discount_price" name="total_discount_price" value="${total_discount_price}" hidden="hidden">
				<input class="total_price_val" name="total_price" hidden="hidden">
				<input class="total_count_val" name="total_count" hidden="hidden">
				<input class="order_shipping_charge_val" name="order_shipping_charge" hidden="hidden">
				<input hidden="hidden" class="total_mileage_val" name="total_mileage" value="${mileage_val}">
			</div>
			  
			<div class="payment_box"> 
				<h4>04 결제정보</h4>
				<div class="pi_select"> 
					<div>
						<span class="mr15">
							<input type="radio" checked="checked" name="payment_methods" id="sett_10" value="신용카드" class="mt3m mr3">
							<label for="sett_10">신용카드</label>
						</span>  
						<span class="mr15" style="">
							<input type="radio" name="payment_methods" id="sett_20" value="휴대폰 결제" class="mt3m mr3">
							<label for="sett_20">휴대폰 결제</label>
						</span> 
						<span class="mr15" style="">
							<input type="radio" name="payment_methods" id="sett_40" value="무통장 입금" class="mt3m mr3">
							<label for="sett_40">무통장 입금</label>
						</span>
					</div>
				</div>
			</div>
			<div class="twin_btn">
				<a class="twin_home_btn" href="<c:url value='/cart'/>">카트로 돌아가기</a><a
					class="twin_page_btn pay_btn">결제하기</a>
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