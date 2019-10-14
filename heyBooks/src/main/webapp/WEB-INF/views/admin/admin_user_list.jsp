<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="container admin_item_list">
	<div class="search-form-container">
		<div class=" admin_page_head">
			<h2>회원리스트</h2>
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
															name="keyword" value=""
															title="이름, 아이디, 이메일, 전화번호, 핸드폰(뒷자리4), 주소, 닉네임"
															placeholder="이름, 아이디, 이메일, 전화번호, 핸드폰(뒷자리4), 주소, 닉네임"></td>
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
										<th>가입일</th>
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
										<th>최종 방문일</th>
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
										<th>생일</th>
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
										<th>등급</th>
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
										<th>성별</th>
										<td><label for="male"><input id="male"
												type="radio" name="gender" value="normal"> <span>남자</span></label>
											<label for="female"><input id="female" type="radio"
												name="gender" value="runout"> <span>여자</span></label></td>
									</tr>

									<tr>
										<th>포인트</th>
										<td no="0"><input type="text" name="sprice" value=""
											size="7" class="line onlyfloat" row_group="price"> ~
											<input type="text" name="eprice" value="" size="7"
											class="line onlyfloat" row_group="price"></td>
										<th>주문횟수</th>
										<td no="1"><input type="text" name="sstock" value=""
											size="7" class="line onlynumber" row_group="stock"> ~
											<input type="text" name="estock" value="" size="7"
											class="line onlynumber" row_group="stock"></td>
									</tr>
									<tr>
										<th>방문횟수</th>
										<td no="0"><input type="text" name="sprice" value=""
											size="7" class="line onlyfloat" row_group="price"> ~
											<input type="text" name="eprice" value="" size="7"
											class="line onlyfloat" row_group="price"></td>
										<th>리뷰횟수</th>
										<td no="1"><input type="text" name="sstock" value=""
											size="7" class="line onlynumber" row_group="stock"> ~
											<input type="text" name="estock" value="" size="7"
											class="line onlynumber" row_group="stock"></td>
									</tr>


								</tbody>
							</table>
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
	<div class="admin_list_box user_list_box">
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
		<table id="user_list_table" class="list-table-style " cellspacing="0">
			<!-- 테이블 헤더 : 시작 -->
			<colgroup>
				<col width="3%">
				<!-- checkbox -->
				<col width="3%">
				<!-- 번호 --> 
				<col width="4%">
				<!-- 등급 -->
				<col width="13%">
				<!-- 아이디 -->
				<col width="10%">
				<!-- 이름 -->
				<col width="12%">
				<!-- 이메일 -->
				<col width="8%">
				<!-- 전화번호 -->
				<col width="15%">
				<!-- 가입일 -->

				<col width="5%">
				<!-- 포인트 -->
				<col width="5%">
				<!-- 예치금 -->
				<col width="5%">
				<!-- 관리 -->
			</colgroup>
			<thead class="lth">
				<tr>
					<th><input type="checkbox"
						onclick="chkAll(this,'member_chk');"></th>
					<th>번호</th>
					<th>등급</th>
					<th>아이디</th>
					<th>이름(닉네임)</th>
					<th>이메일/핸드폰</th>
					<th>전화번호</th>
					<th>가입일 / 최종방문</th>
					<th>포인트</th>
					<th>예치금</th>
					<th>관리</th>
				</tr>
			</thead> 
			<!-- 테이블 헤더 : 끝 -->

			<tbody id="user-tr-list" class="ltb otb">
				<tr class="list-row" nth-row="1">
					<td class="ctd"><input type="checkbox" name="member_chk[]"
						value="7" cellphone="" email="" grade="1" grade_name="일반"
						class="member_chk"></td>
					<td class="ctd">1</td>
					<td class="ltd">일반</td>
					<td class="ltd hand" style="font-weight: bold;"
						onclick="open_crm_summary(this,'7','','right');"><span
						class="blue">test01</span></td>
					<td class="ltd">(test)</td>

					<td class="ltd">없음</td>

					<td class="ltd">없음</td>
					<td class="ltd">2019-08-21 10:44:21<br>2019-08-21
						10:46:10
					</td>
					<td class="ltd"><span class="blue hand"
						onclick="point_pop('7');">0</span></td>
					<td class="ltd"><span class="blue hand"
						onclick="cash_pop('7');">0</span></td>
					<td class="ctd"><span class="btn small valign-middle"><input
							type="button" name="manager_modify_btn" value="상세"
							onclick="open_crm_summary(this);"></span></td>
				</tr>
				<tr class="list-row" nth-row="2">
					<td class="ctd"><input type="checkbox" name="member_chk[]"
						value="7" cellphone="" email="" grade="2" grade_name="일반"
						class="member_chk"></td>
					<td class="ctd">1</td>
					<td class="ltd">일반</td>
					<td class="ltd hand" style="font-weight: bold;"
						onclick="open_crm_summary(this,'7','','right');"><span
						class="blue">test01</span></td>
					<td class="ltd">(test)</td>
					<td class="ltd">없음</td>
					<td class="ltd">없음</td>
					<td class="ltd">2019-08-21 10:44:21<br>2019-08-21
						10:46:10
					</td>
					<td class="ltd"><span class="blue hand"
						onclick="point_pop('7');">0</span></td>
					<td class="ltd"><span class="blue hand"
						onclick="cash_pop('7');">0</span></td>
					<td class="ctd"><span class="btn small valign-middle"><input
							type="button" name="manager_modify_btn" value="상세"
							onclick="open_crm_summary(this);"></span></td>
				</tr>
			</tbody>
		</table>
	</div>
	<div id="member_info_layers" class="member_info_layer"
		style="">
		<div class="memberInfoWrap">
			<div class="layer_close">x</div>
			<div stype="padding:8px;">
			<table width="310" cellspacing="0" cellpadding="0"
				class="memberInfoTable">
				<colgroup> 
					<col style="width: 60px">  
					<col style="width: *">
					<col style="width: 110px"> 
					<col style="width: 50px">
				</colgroup> 
				<thead> 
					<tr> 
						<th colspan="4" style="padding-left:8px"> 고객CRM</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th><a href="/admincrm/main/user_detail?member_seq=7"
							target="_blank">악성도</a></th>
						<td class="">없음</td>
						<th>SNS 정보</th>
						<td class="snsList">없음</td>
					</tr>
					<tr>
						<th><a href="/admincrm/member/point_list?member_seq=7"
							target="_blank">포인트</a></th>
						<td class="blueText bold">0</td>
						<th><a href="/admincrm/order/refund_catalog?member_seq=7"
							target="_blank">미처리 환불</a></th>
						<td class=" bdbottom">0</td>
					</tr>
					<tr>
						<th><a href="/admincrm/member/cash_list?member_seq=7"
							target="_blank">예치금</a></th>
						<td class="blueText bold">0</td>
						<th><a href="/admincrm/board/qna_catalog?member_seq=7"
							target="_blank">미처리 상품문의</a></th>
						<td class="">0</td>
					</tr>
					<tr>
						<th><a
							href="/admincrm/member/member_coupon_list?member_seq=7"
							target="_blank">쿠폰</a></th>
						<td class="">0장</td>
						<th><a href="/admincrm/board/mbqna_catalog?member_seq=7"
							target="_blank">미처리 1:1문의</a></th>
						<td class="">0</td>
					</tr>
					<tr>
						<th><a
							href="/admincrm/member/member_coupon_list?tab=3&amp;member_seq=7"
							target="_blank">코드</a></th>
						<td class="">0장</td>
						<th><a href="/admincrm/board/counsel_catalog?member_seq=7"
							target="_blank">미처리 상담</a></th>
						<td class="">0</td>
					</tr>
				</tbody>
			</table>
			</div>
		</div> 
	</div>
</div>