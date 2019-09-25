<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="sub_right_box my_box_wrap">
	<div class="sub_right_content">
		<h3 class="my_page_title" style="margin-bottom: 20px">1:1 문의</h3>
		<form class="my_qna_form">
			<div class="form-group">
				<label for="my_qna_type">질문유형</label> <select
					class="form-control" id="my_qna_type">
					<option>-</option>
					<option>회원계정문의</option>
					<option>이용문의</option>
					<option>배송문의</option>
					<option>환불문의</option>
					<option>이벤트문의</option>
					<option>오류문의</option>
					<option>기타문의</option>
				</select>
			</div>
			<div class="form-group">
				<label for="my_qna_title">제목</label> <input
					type="email" class="form-control" id="my_qna_title">
			</div>
			<div class="form-group">
				<label for="my_qna_content">내용</label>
				<textarea class="form-control" id="my_qna_content"
					rows="6"></textarea>
			</div>
		</form> 
		<a class="qna_btn">제출하기</a>
	</div>
</div>



