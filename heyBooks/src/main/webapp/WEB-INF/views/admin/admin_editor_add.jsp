<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="container admin_item_add">
	<form>
		<div class="admin_page_head">
			<h2>작가등록</h2>
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
						<th class="its-th-align center">작가명 <span
							class="goods_required"></span>
						</th>
						<td class="its-td"><input type="text" name="goodsName"
							class="cal-len line" maxlength="255" style="width: 85%" value=""
							title="" onkeyup="calculate_input_len(this);"
							onblur="calculate_input_len(this);" placeholder="작가명을 입력하세요">
						</td>
					</tr>
					<tr>
						<th class="its-th-align center">생년월일</th>
						<td class="its-td"><input type="text" name="keyword"
							class="line cal-len" maxlength="50" style="width: 6%" value=""
							title=""> 년 <input type="text" name="keyword"
							class="line cal-len" maxlength="50"
							style="margin-left: 6px; width: 3%" value="" title=""> 월
							<input type="text" name="keyword" class="line cal-len"
							maxlength="50" style="margin-left: 6px; width: 3%" value=""
							title=""> 일</td>
					</tr>
					<tr>
						<th class="its-th-align center">국적</th>
						<td class="its-td"><select>
						<option selected="selected">대한민국</option>
						<option>프랑스</option>
						<option>미국</option>
						<option>일본</option>
						</select></td> 
					</tr>
					<tr>
						<th class="its-th-align center">작가 소개</th>
						<td class="its-td"><textarea name="summary" rows="10"
								class="cal-len line" maxlength="255" style="width: 85%" value=""
								title="상품 설명을 입력하세요" onkeyup="calculate_input_len(this);"
								onblur="calculate_input_len(this);" placeholder="상품 설명을 입력하세요"></textarea><span
							class="view-len"> <b> 0</b>/1000
						</span></td>
					</tr>
					<tr>
						<th class="its-th-align center">학력</th>
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
								
							</ul>
							<span class="index_add">추가</span>
						</td>
					</tr>
					<tr>
						<th class="its-th-align center">수상 경력</th>
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
								
							</ul>
							<span class="index_add">추가</span>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</form>
</div>





