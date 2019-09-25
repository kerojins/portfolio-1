<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
		<div class="sub_right_box my_box_wrap">
			<div class="sub_right_content">
				<h3 class="my_page_title" style="margin-bottom:20px">1:1 문의</h3>
				<table class="table my_qna_table">
					<colgroup>
					 <col style="width:10%">
					 <col style="width:50%">
					 <col style="width:20%">
					 <col style="width:20%"> 
					</colgroup>
					<thead>
						<tr>
							<th scope="col">번호</th>
							<th scope="col">제목</th>
							<th scope="col">날짜</th>
							<th scope="col">답변상태</th>
						</tr>
					</thead> 
					<tbody>
						<tr> 
							<td scope="row">1</td>
							<td><a>Mark</a></td>
							<td>2019.05.31</td>
							<td><span>답변완료</span></td> 
						</tr> 
						<tr>
							<td scope="row">2</td>
							<td><a>Jacob</a></td>
							<td>2019.07.28</td>
							<td><span>답변대기</span></td>
						</tr>
					</tbody>
				</table>
				<a href="<c:url value='/mypage_qna_write'/>" class="qna_btn">문의하기</a> 
			</div>
		</div>



