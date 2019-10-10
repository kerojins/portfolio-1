<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="container admin_item_list">
	<div class="search-form-container">
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
									<td width="20">&nbsp; </td>
									
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
								<col width="300">
								<col width="90">
								<col>
							</colgroup>
							<tbody>
								<tr>
									<th>카테고리</th>
									<td colspan="5"><select class="line" name="category1"
										size="1" style="width: 100px;"><option value="">=
												1차 분류 =</option>
											<option value="0001">카메라</option>
											<option value="0002">렌즈</option>
											<option value="0003">플래쉬</option>
											<option value="0004">메모리</option>
											<option value="0005">베터리</option>
											<option value="0006">가방</option>
											<option value="0007">삼각대</option>
											<option value="0008">스트랩</option>
											<option value="0010">관리용품</option>
											<option value="0011">기타용품</option>
											<option value="0012">강의</option>
											<option value="0013">New node</option>
											<option value="0014">New node</option>
											<option value="0015">New node</option>
											<option value="0016">소품</option>
											<option value="0017">New node</option></select> <select class="line"
										name="category2" size="1" style="width: 100px;"><option
												value="">= 2차 분류 =</option></select> <select class="line"
										name="category3" size="1" style="width: 100px;"><option
												value="">= 3차 분류 =</option></select> <select class="line"
										name="category4" size="1" style="width: 100px;"><option
												value="">= 4차 분류 =</option></select>
									</td>
								</tr>
								<tr>
									<th>브랜드</th>
									<td colspan="5"><select class="line" name="brands1"
										size="1" style="width: 100px;"><option value="">=
												1차 분류 =</option>
											<option value="0001">Rowan</option>
											<option value="0002">캐논</option>
											<option value="0003">시그마</option>
											<option value="0004">로우프로</option>
											<option value="0005">짓죠</option>
											<option value="0006">LG</option>
											<option value="0007">SK-II</option></select> <select class="line"
										name="brands2" size="1" style="width: 100px;"><option
												value="">= 2차 분류 =</option></select> <select class="line"
										name="brands3" size="1" style="width: 100px;"><option
												value="">= 3차 분류 =</option></select> <select class="line"
										name="brands4" size="1" style="width: 100px;"><option
												value="">= 4차 분류 =</option></select>
									</td>
								</tr>
								<tr>
									<th><select name="date_gb" class="search_select line"
										default_none="" style="font-weight: bold;">
											<option value="regist_date">등록일</option>
											<!--<option value="update_date" >수정일</option>-->
									</select></th>
									<td colspan="5"><input type="text" name="sdate" value=""
										class="datepicker line hasDatepicker" maxlength="10" size="10"
										default_none="" id="datepicker_67009428_0"><img
										class="ui-datepicker-trigger"
										src="/app/javascript/jquery/icon_calendar.gif" alt="..."
										title="..."> &nbsp;<span class="gray">-</span>&nbsp; <input
										type="text" name="edate" value=""
										class="datepicker line hasDatepicker" maxlength="10" size="10"
										default_none="" id="datepicker_67009428_1"><img
										class="ui-datepicker-trigger"
										src="/app/javascript/jquery/icon_calendar.gif" alt="..."
										title="..."> &nbsp;&nbsp; <span class="btn small"><input
											type="button" value="오늘" id="today" class="select_date"></span>
										<span class="btn small"><input type="button"
											value="3일간" id="3day" class="select_date"></span> <span
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
									<th><select name="price_gb" class="search_select line"
										default_none="" style="font-weight: bold;">
											<option value="consumer_price">정상가</option>
											<option value="price">할인가</option>
									</select></th>
									<td no="0"><input type="text" name="sprice" value=""
										size="7" class="line onlyfloat" row_group="price"> - <input
										type="text" name="eprice" value="" size="7"
										class="line onlyfloat" row_group="price"></td>
									<th>재고수량</th>
									<td no="1"><input type="text" name="sstock" value=""
										size="7" class="line onlynumber" row_group="stock"> -
										<input type="text" name="estock" value="" size="7"
										class="line onlynumber" row_group="stock"></td>
								</tr>
								<tr>
									<!--
						<th>매입처</th>
						<td>
							<select name=""></select>
						</td>
						<th>판매처</th>
						<td>
							<select name=""></select>
						</td>
						
						<th>모델명</th>
						<td>
							<select name="model" class="line">
								<option value="">= 선택하세요 =</option>
							</select>
						</td>
						<th>브랜드</th>
						<td>
							<select name="brand" class="line">
								<option value="">= 선택하세요 =</option>
							</select>
						</td>
						-->
									<th>상태</th>
									<td no="0"><label><input type="checkbox"
											name="goodsStatus[]" value="normal"> <span>정상</span></label>
										<label><input type="checkbox" name="goodsStatus[]"
											value="runout"> <span>품절</span></label> <label><input
											type="checkbox" name="goodsStatus[]" value="purchasing">
											<span>재고확보중</span></label> <label><input type="checkbox"
											name="goodsStatus[]" value="unsold"> <span>판매중지</span></label>
									</td>
									<th>재입고알림</th>
									<td no="1"><label><input type="checkbox"
											name="notifyStatus[]" value="none"> <span>미통보</span></label>
										<label><input type="checkbox" name="notifyStatus[]"
											value="complete"> <span>통보</span></label></td>
								</tr>
								<tr>
									<!--
						<th>제조사</th>
						<td>
							<select name="manufacture" class="line">
								<option value="">= 선택하세요 =</option>
							</select>
						</td>
						<th>원산지</th>
						<td>
							<select name="orign" class="line">
								<option value="">= 선택하세요 =</option>
							</select>
						</td>
						-->
									<th>노출</th>
									<td><label><input type="checkbox"
											name="goodsView[]" value="look"> <span>보임</span></label> <label><input
											type="checkbox" name="goodsView[]" value="notLook"> <span>안보임</span></label>
									</td>
									<th>과세/비과세</th>
									<td no="1"><label><input type="checkbox"
											name="taxView[]" value="tax"> <span>과세</span></label> <label><input
											type="checkbox" name="taxView[]" value="exempt"
											row_check_all=""> <span>비과세</span></label></td>
								</tr>
							</tbody>
						</table>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
</div>