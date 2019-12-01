<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="container admin_item_add">
	<form>
		<div class="admin_page_head">
			<h2>상품등록</h2>
		</div>
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
						<td></td>
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
						<td></td>
					</tr>
				</table>
			</div>
		</div>
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
						<td class="its-td"><input type="text" name="goodsName"
							class="cal-len line" maxlength="255" style="width: 85%" value=""
							title="" onkeyup="calculate_input_len(this);"
							onblur="calculate_input_len(this);" placeholder="제목을 입력하세요">
							<span class="view-len"><b>0</b>/255</span></td>
					</tr>
					<tr>
						<th class="its-th-align center">페이지 수</th>
						<td class="its-td"><input type="text" name="keyword"
							class="line cal-len" maxlength="50" style="width: 8%" value=""
							title="태그는 ,(콤마)로 구분됩니다" placeholder="예) 230"
							onkeyup="calculate_input_len(this);"
							onblur="calculate_input_len(this);"> P</td>
					</tr>
					<tr>
						<th class="its-th-align center">소개</th>
						<td class="its-td"><textarea name="summary" rows="10"
								class="cal-len line" maxlength="255" style="width: 85%" value=""
								title="상품 설명을 입력하세요" onkeyup="calculate_input_len(this);"
								onblur="calculate_input_len(this);" placeholder="상품 설명을 입력하세요"></textarea><span
							class="view-len"> <b> 0</b>/1000
						</span></td>
					</tr>
					<tr>
						<th class="its-th-align center">목차</th>
						<td class="its-td">
							<ul class="index_list">
								<li><input type="text" name="" class="cal-len line"
									style="width: 85%" value="" title="" placeholder="1."></li>
								<li><input type="text" name="" class="cal-len line"
									style="width: 85%" value="" title="" placeholder="2."></li>
								<li><input type="text" name="" class="cal-len line"
									style="width: 85%" value="" title="" placeholder="3."></li>
								<li><input type="text" name="" class="cal-len line"
									style="width: 85%" value="" title="" placeholder="4."></li>
								<li><input type="text" name="" class="cal-len line"
									style="width: 85%" value="" title="" placeholder="5."></li>
								<li><input type="text" name="" class="cal-len line"
									style="width: 85%" value="" title="" placeholder="6."></li>
								<li><input type="text" name="" class="cal-len line"
									style="width: 85%" value="" title="" placeholder="7."></li>
								<li><input type="text" name="" class="cal-len line"
									style="width: 85%" value="" title="" placeholder="8."></li>
								<li><input type="text" name="" class="cal-len line"
									style="width: 85%" value="" title="" placeholder="9."></li>
								<li><input type="text" name="" class="cal-len line"
									style="width: 85%" value="" title="" placeholder="10."></li>
							</ul>
							<span class="index_add" title="">목차추가</span>

						</td>
					</tr>
				</tbody>
			</table> 
		</div>
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
									name="goodsView" value="look" checked="checked"> 정상</label> <label
									class="item_radio"><input type="radio" name="goodsView"
									value="notLook"> 품절</label><label class="item_radio"><input
									type="radio" name="goodsView" value="notLook"> 판매중지</label>
							</div>
						</td>
					</tr>
					<tr>
						<td class="its-th-align center">노출</td>
						<td class="its-td">
							<div id="" class="">
								<label class="item_radio"><input type="radio"
									name="goodsView" value="look" checked="checked"> 노출</label> <label
									class="item_radio"><input type="radio" name="goodsView"
									value="notLook"> 미노출</label>
							</div>
						</td>
					</tr>
					<tr>
						<td class="its-th-align center">배송비</td>
						<td class="its-td">
							<div id="" class="">
								<label class="item_radio"><input type="radio"
									name="goodsView" value="look" checked="checked"> 2,500원</label>
								<label class="item_radio"><input type="radio"
									name="goodsView"> 3,000원</label> <label class="item_radio"><input
									type="radio" name="goodsView"> 없음</label> <label
									class="item_radio"><input class="direct_price"
									type="text" name="goodsView"> 원</label>
							</div>
						</td>
					</tr>
					<tr>
						<td class="its-th-align center">할인율</td>
						<td class="its-td">
							<div id="" class="">
								<label class="item_radio"><input type="radio"
									name="goodsView" value="look" checked="checked"> 10%</label> <label
									class="item_radio"><input type="radio" name="goodsView"
									value="notLook"> 20%</label> <label class="item_radio"><input
									type="radio" name="goodsView" value="notLook"> 30%</label>
									<label class="item_radio"><input
									type="radio" name="goodsView" value="notLook"> 없음</label>
							</div>
						</td>
					</tr>
					<tr>
						<td class="its-th-align center">가격</td>
						<td class="its-td">
							<div id="item_price" class="">
								<label class="item_radio">정가 <input type="text"
									width="150" name="goodsView"> 원
								</label> ~ <label class="item_radio"> 판매가 <input type="text"
									width="150" name="goodsView"> 원
								</label>
							</div>
						</td>
					</tr>
					<tr>
						<td class="its-th-align center">재고</td>
						<td class="its-td">
							<div id="item_price" class="">
								<label class="item_radio"><input class="direct_price"
									type="text" name="goodsView"> 개</label>
							</div>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="item_image">
			<div class="item_add_head">
				<h3>사진 등록</h3>
			</div>
			<div id="goodsImagePriview">
				<table width="100%" class="info-table-style" id="goodsImageMake">
					<tbody>
						<tr>
							<th class="its-th-align center" style="padding: 10px;"
								width="600"><img id="viewImg" style="max-width: 580px;"
								src="/data/tmp/tmp_a8a800e36574347bc489cd1e205eb7862008view.jpg?1570989319076"><img
								id="viewImgtmp" class="hide"
								src="/data/tmp/tmp_a8a800e36574347bc489cd1e205eb7862008view.jpg?1570989319076"></th>
							<td class="its-td" style="min-width: 470px;">
								<div style="font-weight: bold; float: left; padding-right: 5px">대표컷
									- 상품상세(기본)</div>
								<div>
									<span class=""><button type="button"
											id="eachImageRegist" onclick="each_goods_image();">편집</button></span>
									<span class=""><button type="button"
											id="imgDownload" onclick="each_goods_image_download();">삭제하기</button></span>
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
						<td class="its-td-align left firstCol pdl30" rowspan="1"><span
							class="btn large"><button type="button"
									class="batchImageMultiRegist">등록하기</button></span>&nbsp;<span
							class="helpicon"
							title="<b>여러 컷 일괄등록이란?</b><br>쇼핑몰에서 상품 사진은 여러 페이지에서 보여지게 되며,<br>각각의 페이지에 알맞은 사이즈로 나타나야 합니다.<br>여러 컷 일괄등록이란 입력된 일괄등록 사이즈 설정값을 기준으로 <br>필요한 사이즈의 상품 여러개의 사진을 한꺼번에 등록합니다.<br><br><b>일괄등록이란?</b><br>일괄등록이란 입력된 일괄등록 사이즈 설정값을 기준으로 <br>필요한 사이즈의 상품 사진을 한 번에 등록합니다.<br><br><b>개별등록이란?</b><br>일괄등록으로 등록된 상품사진을 개별적으로 변경하여 등록합니다."></span>
						<td class="its-td-align center"><input type="hidden"
							name="goodsImageColor[]" value=""> <span
							class="fileColorTitle"></span><span class="btn small lightblue"><button
									type="button" class="batchImageRegist">미리보기 등록</button></span>
							<div class="pdt10">
								<span class="btn large"><button type="button"
										class="ImageSort" >순서변경 및 삭제</button></span>
							</div></td>
						<td class="its-td-align center"><span
							class="goodslarge view hand blue" imagetype="large">보기<input
								type="hidden" name="largeGoodsImage[]" value=""><input
								type="hidden" name="largeGoodsLabel[]" value=""></span></td>
						<td class="its-td-align center"><span
							class="goodsview view hand blue" imagetype="view">보기<input
								type="hidden" name="viewGoodsImage[]" value=""><input
								type="hidden" name="viewGoodsLabel[]" value=""></span></td>
						<td class="its-td-align center"><span
							class="goodslist1 view hand blue" imagetype="list1">보기<input
								type="hidden" name="list1GoodsImage[]" value=""><input
								type="hidden" name="list1GoodsLabel[]" value=""></span></td>
						<td class="its-td-align center"><span
							class="goodsthumbView view hand blue" imagetype="thumbView">보기<input
								type="hidden" name="thumbViewGoodsImage[]" value=""><input
								type="hidden" name="thumbViewGoodsLabel[]" value=""></span></td>

					</tr>
				</tbody>
			</table>
		</div>
	</form>
</div>



<%-- 카테고리 연결창--%>
<div id="category_select" class="category_select">
	<div class="category_select_title_box">
		<span class="category_select_title">카테고리 연결</span><a href="#"
			class="category_select_cancel" role="button"><span>close</span></a>
	</div>
	<div class="category_select_content" style="">
		<form name="categoryConnectFrm" method="post"
			action="../goods_process/category_connect" target="actionFrame">
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
								<select class="line" name="category1" size="7" id="select_cate1"
									style="width: 100%"><option value="100">국내도서</option>
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
		</form>
	</div>   
</div>
<div id="editor_select" class="category_select">
	<div class="category_select_title_box">
		<span class="category_select_title">작가 연결</span><a href="#"
			class="category_select_cancel" role="button"><span>close</span></a>
	</div>
	<div class="category_select_content" style="">
		<form name="categoryConnectFrm" method="post"
			action="../goods_process/category_connect" target="actionFrame">
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
								<select class="line" name="category1" size="7"
									style="width: 100%"><option value="0001">카메라</option>
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
									<option value="0017">New node</option></select>
							</div>
						</td>
					</tr>
				</tbody>
			</table>
			<a class="category_select_btn">작가 연결</a>
		</form>
	</div>
</div>
<div id="publishing_select" class="category_select">
	<div class="category_select_title_box">
		<span class="category_select_title">출판사 연결</span><a href="#"
			class="category_select_cancel" role="button"><span>close</span></a>
	</div>
	<div class="category_select_content" style="">
		<form name="categoryConnectFrm" method="post"
			action="../goods_process/category_connect" target="actionFrame">
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
								<select class="line" name="category1" size="7"
									style="width: 100%"><option value="0001">카메라</option>
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
									<option value="0017">New node</option></select>
							</div>
						</td>
					</tr>
				</tbody>
			</table>
			<a class="category_select_btn">출판사 연결</a>
		</form>
	</div>
</div>


<script>
 	$(document).ready(function(){
 		
 		// 카테고리 불러오기 AJAX 연결
 		$('#select_cate1').change(function(){
 			$("#select_cate2").html('');
 			var cate_code = $(this).val();
 			$.getJSON("<c:url value='/jackson/item_cate' />",
 					{ cate_code : cate_code },
 					function(data){
 					data.forEach(function(item,index){
 						$("#select_cate2").append("<option value='" + item.cate_ref1 +"'>"+ item.cate_name+"</option>");
 					});
 			});
 		}); 
		$('#select_cate2').change(function(){
 			$("#select_cate3").html('');
 			var cate_code = $(this).val();
 			$.getJSON("<c:url value='/jackson/item_cate' />",
 					{ cate_code : cate_code },
 					function(data){
 					data.forEach(function(item,index){
 						$("#select_cate3").append("<option value='" + item.cate_ref1 +"'>"+ item.cate_name+"</option>");
 					});
 			}); 
 		});
		$('#category_select_btn').click(function(){
			var sel1 = $("#select_cate1 option:selected").text();
			var sel2 = $("#select_cate2 option:selected").text(); 
			var sel3 = $("#select_cate3 option:selected").text();
			$("#cate_txt").text(sel1 + " > " + sel2 + " > " + sel3);
			$("#category_select").hide(); 
		});
 	});
</script>