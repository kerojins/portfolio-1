<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="container admin_item_list">
	<div class="search-form-container">
		<div class=" admin_page_head">
			<h2>상품리스트</h2>
			<a class="admin_btn" href="<c:url value='/admin_item_add'/>">상품등록</a>
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
			<table class="list-table-style item_list_table" cellspacing="0">
				<!-- 테이블 헤더 : 시작 -->
				<colgroup>
					<col width="30">
					<!--체크값-->
					<col width="40">
					<!--번호-->
					<col width="60">
					<!--상품이미지-->
					<col>
					<!--상품명-->

					<col width="85">
					<!--정가-->
					<col width="85">
					<!--판매가-->
					<col width="120">
					<!--재고가용-->


					<col width="50">
					<!--구매/pv-->

					<col width="180">
					<!--등록일-->
					<col width="90">
					<!--상태-->
					<col width="60">
					<!--노출-->
					<col width="70">
					<!--통계-->

					<col width="60">
					<!--관리-->
				</colgroup>
				<thead class="lth">
					<tr>
						<th><input type="checkbox" id="chkAll"></th>
						<th>번호</th>
						<th colspan="2"><span class="btnSort hand"
							orderby="goods_name" title="[상품명]으로 정렬">상품명</span></th>
						<th><span class="btnSort hand" orderby="consumer_price"
							title="[정가]로 정렬">정가</span></th>
						<th><span class="btnSort hand" orderby="price"
							title="[판매가]로 정렬">판매가</span></th>
						<th><span class="btnSort hand" orderby="tot_stock"
							title="[재고] 정렬">재고</span> <span
							class="helpicon2 detailDescriptionLayerBtn" title="[안내] 재고/가용 표기"></span>
						</th>

						<th>구매/<span class="btnSort hand" orderby="page_view"
							title="[페이지뷰]로 정렬">PV</span></th>

						<th><span class="btnSort hand" orderby="goods_seq"
							title="[등록일순] 정렬">등록일</span> /<span class="btnSort hand"
							orderby="update_date" title="[수정일순] 정렬">수정일</span></th>
						<th>상태</th>
						<th>노출</th>
						<th>통계</th>
						<th>관리</th>
					</tr>
				</thead>
 
				<tbody class="ltb">
				<c:forEach var="list" items="${item_list }">
					<tr class="list-row" style="height: 70px;">
						<td align="center"><input type="checkbox" class="chk"
							name="goods_seq[]" value="61" data-provider_seq="1"></td>
						<td align="center" class="page_no">${list.product_num }</td>
						<td align="right"><a href="/goods/view?no=62" target="_blank"><img
								src="<c:url value='${list.product_picture }' />" 
								width="50"></a></td>   
						<td align="left" style="padding-left: 10px;">
							<div class="fx11 gray"></div> 
							<div>  
								<a href="../goods/regist?no=61" target="_blank">미니어처 별</a>
								<div></div>
								<div style="padding-top: 3px;"></div>
							</div>
						</td>
						<td align="right">0&nbsp;</td>
						<td align="right">
							<div>0&nbsp;</div>
						</td>
						<td align="center">3</td>


						<td align="center">
							<div>
								<a href="/admin/order/catalog?goods_seq=61">조회</a>
							</div>
							<div>1</div>
						</td>
						<td align="center">2019-09-11 23:04:09<br>2019-09-11
							23:04:09
						</td>
						<td align="center">
							<div>
								<b>정상</b>
								<div></div>
							</div>
						</td>
						<td align="center"><span class="display-goods-view-61 "><span
								style="color: red">미노출</span></span></td>
						<td align="center">
							<div>
								<img src="<c:url value='/resources/images/btn_stats.gif'/>"
									style="cursor: pointer;" onclick="openAdvancedStatistic('61');">
							</div>

						</td>
						<td align="center">
							<div>
								<span class="btn small valign-middle"><input
									type="button" class="manager_copy_btn" value="복사"
									goods_seq="61"></span>
							</div>
							<div style="margin-top: 2px;">
								<span class="btn small valign-middle"><input
									type="button" name="manager_modify_btn" value="상세"
									goods_seq="61" onclick="goodsView('61');"></span>
							</div>
						</td>
					</tr>
				</c:forEach>	
				</tbody>
			</table>
	</div>
</div>