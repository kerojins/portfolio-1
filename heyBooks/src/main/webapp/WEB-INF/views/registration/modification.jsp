<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="join">
	<div class="container">
		<form id="join_form" name="join_form"
			action="<c:url value='/member_update'/>" method="post">
			<h2>회원 수정</h2> 
			<div class="join_table_wrap">
				<h3>필수 정보 입력</h3>
				<table class="join_essential_info join_essential">
					<tr>
						<th>아이디</th>
						<td colspan="3">
							<input type="text" hidden="hidden" name="members_num" class="join_classic_input" onkeyup="join1();"
							value="${vo.members_num}" >
							 <%-- 회원 번호 --%>
							<input type="text"  readonly="readonly" name="members_id" class="join_classic_input" onkeyup="join1();"
							value="${vo.members_id}" >
						</td> 
					</tr>  
					<tr>
						<th>비밀번호</th>
						<td colspan="3">
							<input type="password" value="${vo.members_password }" class="join_classic_input" onfocus="join2();" onkeyup="join3();" name="members_password"><span class="join_msg one_area" title=""></span>
						</td>
					</tr>
					<tr> 
						<th>비밀번호확인</th>
						<td colspan="3">
							<input type="password" class="join_classic_input" onkeyup="join4();" name="members_password_ok"><span class="join_msg one_area" title=""></span>
						</td>
					</tr>
					<tr>
						<th>이름</th> 
						<td class="half_td">
							<input type="text" value="${vo.members_name }"  class="join_classic_input" onkeyup="join5();"  name="members_name">
							<span class="join_msg one_area" title=""></span>
						</td>
						<th>생년월일</th>
						<td>
							<input type="text" class="join_years_td" name="members_years" value="${vo.members_years}" maxlength="6" onkeyup="join6();"> - 
							<input type="text"class="join_gender_td" value="${gender}  width="16" readonly="readonly" maxlength="1" name="members_years" onkeyup="join7();">
							****** <span id="years_span" class="join_msg" title=""></span>
						</td>
					</tr> 
					<tr> 
						<th>휴대폰 번호</th>
						<td colspan="3">
							<select id="add_number" name="members_phone_number" id="members_phone_number">
								<option value="010" <c:if test="${phone[0] eq '010'}">selected</c:if>>010</option>
								<option value="011" <c:if test="${phone[0] eq '011'}">selected</c:if>>011</option>
								<option value="016" <c:if test="${phone[0] eq '016'}">selected</c:if>>016</option>
							</select>   
						  - <input type="text" value="${phone[1]}" class="phone_input" name="members_phone_number" onkeyup="join8();" maxlength="4"> - 
						    <input type="text" class="phone_input" name="members_phone_number" value="${phone[2]}" onkeyup="join9();" maxlength="4"><span id="phone_span"class="join_msg" title=""></span></td>
					</tr>   
					<tr>    
						<th>이메일</th>
						<td colspan="3">
							<input type="text" class="join_classic_input" name="members_email"  value="${email[0]}"  onkeyup="join10();"> @ 
							<input type="text" class="join_email_input"  id="join_email_input"  value="${email[1]}" onkeyup="join11();"  name="members_email"> 
							<select id="member_email" onchange="join12(this);" >
								<option value="">직접입력</option>
								<option value="naver.com">naver.com</option> 
								<option value="hanmail.net">hanmail.net</option>
								<option value="yahoo.com">yahoo.com</option> 
								<option value="gmail.com">gmail.com</option>
							</select>
							<span class="join_msg" id="email_span" title=""></span>
						</td>
					</tr>
				</table>
			</div>
			<div class="join_table_wrap">
				<h3>선택 정보 입력</h3>
				<table class="join_essential_info">
					<tr class="address_row">
						<th>주소(배송지)</th>
						<td colspan="3">
							<input type="text" name="members_post" id="sample6_postcode" value="${vo.members_post}" placeholder="우편번호"> 
							<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br> 
							<input type="text" name="members_address" id="sample6_address" value="${vo.members_address}" placeholder="주소"><br>
							<input type="text" name="members_detail_address" value="${vo.members_detail_address}" id="sample6_detailAddress" placeholder="상세주소"> 
							<input type="text" value="${vo.members_extra_address}" name="members_extra_address" id="sample6_extraAddress" placeholder="참고항목">
						</td>
					</tr>
					<tr>
						<th>추가 연락처</th> 
						<td colspan="3">
							<select id="add_number" name="members_add_number">
								<option value="010">010</option>
								<option value="011">011</option>
								<option value="016">016</option>
							</select> - 
							<input type="text" onkeyup="join13();" class="phone_input"  value="${add_number[1]}" name="members_add_number" maxlength="4"> - 
							<input type="text" onkeyup="join14();" class="phone_input"  value="${add_number[2]}" name="members_add_number" maxlength="4">
							<span id="phone_add_span"class="join_msg" title=""></span>
						</td>
					</tr>
					<tr>
						<th>직업</th>
						<td colspan="3">
							<select id="members_job" name="members_job">
								<option>선택</option>
								<option value="학생">학생</option>
								<option value="회사원">회사원</option>
								<option value="전문직">전문직</option>
								<option value="공무원">공무원</option>
								<option value="주부">주부</option>
								<option value="기타">기타</option>
							</select>
						</td>
					</tr>
					<tr>
						<th>관심분야(최대5개)</th>
						<td colspan="3">
							<input hidden="hidden" value="${vo.members_favorite}" id="members_favorite">
							<p class="item_select_option join_favorite" style="display: block;">
								<c:forEach var="list" items="${domestic_vo}" varStatus="status">
									<span>
										<input type="checkbox" id="cate_${status.count}" name="members_favorite" value="${list.cate_num}" class="item_checking">
										<label for="cate_${status.count}" class="input_label"></label>
										<label for="cate_${status.count}">${list.cate_name}</label>
									</span> 
								</c:forEach>
							</p>
						</td>
					</tr> 
				</table>
			</div>
			<button type="submit" class="btn join_btn">수정 완료</button>
		</form>
	</div>
</div>


<%-- 배송지 주소 API --%>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>


	var add_number = document.getElementById('add_number'); // 추가 번호 앞자리 select
	var add_number_val = "${add_number[0]}";
	for (var i = 1; i < add_number.length; i++) {
		if (add_number[i].value == add_number_val)
			add_number[i].setAttribute("selected", "selected");
	}
	var members_job = document.getElementById('members_job'); // 직업 select
	var members_job_val = "${vo.members_job}";
	for (var i = 1; i < members_job.length; i++) {
		if (members_job[i].value == members_job_val)
			members_job[i].setAttribute("selected", "selected");
	}
	var favorite = document.getElementById('members_favorite').value; // 관심분야 체크 
	var fa_array = favorite.split(",");
	var fa_check = document.getElementsByName("members_favorite");
	for (var i = 0; i < fa_array.length; i++) { 
		for (var j = 0; j < fa_check.length; j++) {
			if (fa_array[i] == fa_check[j].value) {
				alert(fa_array[i]);
				fa_check[j].setAttribute("checked", "checked");
				var label = fa_check[j].nextElementSibling;
				label.innerHTML='<i class="fas fa-check"></i>'; 
			} 
		}
	}
	 
	function sample6_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 각 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var addr = ''; // 주소 변수
						var extraAddr = ''; // 참고항목 변수

						//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
						if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
							addr = data.roadAddress;
						} else { // 사용자가 지번 주소를 선택했을 경우(J)
							addr = data.jibunAddress;
						}

						// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
						if (data.userSelectedType === 'R') {
							// 법정동명이 있을 경우 추가한다. (법정리는 제외)
							// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
							if (data.bname !== ''
									&& /[동|로|가]$/g.test(data.bname)) {
								extraAddr += data.bname;
							}
							// 건물명이 있고, 공동주택일 경우 추가한다.
							if (data.buildingName !== ''
									&& data.apartment === 'Y') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
							if (extraAddr !== '') {
								extraAddr = ' (' + extraAddr + ')';
							}
							// 조합된 참고항목을 해당 필드에 넣는다.
							document.getElementById("sample6_extraAddress").value = extraAddr;

						} else {
							document.getElementById("sample6_extraAddress").value = '';
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('sample6_postcode').value = data.zonecode;
						document.getElementById("sample6_address").value = addr;
						// 커서를 상세주소 필드로 이동한다.
						document.getElementById("sample6_detailAddress")
								.focus();
					}
				}).open();

	}
</script>