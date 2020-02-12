<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="container admin_item_add">
	<form action="<c:url value='/editor_add'/>" method="post" name="editor_form" >
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
						<td class="its-td"><input type="text" name="editor_name"
							class="cal-len line" maxlength="255" style="width: 85%" value=""
							title="" 
							 placeholder="작가명을 입력하세요">
						</td>
					</tr>
					<tr>
						<th class="its-th-align center">생년월일</th>
						<td class="its-td"><input type="text" class="datepickers" name="editor_birth"></td>
					</tr>  
					<tr>  
						<th class="its-th-align center">국적</th>
						<td class="its-td"><select name="editor_nation">
						<option selected="selected">대한민국</option>
						<option value="프랑스">프랑스</option>
						<option value="미국">미국</option>
						<option value="일본">일본</option>
						<option value="미상">미상</option>
						</select></td> 
					</tr>
					<tr>
						<th class="its-th-align center">작가 소개</th>
						<td class="its-td"><textarea name="editor_introduce" rows="10"
								class="cal-len line" maxlength="255" style="width: 85%" name="editor_introduce"
								title="상품 설명을 입력하세요" 
								 placeholder="작가 설명을 입력하세요"></textarea><span
							class="view-len"> <b> 0</b>/1000
						</span></td>
					</tr>
					<tr>
						<th class="its-th-align center">학력</th>
						<td class="its-td">
							<ul class="index_list">
								<li><input type="text" name="editor_school" class="cal-len line"
									style="width: 85%"  value="" title="" placeholder="1."></li>
								<li><input type="text" name="editor_school" class="cal-len line"
									style="width: 85%"  value="" title="" placeholder="2."></li>
								<li><input type="text"  name="editor_school" class="cal-len line"
									style="width: 85%"  value="" title="" placeholder="3."></li>
								<li><input type="text" name="editor_school" class="cal-len line"
									style="width: 85%"   value="" title="" placeholder="4."></li>
								<li><input type="text"   name="editor_school" class="cal-len line"
									style="width: 85%"  value=""title="" placeholder="5."></li>
							</ul>
							<span class="index_add" title="editor_school">추가</span>
						</td>
					</tr>
					<tr> 
						<th class="its-th-align center">수상 경력</th>
						<td class="its-td">
							<ul class="index_list">
								<li><input type="text" name="editor_award" class="cal-len line"
									style="width: 85%" value="" title="" placeholder="1."></li>
								<li><input type="text" name="editor_award" class="cal-len line"
									style="width: 85%" value="" title="" placeholder="2."></li>
								<li><input type="text" name="editor_award" class="cal-len line"
									style="width: 85%" value="" title="" placeholder="3."></li>
								<li><input type="text" name="editor_award" class="cal-len line"
									style="width: 85%" value="" title="" placeholder="4."></li>
								<li><input type="text" name="editor_award" class="cal-len line"
									style="width: 85%" value="" title="" placeholder="5."></li>
							</ul> 
							<span class="index_add" title="editor_award">추가</span>
						</td>
					</tr>
				</tbody>
			</table>
			<button class="add_submit" onclick="check_form()">등록 하기</button>
		</div>
	</form>
</div>

<script type="text/javascript">

function check_form(){
	var form = document.editor_form;
	var school = form.editor_school;
	var award = form.editor_award;
	for(var i = school.length - 1 ; i >= 0 ; i--){
		if(school[i].value == ''){ 
			school[i].removeAttribute('name'); 
		}       
	} 
	for(var i = award.length - 1 ; i >= 0 ; i--){
		if(award[i].value == ''){ 
			award[i]. removeAttribute('name'); 
		}       
	}   
}
</script>




