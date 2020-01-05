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
		<form id="item_list_search" method="post">
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
											size="7" class="line onlyfloat" > -
											<input type="text" name="eprice" value="" size="7"
											class="line onlyfloat" ></td>
										<th>재고수량</th>
										<td no="1"><input type="text" name="sstock" value=""
											size="7" class="line onlynumber" row_group="stock"> -
											<input type="text" name="estock" value="" size="7"
											class="line onlynumber" ></td>
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
				<select name = "item_list_arr_list" id="item_list_arr_list">
					<option value="product_date" <c:if test="${list_arr eq 'product_date'}">selected </c:if> >최신순</option>
					<option value="product_stock"<c:if test="${list_arr eq 'product_stock'}">selected  </c:if>>재고순</option>
					<option value="product_name"<c:if test="${list_arr eq 'product_name'}">selected  </c:if>>판매명순</option>
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
					<col width="40">
					<!--번호-->
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
					<col width="70">
					<!--통계-->
	
					<col width="60">
					<!--관리-->
				</colgroup>
				<thead class="lth">
					<tr> 
						<th><input type="checkbox"  class="ckAll" onclick="ckAll(this);"></th>
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
							title="[등록일순] 정렬">수정일</span> /<span class="btnSort hand"
							orderby="update_date" title="[수정일순] 정렬">등록일</span></th>
						<th>상태</th>
						<th>노출</th>
						<th>통계</th>
						<th>관리</th>
					</tr>
				</thead>
				<tbody class="ltb">
					<c:forEach var="list" items="${item_list }" >
						<tr class="list-row" style="height: 70px;">
							<td align="center"><input type="checkbox" class="select_ck_num"
								name="select_ck_num" value="${list.product_num }" data-provider_seq="1"></td>
							<td align="center" class="page_no">${list.product_num }</td>
							<%-- 상품 번호 --%>
							<c:if test="${list.product_picture != null }">
								<c:set var="img" value="${list.product_picture }" /> 
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
									<a href="../goods/regist?no=61" target="_blank">${list.product_name }</a>
									<%-- 상품 이름 --%>
									<div></div>
									<div style="padding-top: 3px;"></div>
								</div>
							</td>
							<td align="center">${list.product_price }&nbsp;</td>
							<%-- 상품 가격 --%>
							<td align="center">
								<div>${list.product_discount_price }&nbsp;</div> <%-- 상품 판매가격 --%>
							</td>
							<td align="center">${list.product_stock}</td>
							<%-- 상품 재고 --%>
	 
							<td align="center">
								<div>
									<a href="/admin/order/catalog?goods_seq=61">조회</a>
								</div>
								<div>1</div>
							</td>
							<c:set var="update_date" value="${list.product_update_date}" />
							<c:set var="insert_date" value="${list.product_date}" />
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
									<b>${list.product_status}</b>
									<%-- 상품 상태 --%>
								</div>
							</td>
							<td align="center"><span style="color: red">${list.product_view}</span></td>
							<td align="center">
								<div>
									<img src="<c:url value='/resources/images/btn_stats.gif'/>"
										style="cursor: pointer;" onclick="openAdvancedStatistic('61');">
								</div>
	
							</td>
							<td align="center">
								<div>
									<span class="btn small valign-middle">
										<a class="admin_list_btn" href="<c:url value='/item_select_del?product_num=${list.product_num}'/>">삭제</a>
									</span>
								</div> 
								<div style="margin-top: 2px;">
									<span class="btn small valign-middle">
										<a class="admin_list_btn" href="<c:url value='/item_getinfo?product_num=${list.product_num}'/>">상세</a>
									</span> 
								</div>
							</td> 
						</tr>
					</c:forEach>   
				</tbody>  
			</table>
			<p style="margin-top:10px;"><input type="button" onclick="ck_null();" value="선택 삭제"></p>
		</form>
		
		<%-- 페이지 네비게이션 --%>
		<ul class="pagination item_pagenum">
			<li class="page-item"><a class="page-link" href="#"
				aria-label="Previous"> <span aria-hidden="true">«</span>
			</a></li>
			<c:forEach var="i" begin="${util.startPageNum }" end="${util.endPageNum }">
				<c:choose> 
					<c:when test="${util.pageNum==i }"> 
						<li class="page-item" id="page_ck" ><a class="page-link"  href="<c:url value='/admin_item_list?pageNum=${i}'/>">${i}</a></li>
					</c:when> 
					<c:otherwise> 
						<li class="page-item"><a class="page-link" href="<c:url value='/admin_item_list?pageNum=${i}'/>">${i}</a></li>
					</c:otherwise>
				</c:choose>  
			</c:forEach>  
			<li class="page-item"><a class="page-link" href="#" 
				aria-label="Next"> <span aria-hidden="true">»</span>
			</a></li>   
		</ul>
	</div>
</div>

<script type="text/javascript"> 
	$(document).ready(function(){
   		 <%-- 아이템 항목별,갯수별 리스트 불러오기 --%>
		$("#item_rowCount_list").change(function(){
			var rowCount = $(this).val(); 
			var list_arr = $("#item_list_arr_list").val();
			location.href = "<c:url value='/admin_item_list?rowCount="+ rowCount +"&list_arr="+list_arr+"'/>";
		}); 
		$("#item_list_arr_list").change(function(){ 
			var rowCount = $("#item_rowCount_list").val();
			var list_arr = $(this).val();
			location.href = "<c:url value='/admin_item_list?rowCount="+ rowCount +"&list_arr="+list_arr+"'/>";
		});
		

	}); 
     
  function ck_null(){
	  var form = document.getElementById("admin_list_form");
	 if($(".select_ck_num").prop("checked")){
		 form.submit();  
	 }else{
		 alert("하나의 항목 이상 체크하세요")
	 }
	  
  }
</script>