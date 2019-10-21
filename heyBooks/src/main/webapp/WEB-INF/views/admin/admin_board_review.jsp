<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="container admin_item_list">
	<div class="search-form-container">
		<div class=" admin_page_head">
			<h2>[리뷰관리] 게시글 리스트</h2>
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
										<th>작성일</th>
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
		<table class="list-table-style qna_list_table board_list_tables"
			cellspacing="0">
			<!-- 테이블 헤더 : 시작 -->
			<colgroup>
				<col width="20">
				<col width="40">
				<col width="150">
				<col width="100">
				<col>
				<col width="110">
				<col width="110">
				<col width="100">
				<col width="90">
			</colgroup>
			<thead class="lth">
				<tr>
					<th><input type="checkbox" name="checkboxAll" value=""
						id="checkboxAll"></th>
					<th>번호</th>
					<th>작성자</th>
					<th><select name="category" id="searchcategory" class="line">
							<option value="" selected="selected">- 전체 -</option>
							<option value="공지">공지</option>
							<option value="이벤트">이벤트</option>
							<option value="긴급공지">긴급공지</option>
					</select></th>
					<th>제목</th>
					<th>등록일</th>
					<th><select name="score" id="searchscore" class="line">
							<option value="" selected="selected">-평점전체-</option>
							<option value="1">★</option>
							<option value="2">★★</option>
							<option value="3">★★★</option>
							<option value="4">★★★★</option>
							<option value="5">★★★★★</option>
					</select></th>
					<th>조회수</th>
					<th>관리</th>
				</tr>
			</thead>
			<!-- 테이블 헤더 : 끝 -->

			<!-- 리스트 : 시작 -->
			<tbody class="ltb otb" id="ajaxTable">
				<!-- 공지리스트데이터 : 시작 -->

				<!--공지 리스트 : 끝 -->

				<!-- 리스트데이터 : 시작 -->
				<tr class="list-row ">
					<td align="center"><input type="checkbox" name="del[]"
						value="20" class="checkeds"></td>
					<td align="center" class="number">2</td>
					<td align="center" class="name"><img
						src="/data/skin/responsive_ver1_default_gl/images/board/icon/icon_admin.gif"
						id="icon_admin_img" align="absmiddle"
						style="vertical-align: middle;"> (gso***)</td>
					<td align="center" class="category">이벤트</td>
					<td align="left"><span class="hand blue boad_view_btn"
						viewlink="/admin/board/view?id=notice&amp;seq=20" board_seq="20"
						board_id="notice">test test</span> <img
						src="/admin/skin/default/images/board/icon/icon_new.gif"
						title="new" align="absmiddle"></td>
					<td align="center" class="date">2019-10-17 06:37</td>
					<td align="center" class="hit"><img src="<c:url value='/resources/images/icon_review.gif'/>"><img src="<c:url value='/resources/images/icon_review.gif'/>"></td>
					<td align="center" class="hit">0</td>
					<td align="center" nowrap=""><span
						class="btn small valign-middle"><input type="button"
							name="boad_modify_btn" board_seq="20" board_id="notice"
							value="수정"></span> <span class="btn small valign-middle"><input
							type="button" name="boad_delete_btn" board_seq="20"
							board_id="notice" value="삭제"></span></td> 
				</tr>
				<tr class="list-row ">
					<td align="center"><input type="checkbox" name="del[]"
						value="19" class="checkeds"></td>
					<td align="center" class="number">1</td>
					<td align="center" class="name"><img
						src="/data/skin/responsive_ver1_default_gl/images/board/icon/icon_admin.gif"
						id="icon_admin_img" align="absmiddle"
						style="vertical-align: middle;"> (gso***)</td>
					<td align="center" class="category">공지</td>
					<td align="left"><span class="hand blue boad_view_btn"
						viewlink="/admin/board/view?id=notice&amp;seq=19" board_seq="19"
						board_id="notice">공지공지입니다</span></td>
					<td align="center" class="date">2019-10-12 02:05</td>
					<td align="center" class="hit"><img src="<c:url value='/resources/images/icon_review.gif'/>"><img src="<c:url value='/resources/images/icon_review.gif'/>"></td>
					<td align="center" class="hit">0</td>
					<td align="center" nowrap=""><span
						class="btn small valign-middle"><input type="button"
							name="boad_modify_btn" board_seq="19" board_id="notice"
							value="수정"></span> <span class="btn small valign-middle"><input
							type="button" name="boad_delete_btn" board_seq="19"
							board_id="notice" value="삭제"></span></td>
				</tr>

			</tbody>
			<!-- 리스트 : 끝 -->
		</table>
	</div>

</div>