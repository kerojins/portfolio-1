<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="container admin_item_list">
	<div class="search-form-container">
		<div class=" admin_page_head">
			<h2>작가 리스트</h2>
			<a class="admin_btn" href="<c:url value='/editor_add'/>">작가등록</a>
		</div>
		<form class="search_form" action="<c:url value='/editor_list'/>" method="get">
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
															<input type="text" name="keyword" value="${keyword}" title="작가명" placeholder="작가명">
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
									<col width="230">
									<col width="80">
									<col>
								</colgroup>
								<tbody>
									<tr>
										<th>등록일</th>
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
										<th>등록작품 수</th>
										<td no="0">
											<input type="text" name="item_start" value="${item_start }" size="7" class="line onlyfloat" row_group="price"> ~
											<input type="text" name="item_end" value="${item_end}" size="7" class="line onlyfloat" row_group="price">
										</td>
										<th>판매 수</th>
										<td no="1">
											<input type="text" name="sell_start" value="${sell_start}" size="7" class="line onlynumber" row_group="stock"> ~
											<input type="text" name="sell_end" value="${sell_end}" size="7" class="line onlynumber" row_group="stock">
										</td>  
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
				<select name = "item_list_arr_list" id="item_list_arr_list">
					<option value="editor_date" <c:if test="${list_arr eq 'editor_date'}">selected </c:if> >최신순</option>
					<option value="editor_name" <c:if test="${list_arr eq 'editor_name'}">selected  </c:if>>작가명순</option>
					<option value="s_quan" <c:if test="${list_arr eq 's_quan'}">selected  </c:if>>판매순</option>
					<option value="s_cnt" <c:if test="${list_arr eq 's_cnt'}">selected  </c:if>>등록작품수순</option>
				</select>     
				<select name = "item_rowCount_list" id="item_rowCount_list">
					<option value="10" <c:if test="${rowCount eq 10}">selected </c:if>>10개씩</option>
					<option value="50" <c:if test="${rowCount eq 50}">selected </c:if>>50개씩</option> 
					<option value="100" <c:if test="${rowCount eq 100}">selected </c:if>>100개씩</option>   
					<option value="200" <c:if test="${rowCount eq 200}">selected </c:if>>200개씩</option>
				</select> 
			</div> 
		</div>
		<form action="<c:url value='/editor_delete'/>" method="post" id="editor_list_form">
			<table id="user_list_table" class="list-table-style">
				<!-- 테이블 헤더 : 시작 -->
				<colgroup>  
					<col width="1%">
					<!-- checkbox -->
					<col width="3%">
					<!-- 번호 --> 
					<col width="13%">
					<!-- 작가명 -->
					<col width="10%">
					<!-- 생년월일 -->
					<col width="5%">
					<!-- 등록작품 수 -->
					<col width="11%"> 
					<!-- 등록일 -->
					<col width="4%">
					<!-- 판매부수 -->
					<col width="7%"> 
					<!-- 관리 -->
				</colgroup>
				<thead class="lth">
					<tr>
						<th><input type="checkbox" class="ckAll" onclick="ckAll();"></th>
						<th>번호</th>
						<th>작가명</th> 
						<th>생년월일</th>
						<th>등록작품 수</th>
						<th>등록일</th>
						<th>판매부수</th>
						<th>관리</th>
					</tr>
				</thead> 
				<!-- 테이블 헤더 : 끝 -->
	
				<tbody id="user-tr-list" class="ltb otb">
				<c:choose>
					<c:when test="${editor_admin_list != null }">
						<c:forEach var="list" items="${editor_admin_list}">
							<tr class="list-row">
								<td class="ctd"><input type="checkbox" name="select_ck_num" class="select_ck_num" value="${list.EDITOR_NUM}"></td>
								<td class="ctd">${list.EDITOR_NUM}</td>
								<td class="ltd">${list.EDITOR_NAME }</td>  
								<td class="ltd">${list.EDITOR_BIRTH }</td>
								<td class="ltd">${list.S_CNT}</td>
								<c:set var="date" value="${list.EDITOR_DATE}"/>
								<%   
									Date date = (Date) pageContext.getAttribute("date");
									SimpleDateFormat sdate = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
									String date_txt = sdate.format(date);
									pageContext.setAttribute("date_txt", date_txt);
								%> 
								<td class="ltd">${date_txt}</td>  
								<td class="ltd">
									<span class="blue hand">${list.S_QUAN}</span>
								</td>
								<td class="ctd">
									<span class="btn small valign-middle admin_detail_btn">
										<a href="<c:url value='/editor_update?editor_num=${list.EDITOR_NUM}'/>">상세</a>
										<a href="<c:url value='/editor_delete?editor_num=${list.EDITOR_NUM}'/>" onclick="editor_del()">삭제</a>
									</span>
								</td>
							</tr>    
						</c:forEach>   
					</c:when> 
					<c:otherwise>
						<c:forEach var="list" items="${editor_list}" varStatus="status">
							<tr class="list-row">
								<td class="ctd"><input type="checkbox" name="select_ck_num" class="select_ck_num" value="${list.editor_num}"></td>
								<td class="ctd">${list.editor_num}</td>
								<td class="ltd">${list.editor_name }</td>  
								<td class="ltd">${list.editor_birth }</td>
								<td class="ltd">${editor_item_count[status.index]}</td>
								<c:set var="date" value="${list.editor_date}"/>
								<%     
									Date date = (Date) pageContext.getAttribute("date");
									SimpleDateFormat sdate = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
									String date_txt = sdate.format(date);
									pageContext.setAttribute("date_txt", date_txt);
								%> 
								<td class="ltd">${date_txt}</td>  
								<td class="ltd">
									<span class="blue hand">0</span>
								</td>
								<td class="ctd">
									<span class="btn small valign-middle admin_detail_btn">
										<a href="<c:url value='/editor_update?editor_num=${vo.editor_num }'/>">상세</a>
										<a href="<c:url value='/editor_delete?editor_num=${vo.editor_num }'/>" onclick="editor_del()">삭제</a>
									</span>
								</td> 
							</tr>
							</c:forEach>
					</c:otherwise>
				</c:choose>
					  
				
				</tbody> 
			</table>
			<p style="margin-top:10px;"><input onclick="ck_null('editor_list_form')" type="button" value="선택 삭제"></p>
		</form>
		<%-- 페이지 네비게이션 --%>  
		<ul class="pagination item_pagenum">
			<li class="page-item"> 
				<input hidden="hidden" class="url_val" value="/editor_list?keyword=${keyword}&search_date=${search_date}&search_end_date=${search_end_date}&item_start=${item_start}&item_end=${item_end}&sell_start=${sell_start}&sell_end=${sell_end}">
				<c:choose> 
					<c:when test="${(util.startPageNum%util.pageBlockCount==1) && (util.startPageNum>util.pageBlockCount)}"> 
						<a class="page-link" aria-label="Previous" href="<c:url value='/editor_list?keyword=${keyword}&search_date=${search_date}&search_end_date=${search_end_date}&item_start=${item_start}&item_end=${item_end}&sell_start=${sell_start}&sell_end=${sell_end}&pageNum=${util.startPageNum-1}&list_arr=${list_arr}&rowCount=${rowCount}'/>">
							<span aria-hidden="true">«</span>
						</a>
					</c:when>      
					<c:otherwise> 
						<a class="page-link" aria-label="Previous" href="<c:url value='/editor_list?keyword=${keyword}&search_date=${search_date}&search_end_date=${search_end_date}&item_start=${item_start}&item_end=${item_end}&sell_start=${sell_start}&sell_end=${sell_end}&pageNum=${util.pageNum-1}&list_arr=${list_arr}&rowCount=${rowCount}'/>">
						<span aria-hidden="true">«</span>
						</a>  
					</c:otherwise> 
				</c:choose>   
			</li> 
			<c:forEach var="i" begin="${util.startPageNum }" end="${util.endPageNum }">
				<c:choose> 
					<c:when test="${util.pageNum==i }"> 
						<li class="page-item" id="page_ck" ><a class="page-link" href="<c:url value='/editor_list?keyword=${keyword}&search_date=${search_date}&search_end_date=${search_end_date}&item_start=${item_start}&item_end=${item_end}&sell_start=${sell_start}&sell_end=${sell_end}&pageNum=${i}&list_arr=${list_arr}&rowCount=${rowCount}'/>" >${i}</a></li>
					</c:when> 
					<c:otherwise> 
						<li class="page-item"><a class="page-link" href="<c:url value='/editor_list?keyword=${keyword}&search_date=${search_date}&search_end_date=${search_end_date}&item_start=${item_start}&item_end=${item_end}&sell_start=${sell_start}&sell_end=${sell_end}&pageNum=${i}&list_arr=${list_arr}&rowCount=${rowCount}'/>" >${i}</a></li>
					</c:otherwise>
				</c:choose>   
			</c:forEach>  
			<li class="page-item">
				<c:choose>
					<c:when test="${util.pageNum < util.totalPageCount}">
						<a class="page-link"  aria-label="Next" href="<c:url value='/editor_list?keyword=${keyword}&search_date=${search_date}&search_end_date=${search_end_date}&item_start=${item_start}&item_end=${item_end}&sell_start=${sell_start}&sell_end=${sell_end}&pageNum=${util.pageNum + 1}&list_arr=${list_arr}&rowCount=${rowCount}'/>"> 
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
</div>

<script type="text/javascript"> 

     
</script>