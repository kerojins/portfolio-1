<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="container admin_item_add">
	<form action="<c:url value='/editor_update'/>" method="post">
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
						<td class="its-td">
						<input type="text" name="editor_num" hidden="hidden"
							class="cal-len line" maxlength="255" style="width: 85%" value="${vo.editor_num }">
						<input type="text" name="editor_name"
							class="cal-len line" maxlength="255" style="width: 85%" value="${vo.editor_name }"
							title=""
							 placeholder="작가명을 입력하세요">
						</td>
					</tr>
					<tr>
						<th class="its-th-align center">생년월일</th>
						<td class="its-td"><input type="text" id="editor_birth" name="editor_birth" value="${vo.editor_birth }">
					</tr>  
					<tr>
						<th class="its-th-align center">국적</th>
						<td class="its-td"><select id="editor_nation" name="editor_nation">
						<option value="대한민국">대한민국</option>
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
								title="상품 설명을 입력하세요" onkeyup="calculate_input_len(this);"
								onblur="calculate_input_len(this);" placeholder="작가 설명을 입력하세요">${vo.editor_introduce}</textarea><span
							class="view-len"> <b> 0</b>/1000  
						</span></td>
					</tr> 
					<tr> 
						<th class="its-th-align center">학력</th>
						<td class="its-td">
							<ul class="index_list">
							<c:forEach var="school"  items="${school}">
								<li><input type="text" name="editor_school" class="cal-len line"
									style="width: 85%" value="${school }"></li>
							</c:forEach>
							</ul>
							<span class="index_add" title="editor_school">추가</span>
						</td>
					</tr>
					<tr> 
						<th class="its-th-align center">수상 경력</th>
						<td class="its-td">
							<ul class="index_list">
								<c:forEach var="award" items="${award}">
								<li><input type="text" name="editor_award" class="cal-len line"
									style="width: 85%"  value="${award}"></li>
								</c:forEach>
							</ul> 
							<span class="index_add" title="editor_award">추가</span>
						</td>
					</tr>
				</tbody>
			</table>
			<button class="add_submit">수정하기</button>
		</div>
	</form>
</div>

<script src="https://code.jquery.com/ui/1.12.0/jquery-ui.min.js"></script>
<script type="text/javascript">
var nation = document.getElementById('editor_nation'); // 추가 번호 앞자리 select
var nation_val = "${vo.editor_nation}";
for (var i = 1; i < nation.length; i++) {
	if (nation[i].value == nation_val)
		nation[i].setAttribute("selected", "selected");
}

$("#editor_birth").datepicker({
    dayNamesMin:["일","월","화","수","목","금","토"], // 요일에 표시되는 형식 설정

    dateFormat:"yy-mm-dd", //날짜 형식 설정

    monthNames:["1월","2월","3월","4월","5월","6월","7월",

     "8월","9월","10월","11월","12월"], //월표시 형식 설정

    showAnim:"fold", //애니메이션효과

	maxDate: 0,
});

function check_form(){
	var form = document.editor_form;
	var school = form.editor_school;
	var award = form.editor_award;
	school.forEach(function(index,item){
		if(item.value == ""){
			item.setAttribute("name") = "";
		}
	});
	award.forEach(function(index,item){
		if(item.value == ""){
			item.setAttribute("name") = "";
		}
	});
}

</script>



