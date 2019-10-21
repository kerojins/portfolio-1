<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="container admin_item_list">
	<div class="search-form-container">
		<div class=" admin_page_head">

			<h2>
				<c:choose>
					<c:when test="${board eq 'qna'}">
					[1:1질문]
					</c:when>
					<c:when test="${board eq 'notice'}">
					[공지사항]
					</c:when>
					<c:when test="${board eq 'event'}">
					[이벤트]
					</c:when>
					<c:when test="${board eq 'review'}">
					[리뷰]
					</c:when>
				</c:choose>
				목록 리스트
			</h2>
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

			</colgroup>
			<thead class="lth">
				<tr>
					<th><input type="checkbox" name="checkboxAll" value=""
						id="checkboxAll"></th>
					<th>번호</th>
					<th>작성자</th>
					<c:choose>
						<c:when test="${board eq 'qna'}">
							<th><select name="category" id="searchcategory" class="line">
									<option value="" selected="selected">- 질문유형전체 -</option>
									<option value="배송지연/불만">배송지연/불만</option>
									<option value="반품문의 ">반품문의</option>
									<option value="A/S문의">A/S문의</option>
									<option value="환불문의 ">환불문의</option>
									<option value="주문결제문의 ">주문결제문의</option>
									<option value="회원정보문의">회원정보문의</option>
									<option value="취소문의 ">취소문의</option>
									<option value="교환문의 ">교환문의</option>
									<option value="상품정보문의 ">상품정보문의</option>
									<option value="기타문의">기타문의</option>
							</select></th>
						</c:when>
						<c:when test="${board eq 'notice'}">
							<th><select name="category" id="searchcategory" class="line">
									<option value="" selected="selected">- 전체 -</option>
									<option value="공지">공지</option>
									<option value="이벤트">이벤트</option>
									<option value="긴급공지">긴급공지</option>
							</select></th>
						</c:when>
					</c:choose>
					<th width="40%">제목</th>
					<th>등록일</th>
					<c:choose>
						<c:when test="${board eq 'qna'}">
							<th><select name="reply" id="selreply" class="line">
									<option value="" selected="selected">- 답변상태 -</option>
									<option value="y">답변대기</option>
									<option value="n">답변완료</option>
							</select></th>
						</c:when>
						<c:when test="${board eq 'review'}">
							<th><select name="score" id="searchscore" class="line">
									<option value="" selected="selected">-평점전체-</option>
									<option value="1">★</option>
									<option value="2">★★</option>
									<option value="3">★★★</option>
									<option value="4">★★★★</option>
									<option value="5">★★★★★</option>
							</select></th>
						</c:when>
					</c:choose>
					<th><c:choose>
							<c:when test="${board eq 'qna' or board eq 'review' }">
						마일리지
					</c:when>
							<c:otherwise> 
						조회수 
					</c:otherwise>
						</c:choose></th>
					<th width="7%">관리</th>
				</tr>
			</thead>
			<!-- 테이블 헤더 : 끝 -->

			<!-- 리스트 : 시작 -->
			<tbody class="ltb otb" id="ajaxTable">
				<!-- 공지리스트데이터 : 시작 -->

				<!--공지 리스트 : 끝 -->

				<!-- 리스트데이터 : 시작 -->
				<tr class="list-row  ">
					<td align="center"><input type="checkbox" name="del[]"
						value="17" class="checkeds"></td>
					<td align="center" class="number">2</td>
					<td align="center" class="name">관리자 (gso***)</td>
					<c:if test="${board eq 'qna' or board eq 'notice' }">
						<td align="center" class="category">기타문의</td>
					</c:if>
					<td align="left"><span class="hand blue boad_view_btn"
						viewlink="/admin/board/mbqna_view?id=mbqna&amp;seq=17"
						board_seq="17" board_id="mbqna">가정에서의 전기안전</span></td>
					<td align="center" class="date">2019-06-13 23:05</td>
					<c:if test="${board eq 'qna' or board eq 'review' }">
						<td align="center"></td>
					</c:if>
					<td align="center"></td>
					<td align="center" nowrap=""><span
						class="btn small valign-middle"><input type="button"
							name="boad_modify_btn" board_seq="17" board_id="mbqna" value="수정"></span>
						<span class="btn small valign-middle"><input type="button"
							name="boad_reply_btn" board_seq="17" board_id="mbqna"
							value="답변등록"></span> <span class="btn small valign-middle"><input
							type="button" name="boad_delete_btn" board_seq="17"
							board_id="mbqna" value="삭제"></span></td>
				</tr>

			</tbody>
			<!-- 리스트 : 끝 -->
		</table>
	</div>

</div>