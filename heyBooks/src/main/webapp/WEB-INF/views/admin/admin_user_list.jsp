<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="container admin_item_list">
	<div class="search-form-container">
		<div class=" admin_page_head">
			<h2>회원리스트</h2>
		</div>
		<form class="member_search search_form" action="<c:url value='/admin_user_list'/>" method="get">
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
														<td class="sfk-td-txt"><input type="text" name="keyword" value="${keyword}" title="이름, 아이디, 이메일, 전화번호, 핸드폰(뒷자리4), 주소, 닉네임" placeholder="이름, 아이디, 이메일, 전화번호, 핸드폰(뒷자리4), 주소, 닉네임"></td>
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
									<col width="230">
									<col width="80">
									<col>
								</colgroup>
								<tbody>
									<tr>
										<th>생일</th>
										<td colspan="5"> 
											<input type="text"  maxlength="10" size="10" value="${birth_date}" name="birth_date" class="datepickers start_day">
											<img class="ui-datepicker-trigger" src="<c:url value='/resources/images/icon_calendar.gif'/>" alt="..." title="..."> &nbsp;
											<span class="gray">-</span>&nbsp;
											<input type="text" maxlength="10" size="10" value="${birth_end_date}" name="birth_end_date" class="datepickers end_day">
											<img class="ui-datepicker-trigger" src="<c:url value='/resources/images/icon_calendar.gif'/>" alt="..." title="..."> &nbsp;&nbsp; 
										</td> 
									</tr>    
									<tr>
										<th>가입일</th>
										<td colspan="5"> 
											<input type="text"  maxlength="10" size="10" value="${join_date}" name="join_date" class="datepickers start_day">
											<img class="ui-datepicker-trigger" src="<c:url value='/resources/images/icon_calendar.gif'/>" alt="..." title="..."> &nbsp;
											<span class="gray">-</span>&nbsp;
											<input type="text" maxlength="10" size="10" value="${join_end_date}" name="join_end_date" class="datepickers end_day">
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
										<th>포인트</th>
										<td no="0">
											<input type="text" name="mile_start" value="${mile_start}" size="7" class="line onlyfloat" row_group="price"> ~ 
											<input type="text" name="mile_end" value="${mile_end}" size="7" class="line onlyfloat" row_group="price">
										</td>
										<th>주문 횟수</th> 
										<td no="0">
											<input type="text" name="order_start" value="${order_start}" size="7" class="line onlyfloat" row_group="price"> ~
											<input type="text" name="order_end" value="${order_end}" size="7" class="line onlyfloat" row_group="price">
										</td>
									</tr>
									<tr>
										<th>리뷰 횟수</th>  
										<td no="0">
											<input type="text" name="review_start" value="${review_start}" size="7" class="line onlyfloat" row_group="price"> ~
											<input type="text" name="review_end" value="${review_end}" size="7" class="line onlyfloat" row_group="price">
										</td> 
										<th>성별</th>
										<td> 
											<label for="male">
												<input id="male" type="radio" <c:if test="${members_gender eq '남자'}">selected</c:if> name="members_gender" value="남자"> 
												<span>남자</span>
											</label> 
											<label for="female">  
												<input id="female" type="radio" <c:if test="${members_gender eq '여자'}">selected</c:if> name="members_gender" value="여자"> 
												<span>여자</span>  
											</label>
										</td>
									</tr> 
									<tr>
										<th>회원 상태</th>
										<td> 
											<label for="male">
												<input id="male" type="radio" <c:if test="${members_status eq '정상'}">selected</c:if> name="members_status" value="정상"> 
												<span>정상</span>
											</label> 
											<label for="female">  
												<input id="female" type="radio" <c:if test="${members_status eq '정지'}">selected</c:if> name="members_status" value="정지"> 
												<span>정지</span>  
											</label> 
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
	<div class="admin_list_box user_list_box">
		<form action="<c:url value='/user_list_update'/>" method="get" id="user_list">
			<div class="admin_list_top">
				<p>  
					전체 <span>${totalRowCount}</span>개
				</p>  
				<div class="admin_select_list">
					<input hidden="hidden" id="list_type" value="admin_user_list">
					<select name = "item_list_arr_list" id="item_list_arr_list">
						<option value="members_regdate" <c:if test="${list_arr eq 'members_regdate'}">selected="selected"</c:if>>가입순</option>
						<option value="members_id"<c:if test="${list_arr eq 'members_id'}">selected="selected"</c:if>>아이디순</option>
						<option value="members_name"<c:if test="${list_arr eq 'members_name'}">selected="selected"</c:if>>이름순</option>
					</select>    
					<select name = "item_rowCount_list" id="item_rowCount_list"> 
						<option value="10" <c:if test="${rowCount eq 10}">selected </c:if>>10개씩</option>
						<option value="50" <c:if test="${rowCount eq 50}">selected </c:if>>50개씩</option> 
						<option value="100" <c:if test="${rowCount eq 100}">selected </c:if>>100개씩</option>   
						<option value="200" <c:if test="${rowCount eq 200}">selected </c:if>>200개씩</option>
					</select>  
				</div>      
			</div>
			<table id="user_list_table" class="list-table-style " cellspacing="0">
				<!-- 테이블 헤더 : 시작 -->
				<colgroup>
					<col width="2%">
					<!-- checkbox -->
					<col width="2%">
					<!-- 번호 --> 
					<col width="6%">
					<!-- 성별-->
					<col width="7%">
					<!-- 아이디 -->
					<col width="7%">
					<!-- 이름 -->
					<col width="13%">
					<!-- 이메일 -->
					<col width="20%">
					<!-- 주소/전화번호 -->
					<col width="9%">
					<!-- 가입일 -->
	
					<col width="5%"> 
					<!-- 포인트 -->
					<col width="5%">
					<!-- 예치금 -->
					<col width="7%">
					<!-- 관리 -->
				</colgroup>
				<thead class="lth">
					<tr>
						<th><input type="checkbox"  class="ckAll" onclick="ckAll(this);"></th>
						<th>번호</th>
						<th>생년월일/성별</th>
						<th>아이디</th>
						<th>이름</th>
						<th>이메일/핸드폰</th>
						<th>주소/전화번호</th>
						<th>가입일</th> 
						<th>포인트</th>
						<th>관리</th>
					</tr> 
				</thead> 
				<!-- 테이블 헤더 : 끝 -->
				<tbody id="user-tr-list" class="ltb otb">
					<c:forEach var="list" items="${member_list}" varStatus="status">
						<tr class="list-row"> 
							<td align="center"> 
								<input type="checkbox" class="select_ck_num" name="select_ck_num" value="${list.members_num}" data-provider_seq="1">
							</td>
							<td class="ctd">${status.count}</td>  
							<td class="ltd">${list.members_years} / ${list.members_gender}</td>   
							<td class="ltd hand" style="font-weight: bold;">
								<span class="blue">${list.members_id}</span>
							</td>  
							<td class="ltd">${list.members_name}</td>  
							<td class="ltd">
							${list.members_email}<br>${list.members_phone_number}
							</td>
							<td class="ltd">
								${list.members_address} ${list.members_detail_address} ${list.members_extra_address}<br>${list.members_add_number}
							</td>
							<c:set var="date" value="${list.members_regdate}"/>
								<%  
									Date date = (Date) pageContext.getAttribute("date");
									SimpleDateFormat sdate = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
									String date_txt = sdate.format(date);
									pageContext.setAttribute("date_txt", date_txt);
								%> 
							<td class="ltd">${date_txt}</td> 
							<td class="ltd"> 
								<span class="blue hand">${mile_list[status.index]}</span>
							</td>    
							<td class="ctd">  
								<span class="admin_detail_btn small valign-middle">
									<input type="button" name="manager_modify_btn" num="${list.members_num}" class="user_detail_btn" onclick="open_summary(this)" value="상세">
									<a href="<c:url value='/user_list_update?members_num=${list.members_num}'/>">정지</a>
								</span>
							
							</td> 
						</tr>	 
					</c:forEach>  
				</tbody>
			</table>
			<p style="margin-top:10px;"><input type="submit" onclick="ck_null('user_list');" value="선택 정지"></p>
		</form>
	</div>
	
	<%-- 페이지 네비게이션 --%>
		<ul class="pagination item_pagenum">
			<li class="page-item"> 
				<input hidden="hidden" class="url_val" value="/admin_user_list?keyword=${keyword}&birth_date=${birth_date}&birth_end_date=${birth_end_date}&join_date=${join_date}&join_end_date=${join_end_date}&mile_start=${mile_start}&mile_end=${mile_end}&order_start=${order_start}&order_end=${order_end}&review_start=${review_start}&review_end=${review_end}&pageNum=${pageNum}">
				<c:choose>  
					<c:when test="${(util.startPageNum%util.pageBlockCount==1) && (util.startPageNum>util.pageBlockCount)}">
						<a class="page-link" aria-label="Previous" href="<c:url value='/admin_user_list?keyword=${keyword}&birth_date=${birth_date}&birth_end_date=${birth_end_date}&join_date=${join_date}&join_end_date=${join_end_date}&mile_start=${mile_start}&mile_end=${mile_end}&order_start=${order_start}&order_end=${order_end}&review_start=${review_start}&review_end=${review_end}&pageNum=${util.startPageNum-1}&list_arr=${list_arr}&rowCount=${rowCount}'/>">
							<span aria-hidden="true">«</span> 
						</a> 
					</c:when>     
					<c:otherwise>
						<a class="page-link" aria-label="Previous" href="<c:url value='/admin_user_list?keyword=${keyword}&birth_date=${birth_date}&birth_end_date=${birth_end_date}&join_date=${join_date}&join_end_date=${join_end_date}&mile_start=${mile_start}&mile_end=${mile_end}&order_start=${order_start}&order_end=${order_end}&review_start=${review_start}&review_end=${review_end}&pageNum=${util.pageNum-1}&list_arr=${list_arr}&rowCount=${rowCount}'/>">
						<span aria-hidden="true">«</span>
						</a> 
					</c:otherwise>   
				</c:choose>    
			</li> 
			<c:forEach var="i" begin="${util.startPageNum }" end="${util.endPageNum }">
				<c:choose> 
					<c:when test="${util.pageNum==i }"> 
						<li class="page-item" id="page_ck">
							<a class="page-link" href="<c:url value='/admin_user_list?keyword=${keyword}&birth_date=${birth_date}&birth_end_date=${birth_end_date}&join_date=${join_date}&join_end_date=${join_end_date}&mile_start=${mile_start}&mile_end=${mile_end}&order_start=${order_start}&order_end=${order_end}&review_start=${review_start}&review_end=${review_end}&pageNum=${i}&list_arr=${list_arr}&rowCount=${rowCount}'/>">${i}</a>
						</li>
					</c:when> 
					<c:otherwise> 
						<li class="page-item">
							<a class="page-link" href="<c:url value='/admin_user_list?keyword=${keyword}&birth_date=${birth_date}&birth_end_date=${birth_end_date}&join_date=${join_date}&join_end_date=${join_end_date}&mile_start=${mile_start}&mile_end=${mile_end}&order_start=${order_start}&order_end=${order_end}&review_start=${review_start}&review_end=${review_end}&pageNum=${i}&list_arr=${list_arr}&rowCount=${rowCount}'/>">${i}</a>
						</li>
					</c:otherwise>
				</c:choose>   
			</c:forEach>  
			<li class="page-item">
				<c:choose>
					<c:when test="${util.pageNum < util.totalPageCount}">
						<a class="page-link" aria-label="Next" href="<c:url value='/admin_user_list?keyword=${keyword}&birth_date=${birth_date}&birth_end_date=${birth_end_date}&join_date=${join_date}&join_end_date=${join_end_date}&mile_start=${mile_start}&mile_end=${mile_end}&order_start=${order_start}&order_end=${order_end}&review_start=${review_start}&review_end=${review_end}&pageNum=${util.pageNum + 1}&list_arr=${list_arr}&rowCount=${rowCount}'/>"> 
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
						<th><a
							href="/admincrm/member/member_coupon_list?member_seq=7" 
							target="_blank">리뷰 수</a></th>
						<td class="detail_review">0</td>
						<th><a href="/admincrm/board/qna_catalog?member_seq=7" 
							target="_blank">미처리 상담문의</a></th>
						<td class="detail_counsel">0</td> 
					</tr>
					<tr> 
						<th><a href="/admincrm/board/mbqna_catalog?member_seq=7"
							target="_blank">구매 수</a></th>
						<td class="detail_order">0</td>
						<th><a
							href="/admincrm/member/member_coupon_list?tab=3&amp;member_seq=7"
							target="_blank">직업</a></th>
						<td class="detail_job"></td> 
					</tr> 
					<tr> 
						<th><a
							href="/admincrm/member/member_coupon_list?tab=3&amp;member_seq=7" 
							target="_blank">관심사</a></th>
						<td colspan="3" class="detail_favorite"></td>
					</tr>
				</tbody>
			</table>  
			</div>
		</div> 
	</div>
</div>