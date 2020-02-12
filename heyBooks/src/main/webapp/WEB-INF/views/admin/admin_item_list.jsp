<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="container admin_item_list">
	<div class="search-form-container">
		<div class=" admin_page_head"> 
			<h2>상품리스트</h2>
			<a class="admin_btn" href="<c:url value='/admin_item_add'/>">상품등록</a>
		</div>
		<form id="item_list_search" class="search_form" method="get" action="<c:url value='/admin_item_list'/>">
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
															<input type="text" name="keyword" value="${keyword}" title="상품명, 상품코드" placeholder="상품명, 상품코드"></td>
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
										<th>카테고리</th>
										<td colspan="5">
											<select class="line" id="select_cate1" data-type="search" name="category1"  style="width: 110px;">
												<option value="">= 1차 분류 =</option>
												<option value="100">국내도서</option>
												<option value="700">외국도서</option>
											</select>    
											<input hidden="hidden" class="category2_val" value="${category2}">
											<select class="line" id="select_cate2" data-type="search" name="category2" style="width: 110px;">
												<option value="">= 2차 분류 =</option> 
											</select> 
											<input hidden="hidden" class="category3" value="${category3}">
											<select class="line" id="select_cate3" data-type="search" name="category3" style="width: 110px;">
												<option value="">= 3차 분류 =</option> 
											</select>
										</td> 
									</tr>
									<tr>
										<th>출판사</th>
										<td><select class="line"  name="product_publish" size="1" style="width: 130px;">
												<option value="">= 선택 =</option>
												<c:forEach var="list" items="${publishing_list}" >
													<option <c:if test="${product_publish == list}">selected</c:if> value='${list}'>${list}</option>
												</c:forEach> 
											</select>  
										</td>  
										<th>작가</th>
										<td>
											<select class="line" name="product_editor_num" size="1" style="width: 130px;">
												<option value="">= 선택 =</option>
												<c:forEach var="list" items="${editor_list}" >
													<option  <c:if test="${product_editor_num == list.editor_num}">selected</c:if> value='${list.editor_num}'>${list.editor_name } / ${list.editor_birth}</option>
												</c:forEach>   
											</select>
										</td>
									</tr>
 
									<tr>
										<th>정상가</th>
										<td no="0">
											<input type="text" style=" width: 90px" value="${start_price}" name="start_price"  size="7" onkeyup="key_money(this)" class="line onlyfloat" row_group="price"> -
											<input type="text" style=" width: 90px" value="${end_price}" name="end_price" size="7" onkeyup="key_money(this)" class="line onlyfloat" row_group="price">
										</td>
										<th>재고수량</th>
										<td no="0"> 
											<input type="text" style=" width: 90px" value="${start_stock}" name="start_stock"  size="7"  class="line onlyfloat" row_group="price"> -
											<input type="text" style=" width: 90px" name="end_stock" value="" size="${end_stock}"  class="line onlyfloat" row_group="price">
										</td> 
									</tr>
									<tr>

										<th>상태</th> 
										<td no="0">
											<input class="status_val" hidden="hidden" value="${product_status}">
											<label> 
												<input type="checkbox" name="product_status" value="정상"> 
												<span>정상</span>
											</label>
											<label>
												<input type="checkbox" name="product_status" value="품절"> 
												<span>품절</span></label>
											<label>
												<input type="checkbox" name="product_status" value="판매중지">
												<span>판매중지</span>
											</label> 
										</td> 
										<th>노출</th>
										<td>
											<label for="view_ok">
												<input id="view_ok" type="radio" name="product_view" value="노출"> 
												<span>노출</span>
											</label>
											<label for="view_no">
												<input id="view_no" type="radio" name="product_view" value="미노출"> 
												<span>미노출</span>
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
	<div class="admin_list_box">
		<div class="admin_list_top">
			<p>
				전체 <span>${totalRowCount}</span>개
			</p> 
			<div class="admin_select_list">
				<input hidden="hidden" id="list_type" value="admin_item_list">
				<select name = "item_list_arr_list" id="item_list_arr_list">
					<option value="product_date" <c:if test="${list_arr eq 'product_date'}">selected="selected"</c:if>>최신순</option>
					<option value="product_stock"<c:if test="${list_arr eq 'product_stock'}">selected="selected"</c:if>>재고순</option>
					<option value="cnt"<c:if test="${list_arr eq 'cnt'}">selected="selected"</c:if>>판매순</option>
					<option value="product_name"<c:if test="${list_arr eq 'product_name'}">selected="selected"</c:if>>상품명순</option>
					<option value="product_discount_price"<c:if test="${list_arr eq 'product_discount_price'}">selected="selected"</c:if>>가격순</option>
				</select>     
				<select name = "item_rowCount_list" id="item_rowCount_list"> 
					<option value="10" <c:if test="${rowCount eq 10}">selected </c:if>>10개씩</option>
					<option value="50" <c:if test="${rowCount eq 50}">selected </c:if>>50개씩</option> 
					<option value="100" <c:if test="${rowCount eq 100}">selected </c:if>>100개씩</option>   
					<option value="200" <c:if test="${rowCount eq 200}">selected </c:if>>200개씩</option> 
				</select> 
			</div>    
		</div>
		<form action="<c:url value='/item_select_del'/>" method="post" id="admin_list_form">
			<table class="list-table-style item_list_table">
				<!-- 테이블 헤더 : 시작 --> 
				<colgroup>
					<col width="30">
					<!--체크값-->
					<col width="50">
					<!--번호-->
					<col width="120">
					<!--상품번호-->
					<col width="60">
					<!--상품이미지-->
					<col> 
					<!--상품명-->
	
					<col width="185">
					<!--정가-->
					<col width="185">
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
	
					<col width="60">
					<!--관리-->
				</colgroup>
				<thead class="lth">
					<tr> 
						<th><input type="checkbox"  class="ckAll" onclick="ckAll(this);"></th>
						<th>번호</th> 
						<th>상품번호</th> 
						<th colspan="2">상품명</th>
						<th>정가</th>
						<th>판매가</th>
						<th>재고</th>
						<th>판매수</th>
						<th><span>수정일</span> /<span>등록일</span></th>
						<th>상태</th>
						<th>노출</th> 
						<th>관리</th>
					</tr> 
				</thead>
				<tbody class="ltb">
					<c:forEach var="list" items="${sell_list}" varStatus="status">
						<tr class="list-row" style="height: 70px;">
							<td align="center"><input type="checkbox" class="select_ck_num"
								name="select_ck_num" value="${list.PRODUCT_NUM }" data-provider_seq="1"></td>
							<td align="center" class="page_no">${status.count}</td>
							<td align="center" class="page_no">${list.PRODUCT_NUM }</td>
							<%-- 상품 번호 --%> 
							<c:if test="${list.PRODUCT_PICTURE != null }">
								<c:set var="img" value="${list.PRODUCT_PICTURE }" /> 
									<% 
										String img_txt = (String)pageContext.getAttribute("img");
										String img_name = img_txt.split(",")[1];
										pageContext.setAttribute("img_name", img_name);
									%>
							</c:if>
							<td align="right"><a href="/goods/view?no=62" target="_blank"><img
									src="<c:url value='/resources/upload/${img_name}' />"
									<%-- 상품 작은사진 --%>
									width="50"></a></td>  
							<td align="left" style="padding-left: 10px;"> 
								<div class="fx11 gray"></div>
								<div>
									<a href="../goods/regist?no=61" target="_blank">${list.PRODUCT_NAME }</a>
									<%-- 상품 이름 --%>
									<div></div>
									<div style="padding-top: 3px;"></div>
								</div>
							</td>
							<td align="center">${list.PRODUCT_PRICE }&nbsp;</td>
							<%-- 상품 가격 --%>
							<td align="center">
								<div>${list.PRODUCT_DISCOUNT_PRICE }&nbsp;</div> <%-- 상품 판매가격 --%>
							</td>
							<td align="center">${list.PRODUCT_STOCK}</td>
							<%-- 상품 재고 --%>
							<td align="center">
								<div>${list.CNT }</div>
							</td>
							<c:set var="update_date" value="${list.PRODUCT_UPDATE_DATE}" />
							<c:set var="insert_date" value="${list.PRODUCT_DATE}" />
							<%-- 수정 등록일 날짜,시간 표시 --%>
							<%
								Date update_date = (Date) pageContext.getAttribute("update_date");
								Date insert_date = (Date) pageContext.getAttribute("insert_date");
								SimpleDateFormat sdate = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
								String update_date_txt = sdate.format(update_date);
								String insert_date_txt = sdate.format(insert_date);
								pageContext.setAttribute("update_date_txt", update_date_txt);
								pageContext.setAttribute("insert_date_txt", insert_date_txt);
							%>
							<td align="center">${update_date_txt }<br>${insert_date_txt}
								<%-- 상품 수정/등록일 --%>
							</td>
							<td align="center">
								<div>
									<b>${list.PRODUCT_STATUS}</b>
									<%-- 상품 상태 --%>
								</div>
							</td>
							<td align="center"><span style="color: red">${list.PRODUCT_VIEW}</span></td>
							
							<td align="center">
								<div>
									<span class="admin_detail_btn small valign-middle">
										<a class="admin_list_btn" href="<c:url value='/item_getinfo?product_num=${list.product_num}'/>">상세</a>
										<a class="admin_list_btn" href="<c:url value='/item_select_del?product_num=${list.product_num}'/>">삭제</a>
									</span>
								</div> 
							</td> 
						</tr>
					</c:forEach>  
				</tbody>  
			</table>
			<p style="margin-top:10px;"><input type="button" onclick="ck_null('admin_list_form');" value="선택 삭제"></p>
		</form>
		 
		<%-- 페이지 네비게이션 --%> 
		<ul class="pagination item_pagenum">
			<li class="page-item">  
				<input hidden="hidden" class="url_val" value="/admin_item_list?keyword=${keyword}&search_date=${search_date}&search_end_date=${search_end_date}&category1=${category1}&category2=${category2}&category3=${category3}&product_publish=${product_publish}&product_editor_num=${product_editor_num}&start_price=${start_price}&end_price=${end_price}&start_stock=${start_stock}&end_stock=${end_stock}&pageNum=${pageNum}">
				<c:choose>
					<c:when test="${(util.startPageNum%util.pageBlockCount==1) && (util.startPageNum>util.pageBlockCount)}">
						<a class="page-link" aria-label="Previous" href="<c:url value='/admin_item_list?keyword=${keyword}&search_date=${search_date}&search_end_date=${search_end_date}&category1=${category1}&category2=${category2}&category3=${category3}&product_publish=${product_publish}&product_editor_num=${product_editor_num}&start_price=${start_price}&end_price=${end_price}&start_stock=${start_stock}&end_stock=${end_stock}&pageNum=${util.startPageNum-1}&list_arr=${list_arr}&rowCount=${rowCount}'/>">
							<span aria-hidden="true">«</span>
						</a>
					</c:when>     
					<c:otherwise>
						<a class="page-link" aria-label="Previous" href="<c:url value='/admin_item_list?keyword=${keyword}&search_date=${search_date}&search_end_date=${search_end_date}&category1=${category1}&category2=${category2}&category3=${category3}&product_publish=${product_publish}&product_editor_num=${product_editor_num}&start_price=${start_price}&end_price=${end_price}&start_stock=${start_stock}&end_stock=${end_stock}&pageNum=${util.pageNum-1}&list_arr=${list_arr}&rowCount=${rowCount}'/>">
						<span aria-hidden="true">«</span>
						</a> 
					</c:otherwise> 
				</c:choose>   
			</li> 
			<c:forEach var="i" begin="${util.startPageNum }" end="${util.endPageNum }">
				<c:choose> 
					<c:when test="${util.pageNum==i }"> 
						<li class="page-item" id="page_ck" >
							<a class="page-link" href="<c:url value='/admin_item_list?keyword=${keyword}&search_date=${search_date}&search_end_date=${search_end_date}&category1=${category1}&category2=${category2}&category3=${category3}&product_publish=${product_publish}&product_editor_num=${product_editor_num}&start_price=${start_price}&end_price=${end_price}&start_stock=${start_stock}&end_stock=${end_stock}&pageNum=${i}&list_arr=${list_arr}&rowCount=${rowCount}'/>">${i}</a>
						</li>
					</c:when> 
					<c:otherwise> 
						<li class="page-item">
							<a class="page-link" href="<c:url value='/admin_item_list?keyword=${keyword}&search_date=${search_date}&search_end_date=${search_end_date}&category1=${category1}&category2=${category2}&category3=${category3}&product_publish=${product_publish}&product_editor_num=${product_editor_num}&start_price=${start_price}&end_price=${end_price}&start_stock=${start_stock}&end_stock=${end_stock}&pageNum=${i}&list_arr=${list_arr}&rowCount=${rowCount}'/>">${i}</a>
						</li>
					</c:otherwise>
				</c:choose>   
			</c:forEach>    
			<li class="page-item">
				<c:choose>
					<c:when test="${util.pageNum < util.totalPageCount}">
						<a class="page-link"   href="<c:url value='/admin_item_list?keyword=${keyword}&search_date=${search_date}&search_end_date=${search_end_date}&category1=${category1}&category2=${category2}&category3=${category3}&product_publish=${product_publish}&product_editor_num=${product_editor_num}&start_price=${start_price}&end_price=${end_price}&start_stock=${start_stock}&end_stock=${end_stock}&pageNum=${util.pageNum + 1}&list_arr=${list_arr}&rowCount=${rowCount}'/>" aria-label="Next"> 
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