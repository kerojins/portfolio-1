<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="container admin_item_list">
	<div class="search-form-container">
		<div class=" admin_page_head">
			<h2>주문리스트</h2>
			<a class="admin_btn" href="<c:url value='/admin_item_add'/>">등록</a>
		</div>
		<form>
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
														<td class="sfk-td-txt"><input type="text"
															name="keyword" value="" title="상품명, 상품코드"
															placeholder="상품명, 상품코드"></td>
														<td class="sfk-td-btn"><button type="submit">
																<span>검색</span>
															</button></td>
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
									<col width="230">
									<col width="80">
									<col>
								</colgroup>
								<tbody>
									<tr>
										<th>등록일</th>
										<td colspan="5"><input type="text" name="sdate" value=""
											class="datepicker line hasDatepicker" maxlength="10"
											size="10" default_none="" id="datepicker_67009428_0"><img
											class="ui-datepicker-trigger"
											src="<c:url value='/resources/images/icon_calendar.gif'/>"
											alt="..." title="..."> &nbsp;<span class="gray">-</span>&nbsp;
											<input type="text" name="edate" value=""
											class="datepicker line hasDatepicker" maxlength="10"
											size="10" default_none="" id="datepicker_67009428_1"><img
											class="ui-datepicker-trigger"
											src="<c:url value='/resources/images/icon_calendar.gif'/>"
											alt="..." title="..."> &nbsp;&nbsp; <span
											class="btn small"><input type="button" value="오늘"
												id="today" class="select_date"></span> <span
											class="btn small"><input type="button" value="일주일"
												id="1week" class="select_date"></span> <span
											class="btn small"><input type="button" value="1개월"
												id="1month" class="select_date"></span> <span
											class="btn small"><input type="button" value="3개월"
												id="3month" class="select_date"></span> <span
											class="btn small"><input type="button" value="전체"
												id="all" class="select_date"></span></td>
									</tr>
									<tr>
										<th>카테고리</th>
										<td colspan="5"><select class="line" name="category1"
											size="1" style="width: 100px;"><option value="">=
													1차 분류 =</option>
												<option value="0001">카메라</option>
												<option value="0002">렌즈</option>
												<option value="0003">플래쉬</option>
												<option value="0004">메모리</option>

										</select> <select class="line" name="category2" size="1"
											style="width: 100px;"><option value="">= 2차
													분류 =</option></select> <select class="line" name="category3" size="1"
											style="width: 100px;"><option value="">= 3차
													분류 =</option></select></td>
									</tr>
									<tr>
										<th>출판사</th>
										<td><select class="line" name="brands1" size="1"
											style="width: 100px;"><option value="">= 선택
													=</option>
												<option value="0001">Rowan</option>
												<option value="0002">캐논</option>
												<option value="0003">시그마</option>
												<option value="0004">로우프로</option>
												<option value="0005">짓죠</option>
												<option value="0006">LG</option>
												<option value="0007">SK-II</option></select></td>
										<th>작가</th>
										<td><select class="line" name="brands1" size="1"
											style="width: 100px;"><option value="">= 선택
													=</option>
												<option value="0001">Rowan</option>
												<option value="0002">캐논</option>
												<option value="0003">시그마</option>
												<option value="0007">SK-II</option></select></td>
									</tr>

									<tr>
										<th>정상가</th>
										<td no="0"><input type="text" name="sprice" value=""
											size="7" class="line onlyfloat" row_group="price"> -
											<input type="text" name="eprice" value="" size="7"
											class="line onlyfloat" row_group="price"></td>
										<th>재고수량</th>
										<td no="1"><input type="text" name="sstock" value=""
											size="7" class="line onlynumber" row_group="stock"> -
											<input type="text" name="estock" value="" size="7"
											class="line onlynumber" row_group="stock"></td>
									</tr>
									<tr>

										<th>상태</th>
										<td no="0"><label><input type="checkbox"
												name="goodsStatus[]" value="normal"> <span>정상</span></label>
											<label><input type="checkbox" name="goodsStatus[]"
												value="runout"> <span>품절</span></label><label><input
												type="checkbox" name="goodsStatus[]" value="unsold">
												<span>판매중지</span></label></td>
										<th>노출</th>
										<td><label><input type="checkbox"
												name="goodsView[]" value="look"> <span>보임</span></label> <label><input
												type="checkbox" name="goodsView[]" value="notLook">
												<span>안보임</span></label></td>

									</tr>

								</tbody>
							</table>
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
	<div class="admin_list_box">
		<div class="admin_list_top">
			<p>
				전체 <span>9</span>개
			</p>
			<div class="admin_select_list">
				<select>
					<option>최신순</option>
					<option>재고순</option>
					<option>판매명순</option>
				</select>
			</div>
		</div>
		<table class="list-table-style order_list_table" cellspacing="0">
			<!-- 테이블 헤더 : 시작 -->
			<colgroup>
				<col width="35">
				<col width="35">
				<col width="80">
				<col width="80">
				<col width="270">
				<col width="30">
				<col width="80">
				<col width="80">
				<col width="80">
				<col width="60">
				<col width="40">
			</colgroup>
			<thead class="lth">
				<tr>
					<th>선택</th>
					<th>번호</th>
					<th>주문일시</th>
					<th>주문번호</th>
					<th>주문상품</th>
					<th>수(종)</th>
					<th>받는분/주문자</th>
					<th>결제수단/일시</th>
					<th>결제금액</th>
					<th>주문상태</th>
					<th>상세</th>
				</tr>
			</thead>
			<!-- 테이블 헤더 : 끝 -->
			<!-- 리스트 : 시작 -->
			<tbody class="ltb order-ajax-list">
				<tr class="list-row">
					<td align="center"><input type="checkbox" class="chk"
						name="goods_seq[]" value="61" data-provider_seq="1"></td>
					<td align="center" class="page_no">12</td>
					<td align="center">2019-09-11 23:04:09</td>
					<td align="center">23432432</td>
					<td align="left" style="padding-left: 10px;">
						<div class="fx11 gray"></div>
						<div>
							<a href="../goods/regist?no=61" target="_blank">미니어처 별</a>
							<div></div>
							<div style="padding-top: 3px;"></div>
						</div>
					</td>

					<td align="right">
						<div>33</div>
					</td>
					<td align="center">test</td>


					<td align="center">신용카드<br>2019-09-11 23:04:09
					</td>

					<td align="center">23,000원</td>
					<td align="center">결제완료</td>
					<td class="center"><span class="order_btn small valign-middle"><input
							type="button" name="manager_modify_btn" value="상세"
							></span></td>
				</tr>  


				<tr class="list-row">

				</tr>
			</tbody>
			<!-- 리스트 : 끝 -->
		</table>
	</div>
	<div
		class="order_detail_box ui-dialog ui-widget ui-widget-content ui-corner-all ui-draggable"
		tabindex="-1" role="dialog"
		aria-labelledby="ui-dialog-title-orderAdminSettle" style="">
		<div
			class="ui-dialog-titlebar ui-widget-header ui-helper-clearfix">
			<span class="ui-dialog-title" id="ui-dialog-title-orderAdminSettle">개인
				결제 보기</span><a href="#" class="ui-dialog-titlebar-close"
				role="button"><span class="ui-icon ui-icon-closethick">x</span></a>
		</div>
		<div id="orderAdminSettle"
			class=" ui-dialog-content ui-widget-content"
			style="display: block; width: auto; min-height: 0px; height: 608px;"
			scrolltop="0" scrollleft="0">

			<form name="orderFrm" id="orderFrm" method="post"
				action="/order/calculate" target="actionFrame">
				<input type="hidden" name="mode" value="cart"> <input
					type="hidden" name="adminOrder" value="admin"> <input
					type="hidden" name="adminOrderType" value="person"> <input
					type="hidden" name="member_seq" id="member_seq" value="4">
				<input type="hidden" name="person_seq" id="person_seq" value="3">
				<div class="admin_cart" style="margin-top: 10px;">
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
											src="/sh/resources/images/list_item1.jpg"></a>
									</p>
									<div class="order_item_title">
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
										(<span>10%</span><i class="fas fa-long-arrow-alt-down"
											aria-hidden="true"></i>)
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
				</div>

				<!-- 결제정보입력/결제하기 -->
				<div class="order_settle clearbox">
					<div class="benefit fx12 left">
						<div class="pd10">
							<dl class="clearbox">
								<dt>구매적립 혜택</dt>
								<dd>
									구매확정 시 : 마일리지 <span id="total_reserve" class="bold">0</span>KRW
								</dd>
							</dl>
							<dl class="clearbox" >
								<dt>결제수단</dt>
								<dd>무통장</dd>
							</dl>
							<dl class="clearbox">
								<dt>에누리</dt>
								<dd>0KRW</dd>
							</dl>
						</div>
					</div>
					<div class="settle bgcolor">
						<dl class="clearbox">
							<dt class="total" style="padding: 10px 0px; border: 0px;">결제금액</dt>
							<dd class="total price" style="padding: 10px 0px; border: 0px;">
								<span class="settle_price tahoma" id="total_settle_price">0</span>KRW
							</dd>
							<span
								class="price_cell settle_price_compare fx20 bold tahoma total_result_price"></span>
						</dl>

					</div>
				</div>
				<!-- //결제금액 -->


				<!-- 주문자/배송지 정보 -->
				<div class="order_settle clearbox">
					<div class="benefit ">
						<h4>배송지</h4>

						<ul class="list_inner fx12">
							<li>배송지 정보는 개인 결제 시 구매자께서 직접 입력하시게 됩니다.</li>
						</ul>
					</div>
					<div class="settle bgcolor fx12">
						<h4>주문자</h4>
						<ul class="list_inner">
							<!-- 회원일 경우 :: START -->
							<li class="order_member">
								<ul>
									<li>테스트999</li>
									<li>010-123-4567 / --</li>
									<li>ssss@daum.net</li>
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