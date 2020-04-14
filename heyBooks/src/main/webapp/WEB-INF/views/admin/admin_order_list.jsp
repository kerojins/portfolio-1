<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="container admin_item_list">
	<div class="search-form-container">
		<div class=" admin_page_head">
			<h2>주문리스트</h2>
		</div> 
		<form class="search_form" action="<c:url value='/admin_order_list'/>" method="get">
			<table class="search-form-table">
				<tbody> 
					<tr>
						<td>
							<table>
								<tbody>
									<tr>
										<td width="440">
											<table class="sf-keyword-table">
												<tbody>
													<tr>
														<td class="sfk-td-txt">
															<input type="text" name="keyword" value="${keyword}" title="주문번호, 주문자명" placeholder="주문번호, 주문자명">
														</td>
														<td class="sfk-td-btn">
															<button type="submit">  
																<span>검색</span>
															</button>
														</td>
													</tr>
												</tbody>
											</table>
										</td>
										<td width="20">&nbsp;</td>
									</tr>
								</tbody>
							</table>
						</td>
					</tr>
				</tbody>
			</table>
			<table class="search-form-table" id="search_detail_table">
				<tbody>
					<tr id="goods_search_form" style="display: block;">
					</tr>
					<tr>
						<td>
							<table class="sf-option-table">
								<colgroup>
									<col width="80">
									<col width="160">
									<col width="80"> 
									<col>
								</colgroup>
								<tbody>
									<tr>
										<th>주문일</th>
										<td colspan="5">  
											<input type="text"  maxlength="10" size="10" value="${search_date}" name="search_date" class="datepickers start_day">
											<img class="ui-datepicker-trigger" src="<c:url value='/resources/images/icon_calendar.gif'/>" alt="..." title="..."> &nbsp;
											<span class="gray">-</span>&nbsp;
											<input type="text" maxlength="10" size="10" value="${search_end_date}" name="search_end_date" class="datepickers end_day">
											<img class="ui-datepicker-trigger" src="<c:url value='/resources/images/icon_calendar.gif'/>" alt="..." title="..."> &nbsp;&nbsp; 
											<span class="btn small">  
												<input type="button" value="오늘" id="today" class="select_date">
											</span>  
											<span class="btn small">
												<input type="button" value="일주일" id="1week" class="select_date">
											</span> 
											<span class="btn small">
												<input type="button" value="1개월" id="1month" class="select_date">
											</span> 
											<span class="btn small">
												<input type="button" value="3개월" id="3month" class="select_date">
											</span>  
											<span class="btn small">
												<input type="button" value="전체" id="all_day" class="select_date">
											</span>
										</td> 
									</tr>
									<tr>
										<th>주문 상태</th> 
										<td colspan="5">
											<input hidden="hidden" class="status_val" value="${order_status}">
											<label>
												<input type="checkbox" name="order_status" value="결제대기"> 
												<span>결제 대기</span>
											</label>
											<label>
												<input type="checkbox" name="order_status" value="결제완료"> 
												<span>결제 완료</span>
											</label>
											<label>
												<input type="checkbox" name="order_status" value="배송준비중"> 
												<span>배송 준비중</span>
											</label>
											<label>
												<input type="checkbox" name="order_status" value="배송중"> 
												<span>배송 중</span>
											</label>
											<label> 
												<input type="checkbox" name="order_status" value="배송완료"> 
												<span>배송 완료</span> 
											</label> 
											<label>
												<input type="checkbox" name="order_status" value="구매확정"> 
												<span>구매 확정</span>
											</label>
										</td>
									</tr> 
									<tr>
										<th>결제 방법</th>
										<td>
											<select class="line" name="payment_methods" size="1" style="width: 100px;">
												<option value="">= 선택 =</option>
												<option value="신용카드" <c:if test="${payment_methods eq '신용카드'}">selected</c:if>>신용카드</option>
												<option value="휴대폰결제" <c:if test="${payment_methods eq '휴대폰결제'}">selected</c:if>>휴대폰 결제</option>   
												<option value="무통장입금" <c:if test="${payment_methods eq '무통장입금'}">selected</c:if>>무통장 입금</option> 
											</select>  
										</td>
										<th>결제금액</th> 
										<td no="0"> 
											<input type="text" style=" width: 90px" value="${start_price }" name="start_price" value="" size="7" onkeyup="key_money(this)" class="line onlyfloat" row_group="price"> -
											<input type="text" style=" width: 90px" value="${end_price }" name="end_price" value="" size="7" onkeyup="key_money(this)" class="line onlyfloat" row_group="price">
										</td>
									</tr>
								</tbody>
							</table> 
						</td>
					</tr>
				</tbody> 
			</table>
			<input hidden="hidden" name="pageNum" value="${util.pageNum }">
			<input hidden="hidden" class="list_arr_val" name="list_arr" value="${list_arr}">
			<input hidden="hidden" class="rowCount_val" name="rowCount" value="${rowCount}">
		</form>
	</div>
	<div class="admin_list_box">
		<form class="admin_order_list_form" action="<c:url value='/order_status_update'/>" id="order_list" method="post">
			<div class="admin_list_top">
				<p>
					전체 <span>${totalRowCount}</span>개
				</p> 
				<div class="admin_select_list" style="margin-top: 0px;"> 
					<input hidden="hidden" id="list_type" value="admin_order_list">
					<select name="order_status" class="order_status_val">
						<option value="">--주문상태 선택--</option>
						<option value="결제대기" <c:if test="${list_arr eq '결제대기'}">selected="selected"</c:if>>결제 대기</option>
						<option value="결제완료"<c:if test="${list_arr eq '결제완료'}">selected="selected"</c:if>>결제 완료</option>
						<option value="배송준비중"<c:if test="${list_arr eq '배송준비중'}">selected="selected"</c:if>>배송 준비중</option>
						<option value="배송중"<c:if test="${list_arr eq '배송중'}">selected="selected"</c:if>>배송 중</option>
						<option value="배송완료"<c:if test="${list_arr eq '배송완료'}">selected="selected"</c:if>>배송 완료</option>
						<option value="구매확정"<c:if test="${list_arr eq '구매확정'}">selected="selected"</c:if>>구매 확정</option>
					</select>     
					<input type="button" class="order_status_btn admin_btn" value="주문 상태 변경" >
					<select name = "item_list_arr_list" id="item_list_arr_list">
						<option value="order_date" <c:if test="${list_arr eq 'order_date'}">selected="selected"</c:if>>최신순</option>
						<option value="order_name"<c:if test="${list_arr eq 'order_name'}">selected="selected"</c:if>>구매자명순</option>
						<option value="total_price"<c:if test="${list_arr eq 'total_price'}">selected="selected"</c:if>>결제금액순</option>
					</select>     
					<select name = "item_rowCount_list" id="item_rowCount_list"> 
						<option value="10" <c:if test="${rowCount eq 10}">selected </c:if>>10개씩</option>
						<option value="50" <c:if test="${rowCount eq 50}">selected </c:if>>50개씩</option> 
						<option value="100" <c:if test="${rowCount eq 100}">selected </c:if>>100개씩</option>   
						<option value="200" <c:if test="${rowCount eq 200}">selected </c:if>>200개씩</option>
					</select> 
				</div> 
			</div> 
			<table class="list-table-style order_list_table" cellspacing="0">
				<!-- 테이블 헤더 : 시작 -->
				<colgroup>
					<col width="20">
					<col width="30">
					<col width="80">
					<col width="80">
					<col width="230">
					<col width="40">
					<col width="80">
					<col width="80">
					<col width="90">
					<col width="60">
					<col width="90"> 
				</colgroup> 
				<thead class="lth"> 
					<tr>
						<th><input type="checkbox"  class="ckAll" onclick="ckAll(this);"></th>
						<th>번호</th>
						<th>주문일시</th>
						<th>주문번호</th>
						<th>주문상품</th>
						<th>수(종)</th>
						<th>받는분/주문자</th>
						<th>결제수단</th>
						<th>결제금액</th>
						<th>주문상태</th>
						<th>상세</th>
					</tr> 
				</thead>
				<tbody class="ltb order-ajax-list">
					<c:forEach var="list" items="${order_view_list}" varStatus="status">
						<tr class="list-row"> 
							<td align="center">
								<input type="checkbox" class="select_ck_num" name="select_ck_num" value="${list.ORDER_NUM}" data-provider_seq="1">
							</td>
							<td align="center" class="page_no">${status.count}</td>
							<%-- 수정 등록일 날짜,시간 표시 --%> 
							<c:set var="date" value="${list.ORDER_DATE}"/>
							<%  
								Date date = (Date) pageContext.getAttribute("date");
								SimpleDateFormat sdate = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
								String date_txt = sdate.format(date);
								pageContext.setAttribute("date_txt", date_txt);
							%> 
							<td align="center">${date_txt}</td>
							<td align="center">${list.ORDER_NUM }</td> 
							<td align="left" style="padding-left: 10px;">
								<div class="fx11 gray"></div> 
								<div>
									<a href="" target="_blank">
										<img width="50" src="<c:url value='/resources/upload/${img_name_list[status.index]}'/>">
										<span>${list.ORDER_ITEM_NAME}</span> 
									</a>     
									<div></div> 
									<div style="padding-top: 3px;"></div> 
								</div> 
							</td>
							<td align="center">
								<div>${list.TOTAL_COUNT}</div>
							</td> 
							<td align="center">${list.ORDER_NAME}</td>
							<td align="center">${list.PAYMENT_METHODS }<br>
							</td>
							<td align="center">${list.TOTAL_PRICE}원</td>
							<td align="center" class="order_status_cnt">${list.ORDER_STATUS}</td>
							<td class="center">
								<span class="admin_detail_btn small valign-middle">
									<input type="button" class="admin_order_detail_btn" order_num="${list.ORDER_NUM}" value="상세">
									<a href="<c:url value='/order_delete?order_num=${list.ORDER_NUM}'/>">주문취소</a>
								</span>
							</td> 
						</tr>  
					</c:forEach>  
				</tbody>
				<!-- 리스트 : 끝 -->
			</table>
			<p style="margin-top:10px;"><input type="submit" onclick="ck_null('order_list');" value="선택 취소"></p>
		</form>  
		<%-- 페이지 네비게이션 --%>
		<ul class="pagination item_pagenum">
			<li class="page-item"> 
				<input hidden="hidden" class="url_val" value="/admin_order_list?keyword=${keyword}&search_date=${search_date}&order_status=${order_status}&search_end_date=${search_end_date}&payment_methods=${payment_methods}&start_price=${start_price}&end_price=${end_price}&pageNum=${page_num}">
				<c:choose>
					<c:when test="${(util.startPageNum%util.pageBlockCount==1) && (util.startPageNum>util.pageBlockCount)}"> 
						<a class="page-link" aria-label="Previous" href="<c:url value='/admin_order_list?keyword=${keyword}&search_date=${search_date}&order_status=${order_status}&search_end_date=${search_end_date}&payment_methods=${payment_methods}&start_price=${start_price}&end_price=${end_price}&pageNum=${util.startPageNum-1}&list_arr=${list_arr}&rowCount=${rowCount}'/>">
							<span aria-hidden="true">«</span>
						</a>
					</c:when>      
					<c:otherwise> 
						<a class="page-link" aria-label="Previous" href="<c:url value='/admin_order_list?keyword=${keyword}&search_date=${search_date}&order_status=${order_status}&search_end_date=${search_end_date}&payment_methods=${payment_methods}&start_price=${start_price}&end_price=${end_price}&pageNum=${util.pageNum-1}&list_arr=${list_arr}&rowCount=${rowCount}'/>">
						<span aria-hidden="true">«</span>
						</a>  
					</c:otherwise> 
				</c:choose>   
			</li> 
			<c:forEach var="i" begin="${util.startPageNum }" end="${util.endPageNum }">
				<c:choose> 
					<c:when test="${util.pageNum==i }"> 
						<li class="page-item" id="page_ck" ><a class="page-link" href="<c:url value='/admin_order_list?keyword=${keyword}&search_date=${search_date}&search_end_date=${search_end_date}&payment_methods=${payment_methods}&start_price=${start_price}&end_price=${end_price}&pageNum=${i}&list_arr=${list_arr}&rowCount=${rowCount}'/>" >${i}</a></li>
					</c:when> 
					<c:otherwise> 
						<li class="page-item"><a class="page-link" href="<c:url value='/admin_order_list?keyword=${keyword}&search_date=${search_date}&search_end_date=${search_end_date}&payment_methods=${payment_methods}&start_price=${start_price}&end_price=${end_price}&pageNum=${i}&list_arr=${list_arr}&rowCount=${rowCount}'/>" >${i}</a></li>
					</c:otherwise>
				</c:choose>   
			</c:forEach>  
			<li class="page-item">
				<c:choose>
					<c:when test="${util.pageNum < util.totalPageCount}">
						<a class="page-link"  aria-label="Next" href="<c:url value='/admin_order_list?keyword=${keyword}&search_date=${search_date}&search_end_date=${search_end_date}&payment_methods=${payment_methods}&start_price=${start_price}&end_price=${end_price}&pageNum=${util.pageNum + 1}&list_arr=${list_arr}&rowCount=${rowCount}'/>"> 
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
	<div class="order_detail_box ui-dialog ui-widget ui-widget-content ui-corner-all ui-draggable">
		<div class="ui-dialog-titlebar ui-widget-header ui-helper-clearfix">
			<span class="ui-dialog-title" id="ui-dialog-title-orderAdminSettle">주문 상세보기</span>
			<a href="#" class="ui-dialog-titlebar-close" role="button">
				<i class="fas fa-times"></i>
			</a>
		</div>
		<div id="orderAdminSettle" class=" ui-dialog-content ui-widget-content">
			<form name="orderFrm" id="orderFrm" method="post" action="/order/calculate" target="actionFrame">
				<div class="admin_cart" style="margin-top: 10px;">
					<table class="order_table">
						<tbody class="order_table_body">
							<tr>
								<th width="45%">상품정보</th>
								<th width="16%">판매가</th>
								<th width="10%">수량</th>
								<th width="14%">예상적립금</th>
								<th width="15%">합계</th>
							</tr>
						</tbody>
					</table>
				</div>

				<!-- 결제정보입력/결제하기 -->
				<div class="order_settle clearbox">
					<div class="benefit fx12 left">
						<div class="pd10">
							<dl class="clearbox">
								<dt>구매적립 혜택</dt>
								<dd>
									구매확정 시 : 적립금 <span id="total_reserve" class="bold">0</span>원
								</dd>
							</dl>
							<dl class="clearbox" >
								<dt>결제수단</dt>
								<dd class="method_txt">무통장</dd>
							</dl>
							<dl class="clearbox">
								<dt>배송비</dt>
								<dd class="shipping_txt">0KRW</dd>
							</dl>
						</div>
					</div>
					<div class="settle bgcolor">
						<dl class="clearbox">
							<dt class="total" style="padding: 10px 0px; border: 0px;">결제금액</dt>
							<dd class="total price" style="padding: 10px 0px; border: 0px;">
								<span class="settle_price tahoma" id="total_settle_price">0</span>원
							</dd>
							
						</dl>

					</div>
				</div>
				<!-- //결제금액 -->

				<!-- 주문자/배송지 정보 -->
				<div class="order_settle clearbox">
					<div class="benefit ">
						<h4>배송지</h4>

						<ul class="list_inner fx12">
							<li class="address_txt">배송지 정보는 개인 결제 시 구매자께서 직접 입력하시게 됩니다.</li>
						</ul>
					</div>
					<div class="settle bgcolor fx12">
						<h4>주문자</h4>
						<ul class="list_inner">
							<!-- 회원일 경우 :: START -->
							<li class="order_member">
								<ul>
									<li class="order_id">테스트999</li>
									<li class="order_phone">010-123-4567</li>
									<li class="order_email">ssss@daum.net</li>
								</ul>
							</li>
							<!-- 회원일 경우 :: END -->
						</ul>
					</div>
					<!-- //주문자 정보 -->
				</div>
				<input type="hidden" name="default_reserve_limit"
					id="default_reserve_limit" value="3"><input type="hidden"
					name="total_real_sale_price" id="total_real_sale_price" value="0">
			</form>
		</div>
	</div>
</div>

