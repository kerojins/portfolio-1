<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="container admin_item_add">
	<form id="item_form" name="item_form" action="<c:url value='/admin_item_add'/>" method="post">
		<div class="admin_page_head">
			<h2>상품등록</h2> 
		</div>
		<%-- 카테고리 등록 --%>      
		<div class="item_category">
			<div class="col-md-4">
				<div class="item_add_head">
					<h3>카테고리 등록</h3>
					<a href="#" id="category_btn2" class="item_category_btn">카테고리
						연결</a>
				</div>
				<table class="item_add_table">
					<tr>  
						<th>연결 카테고리</th>
					</tr>
					<tr>
						<td id="cate_txt"></td>
					</tr>   
				</table>
			</div>
			<div class="col-md-4">
				<div class="item_add_head">
					<h3>작가 등록</h3>
					<a href="#" id="editor_btn" class="item_category_btn">작가 연결</a>

				</div>
				<table class="item_add_table">
					<tr>
						<th>연결 작가</th>
					</tr>
					<tr>
						<td id="editor_txt"></td>
					</tr>
				</table>
			</div>
			<div class="col-md-4">
				<div class="item_add_head">
					<h3>출판사 등록</h3>
					<a href="#" id="publishing_btn" class="item_category_btn">출판사
						연결</a>
				</div>
				<table class="item_add_table">
					<tr>
						<th>연결 출판사</th>
					</tr>
					<tr>
						<td id="publishing_text"></td>
					</tr>
				</table>
			</div>
		</div>
		<%-- 상품 기본 정보 --%>
		<div class="item_basic_info">
			<div class="item_add_head">
				<h3>기본 정보</h3>
			</div>
			<table class="info-table-style mb20" style="width: 100%">
				<colgroup>
					<col width="15%">
					<col>
				</colgroup>
				<tbody>
					<tr>
						<th class="its-th-align center">제목명 <span
							class="goods_required"></span>
						</th>
						<td class="its-td">
							<input id="product_num" name="product_num" hidden="hidden" value="">
							<input type="text" name="product_name" class="cal-len line" maxlength="255" style="width: 85%" value="" placeholder="제목을 입력하세요">
							<span class="view-len"><b>0</b>/255</span>
						</td>
					</tr>
					<tr>
						<th class="its-th-align center">페이지 수</th>
						<td class="its-td"><input type="text" name="product_page"
							class="line cal-len" maxlength="50" style="width: 8%"placeholder="예) 230"
							> P</td>
					</tr> 
					<tr>
						<th class="its-th-align center">발행일</th>
						<td class="its-td"><input type="text" class="datepickers" name="product_issue_date"></td>
					</tr>  
					<tr>
						<th class="its-th-align center">소개</th>
						<td class="its-td"><textarea name="product_discription" rows="10"
								class="cal-len line" maxlength="255" style="width: 85%" 
								title="상품 설명을 입력하세요" 
							    placeholder="상품 설명을 입력하세요"></textarea><span
							class="view-len"> <b> 0</b>/1000
						</span></td>
					</tr>   
					<tr>
						<th class="its-th-align center">목차</th>
						<td class="its-td">
							<ul id="index_list" class="index_list">
								<li><input type="text" name="product_index" class="cal-len line"
									style="width: 85%" value="" title="" placeholder="1. 목차를 입력해주세요"></li>
								<li><input type="text" name="product_index" class="cal-len line"
									style="width: 85%" value="" title="" placeholder="2."></li>
								<li><input type="text" name="product_index" class="cal-len line"
									style="width: 85%" value="" title="" placeholder="3."></li>
								<li><input type="text" name="product_index" class="cal-len line"
									style="width: 85%" value="" title="" placeholder="4."></li>
								<li><input type="text" name="product_index" class="cal-len line"
									style="width: 85%" value="" title="" placeholder="5."></li>
								<li><input type="text" name="product_index" class="cal-len line"
									style="width: 85%" value="" title="" placeholder="6."></li>
								<li><input type="text" name="product_index" class="cal-len line" 
									style="width: 85%" value="" title="" placeholder="7."></li>
								<li><input type="text" name="product_index" class="cal-len line"
									style="width: 85%" value="" title="" placeholder="8."></li>
							</ul> 
							<span class="index_add" title="">목차추가</span>
						</td> 
					</tr>
				</tbody> 
			</table> 
		</div>
		<%-- 상품 판매 정보 --%>
		<div class="item_sale_info">
			<div class="item_add_head">
				<h3>판매 정보</h3>
			</div>
			<table class="info-table-style" style="width: 100%">
				<colgroup>
					<col width="15%">
					<col>
				</colgroup>
				<tbody>
					<tr>
						<td class="its-th-align center">판매 상태</td>
						<td class="its-td">
							<div id="" class="">
								<label class="item_radio"><input type="radio"
									name="product_status" value="정상" checked="checked"> 정상</label> <label
									class="item_radio"><input type="radio" name="product_status"
									value="품절"> 품절</label><label class="item_radio"><input
									type="radio" name="product_status" value="판매중지"> 판매중지</label>
							</div>
						</td>
					</tr>
					<tr>
						<td class="its-th-align center">노출</td>
						<td class="its-td">
							<div id="" class="">
								<label class="item_radio"><input type="radio"
									name="product_view" value="노출" checked="checked"> 노출</label> <label
									class="item_radio"><input type="radio" name="product_view"
									value="미노출"> 미노출</label>
							</div>
						</td> 
					</tr>
					<tr> 
						<td class="its-th-align center">배송비</td>
						<td class="its-td">
							<div id="" class="">
								<label class="item_radio"><input type="radio"
									name="product_shipping_charge" value="2,500" checked="checked"> 2,500원</label>
								<label class="item_radio"><input type="radio" value="3,000"
									name="product_shipping_charge"> 3,000원</label> <label class="item_radio"><input
									type="radio"name="product_shipping_charge" value="0"> 없음</label>
							</div>
						</td>
					</tr>
					<tr>
						<td class="its-th-align center">할인율</td>
						<td class="its-td">
							<div id="" class="">
								<label class="item_radio"><input type="radio"
									name="product_discount" value="10" onclick="discount()" checked="checked"> 10%</label> <label
									class="item_radio"><input type="radio" name="product_discount"
									value="20" onclick="discount()"> 20%</label> <label class="item_radio"><input
									type="radio" name="product_discount" value="30" onclick="discount()"> 30%</label>
									<label class="item_radio"><input
									type="radio" name="product_discount" value="0" onclick="discount()"> 없음</label>
							</div>  
						</td>  
					</tr>  
					<tr>
						<td class="its-th-align center">가격</td>
						<td class="its-td">
							<div id="item_price" class="">
								<label class="item_radio">정가 
									<input type="text" width="300" onkeyup="discount();"  name="product_price" id="origin_price"> 원
								</label> - 
								<label class="item_radio"> 판매가 
									<input type="text" width="300" name="product_discount_price" id="discount_price"> 원
								</label> 
							</div> 
						</td> 
					</tr>  
					<tr>
						<td class="its-th-align center">입고</td>
						<td class="its-td">
							<div id="item_price" class="">
								<label class="item_radio"><input class="direct_price" width="200"
									type="text" name="product_supplement"> 개</label>
							</div> 
						</td> 
					</tr>
					<tr>
						<td class="its-th-align center">재고</td>
						<td class="its-td">
							<div id="item_price" class="">
								<label class="item_radio"><input class="direct_price" width="200"
									type="text" name="product_stock"> 개</label>
							</div> 
						</td> 
					</tr>  
				</tbody>
			</table> 
		</div>
	</form>
	<%-- 상품 사진 등록--%> 
	
	<form id="item_img_form" name="item_img_form" method="post" enctype="multipart/form-data">  
			<div class="item_image">
				<div class="item_add_head">  
					<h3>사진 등록</h3> 
				</div> 
				<div id="item_img_box">
					<table width="100%" class="info-table-style" id="goodsImageMake">
						<tbody>
							<tr>
								<th class="its-th-align center" style="padding: 10px;"
									width="600"><img id="item_viewImg" src=""
									src=""></th>
								<td class="its-td" style="min-width: 470px;">
									<div id="item_img_info" style="font-weight: bold; float: left; padding-right: 5px">대표컷
										- 상품상세(기본)</div>
									<div>
										<span class=""><button type="button"
												id="img_del" onclick="item_img_del();">삭제하기</button></span>
									</div>
									<table class="img-info-tb img_detail_table">
										<tbody>  
											<tr>
												<td>• 주소</td>
												<td>:</td>
												<td><span id="fileurl">/data/tmp/tmp_a8a800e36574347bc489cd1e205eb7862008view.jpg?1570989319076</span>
												</td>
											</tr> 
											<tr>
												<td>• 사이즈</td>
												<td>:</td>
												<td><span id="filesize">400 X 252</span></td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<table class="info-table-style item_image_table" style="width: 100%"
					id="goodsImageTable">
					<colgroup>
						<col width="15%">
						<col width="9%">
						<col width="11%">
						<col width="11%">
						<col width="11%">
						<col width="11%">
						<col width="11%">
						<col width="11%">
						<col width="11%">
					</colgroup>
					<thead>
						<tr>
							<th class="its-th-align center">상품 사진등록</th>
							<th class="its-th-align center">상품 미리보기 등록</th>
							<th class="its-th-align center">상품상세(확대)</th>
							<th class="its-th-align center">상품상세(기본)</th>
							<th class="its-th-align center">리스트</th>
							<th class="its-th-align center">썸네일(장바구니/주문)</th>
						</tr>
					</thead>
					<tbody>
						<tr class="cut-tr cutnum1">
							<td class="its-td-align left" rowspan="1"><span
								class="btn large"><input type="file" name="item_file"
										class="batchImageMultiRegist" onchange="readURL(this);" ></span>
										<span style="display:inline-block; margin-left: -80px;">(권장 파일 사이즈 : 480 X 768)</span>
										</td>     
							<td class="its-td-align center"><span class="btn small lightblue"><button
										type="button" class="item_preview_btn">미리보기 등록</button></span>
								<div class="pdt10"> 
									<span class="btn large"><button type="button"
											class="item_preview_btn" >순서변경 및 삭제</button></span>
								</div></td> 
							<td class="its-td-align center"><span 
								class="item_detail_img img_view_btn">보기</span></td>
							<td class="its-td-align center"><span
								class="item_basic_img img_view_btn" >보기</span></td>
							<td class="its-td-align center"><span
								class="item_list_img img_view_btn" >보기</span></td>
							<td class="its-td-align center"><span
								class="item_order_img img_view_btn">보기</span></td>
						</tr>  
					</tbody>
				</table>
			</div>
			<%-- 상품 미리보기 등록 --%>
			<div id="item_preview" class="category_select" >
				<div class="category_select_title_box">
					<span class="category_select_title">미리보기 등록</span><a href="#" class="category_select_cancel" role="button"><span>close</span></a>
				</div>
				<span class="file_box">
					<input type="file" onchange="preview_img(this);" id="item_preview_img" name="item_preview_img" multiple="multiple">
					<span class="hide_pic_name hide_pics_name">${preview_full}</span>
				</span> 
				<div class="category_select_content" style=""> 
					<div id="preview_box">
						
					</div>
					<p class="select_btn_box">
						<a class="select_btn">선택 완료</a>
					<p> 
				</div>
			</div> 
		</form> 
		<input class="add_submit" onclick="check_item_form();" value="등록하기">
</div>
 
 

<%-- 카테고리 연결창--%>
<div id="category_select" class="category_select">
	<div class="category_select_title_box">
		<span class="category_select_title">카테고리 연결</span><a href="#"
			class="category_select_cancel" role="button"><span>close</span></a>
	</div>
	<div class="category_select_content" style="">
			<table class="simplelist-table-style" style="width: 100%">
				<colgroup>
					<col width="25%">
					<col width="25%">
					<col width="25%">
				</colgroup>
				<thead>
					<tr>
						<th>1차 카테고리</th>
						<th>2차 카테고리</th>
						<th>3차 카테고리</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td class="center">
							<div>
								<select class="line" name="category1" size="7" id="select_cate1" style="width: 100%">
									<option value="100">국내도서</option>
									<option value="700">외국도서</option>
								</select>
							</div>
						</td>
						<td class="center"> 
							<div>
								<select class="line" name="category2" size="7" id="select_cate2"
									style="width: 100%">
									 
									</select>
							</div>  
						</td>
						<td class="center"> 
							<div>
								<select class="line" name="category3" size="7" id="select_cate3"
									style="width: 100%">
									
									</select>
							</div>
						</td>
					</tr> 
				</tbody>
			</table>
			<a class="category_select_btn" id="category_select_btn">카테고리 연결</a>
	</div>   
</div>
<div id="editor_select" class="category_select">
	<div class="category_select_title_box">
		<span class="category_select_title">작가 연결</span><a href="#"
			class="category_select_cancel" role="button"><span>close</span></a>
	</div>
	<div class="category_select_content" style="">
		
			<table class="simplelist-table-style" style="width: 100%">
				<thead>
					<tr>
						<th>작가 선택</th>
					</tr>
				</thead>
				<tbody>
					<tr> 
						<td class="center">
							<div>
								<select class="line" name="category1" size="7" id="cate_editor"
									style="width: 100%">
									<c:forEach var="list" items="${editor_list}" >
										<option value='${list.editor_num}'>${list.editor_name } / ${list.editor_birth}</option>
									</c:forEach> 
								</select>
							</div>    
						</td> 
					</tr>
				</tbody>
			</table>
			<p class="select_btn_box">
			<a id="editor_select_btn" class="select_btn">작가 연결</a>
			<a href="<c:url value='/editor_add'/>" class="select_btn">신규 등록</a></p>
	</div>  
</div>
<div id="publishing_select" class="category_select">
	<div class="category_select_title_box">
		<span class="category_select_title">출판사 연결</span><a href="#"
			class="category_select_cancel" role="button"><span>close</span></a>
	</div>
	<div class="category_select_content" style="">
		
			<table class="simplelist-table-style" style="width: 100%">
				<colgroup>

				</colgroup>
				<thead>
					<tr>
						<th>출판사 선택</th>

					</tr>
				</thead>
				<tbody>
					<tr>
						<td class="center">
							<div>
								<select class="line" id="cate_publish" size="7" style="width: 100%">
									<c:forEach var="list" items="${publishing_list}" >
										<option value='${list}'>${list}</option>
									</c:forEach> 
								</select> 
							</div> 
						</td>
					</tr>
				</tbody>  
			</table>
			<p class="select_btn_box">
			<a id="publish_select_btn" class="select_btn">출판사 연결</a>
			<a id="publish_add_btn" class="select_btn">직접 입력</a></p>
	</div>
</div> 

<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>	
