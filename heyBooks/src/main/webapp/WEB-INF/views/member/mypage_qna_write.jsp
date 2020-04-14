<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="sub_right_box my_box_wrap">
	<div class="sub_right_content">
		<h3 class="my_page_title" style="margin-bottom: 20px">1:1 문의</h3>
		<form class="my_qna_form" action="<c:url value='/counsel_insert'/>" method="post">
			<div class="form-group">  
				<input name="members_num" hidden="hidden" value="${sessionScope.member.members_num}">
				<label for="my_qna_type">질문유형</label> 
				<select class="form-control" name="counsel_type" id="my_qna_type"> 
					<option value="회원계정문의">회원계정문의</option>
					<option value="이용문의" <c:if test="${counsel_type eq '이용문의'}">selected</c:if>>이용문의</option>
					<option value="배송문의" <c:if test="${counsel_type eq '배송문의'}">selected</c:if>>배송문의</option> 
					<option value="환불문의" <c:if test="${counsel_type eq '환불문의'}">selected</c:if>>환불문의</option>
					<option value="이벤트문의" <c:if test="${counsel_type eq '이벤트문의'}">selected</c:if>>이벤트문의</option>
					<option value="오류문의" <c:if test="${counsel_type eq '오류문의'}">selected</c:if>>오류문의</option>
					<option value="기타문의" <c:if test="${counsel_type eq '기타문의'}">selected</c:if>>기타문의</option>
				</select>
			</div>
			<div class="form-group">
				<label for="my_qna_title">제목</label> 
				<input type="text" name="counsel_title" class="form-control" value="${counsel_title}" id="my_qna_title">
			</div>
			<div class="form-group"> 
				<label for="my_qna_content">내용</label>
				<textarea class="form-control"  name="counsel_content" id="my_qna_content" placeholder="자세한 문의 내용을 입력해 주세요." rows="6"></textarea>
			</div>
			<div class="twin_btn qna_btn">
				<a class="twin_home_btn" href="<c:url value='/mypage_qna'/>">목록보기</a>
				<input  type="submit" class="twin_page_btn" value="제출하기">
			</div> 
		</form> 
	</div> 
</div>



