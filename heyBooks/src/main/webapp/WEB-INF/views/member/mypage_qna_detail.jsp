<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="sub_right_box my_box_wrap">
	<div class="sub_right_content">
		<h3 class="my_page_title" style="margin-bottom: 20px">1:1 문의</h3>
		<table class="table my_qna_table">
			<tr>
				<th scope="col">제목</th>
				<td colspan="3" >내용이 마음에 안들어요</td>
			</tr>
			<tr>
				<th scope="row">등록일</th>
				<td>2019.09.22</td>
				<th>답변상태</th>
				<td><span>답변완료</span></td>
			</tr>
		</table>
		<div class="qna_detail_box question_box">
			<span>Q</span>
			<p>이거 내용이 이상해요 정말 정말</p>
		</div>
		<div class="qna_detail_box answer_box">
			<span>A</span>
			<p>이거 내용이 이상해요 정말 정말</p>
		</div>
		<a href="<c:url value='/mypage_qna'/>" class="qna_btn">목록보기</a>
	</div>
</div>
