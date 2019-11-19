<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<aside class="mypage_aside">
	<h2>마이페이지</h2>
	<div class="aside_content">
		<p>
			<a>책/소식</a>
		</p>
		<ul class="aside_menu_list" id="collapseExample1">
			<li><a href="<c:url value='/mypage_notice'/>">알림</a></li>
			<li><a href="<c:url value='/mypage_book_notice'/>">신간알림</a></li>
			<li><a href="<c:url value='/mypage_wishlist'/>">위시리스트</a></li>
			<li><a href="<c:url value='/mypage_recent'/>">최근본 책</a></li>
		</ul>
		<p>
			<a>구매/혜택</a>
		</p>
		<ul class=" aside_menu_list" id="collapseExample2">
			<li><a href="<c:url value='/mypage_order'/>">주문 내역</a></li>
			<li><a href="<c:url value='/mypage_mileage'/>">포인트 적립</a></li>
		</ul>
		<p>
			<a>개인</a>
		</p>
		<ul class=" aside_menu_list" id="collapseExample3">
			<li><a href="<c:url value='/mypage_qna'/>">1:1문의</a></li>
			<li><a href="<c:url value='/mypage_review'/>">리뷰관리</a></li>
			<li><a href="<c:url value='/modification?members_num=${sessionScope.member.members_num}'/>">정보변경</a></li>
			<li><a href="#">회원탈퇴</a></li>
		</ul>
	</div>
</aside>